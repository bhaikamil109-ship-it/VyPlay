package com.kamil.vyplay

import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File

/**
 * Handles video and audio muxing using FFmpeg (via the Dart-side
 * `ffmpeg_kit_flutter_new` package).
 *
 * This handler no longer performs the merge itself. The actual FFmpeg
 * execution happens in Dart (`download_impl.dart` -> `_muxVideoAndAudio`),
 * which is where the FFmpegKit session API lives. Keeping the merge in Dart
 * means one implementation covers every platform instead of a separate
 * Android-only MediaMuxer path.
 *
 * What remains here is the small amount of Android-specific work FFmpegKit
 * cannot do on its own:
 *   - verifying the input files actually exist and are non-empty,
 *   - choosing a container that matches the codecs (MP4 for H.264/AAC,
 *     MKV for VP9/Opus and other combinations MP4 cannot hold),
 *   - reporting the resolved output path back to Dart.
 *
 * The legacy `muxVideoAudio` method is kept as a thin compatibility shim so
 * that any older call site still resolves, but it now delegates to the same
 * container-selection logic and never writes a file itself.
 */
class FFmpegMuxerHandler : MethodChannel.MethodCallHandler {

    companion object {
        private const val TAG = "FFmpegMuxerHandler"

        /** Codec families that MP4 can legally carry. */
        private val MP4_VIDEO_CODECS = setOf("h264", "avc1", "avc3", "hevc", "h265", "mpeg4", "mp4v")
        private val MP4_AUDIO_CODECS = setOf("aac", "mp4a", "ac3", "eac3", "mp3")
    }

    private val scope = CoroutineScope(Dispatchers.IO)

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            // New primary entry point: resolve the container + validate inputs.
            "resolveMuxPlan" -> {
                val videoPath = call.argument<String>("videoPath")
                val audioPath = call.argument<String>("audioPath")
                val requestedOutput = call.argument<String>("outputPath")

                if (videoPath == null || audioPath == null || requestedOutput == null) {
                    result.error(
                        "INVALID_ARGS",
                        "videoPath, audioPath and outputPath are required",
                        null
                    )
                    return
                }

                scope.launch {
                    try {
                        val plan = buildMuxPlan(videoPath, audioPath, requestedOutput)
                        withContext(Dispatchers.Main) { result.success(plan) }
                    } catch (e: Exception) {
                        Log.e(TAG, "Mux plan resolution failed (${e.javaClass.simpleName})")
                        withContext(Dispatchers.Main) {
                            result.error("MUX_PLAN_FAILED", "Unable to resolve download merge plan", null)
                        }
                    }
                }
            }

            // Legacy shim. Older builds called this expecting a boolean merge
            // result. It now only validates inputs and reports whether a merge
            // is still required, so no MediaMuxer code path survives.
            "muxVideoAudio" -> {
                val videoPath = call.argument<String>("videoPath")
                val audioPath = call.argument<String>("audioPath")
                val outputPath = call.argument<String>("outputPath")

                if (videoPath == null || audioPath == null || outputPath == null) {
                    result.error(
                        "INVALID_ARGS",
                        "videoPath, audioPath and outputPath are required",
                        null
                    )
                    return
                }

                scope.launch {
                    try {
                        val plan = buildMuxPlan(videoPath, audioPath, outputPath)
                        withContext(Dispatchers.Main) {
                            // `handled = false` tells Dart to run the FFmpeg
                            // session itself; this channel no longer merges.
                            result.success(
                                mapOf(
                                    "handled" to false,
                                    "outputPath" to plan["outputPath"],
                                    "container" to plan["container"],
                                )
                            )
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Legacy mux-plan validation failed (${e.javaClass.simpleName})")
                        withContext(Dispatchers.Main) {
                            result.error("MUXING_FAILED", "Unable to validate download merge inputs", null)
                        }
                    }
                }
            }

            else -> result.notImplemented()
        }
    }

    /**
     * Validates the two input files and decides which container the merged
     * output should use. Returns a map Dart can act on directly.
     */
    private fun buildMuxPlan(
        videoPath: String,
        audioPath: String,
        requestedOutput: String,
    ): Map<String, Any> {
        val videoFile = File(videoPath)
        val audioFile = File(audioPath)

        if (!videoFile.exists() || videoFile.length() == 0L) {
            throw IllegalStateException("Video stream file is missing or empty")
        }
        if (!audioFile.exists() || audioFile.length() == 0L) {
            throw IllegalStateException("Audio stream file is missing or empty")
        }

        val videoCodec = probeCodec(videoPath, video = true)
        val audioCodec = probeCodec(audioPath, video = false)

        val container = chooseContainer(videoCodec, audioCodec)
        val outputPath = retargetExtension(requestedOutput, container)

        Log.i(
            TAG,
            "Mux plan: video=$videoCodec audio=$audioCodec container=$container"
        )

        return mapOf(
            "outputPath" to outputPath,
            "container" to container,
            "videoCodec" to (videoCodec ?: "unknown"),
            "audioCodec" to (audioCodec ?: "unknown"),
        )
    }

    /**
     * Best-effort codec sniffing from the file header.
     *
     * We deliberately avoid MediaExtractor here: the whole point of this
     * migration is to stop depending on the platform media stack for muxing.
     * FFmpeg itself will report a precise error if a stream is unusable, so a
     * cheap header scan is enough to pick a container.
     */
    private fun probeCodec(path: String, video: Boolean): String? {
        return try {
            val header = ByteArray(4096)
            File(path).inputStream().use { stream ->
                val read = stream.read(header)
                if (read <= 0) return null
            }
            val text = String(header, Charsets.ISO_8859_1).lowercase()
            when {
                text.contains("avc1") || text.contains("avc3") -> "h264"
                text.contains("hvc1") || text.contains("hev1") -> "hevc"
                text.contains("vp09") || text.contains("vp9") -> "vp9"
                text.contains("av01") -> "av1"
                text.contains("mp4a") -> "aac"
                text.contains("opus") -> "opus"
                text.contains("vorbis") -> "vorbis"
                text.contains("mp3") -> "mp3"
                else -> if (video) "h264" else "aac"
            }
        } catch (e: Exception) {
            Log.w(TAG, "Codec probe failed (${e.javaClass.simpleName})")
            if (video) "h264" else "aac"
        }
    }

    /**
     * MP4 only accepts a narrow set of codecs. Anything outside that set goes
     * into MKV, which is the container FFmpeg can always write without
     * re-encoding.
     */
    private fun chooseContainer(videoCodec: String?, audioCodec: String?): String {
        val videoOk = videoCodec == null || videoCodec in MP4_VIDEO_CODECS
        val audioOk = audioCodec == null || audioCodec in MP4_AUDIO_CODECS
        return if (videoOk && audioOk) "mp4" else "mkv"
    }

    private fun retargetExtension(path: String, container: String): String {
        val dot = path.lastIndexOf('.')
        val base = if (dot > 0) path.substring(0, dot) else path
        return "$base.$container"
    }
}
