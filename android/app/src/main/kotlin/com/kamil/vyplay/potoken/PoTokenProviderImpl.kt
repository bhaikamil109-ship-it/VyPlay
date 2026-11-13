package com.kamil.vyplay.potoken

import android.content.Context
import android.util.Log
import android.webkit.CookieManager
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.services.youtube.InnertubeClientRequestInfo
import org.schabi.newpipe.extractor.services.youtube.PoTokenProvider
import org.schabi.newpipe.extractor.services.youtube.PoTokenResult
import org.schabi.newpipe.extractor.services.youtube.YoutubeParsingHelper

/**
 * NewPipe Extractor PoTokenProvider backed by an offscreen WebView that runs
 * YouTube's BotGuard VM. Ported from NewPipe's `PoTokenProviderImpl`.
 */
object PoTokenProviderImpl : PoTokenProvider {

    private const val TAG = "PoTokenProvider"

    @Volatile
    private var appContext: Context? = null

    @Volatile
    private var webViewBadImpl = false

    private val mutex = Mutex()
    private var visitorData: String? = null
    private var streamingPot: String? = null
    private var generator: PoTokenWebView? = null

    fun setContext(context: Context) {
        appContext = context.applicationContext
    }

    /**
     * The extractor's interface also asks for a web-embed token, an Android
     * client token and an iOS client token. VyPlay only runs YouTube's BotGuard
     * VM for the regular web client, so the other clients deliberately return
     * null: the extractor then falls back to its own request path instead of
     * receiving a token minted for the wrong client.
     */
    override fun getWebEmbedClientPoToken(videoId: String): PoTokenResult? = null

    override fun getAndroidClientPoToken(videoId: String): PoTokenResult? = null

    override fun getIosClientPoToken(videoId: String): PoTokenResult? = null

    override fun getWebClientPoToken(videoId: String): PoTokenResult? {
        val context = appContext ?: return null
        if (!supportsWebView() || webViewBadImpl) return null

        return try {
            runBlocking(Dispatchers.IO) {
                getWebClientPoTokenInternal(context, videoId, forceRecreate = false)
            }
        } catch (e: BadWebViewException) {
            Log.e(TAG, "WebView is broken, disabling poToken", e)
            webViewBadImpl = true
            null
        } catch (e: PoTokenException) {
            Log.e(TAG, "Could not obtain poToken", e)
            null
        } catch (e: Throwable) {
            Log.e(TAG, "Unexpected poToken failure", e)
            null
        }
    }

    private suspend fun getWebClientPoTokenInternal(
        context: Context,
        videoId: String,
        forceRecreate: Boolean,
    ): PoTokenResult {
        val (activeGenerator, activeVisitorData, activeStreamingPot, recreated) =
            mutex.withLock {
                val shouldRecreate = generator == null || forceRecreate || generator!!.isExpired()
                if (shouldRecreate) {
                    val requestInfo = InnertubeClientRequestInfo.ofWebClient()
                    requestInfo.clientInfo.clientVersion = YoutubeParsingHelper.getClientVersion()

                    visitorData = YoutubeParsingHelper.getVisitorDataFromInnertube(
                        requestInfo,
                        NewPipe.getPreferredLocalization(),
                        NewPipe.getPreferredContentCountry(),
                        YoutubeParsingHelper.getYouTubeHeaders(),
                        YoutubeParsingHelper.YOUTUBEI_V1_URL,
                        null,
                        false,
                    )

                    generator?.close()
                    val newGenerator = PoTokenWebView.newPoTokenGenerator(context)
                    @Suppress("UNCHECKED_CAST")
                    val concrete = newGenerator as PoTokenWebView
                    concrete.initialize()
                    generator = concrete
                    // The streaming poToken must be generated exactly once before
                    // any player poToken.
                    streamingPot = concrete.generatePoToken(visitorData!!)
                }

                Quad(
                    generator!!,
                    visitorData!!,
                    streamingPot!!,
                    shouldRecreate,
                )
            }

        val playerPot = try {
            activeGenerator.generatePoToken(videoId)
        } catch (t: Throwable) {
            if (recreated) throw t
            Log.e(TAG, "Failed to obtain poToken, retrying with a fresh WebView", t)
            return getWebClientPoTokenInternal(context, videoId, forceRecreate = true)
        }

        return PoTokenResult(activeVisitorData, playerPot, activeStreamingPot)
    }

    private fun supportsWebView(): Boolean = try {
        CookieManager.getInstance()
        true
    } catch (_: Throwable) {
        false
    }

    private data class Quad<T1, T2, T3, T4>(
        val first: T1,
        val second: T2,
        val third: T3,
        val fourth: T4,
    )
}
