package com.kamil.vyplay.player

import android.content.Context
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.view.View
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.database.StandaloneDatabaseProvider
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DefaultHttpDataSource
import androidx.media3.datasource.HttpDataSource
import androidx.media3.datasource.cache.CacheDataSource
import androidx.media3.datasource.cache.LeastRecentlyUsedCacheEvictor
import androidx.media3.datasource.cache.SimpleCache
import androidx.media3.exoplayer.DefaultLoadControl
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.dash.DashMediaSource
import androidx.media3.exoplayer.hls.HlsMediaSource
import androidx.media3.exoplayer.source.MergingMediaSource
import androidx.media3.exoplayer.source.ProgressiveMediaSource
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.ui.AspectRatioFrameLayout
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

private fun findHttpStatus(error: Throwable): Int? {
    val visited = HashSet<Throwable>()
    var current: Throwable? = error
    while (current != null && visited.add(current)) {
        if (current is HttpDataSource.InvalidResponseCodeException) {
            return current.responseCode
        }
        current = current.cause
    }
    return null
}

@UnstableApi
object NewPipeSharedExoPlayer {
    private var player: ExoPlayer? = null
    private var cache: SimpleCache? = null
    var sourceKey: String? = null

    fun get(context: Context): ExoPlayer {
        val existing = player
        if (existing != null) return existing

        val trackSelector = DefaultTrackSelector(context).apply {
            setParameters(
                buildUponParameters()
                    .setTunnelingEnabled(true)
                    .setAllowVideoMixedMimeTypeAdaptiveness(true)
                    .setAllowAudioMixedMimeTypeAdaptiveness(true)
            )
        }

        return ExoPlayer.Builder(context.applicationContext)
            .setTrackSelector(trackSelector)
            .setLoadControl(
                DefaultLoadControl.Builder()
                    .setBufferDurationsMs(
                        8_000,
                        30_000,
                        500,
                        1_500
                    )
                    .setPrioritizeTimeOverSizeThresholds(true)
                    .build()
            )
            .build()
            .also { player = it }
    }

    fun cache(context: Context): SimpleCache {
        val existing = cache
        if (existing != null) return existing

        return SimpleCache(
            context.applicationContext.cacheDir.resolve("exo_media"),
            LeastRecentlyUsedCacheEvictor(256L * 1024L * 1024L),
            StandaloneDatabaseProvider(context.applicationContext)
        ).also { cache = it }
    }

    fun play(): Boolean {
        val existing = player ?: return false
        existing.play()
        return true
    }

    fun pause(): Boolean {
        val existing = player ?: return false
        existing.pause()
        return true
    }

    fun stop(): Boolean {
        val existing = player ?: return false
        existing.stop()
        sourceKey = null
        return true
    }

    fun seekTo(positionMs: Long): Boolean {
        val existing = player ?: return false
        existing.seekTo(positionMs.coerceAtLeast(0))
        return true
    }

    fun seekBy(deltaMs: Long): Long {
        val existing = player ?: return 0L
        val duration = existing.duration
        val upperBound = if (duration == C.TIME_UNSET) Long.MAX_VALUE else duration.coerceAtLeast(0)
        val target = (existing.currentPosition + deltaMs)
            .coerceAtLeast(0)
            .coerceAtMost(upperBound)
        existing.seekTo(target)
        return target
    }
}

