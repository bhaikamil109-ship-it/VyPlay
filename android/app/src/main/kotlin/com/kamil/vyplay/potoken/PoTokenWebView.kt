package com.kamil.vyplay.potoken

import android.annotation.SuppressLint
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.webkit.ConsoleMessage
import android.webkit.JavascriptInterface
import android.webkit.WebChromeClient
import android.webkit.WebView
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeout
import com.kamil.vyplay.newpipe.VyPlayDownloader
import org.schabi.newpipe.extractor.downloader.Response
import java.time.Instant

/**
 * Runs YouTube's BotGuard VM in an offscreen WebView and mints poTokens.
 *
 * Ported from NewPipe's `PoTokenWebView` (GPLv3). RxJava was replaced with
 * Kotlin coroutines because this app does not depend on RxJava.
 */
class PoTokenWebView private constructor(
    private val context: Context,
) : PoTokenGenerator {

    private val webView = WebView(context)
    private val scope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private val pendingTokens = mutableMapOf<String, CompletableDeferred<String>>()
    private var initDeferred: CompletableDeferred<Unit>? = null
    private var expirationInstant: Instant? = null
    private var closed = false

    init {
        @SuppressLint("SetJavaScriptEnabled")
        val settings = webView.settings
        settings.javaScriptEnabled = true
        settings.userAgentString = USER_AGENT
        settings.blockNetworkLoads = true

        webView.addJavascriptInterface(this, JS_INTERFACE)
        webView.webChromeClient = object : WebChromeClient() {
            override fun onConsoleMessage(m: ConsoleMessage): Boolean {
                if (m.message().contains("Uncaught")) {
                    val fmt = "\"${m.message()}\", source: ${m.sourceId()} (${m.lineNumber()})"
                    Log.e(TAG, "Broken WebView implementation: $fmt")
                    val error = BadWebViewException(fmt)
                    initDeferred?.completeExceptionally(error)
                    pendingTokens.values.forEach { it.completeExceptionally(error) }
                    pendingTokens.clear()
                }
                return super.onConsoleMessage(m)
            }
        }
    }

    /** Loads BotGuard and obtains an integrity token. Must be called once. */
    suspend fun initialize() {
        val deferred = CompletableDeferred<Unit>()
        initDeferred = deferred
        val html = withContext(Dispatchers.IO) {
            context.assets.open("po_token.html").bufferedReader().use { it.readText() }
        }
        withContext(Dispatchers.Main) {
            webView.loadDataWithBaseURL(
                "https://www.youtube.com",
                html.replaceFirst(
                    "</script>",
                    "\n$JS_INTERFACE.downloadAndRunBotguard()</script>",
                ),
                "text/html",
                "utf-8",
                null,
            )
        }
        withTimeout(45_000) { deferred.await() }
    }

    @JavascriptInterface
    fun downloadAndRunBotguard() {
        scope.launch {
            try {
                val body = postBotguard(
                    "Create",
                    "[ \"$REQUEST_KEY\" ]",
                )
                val parsedChallengeData = PoTokenJs.parseChallengeData(body)
                withContext(Dispatchers.Main) {
                    webView.evaluateJavascript(
                        """
                        try {
                            data = $parsedChallengeData
                            runBotGuard(data).then(function (result) {
                                this.webPoSignalOutput = result.webPoSignalOutput
                                $JS_INTERFACE.onRunBotguardResult(result.botguardResponse)
                            }, function (error) {
                                $JS_INTERFACE.onJsInitializationError(error + "\n" + error.stack)
                            })
                        } catch (error) {
                            $JS_INTERFACE.onJsInitializationError(error + "\n" + error.stack)
                        }
                        """.trimIndent(),
                        null,
                    )
                }
            } catch (t: Throwable) {
                failInitialization(t)
            }
        }
    }

    @JavascriptInterface
    fun onJsInitializationError(error: String) {
        failInitialization(buildExceptionForJsError(error))
    }

    @JavascriptInterface
    fun onRunBotguardResult(botguardResponse: String) {
        scope.launch {
            try {
                val responseBody = postBotguard(
                    "GenerateIT",
                    "[ \"$REQUEST_KEY\", \"$botguardResponse\" ]",
                )
                val (integrityToken, expirationSeconds) =
                    PoTokenJs.parseIntegrityTokenData(responseBody)
                expirationInstant = Instant.now().plusSeconds((expirationSeconds - 600).coerceAtLeast(60))
                withContext(Dispatchers.Main) {
                    webView.evaluateJavascript("this.integrityToken = $integrityToken") {
                        initDeferred?.complete(Unit)
                    }
                }
            } catch (t: Throwable) {
                failInitialization(t)
            }
        }
    }

    override suspend fun generatePoToken(identifier: String): String {
        if (closed) throw PoTokenException("PoToken WebView is closed")
        val deferred = CompletableDeferred<String>()
        pendingTokens[identifier] = deferred
        withContext(Dispatchers.Main) {
            val u8Identifier = PoTokenJs.stringToU8(identifier)
            webView.evaluateJavascript(
                """
                try {
                    identifier = "$identifier"
                    u8Identifier = $u8Identifier
                    poTokenU8 = obtainPoToken(webPoSignalOutput, integrityToken, u8Identifier)
                    poTokenU8String = ""
                    for (i = 0; i < poTokenU8.length; i++) {
                        if (i != 0) poTokenU8String += ","
                        poTokenU8String += poTokenU8[i]
                    }
                    $JS_INTERFACE.onObtainPoTokenResult(identifier, poTokenU8String)
                } catch (error) {
                    $JS_INTERFACE.onObtainPoTokenError(identifier, error + "\n" + error.stack)
                }
                """.trimIndent(),
                null,
            )
        }
        return withTimeout(30_000) { deferred.await() }
    }

    @JavascriptInterface
    fun onObtainPoTokenError(identifier: String, error: String) {
        pendingTokens.remove(identifier)?.completeExceptionally(buildExceptionForJsError(error))
    }

    @JavascriptInterface
    fun onObtainPoTokenResult(identifier: String, poTokenU8: String) {
        val poToken = try {
            PoTokenJs.u8ToBase64(poTokenU8)
        } catch (t: Throwable) {
            pendingTokens.remove(identifier)?.completeExceptionally(t)
            return
        }
        pendingTokens.remove(identifier)?.complete(poToken)
    }

    override fun isExpired(): Boolean {
        val expiration = expirationInstant ?: return false
        return Instant.now().isAfter(expiration)
    }

    override fun close() {
        if (closed) return
        closed = true
        pendingTokens.values.forEach {
            it.completeExceptionally(PoTokenException("PoToken WebView closed"))
        }
        pendingTokens.clear()
        initDeferred?.completeExceptionally(PoTokenException("PoToken WebView closed"))
        Handler(Looper.getMainLooper()).post {
            scope.cancel()
            webView.clearHistory()
            webView.clearCache(true)
            webView.loadUrl("about:blank")
            webView.onPause()
            webView.removeAllViews()
            webView.destroy()
        }
    }

    private fun failInitialization(t: Throwable) {
        initDeferred?.completeExceptionally(t)
        pendingTokens.values.forEach { it.completeExceptionally(t) }
        pendingTokens.clear()
        close()
    }

    private suspend fun postBotguard(endpoint: String, data: String): String =
        withContext(Dispatchers.IO) {
            val response: Response = VyPlayDownloader.getInstance().post(
                "https://www.youtube.com/api/jnn/v1/$endpoint",
                mapOf(
                    "User-Agent" to listOf(USER_AGENT),
                    "Accept" to listOf("application/json"),
                    "Content-Type" to listOf("application/json+protobuf"),
                    "x-goog-api-key" to listOf(GOOGLE_API_KEY),
                    "x-user-agent" to listOf("grpc-web-javascript/0.1"),
                ),
                data.toByteArray(Charsets.UTF_8),
            )
            if (response.responseCode() != 200) {
                throw PoTokenException("Invalid BotGuard response code: ${response.responseCode()}")
            }
            response.responseBody()
        }

    companion object : PoTokenGenerator.Factory {
        private val TAG = PoTokenWebView::class.simpleName
        private const val GOOGLE_API_KEY = "AIzaSyDyT5W0Jh49F30Pqqtyfdf7pDLFKLJoAnw"
        private const val REQUEST_KEY = "O43z0dpjhgX20SCx4KAo"
        private const val USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " +
                "(KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.3"
        private const val JS_INTERFACE = "PoTokenWebView"

        override suspend fun newPoTokenGenerator(context: Context): PoTokenGenerator =
            withContext(Dispatchers.Main) {
                PoTokenWebView(context.applicationContext)
            }
    }
}
