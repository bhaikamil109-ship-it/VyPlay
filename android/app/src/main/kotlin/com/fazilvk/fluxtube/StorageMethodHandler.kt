package com.fazilvk.fluxtube

import android.os.StatFs
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * Reports free space on the volume that holds a given path.
 *
 * The Dart side uses this before starting a download so the user gets a clear
 * "not enough storage" message instead of a transfer that dies at 80% with a
 * filesystem exception. Kept deliberately small: one method, no state.
 */
class StorageMethodHandler : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getFreeSpace" -> {
                val path = call.argument<String>("path")
                if (path.isNullOrEmpty()) {
                    result.error("INVALID_PATH", "A path is required", null)
                    return
                }
                try {
                    // Walk up to the nearest existing ancestor: the target
                    // folder may not have been created yet.
                    var probe = File(path)
                    while (!probe.exists() && probe.parentFile != null) {
                        probe = probe.parentFile!!
                    }
                    val stat = StatFs(probe.absolutePath)
                    result.success(stat.availableBytes)
                } catch (e: Exception) {
                    result.error("STAT_FAILED", e.message, null)
                }
            }
            else -> result.notImplemented()
        }
    }
}
