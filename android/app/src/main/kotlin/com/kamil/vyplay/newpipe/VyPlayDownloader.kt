package com.kamil.vyplay.newpipe

import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response as OkHttpResponse
import org.schabi.newpipe.extractor.downloader.CancellableCall
import org.schabi.newpipe.extractor.downloader.Downloader
import org.schabi.newpipe.extractor.downloader.Request as ExtractorRequest
import org.schabi.newpipe.extractor.downloader.Response
import org.schabi.newpipe.extractor.exceptions.ReCaptchaException
import java.io.IOException
import java.nio.charset.Charset
import java.util.concurrent.TimeUnit

/**
 * OkHttp downloader for PipePipe/NewPipe Extractor.
 *
 * Both synchronous and asynchronous contracts are implemented. Raw response
 * bytes are retained because PipePipe uses them in its streaming adapters.
 */
class VyPlayDownloader private constructor(
    private val client: OkHttpClient
) : Downloader() {

    companion object {
        private const val USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

        @Volatile
        private var authCookie: String? = null

        @Volatile
        private var instance: VyPlayDownloader? = null

        fun setCookie(cookie: String?) {
            authCookie = cookie?.takeIf { it.isNotBlank() }
        }

        fun getInstance(): VyPlayDownloader {
            return instance ?: synchronized(this) {
                instance ?: createInstance().also { instance = it }
            }
        }

        private fun createInstance(): VyPlayDownloader {
            val client = OkHttpClient.Builder()
                .connectTimeout(30, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .writeTimeout(30, TimeUnit.SECONDS)
                .followRedirects(true)
                .followSslRedirects(true)
                .build()
            return VyPlayDownloader(client)
        }

        fun init() {
            getInstance()
        }
    }

    private fun toOkHttpRequest(request: ExtractorRequest): Request {
        val url = request.url()
        val builder = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)

        authCookie?.let { builder.header("Cookie", it) }
        for ((headerName, values) in request.headers()) {
            if (values.isNotEmpty()) {
                builder.header(headerName, values.first())
            }
        }

        val data = request.dataToSend()
        when (request.httpMethod().uppercase()) {
            "GET" -> builder.get()
            "HEAD" -> builder.head()
            "POST" -> builder.post(data?.toRequestBody() ?: ByteArray(0).toRequestBody())
            else -> builder.method(
                request.httpMethod(),
                data?.toRequestBody()
            )
        }
        return builder.build()
    }

    private fun toExtractorResponse(response: OkHttpResponse): Response {
        val body = response.body
        val rawBody = body?.bytes() ?: ByteArray(0)
        val charset: Charset = body?.contentType()?.charset(Charsets.UTF_8) ?: Charsets.UTF_8
        val responseBody = String(rawBody, charset)
        val responseHeaders: Map<String, List<String>> = response.headers.toMultimap()
        val latestUrl = response.request.url.toString()
        return Response(
            response.code,
            response.message,
            responseHeaders,
            responseBody,
            rawBody,
            latestUrl
        )
    }

    override fun execute(request: ExtractorRequest): Response {
        val response = client.newBuilder()
            .followRedirects(request.followRedirects())
            .followSslRedirects(request.followRedirects())
            .build()
            .newCall(toOkHttpRequest(request))
            .execute()

        if (response.code == 429) {
            val url = response.request.url.toString()
            response.close()
            throw ReCaptchaException("Rate limited by upstream service", url)
        }

        return response.use { toExtractorResponse(it) }
    }

    override fun executeAsync(
        request: ExtractorRequest,
        callback: Downloader.AsyncCallback
    ): CancellableCall {
        val call = client.newBuilder()
            .followRedirects(request.followRedirects())
            .followSslRedirects(request.followRedirects())
            .build()
            .newCall(toOkHttpRequest(request))
        val cancellableCall = CancellableCall(call)

        call.enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                try {
                    callback.onError(e)
                } finally {
                    cancellableCall.setFinished()
                }
            }

            override fun onResponse(call: Call, response: OkHttpResponse) {
                try {
                    if (response.code == 429) {
                        throw ReCaptchaException(
                            "Rate limited by upstream service",
                            response.request.url.toString()
                        )
                    }
                    response.use { callback.onSuccess(toExtractorResponse(it)) }
                } catch (e: Exception) {
                    callback.onError(e)
                } finally {
                    response.close()
                    cancellableCall.setFinished()
                }
            }
        })

        return cancellableCall
    }
}
