package com.kamil.vyplay

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Dart bridge for [DownloadsForegroundService].
 *
 * Contract (channel `com.kamil.vyplay/download_service`):
 *  * `start`  {text: String?, count: int} -> bool
 *  * `update` {text: String?, count: int} -> bool
 *  * `stop`   {} -> bool
 *  * `isRunning` {} -> bool
 *
 * Every method answers with a boolean instead of an error so a missing
 * permission or a background-start restriction degrades to "no keep-alive"
 * rather than failing the download itself.
 */
class DownloadServiceHandler(private val context: Context) :
    MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "start" -> {
                val count = call.argument<Int>("count") ?: 1
                DownloadsForegroundService.start(
                    context,
                    call.argument<String>("text"),
                    count,
                )
                result.success(true)
            }

            "update" -> {
                val count = call.argument<Int>("count") ?: 0
                DownloadsForegroundService.update(
                    context,
                    call.argument<String>("text"),
                    count,
                )
                result.success(DownloadsForegroundService.isRunning)
            }

            "stop" -> {
                DownloadsForegroundService.stop(context)
                result.success(true)
            }

            "isRunning" -> result.success(DownloadsForegroundService.isRunning)

            else -> result.notImplemented()
        }
    }
}
