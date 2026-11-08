package com.kamil.vyplay

import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File

/**
 * Publishes a finished download into the shared media collections.
 *
 * Why this exists: writing straight into `/storage/emulated/0/Movies` worked on
 * Android 9 and earlier, but Android 10 introduced scoped storage and a plain
 * `File.copy` into that directory now fails with EACCES no matter which
 * permission the app holds. The supported route is to hand the bytes to
 * `MediaStore`, which owns the volume and returns a content URI.
 *
 * Below API 29 the legacy path is still the correct one, so it is kept as the
 * explicit fallback rather than being deleted — that branch is what makes the
 * app work on the Android 7–9 devices this release targets.
 */
class MediaStoreHandler(private val context: Context) :
    MethodChannel.MethodCallHandler {

    private val scope = CoroutineScope(Dispatchers.IO)

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "saveToCollection" -> {
                val sourcePath = call.argument<String>("sourcePath")
                val fileName = call.argument<String>("fileName")
                val mimeType = call.argument<String>("mimeType")
                val album = call.argument<String>("album") ?: "VyPlay"

                if (sourcePath == null || fileName == null) {
                    result.error(
                        "INVALID_ARGS",
                        "sourcePath and fileName are required",
                        null
                    )
                    return
                }

                scope.launch {
                    try {
                        val savedPath = save(sourcePath, fileName, mimeType, album)
                        withContext(Dispatchers.Main) { result.success(savedPath) }
                    } catch (e: Exception) {
                        withContext(Dispatchers.Main) {
                            result.error("SAVE_FAILED", e.message, null)
                        }
                    }
                }
            }

            "isMediaStoreRequired" -> result.success(needsMediaStore())

            else -> result.notImplemented()
        }
    }

    private fun needsMediaStore(): Boolean = Build.VERSION.SDK_INT >= 29

    /**
     * Copies [sourcePath] into the shared collection and returns the file's
     * display path (for the user-facing "saved to" message).
     */
    private fun save(
        sourcePath: String,
        fileName: String,
        mimeType: String?,
        album: String,
    ): String? {
        val source = File(sourcePath)
        if (!source.exists() || source.length() == 0L) {
            throw IllegalStateException("Source file is missing or empty: $sourcePath")
        }

        val resolvedMime = mimeType ?: guessMime(fileName)
        val isAudio = resolvedMime.startsWith("audio/")

        // API 29+ — hand the bytes to MediaStore so the system owns the file.
        if (needsMediaStore()) {
            val collection = if (isAudio) {
                MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
            } else {
                MediaStore.Video.Media.EXTERNAL_CONTENT_URI
            }

            val relativeDir = if (isAudio) {
                "${Environment.DIRECTORY_MUSIC}/$album"
            } else {
                "${Environment.DIRECTORY_MOVIES}/$album"
            }

            val values = ContentValues().apply {
                put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                put(MediaStore.MediaColumns.MIME_TYPE, resolvedMime)
                put(MediaStore.MediaColumns.RELATIVE_PATH, relativeDir)
                put(MediaStore.MediaColumns.IS_PENDING, 1)
            }

            val uri: Uri = context.contentResolver.insert(collection, values)
                ?: throw IllegalStateException("MediaStore refused the insert")

            try {
                context.contentResolver.openOutputStream(uri)?.use { out ->
                    source.inputStream().use { input -> input.copyTo(out) }
                } ?: throw IllegalStateException("Could not open MediaStore output stream")

                // Clearing IS_PENDING is what makes the file visible to other
                // apps; skipping it leaves an invisible orphan.
                values.clear()
                values.put(MediaStore.MediaColumns.IS_PENDING, 0)
                context.contentResolver.update(uri, values, null, null)

                // Report the human-readable location rather than the content://
                // URI, since the UI shows this string to the user.
                val displayPath = "/${if (isAudio) Environment.DIRECTORY_MUSIC else Environment.DIRECTORY_MOVIES}/$album/$fileName"
                source.delete()
                return displayPath
            } catch (e: Exception) {
                // Never leave a half-written pending row behind.
                runCatching { context.contentResolver.delete(uri, null, null) }
                throw e
            }
        }

        // API < 29 — direct directory write is the supported path here, and
        // WRITE_EXTERNAL_STORAGE covers it.
        @Suppress("DEPRECATION")
        val publicDir = if (isAudio) {
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC)
        } else {
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES)
        }

        val targetDir = File(publicDir, album)
        if (!targetDir.exists() && !targetDir.mkdirs()) {
            throw IllegalStateException("Could not create $targetDir")
        }

        var target = File(targetDir, fileName)
        var counter = 1
        val dot = fileName.lastIndexOf('.')
        val base = if (dot > 0) fileName.substring(0, dot) else fileName
        val ext = if (dot > 0) fileName.substring(dot) else ""
        while (target.exists()) {
            target = File(targetDir, "$base ($counter)$ext")
            counter++
        }

        source.copyTo(target, overwrite = false)
        source.delete()
        return target.absolutePath
    }

    private fun guessMime(fileName: String): String {
        return when (fileName.substringAfterLast('.', "").lowercase()) {
            "mp4", "m4v" -> "video/mp4"
            "mkv" -> "video/x-matroska"
            "webm" -> "video/webm"
            "mp3" -> "audio/mpeg"
            "m4a" -> "audio/mp4"
            "opus" -> "audio/opus"
            "ogg" -> "audio/ogg"
            else -> "application/octet-stream"
        }
    }
}
