package com.kamil.vyplay.potoken

class PoTokenException(message: String) : Exception(message)

/** Thrown when the system WebView is too old / broken to run BotGuard. */
class BadWebViewException(message: String) : Exception(message)

fun buildExceptionForJsError(error: String): Exception =
    if (error.contains("SyntaxError")) BadWebViewException(error) else PoTokenException(error)
