package com.kamil.vyplay.potoken

import android.content.Context
import java.io.Closeable

/**
 * Generates proof-of-origin tokens using YouTube's BotGuard VM inside an
 * offscreen WebView. Ported from NewPipe's `PoTokenGenerator`.
 */
interface PoTokenGenerator : Closeable {
    /** Generates a poToken for [identifier] using the previously loaded BotGuard VM. */
    suspend fun generatePoToken(identifier: String): String

    /** True when the loaded integrity token has expired and must be regenerated. */
    fun isExpired(): Boolean

    interface Factory {
        suspend fun newPoTokenGenerator(context: Context): PoTokenGenerator
    }
}
