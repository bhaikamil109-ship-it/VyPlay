package com.kamil.vyplay

import android.util.Log
import com.arthenica.ffmpegkit.FFmpegKit
import com.arthenica.ffmpegkit.ReturnCode
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.schabi.newpipe.streams.Mp4FromDashWriter
import org.schabi.newpipe.streams.OggFromWebMWriter
import org.schabi.newpipe.streams.WebMReader
import org.schabi.newpipe.streams.WebMWriter
import org.schabi.newpipe.streams.io.SharpStream
import java.io.File
import java.io.IOException
import java.io.RandomAccessFile

/**
 * Merges separate video and audio streams with PipePipe's FFmpegKit remux
 * approach (`-c copy`, no re-encoding). The NewPipe 0.29.1 writers remain as
 * a compatibility fallback for ABIs where the upstream FFmpegKit binary is
 * unavailable, notably 32-bit ARM.
 *
 * Audio-only Opus demuxing still uses NewPipe's [OggFromWebMWriter].
 *
 * This handler remains on the existing `com.kamil.vyplay/muxer` channel and
 * delegates legacy mux-plan methods to [FFmpegMuxerHandler].
 */
class NewPipeMuxerHandler(
    private val legacy: FFmpegMuxerHandler = FFmpegMuxerHandler(),
) : MethodChannel.MethodCallHandler {

    companion object {
        private const val TAG = "NewPipeMuxerHandler"

        /** EBML header, i.e. a WebM/Matroska file. */
        private const val EBML_MAGIC = 0x1A45DFA3

        /** OggS capture pattern, i.e. an already-Ogg file. */
        private const val OGG_MAGIC = 0x4F676753
    }

    private val scope = CoroutineScope(Dispatchers.IO)

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "mergeStreams" -> {
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
                        val merged = mergeStreams(videoPath, audioPath, outputPath)
                        withContext(Dispatchers.Main) { result.success(merged) }
                    } catch (e: Exception) {
                        Log.e(TAG, "Native merge failed", e)
                        withContext(Dispatchers.Main) {
                            result.error("MERGE_FAILED", e.message ?: "merge failed", null)
                        }
                    }
                }
            }

            "demuxAudio" -> {
                val inputPath = call.argument<String>("inputPath")
                val outputPath = call.argument<String>("outputPath")

                if (inputPath == null || outputPath == null) {
                    result.error(
                        "INVALID_ARGS",
                        "inputPath and outputPath are required",
                        null
                    )
                    return
                }

                scope.launch {
                    try {
                        val out = demuxAudio(inputPath, outputPath)
                        withContext(Dispatchers.Main) { result.success(out) }
                    } catch (e: Exception) {
                        Log.e(TAG, "Native demux failed", e)
                        withContext(Dispatchers.Main) {
                            result.error("DEMUX_FAILED", e.message ?: "demux failed", null)
                        }
                    }
                }
            }

            // Everything else belongs to the pre-existing FFmpeg mux-plan
            // contract; keep it working rather than breaking old call sites.
            else -> legacy.onMethodCall(call, result)
        }
    }

    /**
     * Merges [videoPath] and [audioPath] into [outputPath].
     *
     * The container is chosen from the actual file headers, not the file
     * extension, because YouTube serves both MP4/DASH and WebM variants for the
     * same video. Returns a map with the real output path and container.
     */
    private fun mergeStreams(
        videoPath: String,
        audioPath: String,
        outputPath: String,
    ): Map<String, Any> {
        val videoFile = File(videoPath)
        val audioFile = File(audioPath)

        if (!videoFile.exists() || videoFile.length() == 0L) {
            throw IllegalStateException("Video stream file is missing or empty: $videoPath")
        }
        if (!audioFile.exists() || audioFile.length() == 0L) {
            throw IllegalStateException("Audio stream file is missing or empty: $audioPath")
        }

        val videoKind = sniffContainer(videoPath)
        val audioKind = sniffContainer(audioPath)

        // FFmpeg can remux different input container families into Matroska
        // without re-encoding. Keep MP4/WebM when the pair already matches.
        val container = when {
            videoKind == Container.MP4 && audioKind == Container.MP4 -> "mp4"
            videoKind == Container.WEBM && audioKind == Container.WEBM -> "webm"
            else -> "mkv"
        }

        val target = retargetExtension(outputPath, container)
        val targetFile = File(target)
        if (targetFile.exists() && !targetFile.delete()) {
            throw IllegalStateException("Could not clear stale merge output: $target")
        }

        Log.i(TAG, "PipePipe FFmpeg remux: $videoKind + $audioKind -> $container at $target")

        var ffmpegFailure: Throwable? = null
        try {
            mergeWithPipePipeFfmpeg(videoPath, audioPath, target, container)
        } catch (error: Exception) {
            ffmpegFailure = error
        } catch (error: LinkageError) {
            ffmpegFailure = error
        }

        if (ffmpegFailure != null) {
            Log.w(TAG, "PipePipe FFmpegKit failed; checking NewPipe compatibility fallback", ffmpegFailure)
            try {
                when {
                    videoKind == Container.MP4 && audioKind == Container.MP4 ->
                        mergeMp4(videoPath, audioPath, target)
                    videoKind == Container.WEBM && audioKind == Container.WEBM ->
                        mergeWebM(videoPath, audioPath, target)
                    else -> throw IllegalStateException(
                        "The NewPipe fallback cannot mux mixed/unknown input containers."
                    )
                }
            } catch (fallbackError: Exception) {
                targetFile.delete()
                throw IllegalStateException(
                    "PipePipe FFmpeg remux failed: ${ffmpegFailure.message ?: ffmpegFailure.javaClass.simpleName}. " +
                        "NewPipe fallback also failed: ${fallbackError.message ?: fallbackError.javaClass.simpleName}",
                    fallbackError
                )
            } catch (fallbackError: LinkageError) {
                targetFile.delete()
                throw IllegalStateException(
                    "PipePipe FFmpeg remux failed and the NewPipe compatibility fallback is unavailable: " +
                        (fallbackError.message ?: fallbackError.javaClass.simpleName),
                    fallbackError
                )
            }
        }

        if (!targetFile.exists() || targetFile.length() == 0L) {
            targetFile.delete()
            throw IllegalStateException("Remuxer produced no usable output at $target")
        }

        Log.i(TAG, "Merge complete: $target (${targetFile.length()} bytes)")

        return mapOf(
            "outputPath" to target,
            "container" to container,
            "videoContainer" to videoKind.name.lowercase(),
            "audioContainer" to audioKind.name.lowercase(),
        )
    }

    /**
     * Run PipePipe's FFmpegKit stream-copy remux. Arguments are passed as an
     * array (not a shell command), so paths with spaces remain safe.
     */
    private fun mergeWithPipePipeFfmpeg(
        videoPath: String,
        audioPath: String,
        target: String,
        container: String,
    ) {
        val targetFile = File(target)
        val temporaryFile = File(retargetExtension(target, "tmp.$container"))
        temporaryFile.delete()

        try {
            val arguments = mutableListOf(
                "-hide_banner",
                "-nostats",
                "-loglevel", "error",
                "-y",
                "-i", videoPath,
                "-i", audioPath,
                "-map", "0:v:0",
                "-map", "1:a:0",
                "-map_metadata", "0",
                "-c", "copy",
            )
            if (container == "mp4") {
                arguments.add("-movflags")
                arguments.add("+faststart")
            }
            arguments.add(temporaryFile.absolutePath)

            val session = FFmpegKit.executeWithArguments(arguments.toTypedArray())
            if (!ReturnCode.isSuccess(session.returnCode)) {
                throw IllegalStateException(
                    "FFmpegKit returned ${session.returnCode}: " +
                        (session.output.takeIf { it.isNotBlank() } ?: "no FFmpeg diagnostic output")
                )
            }
            if (!temporaryFile.exists() || temporaryFile.length() == 0L) {
                throw IllegalStateException("FFmpegKit reported success but produced an empty output file")
            }

            if (targetFile.exists() && !targetFile.delete()) {
                throw IllegalStateException("Could not replace merge output: $target")
            }
            if (!temporaryFile.renameTo(targetFile)) {
                temporaryFile.copyTo(targetFile, overwrite = true)
                temporaryFile.delete()
            }
        } finally {
            temporaryFile.delete()
        }
    }

    /** DASH fragments -> progressive MP4, exactly as NewPipe's Mp4FromDashMuxer. */
    private fun mergeMp4(videoPath: String, audioPath: String, target: String) {
        val sources = arrayOf<SharpStream>(
            RandomAccessSharpStream(File(videoPath), "r"),
            RandomAccessSharpStream(File(audioPath), "r"),
        )
        val output = RandomAccessSharpStream(File(target), "rw")

        try {
            val muxer = Mp4FromDashWriter(*sources)
            muxer.parseSources()
            muxer.selectTracks(0, 0)
            muxer.build(output)
        } finally {
            closeQuietly(output)
            sources.forEach { closeQuietly(it) }
        }
    }

    /**
     * WebM -> WebM, mirroring NewPipe's WebMMuxer: YouTube's WebM video stream
     * can carry a fake video track used as a cover image, so the audio track is
     * located explicitly instead of assuming index 0.
     */
    private fun mergeWebM(videoPath: String, audioPath: String, target: String) {
        val sources = arrayOf<SharpStream>(
            RandomAccessSharpStream(File(videoPath), "r"),
            RandomAccessSharpStream(File(audioPath), "r"),
        )
        val output = RandomAccessSharpStream(File(target), "rw")

        try {
            val muxer = WebMWriter(*sources)
            muxer.parseSources()

            val indexes = IntArray(sources.size)
            for (i in sources.indices) {
                val tracks = muxer.getTracksFromSource(i)
                for (j in tracks.indices) {
                    if (tracks[j].kind == WebMReader.TrackKind.Audio) {
                        indexes[i] = j
                        break
                    }
                }
            }

            muxer.selectTracks(*indexes)
            muxer.build(output)
        } finally {
            closeQuietly(output)
            sources.forEach { closeQuietly(it) }
        }
    }

    /**
     * WebM/Opus -> Ogg/Opus, mirroring NewPipe's OggFromWebmDemuxer. Used for
     * audio-only downloads so the saved file is a real `.opus`/`.ogg` rather
     * than a WebM container with an Opus payload.
     */
    private fun demuxAudio(inputPath: String, outputPath: String): Map<String, Any> {
        val inputFile = File(inputPath)
        if (!inputFile.exists() || inputFile.length() == 0L) {
            throw IllegalStateException("Audio stream file is missing or empty: $inputPath")
        }

        val kind = sniffContainer(inputPath)
        if (kind == Container.OGG) {
            // Already Ogg; nothing to demux.
            return mapOf("outputPath" to inputPath, "container" to "ogg", "skipped" to true)
        }
        if (kind != Container.WEBM) {
            throw IllegalStateException(
                "Cannot demux $kind audio to Ogg; only WebM/Opus is supported."
            )
        }

        val target = retargetExtension(outputPath, "ogg")
        val targetFile = File(target)
        if (targetFile.exists()) {
            targetFile.delete()
        }

        val source = RandomAccessSharpStream(inputFile, "r")
        val output = RandomAccessSharpStream(targetFile, "rw")

        try {
            val demuxer = OggFromWebMWriter(source, output)
            demuxer.parseSource()
            demuxer.selectTrack(0)
            demuxer.build()
        } finally {
            closeQuietly(output)
            closeQuietly(source)
        }

        if (!targetFile.exists() || targetFile.length() == 0L) {
            throw IllegalStateException("Demuxer produced no usable output at $target")
        }

        return mapOf("outputPath" to target, "container" to "ogg", "skipped" to false)
    }

    private enum class Container { MP4, WEBM, OGG, UNKNOWN }

    /**
     * Reads the first bytes of [path] and reports the container family.
     *
     * This is a header sniff, not a full parse: it is only used to pick which
     * muxer to run. The muxer itself fails loudly if the payload is unusable.
     */
    private fun sniffContainer(path: String): Container {
        val header = ByteArray(12)
        val read = File(path).inputStream().use { it.read(header) }
        if (read < 8) return Container.UNKNOWN

        val firstInt = ((header[0].toInt() and 0xFF) shl 24) or
            ((header[1].toInt() and 0xFF) shl 16) or
            ((header[2].toInt() and 0xFF) shl 8) or
            (header[3].toInt() and 0xFF)

        return when {
            firstInt == EBML_MAGIC -> Container.WEBM
            firstInt == OGG_MAGIC -> Container.OGG
            // ISO base media file format: a 4-byte box size then "ftyp".
            header[4] == 'f'.code.toByte() &&
                header[5] == 't'.code.toByte() &&
                header[6] == 'y'.code.toByte() &&
                header[7] == 'p'.code.toByte() -> Container.MP4
            else -> Container.UNKNOWN
        }
    }

    private fun retargetExtension(path: String, container: String): String {
        val dot = path.lastIndexOf('.')
        val base = if (dot > 0) path.substring(0, dot) else path
        return "$base.$container"
    }

    private fun closeQuietly(stream: SharpStream?) {
        try {
            stream?.close()
        } catch (e: IOException) {
            Log.w(TAG, "Failed to close stream", e)
        }
    }

    /**
     * A [SharpStream] backed by [RandomAccessFile].
     *
     * The NewPipe writers need a stream that can read, write, rewind, seek and
     * set its length, which is exactly what a random-access file provides. The
     * upstream SAF-backed implementation is not used because VyPlay's downloads
     * always land in the app's own directory, where a plain file is available.
     */
    private class RandomAccessSharpStream(
        private val file: File,
        mode: String,
    ) : SharpStream() {

        private val raf = RandomAccessFile(file, mode)
        private var closed = false

        override fun read(): Int = raf.read()

        override fun read(buffer: ByteArray): Int = raf.read(buffer)

        override fun read(buffer: ByteArray, offset: Int, count: Int): Int =
            raf.read(buffer, offset, count)

        override fun skip(amount: Long): Long {
            raf.seek(raf.filePointer + amount)
            return amount
        }

        override fun available(): Long = raf.length() - raf.filePointer

        override fun rewind() {
            raf.seek(0)
        }

        override fun isClosed(): Boolean = closed

        override fun close() {
            if (!closed) {
                closed = true
                raf.close()
            }
        }

        override fun canRewind(): Boolean = true

        override fun canRead(): Boolean = true

        override fun canWrite(): Boolean = true

        override fun canSetLength(): Boolean = true

        override fun canSeek(): Boolean = true

        override fun write(value: Byte) {
            raf.write(value.toInt())
        }

        override fun write(buffer: ByteArray) {
            raf.write(buffer)
        }

        override fun write(buffer: ByteArray, offset: Int, count: Int) {
            raf.write(buffer, offset, count)
        }

        override fun flush() {
            raf.fd.sync()
        }

        override fun setLength(length: Long) {
            raf.setLength(length)
        }

        override fun seek(offset: Long) {
            raf.seek(offset)
        }

        override fun length(): Long = raf.length()
    }
}
