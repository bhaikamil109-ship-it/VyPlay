package com.kamil.vyplay.newpipe

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import com.kamil.vyplay.potoken.PoTokenProviderImpl
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*
import org.schabi.newpipe.extractor.InfoItem
import org.schabi.newpipe.extractor.search.filter.Filter
import org.schabi.newpipe.extractor.search.filter.FilterItem
import org.schabi.newpipe.extractor.NewPipe
import org.schabi.newpipe.extractor.ServiceList
import org.schabi.newpipe.extractor.StreamingService
import org.schabi.newpipe.extractor.channel.ChannelInfo
import org.schabi.newpipe.extractor.comments.CommentsInfo
import org.schabi.newpipe.extractor.kiosk.KioskInfo
import org.schabi.newpipe.extractor.localization.ContentCountry
import org.schabi.newpipe.extractor.localization.Localization
import org.schabi.newpipe.extractor.playlist.PlaylistInfo
import org.schabi.newpipe.extractor.search.SearchInfo
import org.schabi.newpipe.extractor.stream.StreamInfo
import org.schabi.newpipe.extractor.stream.AudioStream
import org.schabi.newpipe.extractor.stream.VideoStream
import org.schabi.newpipe.extractor.suggestion.SuggestionExtractor
import java.util.concurrent.ConcurrentHashMap

/**
 * Handles all method channel calls from Flutter for NewPipe Extractor operations.
 * All extraction runs on background threads using Kotlin Coroutines.
 */
