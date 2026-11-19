package com.kamil.vyplay

import android.app.PictureInPictureParams
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Rect
import android.net.Uri
import android.os.Build
import android.util.Rational
import android.view.WindowManager
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.media3.common.util.UnstableApi
import com.ryanheise.audioservice.AudioServiceFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import com.kamil.vyplay.newpipe.NewPipeMethodHandler
import com.kamil.vyplay.player.NewPipeExoPlayerViewFactory
import com.kamil.vyplay.player.CastMethodHandler

@UnstableApi
class MainActivity: AudioServiceFragmentActivity() {
    companion object {
        private const val NEWPIPE_CHANNEL = "com.kamil.vyplay/newpipe"
        private const val PIP_CHANNEL = "com.kamil.vyplay/pip"
        private const val MUXER_CHANNEL = "com.kamil.vyplay/muxer"
        private const val CAST_CHANNEL = "com.kamil.vyplay/cast"
        private const val CAST_EVENT_CHANNEL = "com.kamil.vyplay/cast_events"
        private const val STORAGE_CHANNEL = "com.kamil.vyplay/storage"
        private const val SAF_CHANNEL = "com.kamil.vyplay/saf"
        private const val DOWNLOAD_SERVICE_CHANNEL = "com.kamil.vyplay/download_service"
        private const val DEVICE_CHANNEL = "com.kamil.vyplay/device"
        private const val MEDIA_STORE_CHANNEL = "com.kamil.vyplay/mediastore"
    }

    private var newPipeHandler: NewPipeMethodHandler? = null
    private var castHandler: CastMethodHandler? = null
    private var pipChannel: MethodChannel? = null
    private var muxerHandler: NewPipeMuxerHandler? = null
    private var safHandler: SafStorageHandler? = null

    /**
     * The system folder picker used for the download location. Created here
     * (not inside the handler) because ActivityResultLauncher must be
     * registered while the Activity is being created, which is also when
     * configureFlutterEngine runs.
     */
    private lateinit var safTreePicker: ActivityResultLauncher<Intent>

