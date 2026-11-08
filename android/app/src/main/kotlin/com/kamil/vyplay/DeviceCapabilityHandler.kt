package com.kamil.vyplay

import android.app.ActivityManager
import android.content.Context
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Reports the handful of hardware facts the Flutter layer needs to pick
 * low-end-friendly defaults: how much RAM the device has, which Android
 * release it runs, and how many cores it can actually use.
 *
 * Everything here is read-only and synchronous, so a single method call is
 * enough. The Dart side caches the result for the whole process lifetime.
 */
class DeviceCapabilityHandler(private val context: Context) :
    MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getDeviceProfile" -> {
                try {
                    result.success(buildProfile())
                } catch (e: Exception) {
                    result.error("PROFILE_FAILED", e.message, null)
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun buildProfile(): Map<String, Any> {
        val activityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
        val memoryInfo = ActivityManager.MemoryInfo()
        activityManager?.getMemoryInfo(memoryInfo)

        // totalMem is the full physical RAM in bytes. 0 means the platform
        // refused to report it (rare, and only on very old vendors).
        val totalRamMb = (memoryInfo.totalMem / (1024L * 1024L)).toInt()

        val cores = Runtime.getRuntime().availableProcessors()

        return mapOf(
            "sdkInt" to Build.VERSION.SDK_INT,
            "totalRamMb" to totalRamMb,
            "lowRamDevice" to (activityManager?.isLowRamDevice ?: false),
            "processorCount" to cores,
            "is64Bit" to (Build.SUPPORTED_64_BIT_ABIS?.isNotEmpty() ?: false),
        )
    }
}
