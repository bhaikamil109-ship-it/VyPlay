package com.kamil.vyplay.potoken

import android.util.Base64
import org.json.JSONArray
import org.json.JSONObject

/**
 * Parsing helpers for YouTube's BotGuard Create/GenerateIT responses.
 * Ported from NewPipe's `JavaScriptUtil`, using org.json and android.util.Base64
 * instead of nanojson/okio so no extra dependency is needed.
 */
object PoTokenJs {

    fun parseChallengeData(rawChallengeData: String): String {
        val scrambled = JSONArray(rawChallengeData)
        val challengeData = if (scrambled.length() > 1 && scrambled.opt(1) is String) {
            JSONArray(descramble(scrambled.getString(1)))
        } else {
            scrambled.getJSONArray(0)
        }

        val messageId = challengeData.getString(0)
        val interpreterHash = challengeData.getString(3)
        val program = challengeData.getString(4)
        val globalName = challengeData.getString(5)
        val clientExperimentsStateBlob = challengeData.getString(7)

        val safeScript = findFirstString(challengeData.optJSONArray(1))
        val trustedResourceUrl = findFirstString(challengeData.optJSONArray(2))

        val interpreter = JSONObject()
            .put(
                "privateDoNotAccessOrElseSafeScriptWrappedValue",
                safeScript ?: JSONObject.NULL,
            )
            .put(
                "privateDoNotAccessOrElseTrustedResourceUrlWrappedValue",
                trustedResourceUrl ?: JSONObject.NULL,
            )

        return JSONObject()
            .put("messageId", messageId)
            .put("interpreterJavascript", interpreter)
            .put("interpreterHash", interpreterHash)
            .put("program", program)
            .put("globalName", globalName)
            .put("clientExperimentsStateBlob", clientExperimentsStateBlob)
            .toString()
    }

    fun parseIntegrityTokenData(rawIntegrityTokenData: String): Pair<String, Long> {
        val data = JSONArray(rawIntegrityTokenData)
        return base64ToU8(data.getString(0)) to data.getLong(1)
    }

    fun stringToU8(value: String): String = newUint8Array(value.toByteArray(Charsets.UTF_8))

    fun u8ToBase64(poToken: String): String {
        val bytes = poToken.split(',')
            .filter { it.isNotBlank() }
            .map { it.trim().toInt().toByte() }
            .toByteArray()
        return Base64.encodeToString(bytes, Base64.URL_SAFE or Base64.NO_WRAP)
    }

    private fun findFirstString(array: JSONArray?): String? {
        if (array == null) return null
        for (i in 0 until array.length()) {
            val value = array.opt(i)
            if (value is String) return value
        }
        return null
    }

    private fun descramble(scrambledChallenge: String): String {
        val bytes = base64ToBytes(scrambledChallenge)
        val decoded = ByteArray(bytes.size) { (bytes[it] + 97).toByte() }
        return String(decoded, Charsets.UTF_8)
    }

    private fun base64ToU8(base64: String): String = newUint8Array(base64ToBytes(base64))

    private fun newUint8Array(contents: ByteArray): String =
        "new Uint8Array([" + contents.joinToString(",") { (it.toInt() and 0xFF).toString() } + "])"

    private fun base64ToBytes(base64: String): ByteArray {
        val normalized = base64
            .replace('-', '+')
            .replace('_', '/')
            .replace('.', '=')
        return try {
            Base64.decode(normalized, Base64.DEFAULT)
        } catch (e: IllegalArgumentException) {
            throw PoTokenException("Cannot base64 decode: ${e.message}")
        }
    }
}
