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
import org.schabi.newpipe.extractor.services.youtube.YoutubePoTokenResult
import org.schabi.newpipe.extractor.services.youtube.YoutubeParsingHelper

/**
 * PipePipe's MWEB PO-token resolver backed by an offscreen WebView that runs
 * YouTube's BotGuard VM. The exact resolver API is pinned with the extractor.
 */
object PoTokenProviderImpl {

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

    /** True when the app can use the WebView-backed MWEB token resolver. */
    fun isAvailable(): Boolean =
        appContext != null && supportsWebView() && !webViewBadImpl

    /**
     * Obtain the PO token PipePipe requires for one YouTube MWEB player request.
     * Failures are propagated to the caller so stream extraction cannot silently
     * continue with a token generated for the wrong client.
     */
    fun getYoutubePoTokenResult(videoId: String): YoutubePoTokenResult {
        val context = appContext
            ?: throw PoTokenException("Application context is not initialized")
        if (!supportsWebView() || webViewBadImpl) {
            throw PoTokenException("WebView PO-token generation is unavailable")
        }

        return try {
            runBlocking(Dispatchers.IO) {
                getWebClientPoTokenInternal(context, videoId, forceRecreate = false)
            }
        } catch (e: BadWebViewException) {
            Log.e(TAG, "WebView is broken; disabling PO-token generation", e)
            webViewBadImpl = true
            throw e
        } catch (e: PoTokenException) {
            Log.e(TAG, "Could not obtain PO token", e)
            throw e
        } catch (e: Throwable) {
            Log.e(TAG, "Unexpected PO-token failure", e)
            throw PoTokenException(e.message ?: "Unexpected PO-token failure")
        }
    }

    private suspend fun getWebClientPoTokenInternal(
        context: Context,
        videoId: String,
        forceRecreate: Boolean,
    ): YoutubePoTokenResult {
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

        return YoutubePoTokenResult(
            activeVisitorData,
            YoutubeParsingHelper.getClientVersion(),
            playerPot,
        )
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
