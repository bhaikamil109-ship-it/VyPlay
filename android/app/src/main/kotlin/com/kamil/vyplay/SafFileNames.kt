package com.kamil.vyplay

import android.net.Uri

/**
 * Pure, Android-free helpers for the Storage Access Framework path.
 *
 * They live in their own object so the rules that decide *what* a document is
 * called and *how* a collision is resolved can be unit-tested on the JVM
 * without a device, a ContentResolver or Robolectric.
 */
object SafFileNames {

    /** Characters MediaStore and DocumentsContract both reject in a display name. */
    private val forbidden = charArrayOf('<', '>', ':', '"', '/', '\\', '|', '?', '*')

    /**
     * Turns a video title into a safe document name.
     *
     * `extension` is appended when the cleaned title does not already end with
     * it, so `Song.mp4` never becomes `Song.mp4.mp4`.
     */
    fun sanitize(title: String, extension: String): String {
        val cleaned = buildString {
            for (ch in title) {
                append(if (ch in forbidden || ch.isISOControl()) '_' else ch)
            }
        }.replace(Regex("\\s+"), " ").trim().trim('.')

        val base = cleaned.ifEmpty { "download" }
        val ext = extension.trim().trimStart('.')
        if (ext.isEmpty()) return base
        return if (base.endsWith(".$ext", ignoreCase = true)) base else "$base.$ext"
    }

    /**
     * Adds ` (1)`, ` (2)`… before the extension until the name is free.
     *
     * [taken] is consulted rather than the filesystem so the same rule works
     * for SAF trees (where listing every child is expensive) and for plain
     * directories.
     */
    fun uniqueName(desired: String, taken: (String) -> Boolean): String {
        if (!taken(desired)) return desired
        val dot = desired.lastIndexOf('.')
        val base = if (dot > 0) desired.substring(0, dot) else desired
        val ext = if (dot > 0) desired.substring(dot) else ""
        var counter = 1
        while (true) {
            val candidate = "$base ($counter)$ext"
            if (!taken(candidate)) return candidate
            counter++
            if (counter > 1000) return candidate
        }
    }

    /** MIME type for a display name; the SAF picker shows this in file listings. */
    fun mimeTypeFor(fileName: String): String =
        when (fileName.substringAfterLast('.', "").lowercase()) {
            "mp4", "m4v" -> "video/mp4"
            "mkv" -> "video/x-matroska"
            "webm" -> "video/webm"
            "3gp" -> "video/3gpp"
            "mp3" -> "audio/mpeg"
            "m4a" -> "audio/mp4"
            "opus" -> "audio/opus"
            "ogg", "oga" -> "audio/ogg"
            "flac" -> "audio/flac"
            "wav" -> "audio/wav"
            "srt" -> "application/x-subrip"
            "vtt" -> "text/vtt"
            else -> "application/octet-stream"
        }

    /**
     * Human-readable name for a tree URI.
     *
     * The document id of a tree is `primary:VyPlay/Downloads` or
     * `1A2B-3C4D:VyPlay`; the UI shows the part after the volume id.
     */
    fun displayName(treeId: String?): String {
        if (treeId.isNullOrBlank()) return "Selected folder"
        val afterVolume = treeId.substringAfter(':', treeId)
        val trimmed = afterVolume.trim('/')
        return trimmed.ifEmpty { treeId.trim(':') }
    }

    /** Display name for a `content://` tree URI, or null when it is not one. */
    fun displayNameOfTreeUri(uri: Uri?): String? {
        if (uri == null || uri.scheme != "content") return null
        val segments = uri.pathSegments
        val treeIndex = segments.indexOf("tree")
        val treeId = if (treeIndex >= 0 && treeIndex + 1 < segments.size) {
            segments[treeIndex + 1]
        } else {
            segments.lastOrNull()
        }
        return displayName(Uri.decode(treeId))
    }

    /** Whether [value] is a SAF tree/document URI rather than a filesystem path. */
    fun isTreeUri(value: String?): Boolean =
        value != null && value.startsWith("content://", ignoreCase = true)
}