@UnstableApi
class NewPipeExoPlayerView(
    context: Context,
    messenger: BinaryMessenger,
    viewId: Int,
    creationParams: Map<*, *>
) : PlatformView, MethodChannel.MethodCallHandler {
    private val channel = MethodChannel(
        messenger,
        "com.kamil.vyplay/newpipe_exoplayer_$viewId"
    )
    private val httpDataSourceFactory = DefaultHttpDataSource.Factory()
        .setUserAgent(USER_AGENT)
        .setAllowCrossProtocolRedirects(true)
        .setConnectTimeoutMs(15_000)
        .setReadTimeoutMs(15_000)
    private val dataSourceFactory: DataSource.Factory = CacheDataSource.Factory()
        .setCache(NewPipeSharedExoPlayer.cache(context))
        .setUpstreamDataSourceFactory(httpDataSourceFactory)
        .setFlags(CacheDataSource.FLAG_IGNORE_CACHE_ON_ERROR)
    private val liveDataSourceFactory = DefaultHttpDataSource.Factory()
        .setUserAgent(USER_AGENT)
        .setAllowCrossProtocolRedirects(true)
        .setConnectTimeoutMs(30_000)
        .setReadTimeoutMs(30_000)
    private val mediaSourceFactory = ProgressiveMediaSource.Factory(dataSourceFactory)
    private val liveHlsFactory = HlsMediaSource.Factory(liveDataSourceFactory)
        .setAllowChunklessPreparation(true)
    private val player = NewPipeSharedExoPlayer.get(context)
    private val mainHandler = Handler(Looper.getMainLooper())
    private val positionUpdateRunnable = object : Runnable {
        override fun run() {
            sendState()
            if (player.isPlaying) {
                mainHandler.postDelayed(this, POSITION_UPDATE_INTERVAL_MS)
            }
        }
    }
    private val listener = object : Player.Listener {
        override fun onPlaybackStateChanged(playbackState: Int) {
            sendState()
            schedulePositionUpdates()
        }

        override fun onIsPlayingChanged(isPlaying: Boolean) {
            playerView.keepScreenOn = isPlaying
            sendState()
            schedulePositionUpdates()
        }

        override fun onPositionDiscontinuity(
            oldPosition: Player.PositionInfo,
            newPosition: Player.PositionInfo,
            reason: Int
        ) {
            sendState()
        }

        override fun onPlayerError(error: PlaybackException) {
            val errorCode = error.errorCodeName
            val httpStatus = findHttpStatus(error)
            val errorMessage = buildString {
                append(error.message ?: "Playback error")
                if (httpStatus != null) append(" (HTTP $httpStatus)")
            }
            val isPlaylistStuck = errorCode.contains("PlaylistStuck") ||
                error.cause?.javaClass?.simpleName?.contains("PlaylistStuck") == true
            channel.invokeMethod(
                "onError",
                mapOf(
                    "message" to errorMessage,
                    "code" to errorCode,
                    "httpStatus" to httpStatus,
                    "isPlaylistStuck" to isPlaylistStuck,
                    "sourceType" to sourceType,
                    "isLive" to isLive
                )
            )
            if (isPlaylistStuck && isLive) {
                android.util.Log.w("NewPipeExoPlayer", "Live HLS playlist stuck, requesting URL refresh")
                channel.invokeMethod("onLiveUrlExpired", mapOf<String, Any?>())
            }
        }
    }
    private val playerView = PlayerView(context).apply {
        player = this@NewPipeExoPlayerView.player
        useController = false
        keepScreenOn = this@NewPipeExoPlayerView.player.isPlaying
        resizeMode = AspectRatioFrameLayout.RESIZE_MODE_FIT
        setShowBuffering(PlayerView.SHOW_BUFFERING_NEVER)
    }

    private var sourceType = ""
    private var isLive = false

    /** True while the video surface is hidden (audio-only mode). */
    private var audioOnlyEnabled = false

    init {
        channel.setMethodCallHandler(this)
        player.addListener(listener)
        load(creationParams)
    }

    override fun getView(): View = playerView

    override fun dispose() {
        mainHandler.removeCallbacks(positionUpdateRunnable)
        player.removeListener(listener)
        channel.setMethodCallHandler(null)
        playerView.player = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "play" -> {
                player.play()
                result.success(null)
            }
            "pause" -> {
                player.pause()
                result.success(null)
            }
            "stop" -> {
                player.stop()
                NewPipeSharedExoPlayer.sourceKey = null
                playerView.keepScreenOn = false
                sendState()
                result.success(null)
            }
            "seekTo" -> {
                val positionMs = (call.argument<Number>("positionMs") ?: 0).toLong()
                player.seekTo(positionMs.coerceAtLeast(0))
                result.success(null)
            }
            "load" -> {
                val args = call.arguments as? Map<*, *> ?: emptyMap<String, Any?>()
                val keepPosition = args["keepPosition"] as? Boolean ?: false
                val mergedArgs = args.toMutableMap()
                if (keepPosition && !mergedArgs.containsKey("startPositionMs")) {
                    mergedArgs["startPositionMs"] = player.currentPosition.coerceAtLeast(0)
                }
                load(mergedArgs)
                result.success(null)
            }
            "setSpeed" -> {
                val speed = (call.argument<Number>("speed") ?: 1.0).toFloat()
                player.setPlaybackSpeed(speed.coerceIn(0.25f, 3.0f))
                result.success(null)
            }
            "setSkipSilence" -> {
                // ExoPlayer skips silent passages by time-stretching the audio
                // stream it already has; no extra decoding pass is involved.
                player.skipSilenceEnabled = call.argument<Boolean>("enabled") ?: false
                result.success(null)
            }
            "isSkipSilenceEnabled" -> result.success(player.skipSilenceEnabled)
            "setAudioOnly" -> {
                // Hiding the surface stops all video rendering and its decode
                // work while the audio renderer keeps playing; the player is
                // untouched so switching back needs no reload.
                val audioOnly = call.argument<Boolean>("enabled") ?: false
                playerView.visibility = if (audioOnly) View.GONE else View.VISIBLE
                audioOnlyEnabled = audioOnly
                result.success(null)
            }
            "isAudioOnly" -> result.success(audioOnlyEnabled)
            "getPosition" -> result.success(player.currentPosition.coerceAtLeast(0))
            "getDuration" -> {
                val duration = player.duration
                result.success(if (duration == C.TIME_UNSET) 0 else duration.coerceAtLeast(0))
            }
            "isPlaying" -> result.success(player.isPlaying)
            "setResizeMode" -> {
                playerView.resizeMode = resizeModeFrom(call.argument<String>("fitMode"))
                result.success(null)
            }
            "reattach" -> {
                playerView.player = null
                playerView.player = player
                playerView.invalidate()
                sendState()
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun load(params: Map<*, *>) {
        val attachOnly = params["attachOnly"] as? Boolean ?: false
        if (attachOnly) {
            playerView.resizeMode = resizeModeFrom(params["fitMode"] as? String)
            playerView.player = player
            sendState()
            return
        }

        sourceType = params["sourceType"] as? String ?: "progressive"
        isLive = params["isLive"] as? Boolean ?: false
        val sourceKey = params["sourceKey"] as? String
        val startPositionMs = (params["startPositionMs"] as? Number)?.toLong() ?: 0L
        val playWhenReady = params["playWhenReady"] as? Boolean ?: true
        playerView.resizeMode = resizeModeFrom(params["fitMode"] as? String)

        // Service-specific headers (notably Bilibili's Referer) must be
        // applied to every source reload, including quality/audio-track changes.
        val requestHeaders = (params["requestHeaders"] as? Map<*, *>)
            ?.mapNotNull { (key, value) ->
                if (key is String && value is String) key to value else null
            }
            ?.toMap()
            .orEmpty()
        httpDataSourceFactory.setDefaultRequestProperties(requestHeaders)
        liveDataSourceFactory.setDefaultRequestProperties(requestHeaders)

        // Applied on every load so a reload (quality or audio-track change)
        // cannot silently drop the user's preference.
        (params["skipSilence"] as? Boolean)?.let { player.skipSilenceEnabled = it }
        (params["audioOnly"] as? Boolean)?.let {
            audioOnlyEnabled = it
            playerView.visibility = if (it) View.GONE else View.VISIBLE
        }

        if (!sourceKey.isNullOrBlank() &&
            NewPipeSharedExoPlayer.sourceKey == sourceKey &&
            player.mediaItemCount > 0
        ) {
            player.playWhenReady = playWhenReady
            sendState()
            return
        }

        val mediaSource = when (sourceType) {
            "dash" -> {
                val manifestUrl = params["manifestUrl"] as? String
                if (manifestUrl.isNullOrBlank()) return
                DashMediaSource.Factory(dataSourceFactory)
                    .createMediaSource(mediaItem(manifestUrl, params))
            }
            "hls" -> {
                val manifestUrl = params["manifestUrl"] as? String
                if (manifestUrl.isNullOrBlank()) return
                val factory = if (isLive) liveHlsFactory else HlsMediaSource.Factory(dataSourceFactory)
                factory.createMediaSource(mediaItem(manifestUrl, params))
            }
            "merging" -> {
                val videoUrl = params["videoUrl"] as? String
                val audioUrl = params["audioUrl"] as? String
                if (videoUrl.isNullOrBlank() || audioUrl.isNullOrBlank()) return
                val videoSource = mediaSourceFactory
                    .createMediaSource(mediaItem(videoUrl, params))
                val audioSource = mediaSourceFactory
                    .createMediaSource(MediaItem.fromUri(Uri.parse(audioUrl)))
                MergingMediaSource(videoSource, audioSource)
            }
            else -> {
                val videoUrl = params["videoUrl"] as? String
                if (videoUrl.isNullOrBlank()) return
                mediaSourceFactory.createMediaSource(mediaItem(videoUrl, params))
            }
        }

        player.setMediaSource(mediaSource, startPositionMs.coerceAtLeast(0))
        NewPipeSharedExoPlayer.sourceKey = sourceKey
        player.playWhenReady = playWhenReady
        player.prepare()
        schedulePositionUpdates()
        sendState()
    }

    private fun mediaItem(url: String, params: Map<*, *>): MediaItem {
        val selectedSubtitleUrl = params["selectedSubtitleUrl"] as? String
        val selectedSubtitleLanguage = params["selectedSubtitleLanguage"] as? String
        val builder = MediaItem.Builder().setUri(Uri.parse(url))
        if (!selectedSubtitleUrl.isNullOrBlank()) {
            builder.setSubtitleConfigurations(
                listOf(
                    MediaItem.SubtitleConfiguration.Builder(Uri.parse(selectedSubtitleUrl))
                        .setMimeType(mimeTypeForSubtitle(selectedSubtitleUrl))
                        .setLanguage(selectedSubtitleLanguage)
                        .setSelectionFlags(C.SELECTION_FLAG_DEFAULT)
                        .build()
                )
            )
        }
        return builder.build()
    }

    private fun mimeTypeForSubtitle(url: String): String {
        val lower = url.lowercase()
        return when {
            lower.contains("ttml") || lower.endsWith(".ttml") || lower.endsWith(".xml") ->
                MimeTypes.APPLICATION_TTML
            lower.endsWith(".srt") -> MimeTypes.APPLICATION_SUBRIP
            else -> MimeTypes.TEXT_VTT
        }
    }

    private fun sendState() {
        val duration = player.duration
        channel.invokeMethod(
            "onState",
            mapOf(
                "isPlaying" to player.isPlaying,
                "isBuffering" to (player.playbackState == Player.STATE_BUFFERING),
                "positionMs" to player.currentPosition.coerceAtLeast(0),
                "durationMs" to if (duration == C.TIME_UNSET) 0 else duration.coerceAtLeast(0),
                "sourceType" to sourceType,
                "isLive" to isLive
            )
        )
    }

    private fun schedulePositionUpdates() {
        mainHandler.removeCallbacks(positionUpdateRunnable)
        if (player.isPlaying) {
            mainHandler.postDelayed(positionUpdateRunnable, POSITION_UPDATE_INTERVAL_MS)
        }
    }

    private fun resizeModeFrom(fitMode: String?): Int {
        return when (fitMode) {
            "cover" -> AspectRatioFrameLayout.RESIZE_MODE_ZOOM
            "fill" -> AspectRatioFrameLayout.RESIZE_MODE_FILL
            else -> AspectRatioFrameLayout.RESIZE_MODE_FIT
        }
    }

    companion object {
        private const val POSITION_UPDATE_INTERVAL_MS = 1_000L
        private const val USER_AGENT =
            "Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"
    }
}
