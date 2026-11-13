package com.kamil.vyplay

import android.app.Activity
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.webkit.MimeTypeMap
import androidx.activity.result.ActivityResultLauncher
import androidx.documentfile.provider.DocumentFile
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File

/**
 * Storage Access Framework support for the download folder.
 *
 * Why this exists: on Android 11+ an app cannot create files in an arbitrary
 * shared directory with `java.io.File`, and the old
 * `WRITE_EXTERNAL_STORAGE` route does not work at all. The only supported way
 * to write into a folder the user picked — including a folder on a removable
 * SD card — is `ACTION_OPEN_DOCUMENT_TREE`, a persisted URI permission, and
 * `ContentResolver` streams. That is exactly what this handler implements.
 *
 * Every method answers on the main thread because MethodChannel results must
 * not be delivered from a background thread.
 */
class SafStorageHandler(
    private val activity: Activity,
    private val launcher: ActivityResultLauncher<Intent>,
) : MethodChannel.MethodCallHandler {

    companion object {
        private const val PROBE_NAME = ".vyplay_write_probe"

        /** Flags that make a tree grant survive a reboot. */
        private const val PERSIST_FLAGS =
            Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
    }

    private val context: Context get() = activity.applicationContext
    private val resolver: ContentResolver get() = context.contentResolver
    private val scope = CoroutineScope(Dispatchers.IO)

    /** Result of a picker launch that has not answered yet. */
    private var pendingPick: MethodChannel.Result? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "pickDirectory" -> pickDirectory(result)

            "persistedDirectories" -> scope.launch {
                val directories = persistedDirectories()
                withContext(Dispatchers.Main) { result.success(directories) }
            }

            "checkDirectory" -> {
                val uri = call.argument<String>("uri")
                if (uri.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "A tree uri is required", null)
                    return
                }
                scope.launch {
                    val check = try {
                        checkDirectory(Uri.parse(uri))
                    } catch (e: Exception) {
                        mapOf(
                            "status" to "unavailable",
                            "message" to (e.message ?: "The folder could not be read."),
                            "displayName" to SafFileNames.displayNameOfTreeUri(Uri.parse(uri)),
                        )
                    }
                    withContext(Dispatchers.Main) { result.success(check) }
                }
            }

            "releaseDirectory" -> {
                val uri = call.argument<String>("uri")
                if (uri.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "A tree uri is required", null)
                    return
                }
                scope.launch {
                    val released = try {
                        resolver.releasePersistableUriPermission(
                            Uri.parse(uri),
                            Intent.FLAG_GRANT_READ_URI_PERMISSION or
                                Intent.FLAG_GRANT_WRITE_URI_PERMISSION,
                        )
                        true
                    } catch (e: SecurityException) {
                        // Already gone; nothing to release is not a failure.
                        true
                    } catch (e: Exception) {
                        false
                    }
                    withContext(Dispatchers.Main) { result.success(released) }
                }
            }

            "copyIntoTree" -> {
                val treeUri = call.argument<String>("treeUri")
                val sourcePath = call.argument<String>("sourcePath")
                val fileName = call.argument<String>("fileName")
                val mimeType = call.argument<String>("mimeType")

                if (treeUri.isNullOrBlank() || sourcePath.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "treeUri and sourcePath are required", null)
                    return
                }

                scope.launch {
                    try {
                        val copied = copyIntoTree(
                            treeUri = Uri.parse(treeUri),
                            sourcePath = sourcePath,
                            fileName = fileName,
                            mimeType = mimeType,
                        )
                        withContext(Dispatchers.Main) { result.success(copied) }
                    } catch (e: Exception) {
                        withContext(Dispatchers.Main) {
                            result.error("COPY_FAILED", e.message, null)
                        }
                    }
                }
            }

            "deleteDocument" -> {
                val uri = call.argument<String>("uri")
                if (uri.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "A document uri is required", null)
                    return
                }
                scope.launch {
                    val deleted = try {
                        android.provider.DocumentsContract.deleteDocument(
                            resolver,
                            Uri.parse(uri),
                        )
                    } catch (e: Exception) {
                        false
                    }
                    withContext(Dispatchers.Main) { result.success(deleted) }
                }
            }

            "openDocument" -> {
                val uri = call.argument<String>("uri")
                val mimeType = call.argument<String>("mimeType")
                if (uri.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "A document uri is required", null)
                    return
                }
                result.success(openDocument(Uri.parse(uri), mimeType))
            }

            "shareDocument" -> {
                val uri = call.argument<String>("uri")
                val mimeType = call.argument<String>("mimeType")
                if (uri.isNullOrBlank()) {
                    result.error("INVALID_ARGS", "A document uri is required", null)
                    return
                }
                result.success(shareDocument(Uri.parse(uri), mimeType))
            }

            "isTreeUri" -> result.success(SafFileNames.isTreeUri(call.argument<String>("value")))

            else -> result.notImplemented()
        }
    }

    /**
     * Opens the system folder picker.
     *
     * The result arrives in [onPickResult]; only one pick may be in flight, a
     * second call fails instead of dropping the first caller's answer.
     */
    private fun pickDirectory(result: MethodChannel.Result) {
        if (pendingPick != null) {
            result.error("ALREADY_PICKING", "A folder picker is already open", null)
            return
        }
        pendingPick = result
        try {
            launcher.launch(
                Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
                    addFlags(
                        Intent.FLAG_GRANT_READ_URI_PERMISSION or
                            Intent.FLAG_GRANT_WRITE_URI_PERMISSION or
                            Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or
                            Intent.FLAG_GRANT_PREFIX_URI_PERMISSION,
                    )
                },
            )
        } catch (e: Exception) {
            pendingPick = null
            result.error("PICKER_UNAVAILABLE", e.message, null)
        }
    }

    /** Called by the Activity when the tree picker returns. */
    fun onPickResult(uri: Uri?) {
        val result = pendingPick ?: return
        pendingPick = null

        if (uri == null) {
            // User pressed back: not an error, just "nothing chosen".
            result.success(null)
            return
        }

        try {
            resolver.takePersistableUriPermission(uri, PERSIST_FLAGS)
        } catch (e: SecurityException) {
            result.error(
                "PERMISSION_DENIED",
                "The folder permission could not be kept. Pick the folder again and allow access.",
                null,
            )
            return
        }

        scope.launch {
            val check = try {
                checkDirectory(uri)
            } catch (e: Exception) {
                mapOf(
                    "status" to "unavailable",
                    "message" to (e.message ?: "The folder could not be written to."),
                    "displayName" to SafFileNames.displayNameOfTreeUri(uri),
                )
            }
            val payload = HashMap<String, Any?>(check)
            payload["uri"] = uri.toString()
            withContext(Dispatchers.Main) { result.success(payload) }
        }
    }

    /** Every tree grant this app still holds, newest first. */
    private fun persistedDirectories(): List<Map<String, Any?>> =
        resolver.persistedUriPermissions
            .filter { it.isWritePermission }
            .map { permission ->
                val uri = permission.uri
                mapOf(
                    "uri" to uri.toString(),
                    "displayName" to SafFileNames.displayNameOfTreeUri(uri),
                )
            }

    /**
     * Proves the tree can be written to by creating, filling and deleting a
     * real probe document. `canWrite()` on a DocumentFile is a permission flag,
     * not evidence: a revoked grant or a removed SD card still reports it.
     */
    private fun checkDirectory(uri: Uri): Map<String, Any?> {
        val displayName = SafFileNames.displayNameOfTreeUri(uri)

        val hasGrant = resolver.persistedUriPermissions.any {
            it.uri == uri && it.isWritePermission
        }
        if (!hasGrant) {
            return mapOf(
                "status" to "unavailable",
                "message" to "Access to this folder was revoked. Pick the folder again.",
                "displayName" to displayName,
            )
        }

        val tree = DocumentFile.fromTreeUri(context, uri)
        if (tree == null || !tree.exists() || !tree.isDirectory) {
            return mapOf(
                "status" to "unavailable",
                "message" to "This folder is no longer available. Pick another one.",
                "displayName" to displayName,
            )
        }

        var probe: DocumentFile? = null
        try {
            probe = tree.createFile("application/octet-stream", PROBE_NAME)
                ?: return mapOf(
                    "status" to "notWritable",
                    "message" to "The folder did not accept a test file. Pick another folder.",
                    "displayName" to displayName,
                )
            resolver.openOutputStream(probe.uri)?.use { out ->
                out.write("vyplay-write-probe".toByteArray())
                out.flush()
            } ?: return mapOf(
                "status" to "notWritable",
                "message" to "The folder did not accept a test file. Pick another folder.",
                "displayName" to displayName,
            )
        } catch (e: Exception) {
            return mapOf(
                "status" to "notWritable",
                "message" to "The folder is not writable (${e.message ?: "unknown error"}). " +
                    "Pick another folder.",
                "displayName" to displayName,
            )
        } finally {
            // A probe left behind would show up in the user's folder forever.
            runCatching { probe?.delete() }
        }

        return mapOf(
            "status" to "ready",
            "message" to null,
            "displayName" to displayName,
        )
    }

    /**
     * Copies a finished file into the chosen tree through ContentResolver.
     *
     * Returns the new document's URI so the app can open, share and delete it
     * later; the local staging copy is removed by the caller once this
     * succeeds.
     */
    private fun copyIntoTree(
        treeUri: Uri,
        sourcePath: String,
        fileName: String?,
        mimeType: String?,
    ): Map<String, Any?> {
        val source = File(sourcePath)
        if (!source.exists() || source.length() == 0L) {
            throw IllegalStateException("Source file is missing or empty: $sourcePath")
        }

        val tree = DocumentFile.fromTreeUri(context, treeUri)
            ?: throw IllegalStateException("The chosen folder is no longer available.")
        if (!tree.exists() || !tree.isDirectory) {
            throw IllegalStateException("The chosen folder is no longer available.")
        }

        val extension = sourcePath.substringAfterLast('.', "mp4")
        val desired = SafFileNames.sanitize(
            fileName ?: source.nameWithoutExtension,
            extension,
        )
        val resolvedMime = mimeType ?: SafFileNames.mimeTypeFor(desired)

        // Ask SAF to create the document; it appends " (1)" itself on a
        // collision, but the returned name is what we report back.
        val document = tree.createFile(resolvedMime, desired)
            ?: throw IllegalStateException("The folder refused to create the file.")

        try {
            resolver.openOutputStream(document.uri)?.use { out ->
                source.inputStream().use { input -> input.copyTo(out) }
            } ?: throw IllegalStateException("Could not open the folder for writing.")

            return mapOf(
                "uri" to document.uri.toString(),
                "displayName" to document.name,
                "displayPath" to "${SafFileNames.displayNameOfTreeUri(treeUri)}/${document.name}",
            )
        } catch (e: Exception) {
            // Never leave a zero-byte document behind in the user's folder.
            runCatching {
                android.provider.DocumentsContract.deleteDocument(resolver, document.uri)
            }
            throw e
        }
    }

    private fun openDocument(uri: Uri, mimeType: String?): Boolean {
        val resolved = mimeType ?: run {
            val extension = MimeTypeMap.getFileExtensionFromUrl(uri.toString())
            MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension)
        } ?: "application/octet-stream"

        val intent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(uri, resolved)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        return try {
            context.startActivity(intent)
            true
        } catch (e: Exception) {
            false
        }
    }

    private fun shareDocument(uri: Uri, mimeType: String?): Boolean {
        val resolved = mimeType ?: "application/octet-stream"
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = resolved
            putExtra(Intent.EXTRA_STREAM, uri)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        return try {
            context.startActivity(
                Intent.createChooser(intent, null).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            )
            true
        } catch (e: Exception) {
            false
        }
    }

    /** Drops a pending picker answer when the Activity goes away. */
    fun dispose() {
        pendingPick?.error("ACTIVITY_GONE", "The folder picker was closed", null)
        pendingPick = null
    }
}