    // PiP state
    private var isPipModeEnabled = false
    private var isVideoPlaying = false
    private var videoAspectRatio: Rational = Rational(16, 9)
    private var sourceRectHint: Rect? = null

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)

        // Must be registered before the Activity reaches STARTED.
        safTreePicker = registerForActivityResult(
            ActivityResultContracts.StartActivityForResult()
        ) { activityResult ->
            val uri: Uri? = if (activityResult.resultCode == RESULT_OK) {
                activityResult.data?.data
            } else {
                null
            }
            safHandler?.onPickResult(uri)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Initialize NewPipe method handler
        newPipeHandler = NewPipeMethodHandler(applicationContext)

        // Register NewPipe method channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NEWPIPE_CHANNEL)
            .setMethodCallHandler(newPipeHandler)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(
                "vyplay/newpipe_exoplayer",
                NewPipeExoPlayerViewFactory(flutterEngine.dartExecutor.binaryMessenger)
            )

        // Register the native muxer. NewPipeMuxerHandler performs the real
        // merge with the vendored org.schabi.newpipe.streams writers and
        // delegates the legacy resolveMuxPlan/muxVideoAudio calls to
        // FFmpegMuxerHandler, so old call sites keep resolving.
        muxerHandler = NewPipeMuxerHandler()
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MUXER_CHANNEL)
            .setMethodCallHandler(muxerHandler)

        // Register Cast handler: one instance serves both the method channel and
        // the state event stream.
        val castHandler = CastMethodHandler()
        castHandler.setActivity(this)
        this.castHandler = castHandler
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CAST_CHANNEL)
            .setMethodCallHandler(castHandler)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CAST_EVENT_CHANNEL)
            .setStreamHandler(castHandler)

        // Register storage channel (free-space checks before a download starts)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, STORAGE_CHANNEL)
            .setMethodCallHandler(StorageMethodHandler())

        // Register the Storage Access Framework channel: folder picker,
        // persisted grants, write probes and ContentResolver copies. Android
        // 11+ cannot write a user-picked folder with plain File APIs, so this
        // is the only route that actually works for downloads.
        safHandler = SafStorageHandler(this, safTreePicker)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SAF_CHANNEL)
            .setMethodCallHandler(safHandler)

        // Keeps the process alive (dataSync foreground service) while downloads
        // are transferring. Progress notifications stay on the Dart side.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DOWNLOAD_SERVICE_CHANNEL)
            .setMethodCallHandler(DownloadServiceHandler(applicationContext))

        // Register device capability channel. The Flutter layer reads RAM/SDK
        // once at startup and picks low-end-friendly cache and list settings.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DEVICE_CHANNEL)
            .setMethodCallHandler(DeviceCapabilityHandler(applicationContext))

        // Register MediaStore channel. Android 10+ blocks direct writes to
        // /storage/emulated/0, so saved downloads go through MediaStore there.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MEDIA_STORE_CHANNEL)
            .setMethodCallHandler(MediaStoreHandler(applicationContext))

        // Register PiP method channel
        pipChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PIP_CHANNEL)
        pipChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "enterPip" -> {
                    val aspectRatioWidth = call.argument<Int>("aspectRatioWidth") ?: 16
                    val aspectRatioHeight = call.argument<Int>("aspectRatioHeight") ?: 9
                    videoAspectRatio = Rational(aspectRatioWidth, aspectRatioHeight)
                    isVideoPlaying = true

                    val success = enterPipMode()
                    result.success(success)
                }
                "exitPip" -> {
                    // PiP exit is handled by the system, but we can update our state
                    isVideoPlaying = false
                    updateKeepScreenOn()
                    result.success(true)
                }
                "setVideoPlaying" -> {
                    isVideoPlaying = call.argument<Boolean>("isPlaying") ?: false
                    updateKeepScreenOn()
                    updatePipParams()
                    result.success(true)
                }
                "isPipSupported" -> {
                    result.success(isPipSupported())
                }
                "isInPipMode" -> {
                    result.success(isInPictureInPictureMode)
                }
                "setAspectRatio" -> {
                    val width = call.argument<Int>("width") ?: 16
                    val height = call.argument<Int>("height") ?: 9
                    videoAspectRatio = Rational(width, height)
                    updatePipParams()
                    result.success(true)
                }
                "setSourceRect" -> {
                    val left = call.argument<Int>("left")
                    val top = call.argument<Int>("top")
                    val right = call.argument<Int>("right")
                    val bottom = call.argument<Int>("bottom")
                    sourceRectHint = if (
                        left != null &&
                        top != null &&
                        right != null &&
                        bottom != null &&
                        right > left &&
                        bottom > top
                    ) {
                        Rect(left, top, right, bottom)
                    } else {
                        null
                    }
                    updatePipParams()
                    result.success(true)
                }
                "enableAutoPip" -> {
                    isPipModeEnabled = call.argument<Boolean>("enabled") ?: false
                    updatePipParams()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun isPipSupported(): Boolean {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
    }

    private fun enterPipMode(): Boolean {
        if (!isPipSupported()) return false

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            try {
                enterPictureInPictureMode(buildPipParams())
                return true
            } catch (e: Exception) {
                e.printStackTrace()
                return false
            }
        }
        return false
    }

    private fun updatePipParams() {
        if (!isPipSupported()) return

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            try {
                setPictureInPictureParams(buildPipParams())
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    private fun updateKeepScreenOn() {
        if (isVideoPlaying) {
            window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        }
    }

    private fun buildPipParams(): PictureInPictureParams {
        val builder = PictureInPictureParams.Builder()
            .setAspectRatio(videoAspectRatio)

        sourceRectHint?.let { builder.setSourceRectHint(it) }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            builder.setAutoEnterEnabled(isPipModeEnabled && isVideoPlaying)
        }

        return builder.build()
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()

        // Auto-enter PiP when user leaves the app (presses home button)
        // Only if video is playing and auto-PiP is enabled
        if (isPipModeEnabled && isVideoPlaying && isPipSupported()) {
            enterPipMode()
        }
    }

    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: Configuration
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)

        // Notify Flutter about PiP mode change
        // Only invoke if the engine is still attached (activity not destroyed)
        try {
            if (!isDestroyed && !isFinishing) {
                pipChannel?.invokeMethod("onPipModeChanged", mapOf(
                    "isInPipMode" to isInPictureInPictureMode
                ))
            }
        } catch (e: Exception) {
            // Ignore - Flutter engine may have been detached
            e.printStackTrace()
        }
    }

    override fun onDestroy() {
        // Clear PiP channel to prevent callbacks after destruction
        pipChannel?.setMethodCallHandler(null)
        pipChannel = null
        safHandler?.dispose()
        safHandler = null
        newPipeHandler?.dispose()
        castHandler?.detach()
        castHandler = null
        window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        super.onDestroy()
    }
}