class NewPipeMethodHandler(
    private val appContext: Context? = null,
) : MethodChannel.MethodCallHandler {

    private val scope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val mainHandler = Handler(Looper.getMainLooper())
    private val gson: Gson = GsonBuilder()
        .serializeNulls()
        .create()
    private val streamInfoCache = ConcurrentHashMap<String, CachedStreamInfo>()
    private val streamInfoCacheTtlMs = 5 * 60 * 1000L

    companion object {
        private var isInitialized = false

        fun initialize(context: Context? = null) {
            if (!isInitialized) {
                NewPipe.init(VyPlayDownloader.getInstance())
                context?.let { PoTokenProviderImpl.setContext(it.applicationContext) }
                // PipePipe's pinned API uses a per-video MWEB PO-token resolver.
                NewPipe.setYoutubePoTokenResolver(
                    if (PoTokenProviderImpl.isAvailable()) {
                        java.util.function.Function { videoId ->
                            PoTokenProviderImpl.getYoutubePoTokenResult(videoId)
                        }
                    } else {
                        null
                    }
                )
                isInitialized = true
            }
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        initialize(appContext)

        when (call.method) {
            "isAvailable" -> result.success(true)
            "setCookie" -> {
                VyPlayDownloader.setCookie(call.argument<String>("cookie"))
                streamInfoCache.clear()
                result.success(true)
            }
            // Explicit cache invalidation. Without this, a refresh after an
            // expired Googlevideo URL kept returning the cached StreamInfo
            // (and therefore the same dead stream URLs) for up to 5 minutes.
            "clearStreamCache" -> {
                val id = call.argument<String>("id")
                val serviceId = call.argument<String>("serviceId") ?: "newpipe"
                if (id.isNullOrBlank()) {
                    streamInfoCache.clear()
                } else {
                    streamInfoCache.remove(streamCacheKey(serviceId, id))
                }
                result.success(true)
            }
            "getStreamInfo" -> handleGetStreamInfo(call, result)
            "getStreamInfoFast" -> handleGetStreamInfoFast(call, result)
            "getTrending" -> handleGetTrending(call, result)
            "getShorts" -> handleGetShorts(call, result)
            "search" -> handleSearch(call, result)
            "getSearchSuggestions" -> handleGetSearchSuggestions(call, result)
            "getChannel" -> handleGetChannel(call, result)
            "getChannelTab" -> handleGetChannelTab(call, result)
            "getComments" -> handleGetComments(call, result)
            "getMoreComments" -> handleGetMoreComments(call, result)
            "getCommentReplies" -> handleGetCommentReplies(call, result)
            "getPlaylist" -> handleGetPlaylist(call, result)
            "getRelatedStreams" -> handleGetRelatedStreams(call, result)
            "openExternalPlayer" -> handleOpenExternalPlayer(call, result)
            else -> result.notImplemented()
        }
    }

    /**
     * Hands the resolved stream URL to another video player.
     *
     * Uses ACTION_VIEW with an explicit MIME type so Android offers every app
     * that can play this container (VLC, MX Player, the system player…) instead
     * of only browsers. The URL is the already-extracted stream, so no extra
     * network request or extractor work happens here.
     */
    private fun handleOpenExternalPlayer(call: MethodCall, result: MethodChannel.Result) {
        val url = call.argument<String>("url")
        if (url.isNullOrBlank()) {
            result.error("INVALID_URL", "A stream url is required", null)
            return
        }

        val context = appContext
        if (context == null) {
            result.error("NO_CONTEXT", "No Android context is available", null)
            return
        }

        val mimeType = call.argument<String>("mimeType") ?: "video/*"
        val title = call.argument<String>("title")

        try {
            val view = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(Uri.parse(url), mimeType)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
            val chooser = Intent.createChooser(view, title).apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            context.startActivity(chooser)
            result.success(true)
        } catch (e: Exception) {
            // No player installed / activity not found.
            result.error("NO_HANDLER", e.message ?: "No app can play this stream", null)
        }
    }

    /**
     * Get video stream info (video details, streams, etc.)
     */
    private fun handleGetStreamInfo(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val streamInfo = getCachedOrExtractStreamInfo(videoId, serviceId)

                // Get the best quality thumbnail
                val bestThumbnail = streamInfo.thumbnails.maxByOrNull { it.width * it.height }?.url
                    ?: streamInfo.thumbnails.lastOrNull()?.url

                val response = mapOf(
                    "id" to streamInfo.id,
                    "title" to streamInfo.name,
                    "description" to streamInfo.description?.content,
                    "uploaderName" to streamInfo.uploaderName,
                    "uploaderUrl" to streamInfo.uploaderUrl,
                    "uploaderAvatarUrl" to streamInfo.uploaderAvatars.firstOrNull()?.url,
                    "uploaderVerified" to streamInfo.isUploaderVerified,
                    "uploaderSubscriberCount" to streamInfo.uploaderSubscriberCount,
                    "thumbnailUrl" to bestThumbnail,
                    "duration" to streamInfo.duration,
                    "viewCount" to streamInfo.viewCount,
                    "likeCount" to streamInfo.likeCount,
                    "dislikeCount" to streamInfo.dislikeCount,
                    "uploadDate" to streamInfo.uploadDate?.offsetDateTime()?.toString(),
                    "textualUploadDate" to streamInfo.textualUploadDate,
                    "category" to streamInfo.category,
                    "tags" to streamInfo.tags?.toList(),
                    "isLive" to (streamInfo.streamType.name == "LIVE_STREAM"),
                    "hlsUrl" to streamInfo.hlsUrl,
                    "dashMpdUrl" to streamInfo.dashMpdUrl,
                    "audioStreams" to streamInfo.audioStreams.map { mapAudioStream(it) },
                    "videoStreams" to streamInfo.videoStreams.map { mapVideoStream(it) },
                    "videoOnlyStreams" to streamInfo.videoOnlyStreams.map { mapVideoStream(it) },
                    "relatedStreams" to streamInfo.relatedItems.take(20).map { mapInfoItem(it) },
                    "subtitles" to streamInfo.subtitles.map { subtitle ->
                        mapOf(
                            "url" to subtitle.content,
                            "mimeType" to subtitle.format?.mimeType,
                            "languageCode" to subtitle.languageTag,
                            "autoGenerated" to subtitle.isAutoGenerated
                        )
                    }
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to extract stream info", null)
            }
        }
    }

    /**
     * Get video stream info fast (essential data only - no related videos)
     * Returns quickly with just the data needed to start playback
     */
    private fun handleGetStreamInfoFast(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val streamInfo = getCachedOrExtractStreamInfo(videoId, serviceId)

                // Get the best quality thumbnail
                val bestThumbnail = streamInfo.thumbnails.maxByOrNull { it.width * it.height }?.url
                    ?: streamInfo.thumbnails.lastOrNull()?.url

                // Return only essential data for fast playback start
                val response = mapOf(
                    "id" to streamInfo.id,
                    "title" to streamInfo.name,
                    "uploaderName" to streamInfo.uploaderName,
                    "uploaderUrl" to streamInfo.uploaderUrl,
                    "uploaderAvatarUrl" to streamInfo.uploaderAvatars.firstOrNull()?.url,
                    "uploaderVerified" to streamInfo.isUploaderVerified,
                    "uploaderSubscriberCount" to streamInfo.uploaderSubscriberCount,
                    "thumbnailUrl" to bestThumbnail,
                    "duration" to streamInfo.duration,
                    "viewCount" to streamInfo.viewCount,
                    "likeCount" to streamInfo.likeCount,
                    "dislikeCount" to streamInfo.dislikeCount,
                    "uploadDate" to streamInfo.uploadDate?.offsetDateTime()?.toString(),
                    "textualUploadDate" to streamInfo.textualUploadDate,
                    "isLive" to (streamInfo.streamType.name == "LIVE_STREAM"),
                    "hlsUrl" to streamInfo.hlsUrl,
                    "dashMpdUrl" to streamInfo.dashMpdUrl,
                    "audioStreams" to streamInfo.audioStreams.map { mapAudioStream(it) },
                    "videoStreams" to streamInfo.videoStreams.map { mapVideoStream(it) },
                    "videoOnlyStreams" to streamInfo.videoOnlyStreams.map { mapVideoStream(it) },
                    "subtitles" to streamInfo.subtitles.map { subtitle ->
                        mapOf(
                            "url" to subtitle.content,
                            "mimeType" to subtitle.format?.mimeType,
                            "languageCode" to subtitle.languageTag,
                            "autoGenerated" to subtitle.isAutoGenerated
                        )
                    }
                    // Note: Excludes relatedStreams, description, category, tags for faster response
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to extract stream info", null)
            }
        }
    }

    /**
     * Get trending videos for a specific region
     */
    private fun handleGetTrending(call: MethodCall, result: MethodChannel.Result) {
        val region = call.argument<String>("region") ?: "US"

        scope.launch {
            try {
                val serviceId = call.argument<String>("serviceId") ?: "newpipe"
                val service = streamingService(serviceId)
                val kiosk = service.kioskList.defaultKioskExtractor

                // Set content country for region-specific trending
                NewPipe.setupLocalization(
                    Localization.DEFAULT,
                    ContentCountry(region)
                )

                val kioskInfo = KioskInfo.getInfo(service, kiosk.url)

                val videos = kioskInfo.relatedItems.map { mapInfoItem(it) }

                val response = mapOf(
                    "videos" to videos,
                    "nextPage" to kioskInfo.nextPage?.url
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get trending", null)
            }
        }
    }

    /**
     * Get Shorts from a channel's dedicated Shorts tab.
     *
     * This is the real Shorts data source: it reads the channel's `/shorts`
     * tab through the channel-tab extractor, rather than treating a fixed
     * search query as a Shorts feed. The caller passes a channel handle
     * (e.g. "@MrBeast") and optionally a pagination cursor.
     */
    private fun handleGetShorts(call: MethodCall, result: MethodChannel.Result) {
        val channelId = call.argument<String>("channelId") ?: run {
            result.error("INVALID_ARGUMENT", "channelId is required", null)
            return
        }
        val nextPageJson = call.argument<String>("nextPage")
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"
        if (serviceId == "bilibili") {
            result.error("UNSUPPORTED_SERVICE", "Bilibili does not expose the YouTube Shorts channel tab.", null)
            return
        }

        scope.launch {
            try {
                val shortsFilter = FilterItem(Filter.ITEM_IDENTIFIER_UNKNOWN, "shorts")
                val linkHandler = ServiceList.YouTube.channelTabLHFactory.fromQuery(
                    channelId,
                    listOf(shortsFilter),
                    emptyList()
                )
                val tabExtractor = ServiceList.YouTube.getChannelTabExtractor(linkHandler)

                val response = if (nextPageJson != null) {
                    val page = deserializePage(nextPageJson)
                    val moreItems = tabExtractor.getPage(page)
                    mapOf(
                        "items" to moreItems.items.map { mapInfoItem(it) },
                        "nextPage" to serializePage(moreItems.nextPage)
                    )
                } else {
                    tabExtractor.fetchPage()
                    val initialPage = tabExtractor.initialPage
                    mapOf(
                        "items" to initialPage.items.map { mapInfoItem(it) },
                        "nextPage" to serializePage(initialPage.nextPage)
                    )
                }

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                android.util.Log.e("NewPipeHandler", "Failed to get shorts: ${e.message}", e)
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get shorts", null)
            }
        }
    }

    /**
     * Search for videos, channels, or playlists
     */
    private fun handleSearch(call: MethodCall, result: MethodChannel.Result) {
        val query = call.argument<String>("query") ?: run {
            result.error("INVALID_ARGUMENT", "Query is required", null)
            return
        }
        val filter = call.argument<String>("filter") ?: "all"
        val nextPageJson = call.argument<String>("nextPage")
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val service = streamingService(serviceId)
                val service = streamingService(serviceId)
                val contentFilters = findSearchContentFilter(service, filter)

                val searchInfo = if (nextPageJson != null) {
                    // Deserialize the full Page object for pagination
                    val page = deserializePage(nextPageJson)
                    SearchInfo.getMoreItems(
                        service,
                        service.searchQHFactory.fromQuery(query, contentFilters, emptyList()),
                        page
                    ).let { moreItems ->
                        // Create a minimal response for pagination
                        mapOf(
                            "items" to moreItems.items.map { mapInfoItem(it) },
                            "nextPage" to serializePage(moreItems.nextPage)
                        )
                    }
                } else {
                    val info = SearchInfo.getInfo(
                        service,
                        service.searchQHFactory.fromQuery(query, contentFilters, emptyList())
                    )
                    mapOf(
                        "items" to info.relatedItems.map { mapInfoItem(it) },
                        "nextPage" to serializePage(info.nextPage),
                        "searchSuggestion" to info.searchSuggestion,
                        "isCorrectedSearch" to info.isCorrectedSearch
                    )
                }

                sendSuccess(result, gson.toJson(searchInfo))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to search", null)
            }
        }
    }

    /**
     * Get search suggestions
     */
    private fun handleGetSearchSuggestions(call: MethodCall, result: MethodChannel.Result) {
        val query = call.argument<String>("query") ?: run {
            result.error("INVALID_ARGUMENT", "Query is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val extractor = streamingService(serviceId).suggestionExtractor
                val suggestions = extractor.suggestionList(query)
                sendSuccess(result, gson.toJson(suggestions))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get suggestions", null)
            }
        }
    }

    /**
     * Get channel info
     */
    private fun handleGetChannel(call: MethodCall, result: MethodChannel.Result) {
        val channelId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Channel ID is required", null)
            return
        }

        scope.launch {
            try {
                val serviceId = call.argument<String>("serviceId") ?: "newpipe"
                val url = if (channelId.startsWith("http")) {
                    channelId
                } else if (serviceId == "bilibili") {
                    "https://space.bilibili.com/$channelId"
                } else {
                    "https://www.youtube.com/channel/$channelId"
                }

                val service = streamingService(serviceId)
                val channelInfo = ChannelInfo.getInfo(service, url)

                // Get initial videos from the first tab (usually "Videos")
                var initialVideos: List<Map<String, Any?>> = emptyList()
                var videosNextPage: String? = null

                android.util.Log.d("NewPipeHandler", "Channel tabs count: ${channelInfo.tabs.size}")
                channelInfo.tabs.forEach { tab ->
                    android.util.Log.d("NewPipeHandler", "  Tab: filters=${tab.contentFilters}, url=${tab.url}")
                }

                if (channelInfo.tabs.isNotEmpty()) {
                    try {
                        // Find the videos tab or use the first tab
                        val videosTab = channelInfo.tabs.find { tab ->
                            tab.contentFilters.any { it.name.contains("videos", ignoreCase = true) }
                        } ?: channelInfo.tabs.firstOrNull()

                        if (videosTab != null) {
                            android.util.Log.d("NewPipeHandler", "Using tab: filters=${videosTab.contentFilters}")
                            val tabExtractor = service.getChannelTabExtractor(videosTab)
                            tabExtractor.fetchPage()
                            val initialPage = tabExtractor.initialPage
                            android.util.Log.d("NewPipeHandler", "Initial page items count: ${initialPage.items.size}")
                            initialVideos = initialPage.items.map { mapInfoItem(it) }
                            videosNextPage = serializePage(initialPage.nextPage)
                            android.util.Log.d("NewPipeHandler", "Mapped initial videos count: ${initialVideos.size}")
                        }
                    } catch (tabError: Exception) {
                        android.util.Log.e("NewPipeHandler", "Failed to get videos tab: ${tabError.message}", tabError)
                    }
                }

                // Get best quality avatar and banner using ResolutionLevel
                val bestAvatar = channelInfo.avatars
                    .maxWithOrNull(compareBy<org.schabi.newpipe.extractor.Image> {
                        when (it.estimatedResolutionLevel) {
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.HIGH -> 3
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.MEDIUM -> 2
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.LOW -> 1
                            else -> 0
                        }
                    }.thenByDescending { it.width * it.height })?.url

                val bestBanner = channelInfo.banners
                    .maxWithOrNull(compareBy<org.schabi.newpipe.extractor.Image> {
                        when (it.estimatedResolutionLevel) {
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.HIGH -> 3
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.MEDIUM -> 2
                            org.schabi.newpipe.extractor.Image.ResolutionLevel.LOW -> 1
                            else -> 0
                        }
                    }.thenByDescending { it.width * it.height })?.url

                android.util.Log.d("NewPipeHandler", "Selected avatar: ${bestAvatar}")
                android.util.Log.d("NewPipeHandler", "Selected banner: ${bestBanner}")
                android.util.Log.d("NewPipeHandler", "Channel response: name=${channelInfo.name}, videos=${initialVideos.size}, tabs=${channelInfo.tabs.size}, nextPage=${videosNextPage != null}")

                val response = mapOf(
                    "id" to channelInfo.id,
                    "name" to channelInfo.name,
                    "description" to channelInfo.description,
                    "avatarUrl" to bestAvatar,
                    "bannerUrl" to bestBanner,
                    "subscriberCount" to channelInfo.subscriberCount,
                    "isVerified" to channelInfo.isVerified,
                    "videos" to initialVideos,
                    "nextPage" to videosNextPage,
                    "tabs" to channelInfo.tabs.map { tab ->
                        // Store tab data in a format we can use to recreate the extractor
                        mapOf(
                            "name" to tab.contentFilters.firstOrNull()?.name?.lowercase(),
                            "url" to tab.url,
                            "id" to tab.id,
                            "contentFilters" to tab.contentFilters.map { it.name }
                        )
                    }
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get channel", null)
            }
        }
    }

    /**
     * Get channel tab content (shorts, playlists, etc.) by tab URL
     */
    private fun handleGetChannelTab(call: MethodCall, result: MethodChannel.Result) {
        val tabUrl = call.argument<String>("url") ?: run {
            result.error("INVALID_ARGUMENT", "Tab URL is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"
        val tabId = call.argument<String>("id")
        @Suppress("UNCHECKED_CAST")
        val contentFilters = call.argument<List<String>>("contentFilters") ?: emptyList()
        val nextPageJson = call.argument<String>("nextPage")

        scope.launch {
            try {
                // Create the link handler from the tab data
                val service = streamingService(serviceId)
                // The service-provided tab URL already contains typed FilterItems.
                val linkHandler = service.channelTabLHFactory.fromUrl(tabUrl, null)
                val tabExtractor = service.getChannelTabExtractor(linkHandler)

                val response = if (nextPageJson != null) {
                    // Handle pagination
                    val page = deserializePage(nextPageJson)
                    val moreItems = tabExtractor.getPage(page)
                    mapOf(
                        "videos" to moreItems.items.map { mapInfoItem(it) },
                        "nextPage" to serializePage(moreItems.nextPage)
                    )
                } else {
                    // Initial load
                    tabExtractor.fetchPage()
                    val initialPage = tabExtractor.initialPage
                    mapOf(
                        "videos" to initialPage.items.map { mapInfoItem(it) },
                        "nextPage" to serializePage(initialPage.nextPage)
                    )
                }

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                android.util.Log.e("NewPipeHandler", "Failed to get channel tab: ${e.message}", e)
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get channel tab", null)
            }
        }
    }

    /**
     * Get comments for a video
     */
    private fun handleGetComments(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val url = buildStreamUrl(videoId, serviceId)
                val commentsInfo = CommentsInfo.getInfo(streamingService(serviceId), url)

                val response = mapOf(
                    "comments" to commentsInfo?.relatedItems?.map { comment ->
                        mapOf(
                            "id" to comment.commentId,
                            "text" to comment.commentText?.content,
                            "authorName" to comment.uploaderName,
                            "authorUrl" to comment.uploaderUrl,
                            "authorAvatarUrl" to comment.uploaderAvatarUrl,
                            "authorVerified" to comment.isUploaderVerified,
                            "likeCount" to comment.likeCount,
                            "replyCount" to comment.replyCount,
                            "isPinned" to comment.isPinned,
                            "isEdited" to null,
                            "isHearted" to comment.isHeartedByUploader,
                            "uploadDate" to comment.textualUploadDate,
                            "repliesPage" to serializePage(comment.replies)
                        )
                    }?.orEmpty(),
                    "nextPage" to serializePage(commentsInfo?.nextPage),
                    "commentCount" to null,
                    "isDisabled" to (commentsInfo == null || commentsInfo.isCommentsDisabled)
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get comments", null)
            }
        }
    }

    /**
     * Get more comments (pagination)
     */
    private fun handleGetMoreComments(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val nextPageJson = call.argument<String>("nextPage") ?: run {
            result.error("INVALID_ARGUMENT", "Next page is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val url = buildStreamUrl(videoId, serviceId)
                val page = deserializePage(nextPageJson)
                val moreComments = CommentsInfo.getMoreItems(
                    streamingService(serviceId),
                    url,
                    page
                )

                val response = mapOf(
                    "comments" to moreComments.items.map { comment ->
                        mapOf(
                            "id" to comment.commentId,
                            "text" to comment.commentText?.content,
                            "authorName" to comment.uploaderName,
                            "authorUrl" to comment.uploaderUrl,
                            "authorAvatarUrl" to comment.uploaderAvatars.firstOrNull()?.url,
                            "authorVerified" to comment.isUploaderVerified,
                            "likeCount" to comment.likeCount,
                            "replyCount" to comment.replyCount,
                            "isPinned" to comment.isPinned,
                            "isEdited" to comment.isEdited,
                            "isHearted" to comment.isHeartedByUploader,
                            "uploadDate" to comment.textualUploadDate,
                            "repliesPage" to serializePage(comment.replies)
                        )
                    },
                    "nextPage" to serializePage(moreComments.nextPage)
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get more comments", null)
            }
        }
    }

    /**
     * Get comment replies
     */
    private fun handleGetCommentReplies(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val repliesPageJson = call.argument<String>("repliesPage") ?: run {
            result.error("INVALID_ARGUMENT", "Replies page is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val url = buildStreamUrl(videoId, serviceId)
                val page = deserializePage(repliesPageJson)
                val replies = CommentsInfo.getMoreItems(
                    streamingService(serviceId),
                    url,
                    page
                )

                val response = mapOf(
                    "comments" to replies.items.map { comment ->
                        mapOf(
                            "id" to comment.commentId,
                            "text" to comment.commentText?.content,
                            "authorName" to comment.uploaderName,
                            "authorUrl" to comment.uploaderUrl,
                            "authorAvatarUrl" to comment.uploaderAvatars.firstOrNull()?.url,
                            "authorVerified" to comment.isUploaderVerified,
                            "likeCount" to comment.likeCount,
                            "replyCount" to comment.replyCount,
                            "isPinned" to comment.isPinned,
                            "isEdited" to comment.isEdited,
                            "isHearted" to comment.isHeartedByUploader,
                            "uploadDate" to comment.textualUploadDate,
                            "repliesPage" to serializePage(comment.replies)
                        )
                    },
                    "nextPage" to serializePage(replies.nextPage)
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get comment replies", null)
            }
        }
    }

    /**
     * Get playlist info
     */
    private fun handleGetPlaylist(call: MethodCall, result: MethodChannel.Result) {
        val playlistId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Playlist ID is required", null)
            return
        }

        scope.launch {
            try {
                val serviceId = call.argument<String>("serviceId") ?: "newpipe"
                if (serviceId == "bilibili" && !playlistId.startsWith("http")) {
                    throw IllegalArgumentException("A full Bilibili season/series playlist URL is required.")
                }
                val url = if (playlistId.startsWith("http")) {
                    playlistId
                } else {
                    "https://www.youtube.com/playlist?list=$playlistId"
                }

                val playlistInfo = PlaylistInfo.getInfo(streamingService(serviceId), url)
                val bestPlaylistThumbnail = playlistInfo.thumbnailUrl
                val bestUploaderAvatar = playlistInfo.uploaderAvatarUrl

                val response = mapOf(
                    "id" to playlistInfo.id,
                    "name" to playlistInfo.name,
                    "thumbnailUrl" to bestPlaylistThumbnail,
                    "uploaderName" to playlistInfo.uploaderName,
                    "uploaderUrl" to playlistInfo.uploaderUrl,
                    "uploaderAvatarUrl" to bestUploaderAvatar,
                    "streamCount" to playlistInfo.streamCount,
                    "videos" to playlistInfo.relatedItems.map { mapInfoItem(it) },
                    "nextPage" to playlistInfo.nextPage?.url
                )

                sendSuccess(result, gson.toJson(response))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get playlist", null)
            }
        }
    }

    /**
     * Get related streams for a video
     */
    private fun handleGetRelatedStreams(call: MethodCall, result: MethodChannel.Result) {
        val videoId = call.argument<String>("id") ?: run {
            result.error("INVALID_ARGUMENT", "Video ID is required", null)
            return
        }
        val serviceId = call.argument<String>("serviceId") ?: "newpipe"

        scope.launch {
            try {
                val streamInfo = getCachedOrExtractStreamInfo(videoId, serviceId)

                val relatedVideos = streamInfo.relatedItems.map { mapInfoItem(it) }
                sendSuccess(result, gson.toJson(relatedVideos))
            } catch (e: Exception) {
                sendError(result, "EXTRACTION_ERROR", e.message ?: "Failed to get related streams", null)
            }
        }
    }

    // Helper methods

    private fun streamingService(serviceId: String): StreamingService =
        if (serviceId == "bilibili") ServiceList.BiliBili else ServiceList.YouTube

    private fun findSearchContentFilter(
        service: StreamingService,
        filterName: String,
    ): List<FilterItem> {
        if (filterName.isBlank() || filterName == "all") return emptyList()
        val available = service.searchQHFactory.getAvailableContentFilter()
        val matching = available.filterGroups
            .flatMap { group -> group.filterItems.toList() }
            .firstOrNull { it.name.equals(filterName, ignoreCase = true) }
        return matching?.let { listOf(it) } ?: emptyList()
    }

    private fun streamCacheKey(serviceId: String, videoId: String): String =
        "$serviceId:$videoId"

    private fun buildStreamUrl(videoId: String, serviceId: String): String = when {
        videoId.startsWith("http://") || videoId.startsWith("https://") -> videoId
        serviceId == "bilibili" -> "https://www.bilibili.com/video/$videoId"
        else -> "https://www.youtube.com/watch?v=$videoId"
    }

    private fun getCachedOrExtractStreamInfo(
        videoId: String,
        serviceId: String = "newpipe",
    ): StreamInfo {
        val now = System.currentTimeMillis()
        val cacheKey = streamCacheKey(serviceId, videoId)
        val cached = streamInfoCache[cacheKey]
        if (cached != null && now - cached.timestampMs <= streamInfoCacheTtlMs) {
            return cached.streamInfo
        }

        val streamInfo = StreamInfo.getInfo(
            streamingService(serviceId),
            buildStreamUrl(videoId, serviceId)
        )
        streamInfoCache[cacheKey] = CachedStreamInfo(streamInfo, now)
        return streamInfo
    }

    private fun mapAudioStream(stream: AudioStream): Map<String, Any?> {
        val itagItem = stream.itagItem
        return mapOf(
            "url" to stream.content,
            "averageBitrate" to stream.averageBitrate,
            "format" to stream.format?.name,
            "mimeType" to stream.format?.mimeType,
            "codec" to stream.codec,
            "quality" to stream.quality,
            "id" to stream.id,
            "itag" to stream.itag,
            // DASH manifest fields from ItagItem
            "initStart" to itagItem?.initStart,
            "initEnd" to itagItem?.initEnd,
            "indexStart" to itagItem?.indexStart,
            "indexEnd" to itagItem?.indexEnd,
            "contentLength" to itagItem?.contentLength,
            "bitrate" to itagItem?.bitrate,
            "approxDurationMs" to itagItem?.approxDurationMs,
            "audioChannels" to itagItem?.audioChannels,
            "sampleRate" to itagItem?.sampleRate
        )
    }

    private fun mapVideoStream(stream: VideoStream): Map<String, Any?> {
        val itagItem = stream.itagItem
        return mapOf(
            "url" to stream.content,
            "resolution" to stream.resolution,
            "format" to stream.format?.name,
            "mimeType" to stream.format?.mimeType,
            "codec" to stream.codec,
            "quality" to stream.quality,
            "width" to stream.width,
            "height" to stream.height,
            "fps" to stream.fps,
            "isVideoOnly" to stream.isVideoOnly,
            "id" to stream.id,
            "itag" to stream.itag,
            // DASH manifest fields from ItagItem
            "initStart" to itagItem?.initStart,
            "initEnd" to itagItem?.initEnd,
            "indexStart" to itagItem?.indexStart,
            "indexEnd" to itagItem?.indexEnd,
            "contentLength" to itagItem?.contentLength,
            "bitrate" to itagItem?.bitrate,
            "approxDurationMs" to itagItem?.approxDurationMs
        )
    }

    private fun mapInfoItem(item: InfoItem): Map<String, Any?> {
        val stream = item as? org.schabi.newpipe.extractor.stream.StreamInfoItem
        val channel = item as? org.schabi.newpipe.extractor.channel.ChannelInfoItem
        val playlist = item as? org.schabi.newpipe.extractor.playlist.PlaylistInfoItem

        // PipePipe InfoItem exposes a single resolved thumbnail URL. Preserve
        // that URL rather than constructing a YouTube-only thumbnail for Bilibili.
        return mapOf(
            "url" to item.url,
            "name" to item.name,
            "thumbnailUrl" to item.thumbnailUrl,
            "type" to item.infoType.name,
            "uploaderName" to stream?.uploaderName,
            "uploaderUrl" to stream?.uploaderUrl,
            "uploaderAvatarUrl" to stream?.uploaderAvatarUrl,
            "uploaderVerified" to stream?.isUploaderVerified,
            "duration" to stream?.duration,
            "viewCount" to stream?.viewCount,
            "uploadDate" to stream?.textualUploadDate,
            "isLive" to (stream?.streamType?.name == "LIVE_STREAM"),
            "isShort" to stream?.isShortFormContent,
            "contentAvailability" to null,
            "subscriberCount" to channel?.subscriberCount,
            "isVerified" to channel?.isVerified,
            "description" to channel?.description,
            "streamCount" to playlist?.streamCount,
            "playlistUploaderName" to playlist?.uploaderName,
            "playlistUploaderUrl" to playlist?.uploaderUrl
        )
    }

    /**
     * Serialize a Page object to JSON string for passing through MethodChannel
     */
    private fun serializePage(page: org.schabi.newpipe.extractor.Page?): String? {
        if (page == null) return null

        val pageMap = mapOf(
            "url" to page.url,
            "id" to page.id,
            "ids" to page.ids,
            "body" to page.body?.let { android.util.Base64.encodeToString(it, android.util.Base64.NO_WRAP) }
        )
        return gson.toJson(pageMap)
    }

    /**
     * Deserialize a JSON string back to a Page object
     */
    private fun deserializePage(json: String): org.schabi.newpipe.extractor.Page {
        val pageMap = gson.fromJson(json, Map::class.java)
        val url = pageMap["url"] as? String
        val id = pageMap["id"] as? String
        @Suppress("UNCHECKED_CAST")
        val ids = (pageMap["ids"] as? List<*>)?.filterIsInstance<String>()
        val bodyBase64 = pageMap["body"] as? String
        val body = bodyBase64?.let { android.util.Base64.decode(it, android.util.Base64.NO_WRAP) }

        return when {
            ids != null && body != null -> org.schabi.newpipe.extractor.Page(url, id, ids, null, body)
            ids != null -> org.schabi.newpipe.extractor.Page(ids)
            body != null -> org.schabi.newpipe.extractor.Page(url, id, null, null, body)
            id != null -> org.schabi.newpipe.extractor.Page(url, id)
            url != null -> org.schabi.newpipe.extractor.Page(url)
            else -> throw IllegalArgumentException("Invalid Page data: no url or ids provided")
        }
    }

    private fun sendSuccess(result: MethodChannel.Result, data: String) {
        mainHandler.post {
            result.success(data)
        }
    }

    private fun sendError(result: MethodChannel.Result, code: String, message: String, details: Any?) {
        mainHandler.post {
            result.error(code, message, details)
        }
    }

    private data class CachedStreamInfo(
        val streamInfo: StreamInfo,
        val timestampMs: Long
    )

    /**
     * Clean up resources when no longer needed
     */
    fun dispose() {
        scope.cancel()
    }
}
