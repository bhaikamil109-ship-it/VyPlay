package com.kamil.vyplay

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * JVM tests for the rules that decide document names and MIME types in the
 * Storage Access Framework path. These run with `./gradlew testDebugUnitTest`
 * and need no device or emulator: the object under test has no Android
 * dependency on purpose.
 */
class SafFileNamesTest {

    @Test
    fun `sanitize replaces characters the folder rejects`() {
        assertEquals(
            "A_B_C_D_E_F_G_H_I_.mp4",
            SafFileNames.sanitize("A<B>C:D\"E/F\\G|H?I*", "mp4"),
        )
    }

    @Test
    fun `sanitize appends the extension once`() {
        assertEquals("Song.mp4", SafFileNames.sanitize("Song", "mp4"))
        assertEquals("Song.mp4", SafFileNames.sanitize("Song.mp4", "mp4"))
        assertEquals("Song.mp4", SafFileNames.sanitize("Song.mp4", ".mp4"))
    }

    @Test
    fun `sanitize collapses whitespace and falls back for empty titles`() {
        assertEquals("Hello World.mp4", SafFileNames.sanitize("Hello   World", "mp4"))
        assertEquals("download.mp4", SafFileNames.sanitize("   ", "mp4"))
    }

    @Test
    fun `sanitize strips control characters and trailing dots`() {
        assertEquals("Name_.mp4", SafFileNames.sanitize("Name\n.", "mp4"))
    }

    @Test
    fun `uniqueName returns the desired name when it is free`() {
        assertEquals(
            "video.mp4",
            SafFileNames.uniqueName("video.mp4") { false },
        )
    }

    @Test
    fun `uniqueName appends a counter before the extension`() {
        val taken = setOf("video.mp4", "video (1).mp4")
        assertEquals(
            "video (2).mp4",
            SafFileNames.uniqueName("video.mp4") { it in taken },
        )
    }

    @Test
    fun `uniqueName handles names without an extension`() {
        assertEquals(
            "backup (1)",
            SafFileNames.uniqueName("backup") { it == "backup" },
        )
    }

    @Test
    fun `mimeTypeFor knows the containers VyPlay writes`() {
        assertEquals("video/mp4", SafFileNames.mimeTypeFor("clip.mp4"))
        assertEquals("video/x-matroska", SafFileNames.mimeTypeFor("clip.MKV"))
        assertEquals("audio/mp4", SafFileNames.mimeTypeFor("clip.m4a"))
        assertEquals("audio/mpeg", SafFileNames.mimeTypeFor("clip.mp3"))
        assertEquals(
            "application/octet-stream",
            SafFileNames.mimeTypeFor("clip.unknown"),
        )
    }

    @Test
    fun `displayName shows the folder part of a tree id`() {
        assertEquals("VyPlay/Downloads", SafFileNames.displayName("primary:VyPlay/Downloads"))
        assertEquals("VyPlay", SafFileNames.displayName("1A2B-3C4D:VyPlay"))
        assertEquals("SD Card", SafFileNames.displayName("1A2B-3C4D:/SD Card/"))
        assertEquals("Selected folder", SafFileNames.displayName(null))
        assertEquals("Selected folder", SafFileNames.displayName("   "))
    }

    @Test
    fun `isTreeUri only accepts content schemes`() {
        assertTrue(SafFileNames.isTreeUri("content://com.android.externalstorage.documents/tree/primary%3AVyPlay"))
        assertFalse(SafFileNames.isTreeUri("/storage/emulated/0/VyPlay"))
        assertFalse(SafFileNames.isTreeUri(null))
        assertFalse(SafFileNames.isTreeUri(""))
    }
}
