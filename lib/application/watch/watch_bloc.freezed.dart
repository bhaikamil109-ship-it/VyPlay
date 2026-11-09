// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'WatchEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WatchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent()';
  }
}

/// @nodoc
class $WatchEventCopyWith<$Res> {
  $WatchEventCopyWith(WatchEvent _, $Res Function(WatchEvent) __);
}

/// Adds pattern-matching-related methods to [WatchEvent].
extension WatchEventPatterns on WatchEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWatchInfo value)? getWatchInfo,
    TResult Function(GetCommentData value)? getCommentData,
    TResult Function(ForceFetchCommentData value)? forceFetchCommentData,
    TResult Function(GetCommentRepliesData value)? getCommentRepliesData,
    TResult Function(GetMoreCommentsData value)? getMoreCommentsData,
    TResult Function(GetMoreReplyCommentsData value)? getMoreReplyCommentsData,
    TResult Function(GetSubtitles value)? getSubtitles,
    TResult Function(TapDescription value)? tapDescription,
    TResult Function(TogglePip value)? togglePip,
    TResult Function(AssignTitle value)? assignTitle,
    TResult Function(GetExplodeWatchInfo value)? getExplodeWatchInfo,
    TResult Function(GetExplodeRelatedVideoInfo value)?
        getExplodeRelatedVideoInfo,
    TResult Function(GetExplodeMuxStreamInfo value)? getExplodeMuxStreamInfo,
    TResult Function(GetExplodeLiveVideoInfo value)? getExplodeLiveVideoInfo,
    TResult Function(SetSelectedVideoBasicDetails value)?
        setSelectedVideoBasicDetails,
    TResult Function(GetInvidiousWatchInfo value)? getInvidiousWatchInfo,
    TResult Function(GetInvidiousComments value)? getInvidiousComments,
    TResult Function(ForceFetchInvidiousComments value)?
        forceFetchInvidiousComments,
    TResult Function(GetInvidiousCommentReplies value)?
        getInvidiousCommentReplies,
    TResult Function(GetMoreInvidiousComments value)? getMoreInvidiousComments,
    TResult Function(GetMoreInvidiousReplyComments value)?
        getMoreInvidiousReplyComments,
    TResult Function(UpdatePlayBack value)? updatePlayBack,
    TResult Function(GetNewPipeWatchInfo value)? getNewPipeWatchInfo,
    TResult Function(GetNewPipeWatchInfoFast value)? getNewPipeWatchInfoFast,
    TResult Function(GetNewPipeComments value)? getNewPipeComments,
    TResult Function(ForceFetchNewPipeComments value)?
        forceFetchNewPipeComments,
    TResult Function(GetMoreNewPipeComments value)? getMoreNewPipeComments,
    TResult Function(GetNewPipeCommentReplies value)? getNewPipeCommentReplies,
    TResult Function(GetMoreNewPipeCommentReplies value)?
        getMoreNewPipeCommentReplies,
    TResult Function(GetSponsorSegments value)? getSponsorSegments,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo() when getWatchInfo != null:
        return getWatchInfo(_that);
      case GetCommentData() when getCommentData != null:
        return getCommentData(_that);
      case ForceFetchCommentData() when forceFetchCommentData != null:
        return forceFetchCommentData(_that);
      case GetCommentRepliesData() when getCommentRepliesData != null:
        return getCommentRepliesData(_that);
      case GetMoreCommentsData() when getMoreCommentsData != null:
        return getMoreCommentsData(_that);
      case GetMoreReplyCommentsData() when getMoreReplyCommentsData != null:
        return getMoreReplyCommentsData(_that);
      case GetSubtitles() when getSubtitles != null:
        return getSubtitles(_that);
      case TapDescription() when tapDescription != null:
        return tapDescription(_that);
      case TogglePip() when togglePip != null:
        return togglePip(_that);
      case AssignTitle() when assignTitle != null:
        return assignTitle(_that);
      case GetExplodeWatchInfo() when getExplodeWatchInfo != null:
        return getExplodeWatchInfo(_that);
      case GetExplodeRelatedVideoInfo() when getExplodeRelatedVideoInfo != null:
        return getExplodeRelatedVideoInfo(_that);
      case GetExplodeMuxStreamInfo() when getExplodeMuxStreamInfo != null:
        return getExplodeMuxStreamInfo(_that);
      case GetExplodeLiveVideoInfo() when getExplodeLiveVideoInfo != null:
        return getExplodeLiveVideoInfo(_that);
      case SetSelectedVideoBasicDetails()
          when setSelectedVideoBasicDetails != null:
        return setSelectedVideoBasicDetails(_that);
      case GetInvidiousWatchInfo() when getInvidiousWatchInfo != null:
        return getInvidiousWatchInfo(_that);
      case GetInvidiousComments() when getInvidiousComments != null:
        return getInvidiousComments(_that);
      case ForceFetchInvidiousComments()
          when forceFetchInvidiousComments != null:
        return forceFetchInvidiousComments(_that);
      case GetInvidiousCommentReplies() when getInvidiousCommentReplies != null:
        return getInvidiousCommentReplies(_that);
      case GetMoreInvidiousComments() when getMoreInvidiousComments != null:
        return getMoreInvidiousComments(_that);
      case GetMoreInvidiousReplyComments()
          when getMoreInvidiousReplyComments != null:
        return getMoreInvidiousReplyComments(_that);
      case UpdatePlayBack() when updatePlayBack != null:
        return updatePlayBack(_that);
      case GetNewPipeWatchInfo() when getNewPipeWatchInfo != null:
        return getNewPipeWatchInfo(_that);
      case GetNewPipeWatchInfoFast() when getNewPipeWatchInfoFast != null:
        return getNewPipeWatchInfoFast(_that);
      case GetNewPipeComments() when getNewPipeComments != null:
        return getNewPipeComments(_that);
      case ForceFetchNewPipeComments() when forceFetchNewPipeComments != null:
        return forceFetchNewPipeComments(_that);
      case GetMoreNewPipeComments() when getMoreNewPipeComments != null:
        return getMoreNewPipeComments(_that);
      case GetNewPipeCommentReplies() when getNewPipeCommentReplies != null:
        return getNewPipeCommentReplies(_that);
      case GetMoreNewPipeCommentReplies()
          when getMoreNewPipeCommentReplies != null:
        return getMoreNewPipeCommentReplies(_that);
      case GetSponsorSegments() when getSponsorSegments != null:
        return getSponsorSegments(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWatchInfo value) getWatchInfo,
    required TResult Function(GetCommentData value) getCommentData,
    required TResult Function(ForceFetchCommentData value)
        forceFetchCommentData,
    required TResult Function(GetCommentRepliesData value)
        getCommentRepliesData,
    required TResult Function(GetMoreCommentsData value) getMoreCommentsData,
    required TResult Function(GetMoreReplyCommentsData value)
        getMoreReplyCommentsData,
    required TResult Function(GetSubtitles value) getSubtitles,
    required TResult Function(TapDescription value) tapDescription,
    required TResult Function(TogglePip value) togglePip,
    required TResult Function(AssignTitle value) assignTitle,
    required TResult Function(GetExplodeWatchInfo value) getExplodeWatchInfo,
    required TResult Function(GetExplodeRelatedVideoInfo value)
        getExplodeRelatedVideoInfo,
    required TResult Function(GetExplodeMuxStreamInfo value)
        getExplodeMuxStreamInfo,
    required TResult Function(GetExplodeLiveVideoInfo value)
        getExplodeLiveVideoInfo,
    required TResult Function(SetSelectedVideoBasicDetails value)
        setSelectedVideoBasicDetails,
    required TResult Function(GetInvidiousWatchInfo value)
        getInvidiousWatchInfo,
    required TResult Function(GetInvidiousComments value) getInvidiousComments,
    required TResult Function(ForceFetchInvidiousComments value)
        forceFetchInvidiousComments,
    required TResult Function(GetInvidiousCommentReplies value)
        getInvidiousCommentReplies,
    required TResult Function(GetMoreInvidiousComments value)
        getMoreInvidiousComments,
    required TResult Function(GetMoreInvidiousReplyComments value)
        getMoreInvidiousReplyComments,
    required TResult Function(UpdatePlayBack value) updatePlayBack,
    required TResult Function(GetNewPipeWatchInfo value) getNewPipeWatchInfo,
    required TResult Function(GetNewPipeWatchInfoFast value)
        getNewPipeWatchInfoFast,
    required TResult Function(GetNewPipeComments value) getNewPipeComments,
    required TResult Function(ForceFetchNewPipeComments value)
        forceFetchNewPipeComments,
    required TResult Function(GetMoreNewPipeComments value)
        getMoreNewPipeComments,
    required TResult Function(GetNewPipeCommentReplies value)
        getNewPipeCommentReplies,
    required TResult Function(GetMoreNewPipeCommentReplies value)
        getMoreNewPipeCommentReplies,
    required TResult Function(GetSponsorSegments value) getSponsorSegments,
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo():
        return getWatchInfo(_that);
      case GetCommentData():
        return getCommentData(_that);
      case ForceFetchCommentData():
        return forceFetchCommentData(_that);
      case GetCommentRepliesData():
        return getCommentRepliesData(_that);
      case GetMoreCommentsData():
        return getMoreCommentsData(_that);
      case GetMoreReplyCommentsData():
        return getMoreReplyCommentsData(_that);
      case GetSubtitles():
        return getSubtitles(_that);
      case TapDescription():
        return tapDescription(_that);
      case TogglePip():
        return togglePip(_that);
      case AssignTitle():
        return assignTitle(_that);
      case GetExplodeWatchInfo():
        return getExplodeWatchInfo(_that);
      case GetExplodeRelatedVideoInfo():
        return getExplodeRelatedVideoInfo(_that);
      case GetExplodeMuxStreamInfo():
        return getExplodeMuxStreamInfo(_that);
      case GetExplodeLiveVideoInfo():
        return getExplodeLiveVideoInfo(_that);
      case SetSelectedVideoBasicDetails():
        return setSelectedVideoBasicDetails(_that);
      case GetInvidiousWatchInfo():
        return getInvidiousWatchInfo(_that);
      case GetInvidiousComments():
        return getInvidiousComments(_that);
      case ForceFetchInvidiousComments():
        return forceFetchInvidiousComments(_that);
      case GetInvidiousCommentReplies():
        return getInvidiousCommentReplies(_that);
      case GetMoreInvidiousComments():
        return getMoreInvidiousComments(_that);
      case GetMoreInvidiousReplyComments():
        return getMoreInvidiousReplyComments(_that);
      case UpdatePlayBack():
        return updatePlayBack(_that);
      case GetNewPipeWatchInfo():
        return getNewPipeWatchInfo(_that);
      case GetNewPipeWatchInfoFast():
        return getNewPipeWatchInfoFast(_that);
      case GetNewPipeComments():
        return getNewPipeComments(_that);
      case ForceFetchNewPipeComments():
        return forceFetchNewPipeComments(_that);
      case GetMoreNewPipeComments():
        return getMoreNewPipeComments(_that);
      case GetNewPipeCommentReplies():
        return getNewPipeCommentReplies(_that);
      case GetMoreNewPipeCommentReplies():
        return getMoreNewPipeCommentReplies(_that);
      case GetSponsorSegments():
        return getSponsorSegments(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWatchInfo value)? getWatchInfo,
    TResult? Function(GetCommentData value)? getCommentData,
    TResult? Function(ForceFetchCommentData value)? forceFetchCommentData,
    TResult? Function(GetCommentRepliesData value)? getCommentRepliesData,
    TResult? Function(GetMoreCommentsData value)? getMoreCommentsData,
    TResult? Function(GetMoreReplyCommentsData value)? getMoreReplyCommentsData,
    TResult? Function(GetSubtitles value)? getSubtitles,
    TResult? Function(TapDescription value)? tapDescription,
    TResult? Function(TogglePip value)? togglePip,
    TResult? Function(AssignTitle value)? assignTitle,
    TResult? Function(GetExplodeWatchInfo value)? getExplodeWatchInfo,
    TResult? Function(GetExplodeRelatedVideoInfo value)?
        getExplodeRelatedVideoInfo,
    TResult? Function(GetExplodeMuxStreamInfo value)? getExplodeMuxStreamInfo,
    TResult? Function(GetExplodeLiveVideoInfo value)? getExplodeLiveVideoInfo,
    TResult? Function(SetSelectedVideoBasicDetails value)?
        setSelectedVideoBasicDetails,
    TResult? Function(GetInvidiousWatchInfo value)? getInvidiousWatchInfo,
    TResult? Function(GetInvidiousComments value)? getInvidiousComments,
    TResult? Function(ForceFetchInvidiousComments value)?
        forceFetchInvidiousComments,
    TResult? Function(GetInvidiousCommentReplies value)?
        getInvidiousCommentReplies,
    TResult? Function(GetMoreInvidiousComments value)? getMoreInvidiousComments,
    TResult? Function(GetMoreInvidiousReplyComments value)?
        getMoreInvidiousReplyComments,
    TResult? Function(UpdatePlayBack value)? updatePlayBack,
    TResult? Function(GetNewPipeWatchInfo value)? getNewPipeWatchInfo,
    TResult? Function(GetNewPipeWatchInfoFast value)? getNewPipeWatchInfoFast,
    TResult? Function(GetNewPipeComments value)? getNewPipeComments,
    TResult? Function(ForceFetchNewPipeComments value)?
        forceFetchNewPipeComments,
    TResult? Function(GetMoreNewPipeComments value)? getMoreNewPipeComments,
    TResult? Function(GetNewPipeCommentReplies value)? getNewPipeCommentReplies,
    TResult? Function(GetMoreNewPipeCommentReplies value)?
        getMoreNewPipeCommentReplies,
    TResult? Function(GetSponsorSegments value)? getSponsorSegments,
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo() when getWatchInfo != null:
        return getWatchInfo(_that);
      case GetCommentData() when getCommentData != null:
        return getCommentData(_that);
      case ForceFetchCommentData() when forceFetchCommentData != null:
        return forceFetchCommentData(_that);
      case GetCommentRepliesData() when getCommentRepliesData != null:
        return getCommentRepliesData(_that);
      case GetMoreCommentsData() when getMoreCommentsData != null:
        return getMoreCommentsData(_that);
      case GetMoreReplyCommentsData() when getMoreReplyCommentsData != null:
        return getMoreReplyCommentsData(_that);
      case GetSubtitles() when getSubtitles != null:
        return getSubtitles(_that);
      case TapDescription() when tapDescription != null:
        return tapDescription(_that);
      case TogglePip() when togglePip != null:
        return togglePip(_that);
      case AssignTitle() when assignTitle != null:
        return assignTitle(_that);
      case GetExplodeWatchInfo() when getExplodeWatchInfo != null:
        return getExplodeWatchInfo(_that);
      case GetExplodeRelatedVideoInfo() when getExplodeRelatedVideoInfo != null:
        return getExplodeRelatedVideoInfo(_that);
      case GetExplodeMuxStreamInfo() when getExplodeMuxStreamInfo != null:
        return getExplodeMuxStreamInfo(_that);
      case GetExplodeLiveVideoInfo() when getExplodeLiveVideoInfo != null:
        return getExplodeLiveVideoInfo(_that);
      case SetSelectedVideoBasicDetails()
          when setSelectedVideoBasicDetails != null:
        return setSelectedVideoBasicDetails(_that);
      case GetInvidiousWatchInfo() when getInvidiousWatchInfo != null:
        return getInvidiousWatchInfo(_that);
      case GetInvidiousComments() when getInvidiousComments != null:
        return getInvidiousComments(_that);
      case ForceFetchInvidiousComments()
          when forceFetchInvidiousComments != null:
        return forceFetchInvidiousComments(_that);
      case GetInvidiousCommentReplies() when getInvidiousCommentReplies != null:
        return getInvidiousCommentReplies(_that);
      case GetMoreInvidiousComments() when getMoreInvidiousComments != null:
        return getMoreInvidiousComments(_that);
      case GetMoreInvidiousReplyComments()
          when getMoreInvidiousReplyComments != null:
        return getMoreInvidiousReplyComments(_that);
      case UpdatePlayBack() when updatePlayBack != null:
        return updatePlayBack(_that);
      case GetNewPipeWatchInfo() when getNewPipeWatchInfo != null:
        return getNewPipeWatchInfo(_that);
      case GetNewPipeWatchInfoFast() when getNewPipeWatchInfoFast != null:
        return getNewPipeWatchInfoFast(_that);
      case GetNewPipeComments() when getNewPipeComments != null:
        return getNewPipeComments(_that);
      case ForceFetchNewPipeComments() when forceFetchNewPipeComments != null:
        return forceFetchNewPipeComments(_that);
      case GetMoreNewPipeComments() when getMoreNewPipeComments != null:
        return getMoreNewPipeComments(_that);
      case GetNewPipeCommentReplies() when getNewPipeCommentReplies != null:
        return getNewPipeCommentReplies(_that);
      case GetMoreNewPipeCommentReplies()
          when getMoreNewPipeCommentReplies != null:
        return getMoreNewPipeCommentReplies(_that);
      case GetSponsorSegments() when getSponsorSegments != null:
        return getSponsorSegments(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getWatchInfo,
    TResult Function(String id)? getCommentData,
    TResult Function(String id)? forceFetchCommentData,
    TResult Function(String id, String nextPage)? getCommentRepliesData,
    TResult Function(String id, String? nextPage)? getMoreCommentsData,
    TResult Function(String id, String? nextPage)? getMoreReplyCommentsData,
    TResult Function(String id)? getSubtitles,
    TResult Function()? tapDescription,
    TResult Function(bool value)? togglePip,
    TResult Function(String title)? assignTitle,
    TResult Function(String id)? getExplodeWatchInfo,
    TResult Function(String id)? getExplodeRelatedVideoInfo,
    TResult Function(String id)? getExplodeMuxStreamInfo,
    TResult Function(String id)? getExplodeLiveVideoInfo,
    TResult Function(VideoBasicInfo details)? setSelectedVideoBasicDetails,
    TResult Function(String id)? getInvidiousWatchInfo,
    TResult Function(String id)? getInvidiousComments,
    TResult Function(String id)? forceFetchInvidiousComments,
    TResult Function(String id, String continuation)?
        getInvidiousCommentReplies,
    TResult Function(String id, String? continuation)? getMoreInvidiousComments,
    TResult Function(String id, String? continuation)?
        getMoreInvidiousReplyComments,
    TResult Function(int? playBack)? updatePlayBack,
    TResult Function(String id)? getNewPipeWatchInfo,
    TResult Function(String id, List<String> sponsorBlockCategories)?
        getNewPipeWatchInfoFast,
    TResult Function(String id)? getNewPipeComments,
    TResult Function(String id)? forceFetchNewPipeComments,
    TResult Function(String id, String? nextPage)? getMoreNewPipeComments,
    TResult Function(String videoId, String repliesPage)?
        getNewPipeCommentReplies,
    TResult Function(String videoId, String? nextPage)?
        getMoreNewPipeCommentReplies,
    TResult Function(String videoId, List<String> categories)?
        getSponsorSegments,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo() when getWatchInfo != null:
        return getWatchInfo(_that.id);
      case GetCommentData() when getCommentData != null:
        return getCommentData(_that.id);
      case ForceFetchCommentData() when forceFetchCommentData != null:
        return forceFetchCommentData(_that.id);
      case GetCommentRepliesData() when getCommentRepliesData != null:
        return getCommentRepliesData(_that.id, _that.nextPage);
      case GetMoreCommentsData() when getMoreCommentsData != null:
        return getMoreCommentsData(_that.id, _that.nextPage);
      case GetMoreReplyCommentsData() when getMoreReplyCommentsData != null:
        return getMoreReplyCommentsData(_that.id, _that.nextPage);
      case GetSubtitles() when getSubtitles != null:
        return getSubtitles(_that.id);
      case TapDescription() when tapDescription != null:
        return tapDescription();
      case TogglePip() when togglePip != null:
        return togglePip(_that.value);
      case AssignTitle() when assignTitle != null:
        return assignTitle(_that.title);
      case GetExplodeWatchInfo() when getExplodeWatchInfo != null:
        return getExplodeWatchInfo(_that.id);
      case GetExplodeRelatedVideoInfo() when getExplodeRelatedVideoInfo != null:
        return getExplodeRelatedVideoInfo(_that.id);
      case GetExplodeMuxStreamInfo() when getExplodeMuxStreamInfo != null:
        return getExplodeMuxStreamInfo(_that.id);
      case GetExplodeLiveVideoInfo() when getExplodeLiveVideoInfo != null:
        return getExplodeLiveVideoInfo(_that.id);
      case SetSelectedVideoBasicDetails()
          when setSelectedVideoBasicDetails != null:
        return setSelectedVideoBasicDetails(_that.details);
      case GetInvidiousWatchInfo() when getInvidiousWatchInfo != null:
        return getInvidiousWatchInfo(_that.id);
      case GetInvidiousComments() when getInvidiousComments != null:
        return getInvidiousComments(_that.id);
      case ForceFetchInvidiousComments()
          when forceFetchInvidiousComments != null:
        return forceFetchInvidiousComments(_that.id);
      case GetInvidiousCommentReplies() when getInvidiousCommentReplies != null:
        return getInvidiousCommentReplies(_that.id, _that.continuation);
      case GetMoreInvidiousComments() when getMoreInvidiousComments != null:
        return getMoreInvidiousComments(_that.id, _that.continuation);
      case GetMoreInvidiousReplyComments()
          when getMoreInvidiousReplyComments != null:
        return getMoreInvidiousReplyComments(_that.id, _that.continuation);
      case UpdatePlayBack() when updatePlayBack != null:
        return updatePlayBack(_that.playBack);
      case GetNewPipeWatchInfo() when getNewPipeWatchInfo != null:
        return getNewPipeWatchInfo(_that.id);
      case GetNewPipeWatchInfoFast() when getNewPipeWatchInfoFast != null:
        return getNewPipeWatchInfoFast(_that.id, _that.sponsorBlockCategories);
      case GetNewPipeComments() when getNewPipeComments != null:
        return getNewPipeComments(_that.id);
      case ForceFetchNewPipeComments() when forceFetchNewPipeComments != null:
        return forceFetchNewPipeComments(_that.id);
      case GetMoreNewPipeComments() when getMoreNewPipeComments != null:
        return getMoreNewPipeComments(_that.id, _that.nextPage);
      case GetNewPipeCommentReplies() when getNewPipeCommentReplies != null:
        return getNewPipeCommentReplies(_that.videoId, _that.repliesPage);
      case GetMoreNewPipeCommentReplies()
          when getMoreNewPipeCommentReplies != null:
        return getMoreNewPipeCommentReplies(_that.videoId, _that.nextPage);
      case GetSponsorSegments() when getSponsorSegments != null:
        return getSponsorSegments(_that.videoId, _that.categories);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getWatchInfo,
    required TResult Function(String id) getCommentData,
    required TResult Function(String id) forceFetchCommentData,
    required TResult Function(String id, String nextPage) getCommentRepliesData,
    required TResult Function(String id, String? nextPage) getMoreCommentsData,
    required TResult Function(String id, String? nextPage)
        getMoreReplyCommentsData,
    required TResult Function(String id) getSubtitles,
    required TResult Function() tapDescription,
    required TResult Function(bool value) togglePip,
    required TResult Function(String title) assignTitle,
    required TResult Function(String id) getExplodeWatchInfo,
    required TResult Function(String id) getExplodeRelatedVideoInfo,
    required TResult Function(String id) getExplodeMuxStreamInfo,
    required TResult Function(String id) getExplodeLiveVideoInfo,
    required TResult Function(VideoBasicInfo details)
        setSelectedVideoBasicDetails,
    required TResult Function(String id) getInvidiousWatchInfo,
    required TResult Function(String id) getInvidiousComments,
    required TResult Function(String id) forceFetchInvidiousComments,
    required TResult Function(String id, String continuation)
        getInvidiousCommentReplies,
    required TResult Function(String id, String? continuation)
        getMoreInvidiousComments,
    required TResult Function(String id, String? continuation)
        getMoreInvidiousReplyComments,
    required TResult Function(int? playBack) updatePlayBack,
    required TResult Function(String id) getNewPipeWatchInfo,
    required TResult Function(String id, List<String> sponsorBlockCategories)
        getNewPipeWatchInfoFast,
    required TResult Function(String id) getNewPipeComments,
    required TResult Function(String id) forceFetchNewPipeComments,
    required TResult Function(String id, String? nextPage)
        getMoreNewPipeComments,
    required TResult Function(String videoId, String repliesPage)
        getNewPipeCommentReplies,
    required TResult Function(String videoId, String? nextPage)
        getMoreNewPipeCommentReplies,
    required TResult Function(String videoId, List<String> categories)
        getSponsorSegments,
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo():
        return getWatchInfo(_that.id);
      case GetCommentData():
        return getCommentData(_that.id);
      case ForceFetchCommentData():
        return forceFetchCommentData(_that.id);
      case GetCommentRepliesData():
        return getCommentRepliesData(_that.id, _that.nextPage);
      case GetMoreCommentsData():
        return getMoreCommentsData(_that.id, _that.nextPage);
      case GetMoreReplyCommentsData():
        return getMoreReplyCommentsData(_that.id, _that.nextPage);
      case GetSubtitles():
        return getSubtitles(_that.id);
      case TapDescription():
        return tapDescription();
      case TogglePip():
        return togglePip(_that.value);
      case AssignTitle():
        return assignTitle(_that.title);
      case GetExplodeWatchInfo():
        return getExplodeWatchInfo(_that.id);
      case GetExplodeRelatedVideoInfo():
        return getExplodeRelatedVideoInfo(_that.id);
      case GetExplodeMuxStreamInfo():
        return getExplodeMuxStreamInfo(_that.id);
      case GetExplodeLiveVideoInfo():
        return getExplodeLiveVideoInfo(_that.id);
      case SetSelectedVideoBasicDetails():
        return setSelectedVideoBasicDetails(_that.details);
      case GetInvidiousWatchInfo():
        return getInvidiousWatchInfo(_that.id);
      case GetInvidiousComments():
        return getInvidiousComments(_that.id);
      case ForceFetchInvidiousComments():
        return forceFetchInvidiousComments(_that.id);
      case GetInvidiousCommentReplies():
        return getInvidiousCommentReplies(_that.id, _that.continuation);
      case GetMoreInvidiousComments():
        return getMoreInvidiousComments(_that.id, _that.continuation);
      case GetMoreInvidiousReplyComments():
        return getMoreInvidiousReplyComments(_that.id, _that.continuation);
      case UpdatePlayBack():
        return updatePlayBack(_that.playBack);
      case GetNewPipeWatchInfo():
        return getNewPipeWatchInfo(_that.id);
      case GetNewPipeWatchInfoFast():
        return getNewPipeWatchInfoFast(_that.id, _that.sponsorBlockCategories);
      case GetNewPipeComments():
        return getNewPipeComments(_that.id);
      case ForceFetchNewPipeComments():
        return forceFetchNewPipeComments(_that.id);
      case GetMoreNewPipeComments():
        return getMoreNewPipeComments(_that.id, _that.nextPage);
      case GetNewPipeCommentReplies():
        return getNewPipeCommentReplies(_that.videoId, _that.repliesPage);
      case GetMoreNewPipeCommentReplies():
        return getMoreNewPipeCommentReplies(_that.videoId, _that.nextPage);
      case GetSponsorSegments():
        return getSponsorSegments(_that.videoId, _that.categories);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? getWatchInfo,
    TResult? Function(String id)? getCommentData,
    TResult? Function(String id)? forceFetchCommentData,
    TResult? Function(String id, String nextPage)? getCommentRepliesData,
    TResult? Function(String id, String? nextPage)? getMoreCommentsData,
    TResult? Function(String id, String? nextPage)? getMoreReplyCommentsData,
    TResult? Function(String id)? getSubtitles,
    TResult? Function()? tapDescription,
    TResult? Function(bool value)? togglePip,
    TResult? Function(String title)? assignTitle,
    TResult? Function(String id)? getExplodeWatchInfo,
    TResult? Function(String id)? getExplodeRelatedVideoInfo,
    TResult? Function(String id)? getExplodeMuxStreamInfo,
    TResult? Function(String id)? getExplodeLiveVideoInfo,
    TResult? Function(VideoBasicInfo details)? setSelectedVideoBasicDetails,
    TResult? Function(String id)? getInvidiousWatchInfo,
    TResult? Function(String id)? getInvidiousComments,
    TResult? Function(String id)? forceFetchInvidiousComments,
    TResult? Function(String id, String continuation)?
        getInvidiousCommentReplies,
    TResult? Function(String id, String? continuation)?
        getMoreInvidiousComments,
    TResult? Function(String id, String? continuation)?
        getMoreInvidiousReplyComments,
    TResult? Function(int? playBack)? updatePlayBack,
    TResult? Function(String id)? getNewPipeWatchInfo,
    TResult? Function(String id, List<String> sponsorBlockCategories)?
        getNewPipeWatchInfoFast,
    TResult? Function(String id)? getNewPipeComments,
    TResult? Function(String id)? forceFetchNewPipeComments,
    TResult? Function(String id, String? nextPage)? getMoreNewPipeComments,
    TResult? Function(String videoId, String repliesPage)?
        getNewPipeCommentReplies,
    TResult? Function(String videoId, String? nextPage)?
        getMoreNewPipeCommentReplies,
    TResult? Function(String videoId, List<String> categories)?
        getSponsorSegments,
  }) {
    final _that = this;
    switch (_that) {
      case GetWatchInfo() when getWatchInfo != null:
        return getWatchInfo(_that.id);
      case GetCommentData() when getCommentData != null:
        return getCommentData(_that.id);
      case ForceFetchCommentData() when forceFetchCommentData != null:
        return forceFetchCommentData(_that.id);
      case GetCommentRepliesData() when getCommentRepliesData != null:
        return getCommentRepliesData(_that.id, _that.nextPage);
      case GetMoreCommentsData() when getMoreCommentsData != null:
        return getMoreCommentsData(_that.id, _that.nextPage);
      case GetMoreReplyCommentsData() when getMoreReplyCommentsData != null:
        return getMoreReplyCommentsData(_that.id, _that.nextPage);
      case GetSubtitles() when getSubtitles != null:
        return getSubtitles(_that.id);
      case TapDescription() when tapDescription != null:
        return tapDescription();
      case TogglePip() when togglePip != null:
        return togglePip(_that.value);
      case AssignTitle() when assignTitle != null:
        return assignTitle(_that.title);
      case GetExplodeWatchInfo() when getExplodeWatchInfo != null:
        return getExplodeWatchInfo(_that.id);
      case GetExplodeRelatedVideoInfo() when getExplodeRelatedVideoInfo != null:
        return getExplodeRelatedVideoInfo(_that.id);
      case GetExplodeMuxStreamInfo() when getExplodeMuxStreamInfo != null:
        return getExplodeMuxStreamInfo(_that.id);
      case GetExplodeLiveVideoInfo() when getExplodeLiveVideoInfo != null:
        return getExplodeLiveVideoInfo(_that.id);
      case SetSelectedVideoBasicDetails()
          when setSelectedVideoBasicDetails != null:
        return setSelectedVideoBasicDetails(_that.details);
      case GetInvidiousWatchInfo() when getInvidiousWatchInfo != null:
        return getInvidiousWatchInfo(_that.id);
      case GetInvidiousComments() when getInvidiousComments != null:
        return getInvidiousComments(_that.id);
      case ForceFetchInvidiousComments()
          when forceFetchInvidiousComments != null:
        return forceFetchInvidiousComments(_that.id);
      case GetInvidiousCommentReplies() when getInvidiousCommentReplies != null:
        return getInvidiousCommentReplies(_that.id, _that.continuation);
      case GetMoreInvidiousComments() when getMoreInvidiousComments != null:
        return getMoreInvidiousComments(_that.id, _that.continuation);
      case GetMoreInvidiousReplyComments()
          when getMoreInvidiousReplyComments != null:
        return getMoreInvidiousReplyComments(_that.id, _that.continuation);
      case UpdatePlayBack() when updatePlayBack != null:
        return updatePlayBack(_that.playBack);
      case GetNewPipeWatchInfo() when getNewPipeWatchInfo != null:
        return getNewPipeWatchInfo(_that.id);
      case GetNewPipeWatchInfoFast() when getNewPipeWatchInfoFast != null:
        return getNewPipeWatchInfoFast(_that.id, _that.sponsorBlockCategories);
      case GetNewPipeComments() when getNewPipeComments != null:
        return getNewPipeComments(_that.id);
      case ForceFetchNewPipeComments() when forceFetchNewPipeComments != null:
        return forceFetchNewPipeComments(_that.id);
      case GetMoreNewPipeComments() when getMoreNewPipeComments != null:
        return getMoreNewPipeComments(_that.id, _that.nextPage);
      case GetNewPipeCommentReplies() when getNewPipeCommentReplies != null:
        return getNewPipeCommentReplies(_that.videoId, _that.repliesPage);
      case GetMoreNewPipeCommentReplies()
          when getMoreNewPipeCommentReplies != null:
        return getMoreNewPipeCommentReplies(_that.videoId, _that.nextPage);
      case GetSponsorSegments() when getSponsorSegments != null:
        return getSponsorSegments(_that.videoId, _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetWatchInfo with DiagnosticableTreeMixin implements WatchEvent {
  GetWatchInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetWatchInfoCopyWith<GetWatchInfo> get copyWith =>
      _$GetWatchInfoCopyWithImpl<GetWatchInfo>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getWatchInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetWatchInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getWatchInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetWatchInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetWatchInfoCopyWith(
          GetWatchInfo value, $Res Function(GetWatchInfo) _then) =
      _$GetWatchInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetWatchInfoCopyWithImpl<$Res> implements $GetWatchInfoCopyWith<$Res> {
  _$GetWatchInfoCopyWithImpl(this._self, this._then);

  final GetWatchInfo _self;
  final $Res Function(GetWatchInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetWatchInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetCommentData with DiagnosticableTreeMixin implements WatchEvent {
  GetCommentData({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCommentDataCopyWith<GetCommentData> get copyWith =>
      _$GetCommentDataCopyWithImpl<GetCommentData>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getCommentData'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCommentData &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getCommentData(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetCommentDataCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetCommentDataCopyWith(
          GetCommentData value, $Res Function(GetCommentData) _then) =
      _$GetCommentDataCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetCommentDataCopyWithImpl<$Res>
    implements $GetCommentDataCopyWith<$Res> {
  _$GetCommentDataCopyWithImpl(this._self, this._then);

  final GetCommentData _self;
  final $Res Function(GetCommentData) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetCommentData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ForceFetchCommentData with DiagnosticableTreeMixin implements WatchEvent {
  ForceFetchCommentData({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForceFetchCommentDataCopyWith<ForceFetchCommentData> get copyWith =>
      _$ForceFetchCommentDataCopyWithImpl<ForceFetchCommentData>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.forceFetchCommentData'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForceFetchCommentData &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.forceFetchCommentData(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ForceFetchCommentDataCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $ForceFetchCommentDataCopyWith(ForceFetchCommentData value,
          $Res Function(ForceFetchCommentData) _then) =
      _$ForceFetchCommentDataCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ForceFetchCommentDataCopyWithImpl<$Res>
    implements $ForceFetchCommentDataCopyWith<$Res> {
  _$ForceFetchCommentDataCopyWithImpl(this._self, this._then);

  final ForceFetchCommentData _self;
  final $Res Function(ForceFetchCommentData) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ForceFetchCommentData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetCommentRepliesData with DiagnosticableTreeMixin implements WatchEvent {
  GetCommentRepliesData({required this.id, required this.nextPage});

  final String id;
  final String nextPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCommentRepliesDataCopyWith<GetCommentRepliesData> get copyWith =>
      _$GetCommentRepliesDataCopyWithImpl<GetCommentRepliesData>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getCommentRepliesData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCommentRepliesData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nextPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getCommentRepliesData(id: $id, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetCommentRepliesDataCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetCommentRepliesDataCopyWith(GetCommentRepliesData value,
          $Res Function(GetCommentRepliesData) _then) =
      _$GetCommentRepliesDataCopyWithImpl;
  @useResult
  $Res call({String id, String nextPage});
}

/// @nodoc
class _$GetCommentRepliesDataCopyWithImpl<$Res>
    implements $GetCommentRepliesDataCopyWith<$Res> {
  _$GetCommentRepliesDataCopyWithImpl(this._self, this._then);

  final GetCommentRepliesData _self;
  final $Res Function(GetCommentRepliesData) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nextPage = null,
  }) {
    return _then(GetCommentRepliesData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreCommentsData with DiagnosticableTreeMixin implements WatchEvent {
  GetMoreCommentsData({required this.id, required this.nextPage});

  final String id;
  final String? nextPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreCommentsDataCopyWith<GetMoreCommentsData> get copyWith =>
      _$GetMoreCommentsDataCopyWithImpl<GetMoreCommentsData>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getMoreCommentsData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreCommentsData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nextPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreCommentsData(id: $id, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMoreCommentsDataCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreCommentsDataCopyWith(
          GetMoreCommentsData value, $Res Function(GetMoreCommentsData) _then) =
      _$GetMoreCommentsDataCopyWithImpl;
  @useResult
  $Res call({String id, String? nextPage});
}

/// @nodoc
class _$GetMoreCommentsDataCopyWithImpl<$Res>
    implements $GetMoreCommentsDataCopyWith<$Res> {
  _$GetMoreCommentsDataCopyWithImpl(this._self, this._then);

  final GetMoreCommentsData _self;
  final $Res Function(GetMoreCommentsData) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMoreCommentsData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetMoreReplyCommentsData
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetMoreReplyCommentsData({required this.id, required this.nextPage});

  final String id;
  final String? nextPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreReplyCommentsDataCopyWith<GetMoreReplyCommentsData> get copyWith =>
      _$GetMoreReplyCommentsDataCopyWithImpl<GetMoreReplyCommentsData>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getMoreReplyCommentsData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreReplyCommentsData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nextPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreReplyCommentsData(id: $id, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMoreReplyCommentsDataCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreReplyCommentsDataCopyWith(GetMoreReplyCommentsData value,
          $Res Function(GetMoreReplyCommentsData) _then) =
      _$GetMoreReplyCommentsDataCopyWithImpl;
  @useResult
  $Res call({String id, String? nextPage});
}

/// @nodoc
class _$GetMoreReplyCommentsDataCopyWithImpl<$Res>
    implements $GetMoreReplyCommentsDataCopyWith<$Res> {
  _$GetMoreReplyCommentsDataCopyWithImpl(this._self, this._then);

  final GetMoreReplyCommentsData _self;
  final $Res Function(GetMoreReplyCommentsData) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMoreReplyCommentsData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetSubtitles with DiagnosticableTreeMixin implements WatchEvent {
  GetSubtitles({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSubtitlesCopyWith<GetSubtitles> get copyWith =>
      _$GetSubtitlesCopyWithImpl<GetSubtitles>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getSubtitles'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSubtitles &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getSubtitles(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetSubtitlesCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetSubtitlesCopyWith(
          GetSubtitles value, $Res Function(GetSubtitles) _then) =
      _$GetSubtitlesCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetSubtitlesCopyWithImpl<$Res> implements $GetSubtitlesCopyWith<$Res> {
  _$GetSubtitlesCopyWithImpl(this._self, this._then);

  final GetSubtitles _self;
  final $Res Function(GetSubtitles) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetSubtitles(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TapDescription with DiagnosticableTreeMixin implements WatchEvent {
  TapDescription();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'WatchEvent.tapDescription'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TapDescription);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.tapDescription()';
  }
}

/// @nodoc

class TogglePip with DiagnosticableTreeMixin implements WatchEvent {
  TogglePip({required this.value});

  final bool value;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TogglePipCopyWith<TogglePip> get copyWith =>
      _$TogglePipCopyWithImpl<TogglePip>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.togglePip'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TogglePip &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.togglePip(value: $value)';
  }
}

/// @nodoc
abstract mixin class $TogglePipCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $TogglePipCopyWith(TogglePip value, $Res Function(TogglePip) _then) =
      _$TogglePipCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class _$TogglePipCopyWithImpl<$Res> implements $TogglePipCopyWith<$Res> {
  _$TogglePipCopyWithImpl(this._self, this._then);

  final TogglePip _self;
  final $Res Function(TogglePip) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(TogglePip(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class AssignTitle with DiagnosticableTreeMixin implements WatchEvent {
  AssignTitle({required this.title});

  final String title;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssignTitleCopyWith<AssignTitle> get copyWith =>
      _$AssignTitleCopyWithImpl<AssignTitle>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.assignTitle'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssignTitle &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.assignTitle(title: $title)';
  }
}

/// @nodoc
abstract mixin class $AssignTitleCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $AssignTitleCopyWith(
          AssignTitle value, $Res Function(AssignTitle) _then) =
      _$AssignTitleCopyWithImpl;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$AssignTitleCopyWithImpl<$Res> implements $AssignTitleCopyWith<$Res> {
  _$AssignTitleCopyWithImpl(this._self, this._then);

  final AssignTitle _self;
  final $Res Function(AssignTitle) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
  }) {
    return _then(AssignTitle(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetExplodeWatchInfo with DiagnosticableTreeMixin implements WatchEvent {
  GetExplodeWatchInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetExplodeWatchInfoCopyWith<GetExplodeWatchInfo> get copyWith =>
      _$GetExplodeWatchInfoCopyWithImpl<GetExplodeWatchInfo>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getExplodeWatchInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetExplodeWatchInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getExplodeWatchInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetExplodeWatchInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetExplodeWatchInfoCopyWith(
          GetExplodeWatchInfo value, $Res Function(GetExplodeWatchInfo) _then) =
      _$GetExplodeWatchInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetExplodeWatchInfoCopyWithImpl<$Res>
    implements $GetExplodeWatchInfoCopyWith<$Res> {
  _$GetExplodeWatchInfoCopyWithImpl(this._self, this._then);

  final GetExplodeWatchInfo _self;
  final $Res Function(GetExplodeWatchInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetExplodeWatchInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetExplodeRelatedVideoInfo
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetExplodeRelatedVideoInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetExplodeRelatedVideoInfoCopyWith<GetExplodeRelatedVideoInfo>
      get copyWith =>
          _$GetExplodeRelatedVideoInfoCopyWithImpl<GetExplodeRelatedVideoInfo>(
              this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'WatchEvent.getExplodeRelatedVideoInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetExplodeRelatedVideoInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getExplodeRelatedVideoInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetExplodeRelatedVideoInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetExplodeRelatedVideoInfoCopyWith(GetExplodeRelatedVideoInfo value,
          $Res Function(GetExplodeRelatedVideoInfo) _then) =
      _$GetExplodeRelatedVideoInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetExplodeRelatedVideoInfoCopyWithImpl<$Res>
    implements $GetExplodeRelatedVideoInfoCopyWith<$Res> {
  _$GetExplodeRelatedVideoInfoCopyWithImpl(this._self, this._then);

  final GetExplodeRelatedVideoInfo _self;
  final $Res Function(GetExplodeRelatedVideoInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetExplodeRelatedVideoInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetExplodeMuxStreamInfo
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetExplodeMuxStreamInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetExplodeMuxStreamInfoCopyWith<GetExplodeMuxStreamInfo> get copyWith =>
      _$GetExplodeMuxStreamInfoCopyWithImpl<GetExplodeMuxStreamInfo>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getExplodeMuxStreamInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetExplodeMuxStreamInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getExplodeMuxStreamInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetExplodeMuxStreamInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetExplodeMuxStreamInfoCopyWith(GetExplodeMuxStreamInfo value,
          $Res Function(GetExplodeMuxStreamInfo) _then) =
      _$GetExplodeMuxStreamInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetExplodeMuxStreamInfoCopyWithImpl<$Res>
    implements $GetExplodeMuxStreamInfoCopyWith<$Res> {
  _$GetExplodeMuxStreamInfoCopyWithImpl(this._self, this._then);

  final GetExplodeMuxStreamInfo _self;
  final $Res Function(GetExplodeMuxStreamInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetExplodeMuxStreamInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetExplodeLiveVideoInfo
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetExplodeLiveVideoInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetExplodeLiveVideoInfoCopyWith<GetExplodeLiveVideoInfo> get copyWith =>
      _$GetExplodeLiveVideoInfoCopyWithImpl<GetExplodeLiveVideoInfo>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getExplodeLiveVideoInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetExplodeLiveVideoInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getExplodeLiveVideoInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetExplodeLiveVideoInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetExplodeLiveVideoInfoCopyWith(GetExplodeLiveVideoInfo value,
          $Res Function(GetExplodeLiveVideoInfo) _then) =
      _$GetExplodeLiveVideoInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetExplodeLiveVideoInfoCopyWithImpl<$Res>
    implements $GetExplodeLiveVideoInfoCopyWith<$Res> {
  _$GetExplodeLiveVideoInfoCopyWithImpl(this._self, this._then);

  final GetExplodeLiveVideoInfo _self;
  final $Res Function(GetExplodeLiveVideoInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetExplodeLiveVideoInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SetSelectedVideoBasicDetails
    with DiagnosticableTreeMixin
    implements WatchEvent {
  SetSelectedVideoBasicDetails({required this.details});

  final VideoBasicInfo details;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetSelectedVideoBasicDetailsCopyWith<SetSelectedVideoBasicDetails>
      get copyWith => _$SetSelectedVideoBasicDetailsCopyWithImpl<
          SetSelectedVideoBasicDetails>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'WatchEvent.setSelectedVideoBasicDetails'))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetSelectedVideoBasicDetails &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.setSelectedVideoBasicDetails(details: $details)';
  }
}

/// @nodoc
abstract mixin class $SetSelectedVideoBasicDetailsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $SetSelectedVideoBasicDetailsCopyWith(
          SetSelectedVideoBasicDetails value,
          $Res Function(SetSelectedVideoBasicDetails) _then) =
      _$SetSelectedVideoBasicDetailsCopyWithImpl;
  @useResult
  $Res call({VideoBasicInfo details});
}

/// @nodoc
class _$SetSelectedVideoBasicDetailsCopyWithImpl<$Res>
    implements $SetSelectedVideoBasicDetailsCopyWith<$Res> {
  _$SetSelectedVideoBasicDetailsCopyWithImpl(this._self, this._then);

  final SetSelectedVideoBasicDetails _self;
  final $Res Function(SetSelectedVideoBasicDetails) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? details = null,
  }) {
    return _then(SetSelectedVideoBasicDetails(
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as VideoBasicInfo,
    ));
  }
}

/// @nodoc

class GetInvidiousWatchInfo with DiagnosticableTreeMixin implements WatchEvent {
  GetInvidiousWatchInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetInvidiousWatchInfoCopyWith<GetInvidiousWatchInfo> get copyWith =>
      _$GetInvidiousWatchInfoCopyWithImpl<GetInvidiousWatchInfo>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getInvidiousWatchInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetInvidiousWatchInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getInvidiousWatchInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetInvidiousWatchInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetInvidiousWatchInfoCopyWith(GetInvidiousWatchInfo value,
          $Res Function(GetInvidiousWatchInfo) _then) =
      _$GetInvidiousWatchInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetInvidiousWatchInfoCopyWithImpl<$Res>
    implements $GetInvidiousWatchInfoCopyWith<$Res> {
  _$GetInvidiousWatchInfoCopyWithImpl(this._self, this._then);

  final GetInvidiousWatchInfo _self;
  final $Res Function(GetInvidiousWatchInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetInvidiousWatchInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetInvidiousComments with DiagnosticableTreeMixin implements WatchEvent {
  GetInvidiousComments({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetInvidiousCommentsCopyWith<GetInvidiousComments> get copyWith =>
      _$GetInvidiousCommentsCopyWithImpl<GetInvidiousComments>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getInvidiousComments'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetInvidiousComments &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getInvidiousComments(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetInvidiousCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetInvidiousCommentsCopyWith(GetInvidiousComments value,
          $Res Function(GetInvidiousComments) _then) =
      _$GetInvidiousCommentsCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetInvidiousCommentsCopyWithImpl<$Res>
    implements $GetInvidiousCommentsCopyWith<$Res> {
  _$GetInvidiousCommentsCopyWithImpl(this._self, this._then);

  final GetInvidiousComments _self;
  final $Res Function(GetInvidiousComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetInvidiousComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ForceFetchInvidiousComments
    with DiagnosticableTreeMixin
    implements WatchEvent {
  ForceFetchInvidiousComments({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForceFetchInvidiousCommentsCopyWith<ForceFetchInvidiousComments>
      get copyWith => _$ForceFetchInvidiousCommentsCopyWithImpl<
          ForceFetchInvidiousComments>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'WatchEvent.forceFetchInvidiousComments'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForceFetchInvidiousComments &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.forceFetchInvidiousComments(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ForceFetchInvidiousCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $ForceFetchInvidiousCommentsCopyWith(
          ForceFetchInvidiousComments value,
          $Res Function(ForceFetchInvidiousComments) _then) =
      _$ForceFetchInvidiousCommentsCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ForceFetchInvidiousCommentsCopyWithImpl<$Res>
    implements $ForceFetchInvidiousCommentsCopyWith<$Res> {
  _$ForceFetchInvidiousCommentsCopyWithImpl(this._self, this._then);

  final ForceFetchInvidiousComments _self;
  final $Res Function(ForceFetchInvidiousComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ForceFetchInvidiousComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetInvidiousCommentReplies
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetInvidiousCommentReplies({required this.id, required this.continuation});

  final String id;
  final String continuation;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetInvidiousCommentRepliesCopyWith<GetInvidiousCommentReplies>
      get copyWith =>
          _$GetInvidiousCommentRepliesCopyWithImpl<GetInvidiousCommentReplies>(
              this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'WatchEvent.getInvidiousCommentReplies'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('continuation', continuation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetInvidiousCommentReplies &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, continuation);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getInvidiousCommentReplies(id: $id, continuation: $continuation)';
  }
}

/// @nodoc
abstract mixin class $GetInvidiousCommentRepliesCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetInvidiousCommentRepliesCopyWith(GetInvidiousCommentReplies value,
          $Res Function(GetInvidiousCommentReplies) _then) =
      _$GetInvidiousCommentRepliesCopyWithImpl;
  @useResult
  $Res call({String id, String continuation});
}

/// @nodoc
class _$GetInvidiousCommentRepliesCopyWithImpl<$Res>
    implements $GetInvidiousCommentRepliesCopyWith<$Res> {
  _$GetInvidiousCommentRepliesCopyWithImpl(this._self, this._then);

  final GetInvidiousCommentReplies _self;
  final $Res Function(GetInvidiousCommentReplies) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? continuation = null,
  }) {
    return _then(GetInvidiousCommentReplies(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      continuation: null == continuation
          ? _self.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreInvidiousComments
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetMoreInvidiousComments({required this.id, required this.continuation});

  final String id;
  final String? continuation;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreInvidiousCommentsCopyWith<GetMoreInvidiousComments> get copyWith =>
      _$GetMoreInvidiousCommentsCopyWithImpl<GetMoreInvidiousComments>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getMoreInvidiousComments'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('continuation', continuation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreInvidiousComments &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, continuation);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreInvidiousComments(id: $id, continuation: $continuation)';
  }
}

/// @nodoc
abstract mixin class $GetMoreInvidiousCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreInvidiousCommentsCopyWith(GetMoreInvidiousComments value,
          $Res Function(GetMoreInvidiousComments) _then) =
      _$GetMoreInvidiousCommentsCopyWithImpl;
  @useResult
  $Res call({String id, String? continuation});
}

/// @nodoc
class _$GetMoreInvidiousCommentsCopyWithImpl<$Res>
    implements $GetMoreInvidiousCommentsCopyWith<$Res> {
  _$GetMoreInvidiousCommentsCopyWithImpl(this._self, this._then);

  final GetMoreInvidiousComments _self;
  final $Res Function(GetMoreInvidiousComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? continuation = freezed,
  }) {
    return _then(GetMoreInvidiousComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      continuation: freezed == continuation
          ? _self.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetMoreInvidiousReplyComments
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetMoreInvidiousReplyComments({required this.id, required this.continuation});

  final String id;
  final String? continuation;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreInvidiousReplyCommentsCopyWith<GetMoreInvidiousReplyComments>
      get copyWith => _$GetMoreInvidiousReplyCommentsCopyWithImpl<
          GetMoreInvidiousReplyComments>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'WatchEvent.getMoreInvidiousReplyComments'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('continuation', continuation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreInvidiousReplyComments &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, continuation);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreInvidiousReplyComments(id: $id, continuation: $continuation)';
  }
}

/// @nodoc
abstract mixin class $GetMoreInvidiousReplyCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreInvidiousReplyCommentsCopyWith(
          GetMoreInvidiousReplyComments value,
          $Res Function(GetMoreInvidiousReplyComments) _then) =
      _$GetMoreInvidiousReplyCommentsCopyWithImpl;
  @useResult
  $Res call({String id, String? continuation});
}

/// @nodoc
class _$GetMoreInvidiousReplyCommentsCopyWithImpl<$Res>
    implements $GetMoreInvidiousReplyCommentsCopyWith<$Res> {
  _$GetMoreInvidiousReplyCommentsCopyWithImpl(this._self, this._then);

  final GetMoreInvidiousReplyComments _self;
  final $Res Function(GetMoreInvidiousReplyComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? continuation = freezed,
  }) {
    return _then(GetMoreInvidiousReplyComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      continuation: freezed == continuation
          ? _self.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class UpdatePlayBack with DiagnosticableTreeMixin implements WatchEvent {
  UpdatePlayBack({required this.playBack});

  final int? playBack;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePlayBackCopyWith<UpdatePlayBack> get copyWith =>
      _$UpdatePlayBackCopyWithImpl<UpdatePlayBack>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.updatePlayBack'))
      ..add(DiagnosticsProperty('playBack', playBack));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePlayBack &&
            (identical(other.playBack, playBack) ||
                other.playBack == playBack));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playBack);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.updatePlayBack(playBack: $playBack)';
  }
}

/// @nodoc
abstract mixin class $UpdatePlayBackCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $UpdatePlayBackCopyWith(
          UpdatePlayBack value, $Res Function(UpdatePlayBack) _then) =
      _$UpdatePlayBackCopyWithImpl;
  @useResult
  $Res call({int? playBack});
}

/// @nodoc
class _$UpdatePlayBackCopyWithImpl<$Res>
    implements $UpdatePlayBackCopyWith<$Res> {
  _$UpdatePlayBackCopyWithImpl(this._self, this._then);

  final UpdatePlayBack _self;
  final $Res Function(UpdatePlayBack) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playBack = freezed,
  }) {
    return _then(UpdatePlayBack(
      playBack: freezed == playBack
          ? _self.playBack
          : playBack // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class GetNewPipeWatchInfo with DiagnosticableTreeMixin implements WatchEvent {
  GetNewPipeWatchInfo({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNewPipeWatchInfoCopyWith<GetNewPipeWatchInfo> get copyWith =>
      _$GetNewPipeWatchInfoCopyWithImpl<GetNewPipeWatchInfo>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getNewPipeWatchInfo'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNewPipeWatchInfo &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getNewPipeWatchInfo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetNewPipeWatchInfoCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetNewPipeWatchInfoCopyWith(
          GetNewPipeWatchInfo value, $Res Function(GetNewPipeWatchInfo) _then) =
      _$GetNewPipeWatchInfoCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetNewPipeWatchInfoCopyWithImpl<$Res>
    implements $GetNewPipeWatchInfoCopyWith<$Res> {
  _$GetNewPipeWatchInfoCopyWithImpl(this._self, this._then);

  final GetNewPipeWatchInfo _self;
  final $Res Function(GetNewPipeWatchInfo) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetNewPipeWatchInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetNewPipeWatchInfoFast
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetNewPipeWatchInfoFast(
      {required this.id, required final List<String> sponsorBlockCategories})
      : _sponsorBlockCategories = sponsorBlockCategories;

  final String id;
  final List<String> _sponsorBlockCategories;
  List<String> get sponsorBlockCategories {
    if (_sponsorBlockCategories is EqualUnmodifiableListView)
      return _sponsorBlockCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorBlockCategories);
  }

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNewPipeWatchInfoFastCopyWith<GetNewPipeWatchInfoFast> get copyWith =>
      _$GetNewPipeWatchInfoFastCopyWithImpl<GetNewPipeWatchInfoFast>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getNewPipeWatchInfoFast'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty(
          'sponsorBlockCategories', sponsorBlockCategories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNewPipeWatchInfoFast &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
                other._sponsorBlockCategories, _sponsorBlockCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_sponsorBlockCategories));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getNewPipeWatchInfoFast(id: $id, sponsorBlockCategories: $sponsorBlockCategories)';
  }
}

/// @nodoc
abstract mixin class $GetNewPipeWatchInfoFastCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetNewPipeWatchInfoFastCopyWith(GetNewPipeWatchInfoFast value,
          $Res Function(GetNewPipeWatchInfoFast) _then) =
      _$GetNewPipeWatchInfoFastCopyWithImpl;
  @useResult
  $Res call({String id, List<String> sponsorBlockCategories});
}

/// @nodoc
class _$GetNewPipeWatchInfoFastCopyWithImpl<$Res>
    implements $GetNewPipeWatchInfoFastCopyWith<$Res> {
  _$GetNewPipeWatchInfoFastCopyWithImpl(this._self, this._then);

  final GetNewPipeWatchInfoFast _self;
  final $Res Function(GetNewPipeWatchInfoFast) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sponsorBlockCategories = null,
  }) {
    return _then(GetNewPipeWatchInfoFast(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sponsorBlockCategories: null == sponsorBlockCategories
          ? _self._sponsorBlockCategories
          : sponsorBlockCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class GetNewPipeComments with DiagnosticableTreeMixin implements WatchEvent {
  GetNewPipeComments({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNewPipeCommentsCopyWith<GetNewPipeComments> get copyWith =>
      _$GetNewPipeCommentsCopyWithImpl<GetNewPipeComments>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getNewPipeComments'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNewPipeComments &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getNewPipeComments(id: $id)';
  }
}

/// @nodoc
abstract mixin class $GetNewPipeCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetNewPipeCommentsCopyWith(
          GetNewPipeComments value, $Res Function(GetNewPipeComments) _then) =
      _$GetNewPipeCommentsCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetNewPipeCommentsCopyWithImpl<$Res>
    implements $GetNewPipeCommentsCopyWith<$Res> {
  _$GetNewPipeCommentsCopyWithImpl(this._self, this._then);

  final GetNewPipeComments _self;
  final $Res Function(GetNewPipeComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(GetNewPipeComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ForceFetchNewPipeComments
    with DiagnosticableTreeMixin
    implements WatchEvent {
  ForceFetchNewPipeComments({required this.id});

  final String id;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForceFetchNewPipeCommentsCopyWith<ForceFetchNewPipeComments> get copyWith =>
      _$ForceFetchNewPipeCommentsCopyWithImpl<ForceFetchNewPipeComments>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.forceFetchNewPipeComments'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForceFetchNewPipeComments &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.forceFetchNewPipeComments(id: $id)';
  }
}

/// @nodoc
abstract mixin class $ForceFetchNewPipeCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $ForceFetchNewPipeCommentsCopyWith(ForceFetchNewPipeComments value,
          $Res Function(ForceFetchNewPipeComments) _then) =
      _$ForceFetchNewPipeCommentsCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ForceFetchNewPipeCommentsCopyWithImpl<$Res>
    implements $ForceFetchNewPipeCommentsCopyWith<$Res> {
  _$ForceFetchNewPipeCommentsCopyWithImpl(this._self, this._then);

  final ForceFetchNewPipeComments _self;
  final $Res Function(ForceFetchNewPipeComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(ForceFetchNewPipeComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreNewPipeComments
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetMoreNewPipeComments({required this.id, required this.nextPage});

  final String id;
  final String? nextPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreNewPipeCommentsCopyWith<GetMoreNewPipeComments> get copyWith =>
      _$GetMoreNewPipeCommentsCopyWithImpl<GetMoreNewPipeComments>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getMoreNewPipeComments'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreNewPipeComments &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nextPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreNewPipeComments(id: $id, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMoreNewPipeCommentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreNewPipeCommentsCopyWith(GetMoreNewPipeComments value,
          $Res Function(GetMoreNewPipeComments) _then) =
      _$GetMoreNewPipeCommentsCopyWithImpl;
  @useResult
  $Res call({String id, String? nextPage});
}

/// @nodoc
class _$GetMoreNewPipeCommentsCopyWithImpl<$Res>
    implements $GetMoreNewPipeCommentsCopyWith<$Res> {
  _$GetMoreNewPipeCommentsCopyWithImpl(this._self, this._then);

  final GetMoreNewPipeComments _self;
  final $Res Function(GetMoreNewPipeComments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMoreNewPipeComments(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetNewPipeCommentReplies
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetNewPipeCommentReplies({required this.videoId, required this.repliesPage});

  final String videoId;
  final String repliesPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNewPipeCommentRepliesCopyWith<GetNewPipeCommentReplies> get copyWith =>
      _$GetNewPipeCommentRepliesCopyWithImpl<GetNewPipeCommentReplies>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getNewPipeCommentReplies'))
      ..add(DiagnosticsProperty('videoId', videoId))
      ..add(DiagnosticsProperty('repliesPage', repliesPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNewPipeCommentReplies &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.repliesPage, repliesPage) ||
                other.repliesPage == repliesPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, repliesPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getNewPipeCommentReplies(videoId: $videoId, repliesPage: $repliesPage)';
  }
}

/// @nodoc
abstract mixin class $GetNewPipeCommentRepliesCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetNewPipeCommentRepliesCopyWith(GetNewPipeCommentReplies value,
          $Res Function(GetNewPipeCommentReplies) _then) =
      _$GetNewPipeCommentRepliesCopyWithImpl;
  @useResult
  $Res call({String videoId, String repliesPage});
}

/// @nodoc
class _$GetNewPipeCommentRepliesCopyWithImpl<$Res>
    implements $GetNewPipeCommentRepliesCopyWith<$Res> {
  _$GetNewPipeCommentRepliesCopyWithImpl(this._self, this._then);

  final GetNewPipeCommentReplies _self;
  final $Res Function(GetNewPipeCommentReplies) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? repliesPage = null,
  }) {
    return _then(GetNewPipeCommentReplies(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      repliesPage: null == repliesPage
          ? _self.repliesPage
          : repliesPage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreNewPipeCommentReplies
    with DiagnosticableTreeMixin
    implements WatchEvent {
  GetMoreNewPipeCommentReplies({required this.videoId, required this.nextPage});

  final String videoId;
  final String? nextPage;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreNewPipeCommentRepliesCopyWith<GetMoreNewPipeCommentReplies>
      get copyWith => _$GetMoreNewPipeCommentRepliesCopyWithImpl<
          GetMoreNewPipeCommentReplies>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'WatchEvent.getMoreNewPipeCommentReplies'))
      ..add(DiagnosticsProperty('videoId', videoId))
      ..add(DiagnosticsProperty('nextPage', nextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreNewPipeCommentReplies &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, nextPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getMoreNewPipeCommentReplies(videoId: $videoId, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMoreNewPipeCommentRepliesCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetMoreNewPipeCommentRepliesCopyWith(
          GetMoreNewPipeCommentReplies value,
          $Res Function(GetMoreNewPipeCommentReplies) _then) =
      _$GetMoreNewPipeCommentRepliesCopyWithImpl;
  @useResult
  $Res call({String videoId, String? nextPage});
}

/// @nodoc
class _$GetMoreNewPipeCommentRepliesCopyWithImpl<$Res>
    implements $GetMoreNewPipeCommentRepliesCopyWith<$Res> {
  _$GetMoreNewPipeCommentRepliesCopyWithImpl(this._self, this._then);

  final GetMoreNewPipeCommentReplies _self;
  final $Res Function(GetMoreNewPipeCommentReplies) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMoreNewPipeCommentReplies(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetSponsorSegments with DiagnosticableTreeMixin implements WatchEvent {
  GetSponsorSegments(
      {required this.videoId, required final List<String> categories})
      : _categories = categories;

  final String videoId;
  final List<String> _categories;
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSponsorSegmentsCopyWith<GetSponsorSegments> get copyWith =>
      _$GetSponsorSegmentsCopyWithImpl<GetSponsorSegments>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchEvent.getSponsorSegments'))
      ..add(DiagnosticsProperty('videoId', videoId))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSponsorSegments &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, videoId, const DeepCollectionEquality().hash(_categories));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchEvent.getSponsorSegments(videoId: $videoId, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $GetSponsorSegmentsCopyWith<$Res>
    implements $WatchEventCopyWith<$Res> {
  factory $GetSponsorSegmentsCopyWith(
          GetSponsorSegments value, $Res Function(GetSponsorSegments) _then) =
      _$GetSponsorSegmentsCopyWithImpl;
  @useResult
  $Res call({String videoId, List<String> categories});
}

/// @nodoc
class _$GetSponsorSegmentsCopyWithImpl<$Res>
    implements $GetSponsorSegmentsCopyWith<$Res> {
  _$GetSponsorSegmentsCopyWithImpl(this._self, this._then);

  final GetSponsorSegments _self;
  final $Res Function(GetSponsorSegments) _then;

  /// Create a copy of WatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? categories = null,
  }) {
    return _then(GetSponsorSegments(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$WatchState implements DiagnosticableTreeMixin {
//
  String? get oldId;
  bool get isTapComments;
  bool get isDescriptionTapped;
  bool get isPipEnabled;
  String get title;
  int get playBack;
  VideoBasicInfo? get selectedVideoBasicDetails; // PIPED
  WatchResp get watchResp;
  CommentsResp get comments;
  CommentsResp get commentReplies;
  ApiStatus get fetchWatchInfoStatus;
  ApiStatus get fetchCommentsStatus;
  ApiStatus get fetchCommentRepliesStatus;
  ApiStatus get fetchMoreCommentsStatus;
  bool get isMoreCommentsFetchCompleted;
  ApiStatus get fetchMoreCommentRepliesStatus;
  bool get isMoreReplyCommentsFetchCompleted; //EXPLODE
  ExplodeWatchResp get explodeWatchResp;
  ApiStatus get fetchExplodeWatchInfoStatus;
  ApiStatus get fetchSubtitlesStatus;
  List<Map<String, String>> get subtitles;
  String? get liveStreamUrl;
  ApiStatus get fetchExplodeLiveStreamStatus;
  List<MyRelatedVideo>? get relatedVideos;
  ApiStatus get fetchExplodedRelatedVideosStatus;
  List<MyMuxedStreamInfo>? get muxedStreams;
  ApiStatus get fetchExplodeMuxedStreamsStatus; // INVIDIOUS
  InvidiousWatchResp get invidiousWatchResp;
  ApiStatus get fetchInvidiousWatchInfoStatus;
  InvidiousCommentsResp get invidiousComments;
  ApiStatus get fetchInvidiousCommentsStatus;
  InvidiousCommentsResp get invidiousCommentReplies;
  ApiStatus get fetchInvidiousCommentRepliesStatus;
  ApiStatus get fetchMoreInvidiousCommentsStatus;
  bool get isMoreInvidiousCommentsFetchCompleted;
  ApiStatus get fetchMoreInvidiousCommentRepliesStatus;
  bool get isMoreInvidiousReplyCommentsFetchCompleted; // NEWPIPE
  NewPipeWatchResp get newPipeWatchResp;
  ApiStatus get fetchNewPipeWatchInfoStatus;
  String? get newPipeErrorMessage;
  NewPipeCommentsResp get newPipeComments;
  ApiStatus get fetchNewPipeCommentsStatus;
  ApiStatus get fetchMoreNewPipeCommentsStatus;
  bool get isMoreNewPipeCommentsFetchCompleted;
  NewPipeCommentsResp get newPipeCommentReplies;
  ApiStatus get fetchNewPipeCommentRepliesStatus;
  ApiStatus get fetchMoreNewPipeCommentRepliesStatus;
  bool get isMoreNewPipeReplyCommentsFetchCompleted; // SPONSORBLOCK
  List<SponsorSegment> get sponsorSegments;
  ApiStatus get fetchSponsorSegmentsStatus;

  /// Create a copy of WatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchStateCopyWith<WatchState> get copyWith =>
      _$WatchStateCopyWithImpl<WatchState>(this as WatchState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchState'))
      ..add(DiagnosticsProperty('oldId', oldId))
      ..add(DiagnosticsProperty('isTapComments', isTapComments))
      ..add(DiagnosticsProperty('isDescriptionTapped', isDescriptionTapped))
      ..add(DiagnosticsProperty('isPipEnabled', isPipEnabled))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('playBack', playBack))
      ..add(DiagnosticsProperty(
          'selectedVideoBasicDetails', selectedVideoBasicDetails))
      ..add(DiagnosticsProperty('watchResp', watchResp))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('commentReplies', commentReplies))
      ..add(DiagnosticsProperty('fetchWatchInfoStatus', fetchWatchInfoStatus))
      ..add(DiagnosticsProperty('fetchCommentsStatus', fetchCommentsStatus))
      ..add(DiagnosticsProperty(
          'fetchCommentRepliesStatus', fetchCommentRepliesStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreCommentsStatus', fetchMoreCommentsStatus))
      ..add(DiagnosticsProperty(
          'isMoreCommentsFetchCompleted', isMoreCommentsFetchCompleted))
      ..add(DiagnosticsProperty(
          'fetchMoreCommentRepliesStatus', fetchMoreCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreReplyCommentsFetchCompleted',
          isMoreReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('explodeWatchResp', explodeWatchResp))
      ..add(DiagnosticsProperty(
          'fetchExplodeWatchInfoStatus', fetchExplodeWatchInfoStatus))
      ..add(DiagnosticsProperty('fetchSubtitlesStatus', fetchSubtitlesStatus))
      ..add(DiagnosticsProperty('subtitles', subtitles))
      ..add(DiagnosticsProperty('liveStreamUrl', liveStreamUrl))
      ..add(DiagnosticsProperty(
          'fetchExplodeLiveStreamStatus', fetchExplodeLiveStreamStatus))
      ..add(DiagnosticsProperty('relatedVideos', relatedVideos))
      ..add(DiagnosticsProperty(
          'fetchExplodedRelatedVideosStatus', fetchExplodedRelatedVideosStatus))
      ..add(DiagnosticsProperty('muxedStreams', muxedStreams))
      ..add(DiagnosticsProperty(
          'fetchExplodeMuxedStreamsStatus', fetchExplodeMuxedStreamsStatus))
      ..add(DiagnosticsProperty('invidiousWatchResp', invidiousWatchResp))
      ..add(DiagnosticsProperty(
          'fetchInvidiousWatchInfoStatus', fetchInvidiousWatchInfoStatus))
      ..add(DiagnosticsProperty('invidiousComments', invidiousComments))
      ..add(DiagnosticsProperty(
          'fetchInvidiousCommentsStatus', fetchInvidiousCommentsStatus))
      ..add(DiagnosticsProperty(
          'invidiousCommentReplies', invidiousCommentReplies))
      ..add(DiagnosticsProperty('fetchInvidiousCommentRepliesStatus',
          fetchInvidiousCommentRepliesStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreInvidiousCommentsStatus', fetchMoreInvidiousCommentsStatus))
      ..add(DiagnosticsProperty('isMoreInvidiousCommentsFetchCompleted',
          isMoreInvidiousCommentsFetchCompleted))
      ..add(DiagnosticsProperty('fetchMoreInvidiousCommentRepliesStatus',
          fetchMoreInvidiousCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreInvidiousReplyCommentsFetchCompleted',
          isMoreInvidiousReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('newPipeWatchResp', newPipeWatchResp))
      ..add(DiagnosticsProperty(
          'fetchNewPipeWatchInfoStatus', fetchNewPipeWatchInfoStatus))
      ..add(DiagnosticsProperty('newPipeErrorMessage', newPipeErrorMessage))
      ..add(DiagnosticsProperty('newPipeComments', newPipeComments))
      ..add(DiagnosticsProperty(
          'fetchNewPipeCommentsStatus', fetchNewPipeCommentsStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreNewPipeCommentsStatus', fetchMoreNewPipeCommentsStatus))
      ..add(DiagnosticsProperty('isMoreNewPipeCommentsFetchCompleted',
          isMoreNewPipeCommentsFetchCompleted))
      ..add(DiagnosticsProperty('newPipeCommentReplies', newPipeCommentReplies))
      ..add(DiagnosticsProperty(
          'fetchNewPipeCommentRepliesStatus', fetchNewPipeCommentRepliesStatus))
      ..add(DiagnosticsProperty('fetchMoreNewPipeCommentRepliesStatus',
          fetchMoreNewPipeCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreNewPipeReplyCommentsFetchCompleted',
          isMoreNewPipeReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('sponsorSegments', sponsorSegments))
      ..add(DiagnosticsProperty(
          'fetchSponsorSegmentsStatus', fetchSponsorSegmentsStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchState &&
            (identical(other.oldId, oldId) || other.oldId == oldId) &&
            (identical(other.isTapComments, isTapComments) ||
                other.isTapComments == isTapComments) &&
            (identical(other.isDescriptionTapped, isDescriptionTapped) ||
                other.isDescriptionTapped == isDescriptionTapped) &&
            (identical(other.isPipEnabled, isPipEnabled) ||
                other.isPipEnabled == isPipEnabled) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playBack, playBack) ||
                other.playBack == playBack) &&
            (identical(other.selectedVideoBasicDetails, selectedVideoBasicDetails) ||
                other.selectedVideoBasicDetails == selectedVideoBasicDetails) &&
            (identical(other.watchResp, watchResp) ||
                other.watchResp == watchResp) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.commentReplies, commentReplies) ||
                other.commentReplies == commentReplies) &&
            (identical(other.fetchWatchInfoStatus, fetchWatchInfoStatus) ||
                other.fetchWatchInfoStatus == fetchWatchInfoStatus) &&
            (identical(other.fetchCommentsStatus, fetchCommentsStatus) ||
                other.fetchCommentsStatus == fetchCommentsStatus) &&
            (identical(other.fetchCommentRepliesStatus, fetchCommentRepliesStatus) ||
                other.fetchCommentRepliesStatus == fetchCommentRepliesStatus) &&
            (identical(other.fetchMoreCommentsStatus, fetchMoreCommentsStatus) ||
                other.fetchMoreCommentsStatus == fetchMoreCommentsStatus) &&
            (identical(other.isMoreCommentsFetchCompleted, isMoreCommentsFetchCompleted) ||
                other.isMoreCommentsFetchCompleted ==
                    isMoreCommentsFetchCompleted) &&
            (identical(other.fetchMoreCommentRepliesStatus, fetchMoreCommentRepliesStatus) ||
                other.fetchMoreCommentRepliesStatus ==
                    fetchMoreCommentRepliesStatus) &&
            (identical(other.isMoreReplyCommentsFetchCompleted, isMoreReplyCommentsFetchCompleted) ||
                other.isMoreReplyCommentsFetchCompleted ==
                    isMoreReplyCommentsFetchCompleted) &&
            (identical(other.explodeWatchResp, explodeWatchResp) ||
                other.explodeWatchResp == explodeWatchResp) &&
            (identical(other.fetchExplodeWatchInfoStatus, fetchExplodeWatchInfoStatus) ||
                other.fetchExplodeWatchInfoStatus ==
                    fetchExplodeWatchInfoStatus) &&
            (identical(other.fetchSubtitlesStatus, fetchSubtitlesStatus) ||
                other.fetchSubtitlesStatus == fetchSubtitlesStatus) &&
            const DeepCollectionEquality().equals(other.subtitles, subtitles) &&
            (identical(other.liveStreamUrl, liveStreamUrl) ||
                other.liveStreamUrl == liveStreamUrl) &&
            (identical(other.fetchExplodeLiveStreamStatus, fetchExplodeLiveStreamStatus) ||
                other.fetchExplodeLiveStreamStatus ==
                    fetchExplodeLiveStreamStatus) &&
            const DeepCollectionEquality()
                .equals(other.relatedVideos, relatedVideos) &&
            (identical(other.fetchExplodedRelatedVideosStatus, fetchExplodedRelatedVideosStatus) ||
                other.fetchExplodedRelatedVideosStatus == fetchExplodedRelatedVideosStatus) &&
            const DeepCollectionEquality().equals(other.muxedStreams, muxedStreams) &&
            (identical(other.fetchExplodeMuxedStreamsStatus, fetchExplodeMuxedStreamsStatus) || other.fetchExplodeMuxedStreamsStatus == fetchExplodeMuxedStreamsStatus) &&
            (identical(other.invidiousWatchResp, invidiousWatchResp) || other.invidiousWatchResp == invidiousWatchResp) &&
            (identical(other.fetchInvidiousWatchInfoStatus, fetchInvidiousWatchInfoStatus) || other.fetchInvidiousWatchInfoStatus == fetchInvidiousWatchInfoStatus) &&
            (identical(other.invidiousComments, invidiousComments) || other.invidiousComments == invidiousComments) &&
            (identical(other.fetchInvidiousCommentsStatus, fetchInvidiousCommentsStatus) || other.fetchInvidiousCommentsStatus == fetchInvidiousCommentsStatus) &&
            (identical(other.invidiousCommentReplies, invidiousCommentReplies) || other.invidiousCommentReplies == invidiousCommentReplies) &&
            (identical(other.fetchInvidiousCommentRepliesStatus, fetchInvidiousCommentRepliesStatus) || other.fetchInvidiousCommentRepliesStatus == fetchInvidiousCommentRepliesStatus) &&
            (identical(other.fetchMoreInvidiousCommentsStatus, fetchMoreInvidiousCommentsStatus) || other.fetchMoreInvidiousCommentsStatus == fetchMoreInvidiousCommentsStatus) &&
            (identical(other.isMoreInvidiousCommentsFetchCompleted, isMoreInvidiousCommentsFetchCompleted) || other.isMoreInvidiousCommentsFetchCompleted == isMoreInvidiousCommentsFetchCompleted) &&
            (identical(other.fetchMoreInvidiousCommentRepliesStatus, fetchMoreInvidiousCommentRepliesStatus) || other.fetchMoreInvidiousCommentRepliesStatus == fetchMoreInvidiousCommentRepliesStatus) &&
            (identical(other.isMoreInvidiousReplyCommentsFetchCompleted, isMoreInvidiousReplyCommentsFetchCompleted) || other.isMoreInvidiousReplyCommentsFetchCompleted == isMoreInvidiousReplyCommentsFetchCompleted) &&
            (identical(other.newPipeWatchResp, newPipeWatchResp) || other.newPipeWatchResp == newPipeWatchResp) &&
            (identical(other.fetchNewPipeWatchInfoStatus, fetchNewPipeWatchInfoStatus) || other.fetchNewPipeWatchInfoStatus == fetchNewPipeWatchInfoStatus) &&
            (identical(other.newPipeErrorMessage, newPipeErrorMessage) || other.newPipeErrorMessage == newPipeErrorMessage) &&
            (identical(other.newPipeComments, newPipeComments) || other.newPipeComments == newPipeComments) &&
            (identical(other.fetchNewPipeCommentsStatus, fetchNewPipeCommentsStatus) || other.fetchNewPipeCommentsStatus == fetchNewPipeCommentsStatus) &&
            (identical(other.fetchMoreNewPipeCommentsStatus, fetchMoreNewPipeCommentsStatus) || other.fetchMoreNewPipeCommentsStatus == fetchMoreNewPipeCommentsStatus) &&
            (identical(other.isMoreNewPipeCommentsFetchCompleted, isMoreNewPipeCommentsFetchCompleted) || other.isMoreNewPipeCommentsFetchCompleted == isMoreNewPipeCommentsFetchCompleted) &&
            (identical(other.newPipeCommentReplies, newPipeCommentReplies) || other.newPipeCommentReplies == newPipeCommentReplies) &&
            (identical(other.fetchNewPipeCommentRepliesStatus, fetchNewPipeCommentRepliesStatus) || other.fetchNewPipeCommentRepliesStatus == fetchNewPipeCommentRepliesStatus) &&
            (identical(other.fetchMoreNewPipeCommentRepliesStatus, fetchMoreNewPipeCommentRepliesStatus) || other.fetchMoreNewPipeCommentRepliesStatus == fetchMoreNewPipeCommentRepliesStatus) &&
            (identical(other.isMoreNewPipeReplyCommentsFetchCompleted, isMoreNewPipeReplyCommentsFetchCompleted) || other.isMoreNewPipeReplyCommentsFetchCompleted == isMoreNewPipeReplyCommentsFetchCompleted) &&
            const DeepCollectionEquality().equals(other.sponsorSegments, sponsorSegments) &&
            (identical(other.fetchSponsorSegmentsStatus, fetchSponsorSegmentsStatus) || other.fetchSponsorSegmentsStatus == fetchSponsorSegmentsStatus));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        oldId,
        isTapComments,
        isDescriptionTapped,
        isPipEnabled,
        title,
        playBack,
        selectedVideoBasicDetails,
        watchResp,
        comments,
        commentReplies,
        fetchWatchInfoStatus,
        fetchCommentsStatus,
        fetchCommentRepliesStatus,
        fetchMoreCommentsStatus,
        isMoreCommentsFetchCompleted,
        fetchMoreCommentRepliesStatus,
        isMoreReplyCommentsFetchCompleted,
        explodeWatchResp,
        fetchExplodeWatchInfoStatus,
        fetchSubtitlesStatus,
        const DeepCollectionEquality().hash(subtitles),
        liveStreamUrl,
        fetchExplodeLiveStreamStatus,
        const DeepCollectionEquality().hash(relatedVideos),
        fetchExplodedRelatedVideosStatus,
        const DeepCollectionEquality().hash(muxedStreams),
        fetchExplodeMuxedStreamsStatus,
        invidiousWatchResp,
        fetchInvidiousWatchInfoStatus,
        invidiousComments,
        fetchInvidiousCommentsStatus,
        invidiousCommentReplies,
        fetchInvidiousCommentRepliesStatus,
        fetchMoreInvidiousCommentsStatus,
        isMoreInvidiousCommentsFetchCompleted,
        fetchMoreInvidiousCommentRepliesStatus,
        isMoreInvidiousReplyCommentsFetchCompleted,
        newPipeWatchResp,
        fetchNewPipeWatchInfoStatus,
        newPipeErrorMessage,
        newPipeComments,
        fetchNewPipeCommentsStatus,
        fetchMoreNewPipeCommentsStatus,
        isMoreNewPipeCommentsFetchCompleted,
        newPipeCommentReplies,
        fetchNewPipeCommentRepliesStatus,
        fetchMoreNewPipeCommentRepliesStatus,
        isMoreNewPipeReplyCommentsFetchCompleted,
        const DeepCollectionEquality().hash(sponsorSegments),
        fetchSponsorSegmentsStatus
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchState(oldId: $oldId, isTapComments: $isTapComments, isDescriptionTapped: $isDescriptionTapped, isPipEnabled: $isPipEnabled, title: $title, playBack: $playBack, selectedVideoBasicDetails: $selectedVideoBasicDetails, watchResp: $watchResp, comments: $comments, commentReplies: $commentReplies, fetchWatchInfoStatus: $fetchWatchInfoStatus, fetchCommentsStatus: $fetchCommentsStatus, fetchCommentRepliesStatus: $fetchCommentRepliesStatus, fetchMoreCommentsStatus: $fetchMoreCommentsStatus, isMoreCommentsFetchCompleted: $isMoreCommentsFetchCompleted, fetchMoreCommentRepliesStatus: $fetchMoreCommentRepliesStatus, isMoreReplyCommentsFetchCompleted: $isMoreReplyCommentsFetchCompleted, explodeWatchResp: $explodeWatchResp, fetchExplodeWatchInfoStatus: $fetchExplodeWatchInfoStatus, fetchSubtitlesStatus: $fetchSubtitlesStatus, subtitles: $subtitles, liveStreamUrl: $liveStreamUrl, fetchExplodeLiveStreamStatus: $fetchExplodeLiveStreamStatus, relatedVideos: $relatedVideos, fetchExplodedRelatedVideosStatus: $fetchExplodedRelatedVideosStatus, muxedStreams: $muxedStreams, fetchExplodeMuxedStreamsStatus: $fetchExplodeMuxedStreamsStatus, invidiousWatchResp: $invidiousWatchResp, fetchInvidiousWatchInfoStatus: $fetchInvidiousWatchInfoStatus, invidiousComments: $invidiousComments, fetchInvidiousCommentsStatus: $fetchInvidiousCommentsStatus, invidiousCommentReplies: $invidiousCommentReplies, fetchInvidiousCommentRepliesStatus: $fetchInvidiousCommentRepliesStatus, fetchMoreInvidiousCommentsStatus: $fetchMoreInvidiousCommentsStatus, isMoreInvidiousCommentsFetchCompleted: $isMoreInvidiousCommentsFetchCompleted, fetchMoreInvidiousCommentRepliesStatus: $fetchMoreInvidiousCommentRepliesStatus, isMoreInvidiousReplyCommentsFetchCompleted: $isMoreInvidiousReplyCommentsFetchCompleted, newPipeWatchResp: $newPipeWatchResp, fetchNewPipeWatchInfoStatus: $fetchNewPipeWatchInfoStatus, newPipeErrorMessage: $newPipeErrorMessage, newPipeComments: $newPipeComments, fetchNewPipeCommentsStatus: $fetchNewPipeCommentsStatus, fetchMoreNewPipeCommentsStatus: $fetchMoreNewPipeCommentsStatus, isMoreNewPipeCommentsFetchCompleted: $isMoreNewPipeCommentsFetchCompleted, newPipeCommentReplies: $newPipeCommentReplies, fetchNewPipeCommentRepliesStatus: $fetchNewPipeCommentRepliesStatus, fetchMoreNewPipeCommentRepliesStatus: $fetchMoreNewPipeCommentRepliesStatus, isMoreNewPipeReplyCommentsFetchCompleted: $isMoreNewPipeReplyCommentsFetchCompleted, sponsorSegments: $sponsorSegments, fetchSponsorSegmentsStatus: $fetchSponsorSegmentsStatus)';
  }
}

/// @nodoc
abstract mixin class $WatchStateCopyWith<$Res> {
  factory $WatchStateCopyWith(
          WatchState value, $Res Function(WatchState) _then) =
      _$WatchStateCopyWithImpl;
  @useResult
  $Res call(
      {String? oldId,
      bool isTapComments,
      bool isDescriptionTapped,
      bool isPipEnabled,
      String title,
      int playBack,
      VideoBasicInfo? selectedVideoBasicDetails,
      WatchResp watchResp,
      CommentsResp comments,
      CommentsResp commentReplies,
      ApiStatus fetchWatchInfoStatus,
      ApiStatus fetchCommentsStatus,
      ApiStatus fetchCommentRepliesStatus,
      ApiStatus fetchMoreCommentsStatus,
      bool isMoreCommentsFetchCompleted,
      ApiStatus fetchMoreCommentRepliesStatus,
      bool isMoreReplyCommentsFetchCompleted,
      ExplodeWatchResp explodeWatchResp,
      ApiStatus fetchExplodeWatchInfoStatus,
      ApiStatus fetchSubtitlesStatus,
      List<Map<String, String>> subtitles,
      String? liveStreamUrl,
      ApiStatus fetchExplodeLiveStreamStatus,
      List<MyRelatedVideo>? relatedVideos,
      ApiStatus fetchExplodedRelatedVideosStatus,
      List<MyMuxedStreamInfo>? muxedStreams,
      ApiStatus fetchExplodeMuxedStreamsStatus,
      InvidiousWatchResp invidiousWatchResp,
      ApiStatus fetchInvidiousWatchInfoStatus,
      InvidiousCommentsResp invidiousComments,
      ApiStatus fetchInvidiousCommentsStatus,
      InvidiousCommentsResp invidiousCommentReplies,
      ApiStatus fetchInvidiousCommentRepliesStatus,
      ApiStatus fetchMoreInvidiousCommentsStatus,
      bool isMoreInvidiousCommentsFetchCompleted,
      ApiStatus fetchMoreInvidiousCommentRepliesStatus,
      bool isMoreInvidiousReplyCommentsFetchCompleted,
      NewPipeWatchResp newPipeWatchResp,
      ApiStatus fetchNewPipeWatchInfoStatus,
      String? newPipeErrorMessage,
      NewPipeCommentsResp newPipeComments,
      ApiStatus fetchNewPipeCommentsStatus,
      ApiStatus fetchMoreNewPipeCommentsStatus,
      bool isMoreNewPipeCommentsFetchCompleted,
      NewPipeCommentsResp newPipeCommentReplies,
      ApiStatus fetchNewPipeCommentRepliesStatus,
      ApiStatus fetchMoreNewPipeCommentRepliesStatus,
      bool isMoreNewPipeReplyCommentsFetchCompleted,
      List<SponsorSegment> sponsorSegments,
      ApiStatus fetchSponsorSegmentsStatus});
}

/// @nodoc
class _$WatchStateCopyWithImpl<$Res> implements $WatchStateCopyWith<$Res> {
  _$WatchStateCopyWithImpl(this._self, this._then);

  final WatchState _self;
  final $Res Function(WatchState) _then;

  /// Create a copy of WatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldId = freezed,
    Object? isTapComments = null,
    Object? isDescriptionTapped = null,
    Object? isPipEnabled = null,
    Object? title = null,
    Object? playBack = null,
    Object? selectedVideoBasicDetails = freezed,
    Object? watchResp = null,
    Object? comments = null,
    Object? commentReplies = null,
    Object? fetchWatchInfoStatus = null,
    Object? fetchCommentsStatus = null,
    Object? fetchCommentRepliesStatus = null,
    Object? fetchMoreCommentsStatus = null,
    Object? isMoreCommentsFetchCompleted = null,
    Object? fetchMoreCommentRepliesStatus = null,
    Object? isMoreReplyCommentsFetchCompleted = null,
    Object? explodeWatchResp = null,
    Object? fetchExplodeWatchInfoStatus = null,
    Object? fetchSubtitlesStatus = null,
    Object? subtitles = null,
    Object? liveStreamUrl = freezed,
    Object? fetchExplodeLiveStreamStatus = null,
    Object? relatedVideos = freezed,
    Object? fetchExplodedRelatedVideosStatus = null,
    Object? muxedStreams = freezed,
    Object? fetchExplodeMuxedStreamsStatus = null,
    Object? invidiousWatchResp = null,
    Object? fetchInvidiousWatchInfoStatus = null,
    Object? invidiousComments = null,
    Object? fetchInvidiousCommentsStatus = null,
    Object? invidiousCommentReplies = null,
    Object? fetchInvidiousCommentRepliesStatus = null,
    Object? fetchMoreInvidiousCommentsStatus = null,
    Object? isMoreInvidiousCommentsFetchCompleted = null,
    Object? fetchMoreInvidiousCommentRepliesStatus = null,
    Object? isMoreInvidiousReplyCommentsFetchCompleted = null,
    Object? newPipeWatchResp = null,
    Object? fetchNewPipeWatchInfoStatus = null,
    Object? newPipeErrorMessage = freezed,
    Object? newPipeComments = null,
    Object? fetchNewPipeCommentsStatus = null,
    Object? fetchMoreNewPipeCommentsStatus = null,
    Object? isMoreNewPipeCommentsFetchCompleted = null,
    Object? newPipeCommentReplies = null,
    Object? fetchNewPipeCommentRepliesStatus = null,
    Object? fetchMoreNewPipeCommentRepliesStatus = null,
    Object? isMoreNewPipeReplyCommentsFetchCompleted = null,
    Object? sponsorSegments = null,
    Object? fetchSponsorSegmentsStatus = null,
  }) {
    return _then(_self.copyWith(
      oldId: freezed == oldId
          ? _self.oldId
          : oldId // ignore: cast_nullable_to_non_nullable
              as String?,
      isTapComments: null == isTapComments
          ? _self.isTapComments
          : isTapComments // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionTapped: null == isDescriptionTapped
          ? _self.isDescriptionTapped
          : isDescriptionTapped // ignore: cast_nullable_to_non_nullable
              as bool,
      isPipEnabled: null == isPipEnabled
          ? _self.isPipEnabled
          : isPipEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playBack: null == playBack
          ? _self.playBack
          : playBack // ignore: cast_nullable_to_non_nullable
              as int,
      selectedVideoBasicDetails: freezed == selectedVideoBasicDetails
          ? _self.selectedVideoBasicDetails
          : selectedVideoBasicDetails // ignore: cast_nullable_to_non_nullable
              as VideoBasicInfo?,
      watchResp: null == watchResp
          ? _self.watchResp
          : watchResp // ignore: cast_nullable_to_non_nullable
              as WatchResp,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsResp,
      commentReplies: null == commentReplies
          ? _self.commentReplies
          : commentReplies // ignore: cast_nullable_to_non_nullable
              as CommentsResp,
      fetchWatchInfoStatus: null == fetchWatchInfoStatus
          ? _self.fetchWatchInfoStatus
          : fetchWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchCommentsStatus: null == fetchCommentsStatus
          ? _self.fetchCommentsStatus
          : fetchCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchCommentRepliesStatus: null == fetchCommentRepliesStatus
          ? _self.fetchCommentRepliesStatus
          : fetchCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreCommentsStatus: null == fetchMoreCommentsStatus
          ? _self.fetchMoreCommentsStatus
          : fetchMoreCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreCommentsFetchCompleted: null == isMoreCommentsFetchCompleted
          ? _self.isMoreCommentsFetchCompleted
          : isMoreCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchMoreCommentRepliesStatus: null == fetchMoreCommentRepliesStatus
          ? _self.fetchMoreCommentRepliesStatus
          : fetchMoreCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreReplyCommentsFetchCompleted: null ==
              isMoreReplyCommentsFetchCompleted
          ? _self.isMoreReplyCommentsFetchCompleted
          : isMoreReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      explodeWatchResp: null == explodeWatchResp
          ? _self.explodeWatchResp
          : explodeWatchResp // ignore: cast_nullable_to_non_nullable
              as ExplodeWatchResp,
      fetchExplodeWatchInfoStatus: null == fetchExplodeWatchInfoStatus
          ? _self.fetchExplodeWatchInfoStatus
          : fetchExplodeWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchSubtitlesStatus: null == fetchSubtitlesStatus
          ? _self.fetchSubtitlesStatus
          : fetchSubtitlesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      subtitles: null == subtitles
          ? _self.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      liveStreamUrl: freezed == liveStreamUrl
          ? _self.liveStreamUrl
          : liveStreamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchExplodeLiveStreamStatus: null == fetchExplodeLiveStreamStatus
          ? _self.fetchExplodeLiveStreamStatus
          : fetchExplodeLiveStreamStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      relatedVideos: freezed == relatedVideos
          ? _self.relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<MyRelatedVideo>?,
      fetchExplodedRelatedVideosStatus: null == fetchExplodedRelatedVideosStatus
          ? _self.fetchExplodedRelatedVideosStatus
          : fetchExplodedRelatedVideosStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      muxedStreams: freezed == muxedStreams
          ? _self.muxedStreams
          : muxedStreams // ignore: cast_nullable_to_non_nullable
              as List<MyMuxedStreamInfo>?,
      fetchExplodeMuxedStreamsStatus: null == fetchExplodeMuxedStreamsStatus
          ? _self.fetchExplodeMuxedStreamsStatus
          : fetchExplodeMuxedStreamsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousWatchResp: null == invidiousWatchResp
          ? _self.invidiousWatchResp
          : invidiousWatchResp // ignore: cast_nullable_to_non_nullable
              as InvidiousWatchResp,
      fetchInvidiousWatchInfoStatus: null == fetchInvidiousWatchInfoStatus
          ? _self.fetchInvidiousWatchInfoStatus
          : fetchInvidiousWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousComments: null == invidiousComments
          ? _self.invidiousComments
          : invidiousComments // ignore: cast_nullable_to_non_nullable
              as InvidiousCommentsResp,
      fetchInvidiousCommentsStatus: null == fetchInvidiousCommentsStatus
          ? _self.fetchInvidiousCommentsStatus
          : fetchInvidiousCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousCommentReplies: null == invidiousCommentReplies
          ? _self.invidiousCommentReplies
          : invidiousCommentReplies // ignore: cast_nullable_to_non_nullable
              as InvidiousCommentsResp,
      fetchInvidiousCommentRepliesStatus: null ==
              fetchInvidiousCommentRepliesStatus
          ? _self.fetchInvidiousCommentRepliesStatus
          : fetchInvidiousCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreInvidiousCommentsStatus: null == fetchMoreInvidiousCommentsStatus
          ? _self.fetchMoreInvidiousCommentsStatus
          : fetchMoreInvidiousCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousCommentsFetchCompleted: null ==
              isMoreInvidiousCommentsFetchCompleted
          ? _self.isMoreInvidiousCommentsFetchCompleted
          : isMoreInvidiousCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchMoreInvidiousCommentRepliesStatus: null ==
              fetchMoreInvidiousCommentRepliesStatus
          ? _self.fetchMoreInvidiousCommentRepliesStatus
          : fetchMoreInvidiousCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousReplyCommentsFetchCompleted: null ==
              isMoreInvidiousReplyCommentsFetchCompleted
          ? _self.isMoreInvidiousReplyCommentsFetchCompleted
          : isMoreInvidiousReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      newPipeWatchResp: null == newPipeWatchResp
          ? _self.newPipeWatchResp
          : newPipeWatchResp // ignore: cast_nullable_to_non_nullable
              as NewPipeWatchResp,
      fetchNewPipeWatchInfoStatus: null == fetchNewPipeWatchInfoStatus
          ? _self.fetchNewPipeWatchInfoStatus
          : fetchNewPipeWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeErrorMessage: freezed == newPipeErrorMessage
          ? _self.newPipeErrorMessage
          : newPipeErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      newPipeComments: null == newPipeComments
          ? _self.newPipeComments
          : newPipeComments // ignore: cast_nullable_to_non_nullable
              as NewPipeCommentsResp,
      fetchNewPipeCommentsStatus: null == fetchNewPipeCommentsStatus
          ? _self.fetchNewPipeCommentsStatus
          : fetchNewPipeCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreNewPipeCommentsStatus: null == fetchMoreNewPipeCommentsStatus
          ? _self.fetchMoreNewPipeCommentsStatus
          : fetchMoreNewPipeCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeCommentsFetchCompleted: null ==
              isMoreNewPipeCommentsFetchCompleted
          ? _self.isMoreNewPipeCommentsFetchCompleted
          : isMoreNewPipeCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      newPipeCommentReplies: null == newPipeCommentReplies
          ? _self.newPipeCommentReplies
          : newPipeCommentReplies // ignore: cast_nullable_to_non_nullable
              as NewPipeCommentsResp,
      fetchNewPipeCommentRepliesStatus: null == fetchNewPipeCommentRepliesStatus
          ? _self.fetchNewPipeCommentRepliesStatus
          : fetchNewPipeCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreNewPipeCommentRepliesStatus: null ==
              fetchMoreNewPipeCommentRepliesStatus
          ? _self.fetchMoreNewPipeCommentRepliesStatus
          : fetchMoreNewPipeCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeReplyCommentsFetchCompleted: null ==
              isMoreNewPipeReplyCommentsFetchCompleted
          ? _self.isMoreNewPipeReplyCommentsFetchCompleted
          : isMoreNewPipeReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorSegments: null == sponsorSegments
          ? _self.sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<SponsorSegment>,
      fetchSponsorSegmentsStatus: null == fetchSponsorSegmentsStatus
          ? _self.fetchSponsorSegmentsStatus
          : fetchSponsorSegmentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
    ));
  }
}

/// Adds pattern-matching-related methods to [WatchState].
extension WatchStatePatterns on WatchState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Initial value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Initial value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Initial value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? oldId,
            bool isTapComments,
            bool isDescriptionTapped,
            bool isPipEnabled,
            String title,
            int playBack,
            VideoBasicInfo? selectedVideoBasicDetails,
            WatchResp watchResp,
            CommentsResp comments,
            CommentsResp commentReplies,
            ApiStatus fetchWatchInfoStatus,
            ApiStatus fetchCommentsStatus,
            ApiStatus fetchCommentRepliesStatus,
            ApiStatus fetchMoreCommentsStatus,
            bool isMoreCommentsFetchCompleted,
            ApiStatus fetchMoreCommentRepliesStatus,
            bool isMoreReplyCommentsFetchCompleted,
            ExplodeWatchResp explodeWatchResp,
            ApiStatus fetchExplodeWatchInfoStatus,
            ApiStatus fetchSubtitlesStatus,
            List<Map<String, String>> subtitles,
            String? liveStreamUrl,
            ApiStatus fetchExplodeLiveStreamStatus,
            List<MyRelatedVideo>? relatedVideos,
            ApiStatus fetchExplodedRelatedVideosStatus,
            List<MyMuxedStreamInfo>? muxedStreams,
            ApiStatus fetchExplodeMuxedStreamsStatus,
            InvidiousWatchResp invidiousWatchResp,
            ApiStatus fetchInvidiousWatchInfoStatus,
            InvidiousCommentsResp invidiousComments,
            ApiStatus fetchInvidiousCommentsStatus,
            InvidiousCommentsResp invidiousCommentReplies,
            ApiStatus fetchInvidiousCommentRepliesStatus,
            ApiStatus fetchMoreInvidiousCommentsStatus,
            bool isMoreInvidiousCommentsFetchCompleted,
            ApiStatus fetchMoreInvidiousCommentRepliesStatus,
            bool isMoreInvidiousReplyCommentsFetchCompleted,
            NewPipeWatchResp newPipeWatchResp,
            ApiStatus fetchNewPipeWatchInfoStatus,
            String? newPipeErrorMessage,
            NewPipeCommentsResp newPipeComments,
            ApiStatus fetchNewPipeCommentsStatus,
            ApiStatus fetchMoreNewPipeCommentsStatus,
            bool isMoreNewPipeCommentsFetchCompleted,
            NewPipeCommentsResp newPipeCommentReplies,
            ApiStatus fetchNewPipeCommentRepliesStatus,
            ApiStatus fetchMoreNewPipeCommentRepliesStatus,
            bool isMoreNewPipeReplyCommentsFetchCompleted,
            List<SponsorSegment> sponsorSegments,
            ApiStatus fetchSponsorSegmentsStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.oldId,
            _that.isTapComments,
            _that.isDescriptionTapped,
            _that.isPipEnabled,
            _that.title,
            _that.playBack,
            _that.selectedVideoBasicDetails,
            _that.watchResp,
            _that.comments,
            _that.commentReplies,
            _that.fetchWatchInfoStatus,
            _that.fetchCommentsStatus,
            _that.fetchCommentRepliesStatus,
            _that.fetchMoreCommentsStatus,
            _that.isMoreCommentsFetchCompleted,
            _that.fetchMoreCommentRepliesStatus,
            _that.isMoreReplyCommentsFetchCompleted,
            _that.explodeWatchResp,
            _that.fetchExplodeWatchInfoStatus,
            _that.fetchSubtitlesStatus,
            _that.subtitles,
            _that.liveStreamUrl,
            _that.fetchExplodeLiveStreamStatus,
            _that.relatedVideos,
            _that.fetchExplodedRelatedVideosStatus,
            _that.muxedStreams,
            _that.fetchExplodeMuxedStreamsStatus,
            _that.invidiousWatchResp,
            _that.fetchInvidiousWatchInfoStatus,
            _that.invidiousComments,
            _that.fetchInvidiousCommentsStatus,
            _that.invidiousCommentReplies,
            _that.fetchInvidiousCommentRepliesStatus,
            _that.fetchMoreInvidiousCommentsStatus,
            _that.isMoreInvidiousCommentsFetchCompleted,
            _that.fetchMoreInvidiousCommentRepliesStatus,
            _that.isMoreInvidiousReplyCommentsFetchCompleted,
            _that.newPipeWatchResp,
            _that.fetchNewPipeWatchInfoStatus,
            _that.newPipeErrorMessage,
            _that.newPipeComments,
            _that.fetchNewPipeCommentsStatus,
            _that.fetchMoreNewPipeCommentsStatus,
            _that.isMoreNewPipeCommentsFetchCompleted,
            _that.newPipeCommentReplies,
            _that.fetchNewPipeCommentRepliesStatus,
            _that.fetchMoreNewPipeCommentRepliesStatus,
            _that.isMoreNewPipeReplyCommentsFetchCompleted,
            _that.sponsorSegments,
            _that.fetchSponsorSegmentsStatus);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? oldId,
            bool isTapComments,
            bool isDescriptionTapped,
            bool isPipEnabled,
            String title,
            int playBack,
            VideoBasicInfo? selectedVideoBasicDetails,
            WatchResp watchResp,
            CommentsResp comments,
            CommentsResp commentReplies,
            ApiStatus fetchWatchInfoStatus,
            ApiStatus fetchCommentsStatus,
            ApiStatus fetchCommentRepliesStatus,
            ApiStatus fetchMoreCommentsStatus,
            bool isMoreCommentsFetchCompleted,
            ApiStatus fetchMoreCommentRepliesStatus,
            bool isMoreReplyCommentsFetchCompleted,
            ExplodeWatchResp explodeWatchResp,
            ApiStatus fetchExplodeWatchInfoStatus,
            ApiStatus fetchSubtitlesStatus,
            List<Map<String, String>> subtitles,
            String? liveStreamUrl,
            ApiStatus fetchExplodeLiveStreamStatus,
            List<MyRelatedVideo>? relatedVideos,
            ApiStatus fetchExplodedRelatedVideosStatus,
            List<MyMuxedStreamInfo>? muxedStreams,
            ApiStatus fetchExplodeMuxedStreamsStatus,
            InvidiousWatchResp invidiousWatchResp,
            ApiStatus fetchInvidiousWatchInfoStatus,
            InvidiousCommentsResp invidiousComments,
            ApiStatus fetchInvidiousCommentsStatus,
            InvidiousCommentsResp invidiousCommentReplies,
            ApiStatus fetchInvidiousCommentRepliesStatus,
            ApiStatus fetchMoreInvidiousCommentsStatus,
            bool isMoreInvidiousCommentsFetchCompleted,
            ApiStatus fetchMoreInvidiousCommentRepliesStatus,
            bool isMoreInvidiousReplyCommentsFetchCompleted,
            NewPipeWatchResp newPipeWatchResp,
            ApiStatus fetchNewPipeWatchInfoStatus,
            String? newPipeErrorMessage,
            NewPipeCommentsResp newPipeComments,
            ApiStatus fetchNewPipeCommentsStatus,
            ApiStatus fetchMoreNewPipeCommentsStatus,
            bool isMoreNewPipeCommentsFetchCompleted,
            NewPipeCommentsResp newPipeCommentReplies,
            ApiStatus fetchNewPipeCommentRepliesStatus,
            ApiStatus fetchMoreNewPipeCommentRepliesStatus,
            bool isMoreNewPipeReplyCommentsFetchCompleted,
            List<SponsorSegment> sponsorSegments,
            ApiStatus fetchSponsorSegmentsStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(
            _that.oldId,
            _that.isTapComments,
            _that.isDescriptionTapped,
            _that.isPipEnabled,
            _that.title,
            _that.playBack,
            _that.selectedVideoBasicDetails,
            _that.watchResp,
            _that.comments,
            _that.commentReplies,
            _that.fetchWatchInfoStatus,
            _that.fetchCommentsStatus,
            _that.fetchCommentRepliesStatus,
            _that.fetchMoreCommentsStatus,
            _that.isMoreCommentsFetchCompleted,
            _that.fetchMoreCommentRepliesStatus,
            _that.isMoreReplyCommentsFetchCompleted,
            _that.explodeWatchResp,
            _that.fetchExplodeWatchInfoStatus,
            _that.fetchSubtitlesStatus,
            _that.subtitles,
            _that.liveStreamUrl,
            _that.fetchExplodeLiveStreamStatus,
            _that.relatedVideos,
            _that.fetchExplodedRelatedVideosStatus,
            _that.muxedStreams,
            _that.fetchExplodeMuxedStreamsStatus,
            _that.invidiousWatchResp,
            _that.fetchInvidiousWatchInfoStatus,
            _that.invidiousComments,
            _that.fetchInvidiousCommentsStatus,
            _that.invidiousCommentReplies,
            _that.fetchInvidiousCommentRepliesStatus,
            _that.fetchMoreInvidiousCommentsStatus,
            _that.isMoreInvidiousCommentsFetchCompleted,
            _that.fetchMoreInvidiousCommentRepliesStatus,
            _that.isMoreInvidiousReplyCommentsFetchCompleted,
            _that.newPipeWatchResp,
            _that.fetchNewPipeWatchInfoStatus,
            _that.newPipeErrorMessage,
            _that.newPipeComments,
            _that.fetchNewPipeCommentsStatus,
            _that.fetchMoreNewPipeCommentsStatus,
            _that.isMoreNewPipeCommentsFetchCompleted,
            _that.newPipeCommentReplies,
            _that.fetchNewPipeCommentRepliesStatus,
            _that.fetchMoreNewPipeCommentRepliesStatus,
            _that.isMoreNewPipeReplyCommentsFetchCompleted,
            _that.sponsorSegments,
            _that.fetchSponsorSegmentsStatus);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? oldId,
            bool isTapComments,
            bool isDescriptionTapped,
            bool isPipEnabled,
            String title,
            int playBack,
            VideoBasicInfo? selectedVideoBasicDetails,
            WatchResp watchResp,
            CommentsResp comments,
            CommentsResp commentReplies,
            ApiStatus fetchWatchInfoStatus,
            ApiStatus fetchCommentsStatus,
            ApiStatus fetchCommentRepliesStatus,
            ApiStatus fetchMoreCommentsStatus,
            bool isMoreCommentsFetchCompleted,
            ApiStatus fetchMoreCommentRepliesStatus,
            bool isMoreReplyCommentsFetchCompleted,
            ExplodeWatchResp explodeWatchResp,
            ApiStatus fetchExplodeWatchInfoStatus,
            ApiStatus fetchSubtitlesStatus,
            List<Map<String, String>> subtitles,
            String? liveStreamUrl,
            ApiStatus fetchExplodeLiveStreamStatus,
            List<MyRelatedVideo>? relatedVideos,
            ApiStatus fetchExplodedRelatedVideosStatus,
            List<MyMuxedStreamInfo>? muxedStreams,
            ApiStatus fetchExplodeMuxedStreamsStatus,
            InvidiousWatchResp invidiousWatchResp,
            ApiStatus fetchInvidiousWatchInfoStatus,
            InvidiousCommentsResp invidiousComments,
            ApiStatus fetchInvidiousCommentsStatus,
            InvidiousCommentsResp invidiousCommentReplies,
            ApiStatus fetchInvidiousCommentRepliesStatus,
            ApiStatus fetchMoreInvidiousCommentsStatus,
            bool isMoreInvidiousCommentsFetchCompleted,
            ApiStatus fetchMoreInvidiousCommentRepliesStatus,
            bool isMoreInvidiousReplyCommentsFetchCompleted,
            NewPipeWatchResp newPipeWatchResp,
            ApiStatus fetchNewPipeWatchInfoStatus,
            String? newPipeErrorMessage,
            NewPipeCommentsResp newPipeComments,
            ApiStatus fetchNewPipeCommentsStatus,
            ApiStatus fetchMoreNewPipeCommentsStatus,
            bool isMoreNewPipeCommentsFetchCompleted,
            NewPipeCommentsResp newPipeCommentReplies,
            ApiStatus fetchNewPipeCommentRepliesStatus,
            ApiStatus fetchMoreNewPipeCommentRepliesStatus,
            bool isMoreNewPipeReplyCommentsFetchCompleted,
            List<SponsorSegment> sponsorSegments,
            ApiStatus fetchSponsorSegmentsStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.oldId,
            _that.isTapComments,
            _that.isDescriptionTapped,
            _that.isPipEnabled,
            _that.title,
            _that.playBack,
            _that.selectedVideoBasicDetails,
            _that.watchResp,
            _that.comments,
            _that.commentReplies,
            _that.fetchWatchInfoStatus,
            _that.fetchCommentsStatus,
            _that.fetchCommentRepliesStatus,
            _that.fetchMoreCommentsStatus,
            _that.isMoreCommentsFetchCompleted,
            _that.fetchMoreCommentRepliesStatus,
            _that.isMoreReplyCommentsFetchCompleted,
            _that.explodeWatchResp,
            _that.fetchExplodeWatchInfoStatus,
            _that.fetchSubtitlesStatus,
            _that.subtitles,
            _that.liveStreamUrl,
            _that.fetchExplodeLiveStreamStatus,
            _that.relatedVideos,
            _that.fetchExplodedRelatedVideosStatus,
            _that.muxedStreams,
            _that.fetchExplodeMuxedStreamsStatus,
            _that.invidiousWatchResp,
            _that.fetchInvidiousWatchInfoStatus,
            _that.invidiousComments,
            _that.fetchInvidiousCommentsStatus,
            _that.invidiousCommentReplies,
            _that.fetchInvidiousCommentRepliesStatus,
            _that.fetchMoreInvidiousCommentsStatus,
            _that.isMoreInvidiousCommentsFetchCompleted,
            _that.fetchMoreInvidiousCommentRepliesStatus,
            _that.isMoreInvidiousReplyCommentsFetchCompleted,
            _that.newPipeWatchResp,
            _that.fetchNewPipeWatchInfoStatus,
            _that.newPipeErrorMessage,
            _that.newPipeComments,
            _that.fetchNewPipeCommentsStatus,
            _that.fetchMoreNewPipeCommentsStatus,
            _that.isMoreNewPipeCommentsFetchCompleted,
            _that.newPipeCommentReplies,
            _that.fetchNewPipeCommentRepliesStatus,
            _that.fetchMoreNewPipeCommentRepliesStatus,
            _that.isMoreNewPipeReplyCommentsFetchCompleted,
            _that.sponsorSegments,
            _that.fetchSponsorSegmentsStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements WatchState {
  const _Initial(
      {this.oldId,
      required this.isTapComments,
      required this.isDescriptionTapped,
      required this.isPipEnabled,
      required this.title,
      required this.playBack,
      this.selectedVideoBasicDetails,
      required this.watchResp,
      required this.comments,
      required this.commentReplies,
      required this.fetchWatchInfoStatus,
      required this.fetchCommentsStatus,
      required this.fetchCommentRepliesStatus,
      required this.fetchMoreCommentsStatus,
      required this.isMoreCommentsFetchCompleted,
      required this.fetchMoreCommentRepliesStatus,
      required this.isMoreReplyCommentsFetchCompleted,
      required this.explodeWatchResp,
      required this.fetchExplodeWatchInfoStatus,
      required this.fetchSubtitlesStatus,
      required final List<Map<String, String>> subtitles,
      this.liveStreamUrl,
      required this.fetchExplodeLiveStreamStatus,
      final List<MyRelatedVideo>? relatedVideos,
      required this.fetchExplodedRelatedVideosStatus,
      final List<MyMuxedStreamInfo>? muxedStreams,
      required this.fetchExplodeMuxedStreamsStatus,
      required this.invidiousWatchResp,
      required this.fetchInvidiousWatchInfoStatus,
      required this.invidiousComments,
      required this.fetchInvidiousCommentsStatus,
      required this.invidiousCommentReplies,
      required this.fetchInvidiousCommentRepliesStatus,
      required this.fetchMoreInvidiousCommentsStatus,
      required this.isMoreInvidiousCommentsFetchCompleted,
      required this.fetchMoreInvidiousCommentRepliesStatus,
      required this.isMoreInvidiousReplyCommentsFetchCompleted,
      required this.newPipeWatchResp,
      required this.fetchNewPipeWatchInfoStatus,
      this.newPipeErrorMessage,
      required this.newPipeComments,
      required this.fetchNewPipeCommentsStatus,
      required this.fetchMoreNewPipeCommentsStatus,
      required this.isMoreNewPipeCommentsFetchCompleted,
      required this.newPipeCommentReplies,
      required this.fetchNewPipeCommentRepliesStatus,
      required this.fetchMoreNewPipeCommentRepliesStatus,
      required this.isMoreNewPipeReplyCommentsFetchCompleted,
      required final List<SponsorSegment> sponsorSegments,
      required this.fetchSponsorSegmentsStatus})
      : _subtitles = subtitles,
        _relatedVideos = relatedVideos,
        _muxedStreams = muxedStreams,
        _sponsorSegments = sponsorSegments;

//
  @override
  final String? oldId;
  @override
  final bool isTapComments;
  @override
  final bool isDescriptionTapped;
  @override
  final bool isPipEnabled;
  @override
  final String title;
  @override
  final int playBack;
  @override
  final VideoBasicInfo? selectedVideoBasicDetails;
// PIPED
  @override
  final WatchResp watchResp;
  @override
  final CommentsResp comments;
  @override
  final CommentsResp commentReplies;
  @override
  final ApiStatus fetchWatchInfoStatus;
  @override
  final ApiStatus fetchCommentsStatus;
  @override
  final ApiStatus fetchCommentRepliesStatus;
  @override
  final ApiStatus fetchMoreCommentsStatus;
  @override
  final bool isMoreCommentsFetchCompleted;
  @override
  final ApiStatus fetchMoreCommentRepliesStatus;
  @override
  final bool isMoreReplyCommentsFetchCompleted;
//EXPLODE
  @override
  final ExplodeWatchResp explodeWatchResp;
  @override
  final ApiStatus fetchExplodeWatchInfoStatus;
  @override
  final ApiStatus fetchSubtitlesStatus;
  final List<Map<String, String>> _subtitles;
  @override
  List<Map<String, String>> get subtitles {
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitles);
  }

  @override
  final String? liveStreamUrl;
  @override
  final ApiStatus fetchExplodeLiveStreamStatus;
  final List<MyRelatedVideo>? _relatedVideos;
  @override
  List<MyRelatedVideo>? get relatedVideos {
    final value = _relatedVideos;
    if (value == null) return null;
    if (_relatedVideos is EqualUnmodifiableListView) return _relatedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ApiStatus fetchExplodedRelatedVideosStatus;
  final List<MyMuxedStreamInfo>? _muxedStreams;
  @override
  List<MyMuxedStreamInfo>? get muxedStreams {
    final value = _muxedStreams;
    if (value == null) return null;
    if (_muxedStreams is EqualUnmodifiableListView) return _muxedStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ApiStatus fetchExplodeMuxedStreamsStatus;
// INVIDIOUS
  @override
  final InvidiousWatchResp invidiousWatchResp;
  @override
  final ApiStatus fetchInvidiousWatchInfoStatus;
  @override
  final InvidiousCommentsResp invidiousComments;
  @override
  final ApiStatus fetchInvidiousCommentsStatus;
  @override
  final InvidiousCommentsResp invidiousCommentReplies;
  @override
  final ApiStatus fetchInvidiousCommentRepliesStatus;
  @override
  final ApiStatus fetchMoreInvidiousCommentsStatus;
  @override
  final bool isMoreInvidiousCommentsFetchCompleted;
  @override
  final ApiStatus fetchMoreInvidiousCommentRepliesStatus;
  @override
  final bool isMoreInvidiousReplyCommentsFetchCompleted;
// NEWPIPE
  @override
  final NewPipeWatchResp newPipeWatchResp;
  @override
  final ApiStatus fetchNewPipeWatchInfoStatus;
  @override
  final String? newPipeErrorMessage;
  @override
  final NewPipeCommentsResp newPipeComments;
  @override
  final ApiStatus fetchNewPipeCommentsStatus;
  @override
  final ApiStatus fetchMoreNewPipeCommentsStatus;
  @override
  final bool isMoreNewPipeCommentsFetchCompleted;
  @override
  final NewPipeCommentsResp newPipeCommentReplies;
  @override
  final ApiStatus fetchNewPipeCommentRepliesStatus;
  @override
  final ApiStatus fetchMoreNewPipeCommentRepliesStatus;
  @override
  final bool isMoreNewPipeReplyCommentsFetchCompleted;
// SPONSORBLOCK
  final List<SponsorSegment> _sponsorSegments;
// SPONSORBLOCK
  @override
  List<SponsorSegment> get sponsorSegments {
    if (_sponsorSegments is EqualUnmodifiableListView) return _sponsorSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorSegments);
  }

  @override
  final ApiStatus fetchSponsorSegmentsStatus;

  /// Create a copy of WatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'WatchState'))
      ..add(DiagnosticsProperty('oldId', oldId))
      ..add(DiagnosticsProperty('isTapComments', isTapComments))
      ..add(DiagnosticsProperty('isDescriptionTapped', isDescriptionTapped))
      ..add(DiagnosticsProperty('isPipEnabled', isPipEnabled))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('playBack', playBack))
      ..add(DiagnosticsProperty(
          'selectedVideoBasicDetails', selectedVideoBasicDetails))
      ..add(DiagnosticsProperty('watchResp', watchResp))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('commentReplies', commentReplies))
      ..add(DiagnosticsProperty('fetchWatchInfoStatus', fetchWatchInfoStatus))
      ..add(DiagnosticsProperty('fetchCommentsStatus', fetchCommentsStatus))
      ..add(DiagnosticsProperty(
          'fetchCommentRepliesStatus', fetchCommentRepliesStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreCommentsStatus', fetchMoreCommentsStatus))
      ..add(DiagnosticsProperty(
          'isMoreCommentsFetchCompleted', isMoreCommentsFetchCompleted))
      ..add(DiagnosticsProperty(
          'fetchMoreCommentRepliesStatus', fetchMoreCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreReplyCommentsFetchCompleted',
          isMoreReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('explodeWatchResp', explodeWatchResp))
      ..add(DiagnosticsProperty(
          'fetchExplodeWatchInfoStatus', fetchExplodeWatchInfoStatus))
      ..add(DiagnosticsProperty('fetchSubtitlesStatus', fetchSubtitlesStatus))
      ..add(DiagnosticsProperty('subtitles', subtitles))
      ..add(DiagnosticsProperty('liveStreamUrl', liveStreamUrl))
      ..add(DiagnosticsProperty(
          'fetchExplodeLiveStreamStatus', fetchExplodeLiveStreamStatus))
      ..add(DiagnosticsProperty('relatedVideos', relatedVideos))
      ..add(DiagnosticsProperty(
          'fetchExplodedRelatedVideosStatus', fetchExplodedRelatedVideosStatus))
      ..add(DiagnosticsProperty('muxedStreams', muxedStreams))
      ..add(DiagnosticsProperty(
          'fetchExplodeMuxedStreamsStatus', fetchExplodeMuxedStreamsStatus))
      ..add(DiagnosticsProperty('invidiousWatchResp', invidiousWatchResp))
      ..add(DiagnosticsProperty(
          'fetchInvidiousWatchInfoStatus', fetchInvidiousWatchInfoStatus))
      ..add(DiagnosticsProperty('invidiousComments', invidiousComments))
      ..add(DiagnosticsProperty(
          'fetchInvidiousCommentsStatus', fetchInvidiousCommentsStatus))
      ..add(DiagnosticsProperty(
          'invidiousCommentReplies', invidiousCommentReplies))
      ..add(DiagnosticsProperty('fetchInvidiousCommentRepliesStatus',
          fetchInvidiousCommentRepliesStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreInvidiousCommentsStatus', fetchMoreInvidiousCommentsStatus))
      ..add(DiagnosticsProperty('isMoreInvidiousCommentsFetchCompleted',
          isMoreInvidiousCommentsFetchCompleted))
      ..add(DiagnosticsProperty('fetchMoreInvidiousCommentRepliesStatus',
          fetchMoreInvidiousCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreInvidiousReplyCommentsFetchCompleted',
          isMoreInvidiousReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('newPipeWatchResp', newPipeWatchResp))
      ..add(DiagnosticsProperty(
          'fetchNewPipeWatchInfoStatus', fetchNewPipeWatchInfoStatus))
      ..add(DiagnosticsProperty('newPipeErrorMessage', newPipeErrorMessage))
      ..add(DiagnosticsProperty('newPipeComments', newPipeComments))
      ..add(DiagnosticsProperty(
          'fetchNewPipeCommentsStatus', fetchNewPipeCommentsStatus))
      ..add(DiagnosticsProperty(
          'fetchMoreNewPipeCommentsStatus', fetchMoreNewPipeCommentsStatus))
      ..add(DiagnosticsProperty('isMoreNewPipeCommentsFetchCompleted',
          isMoreNewPipeCommentsFetchCompleted))
      ..add(DiagnosticsProperty('newPipeCommentReplies', newPipeCommentReplies))
      ..add(DiagnosticsProperty(
          'fetchNewPipeCommentRepliesStatus', fetchNewPipeCommentRepliesStatus))
      ..add(DiagnosticsProperty('fetchMoreNewPipeCommentRepliesStatus',
          fetchMoreNewPipeCommentRepliesStatus))
      ..add(DiagnosticsProperty('isMoreNewPipeReplyCommentsFetchCompleted',
          isMoreNewPipeReplyCommentsFetchCompleted))
      ..add(DiagnosticsProperty('sponsorSegments', sponsorSegments))
      ..add(DiagnosticsProperty(
          'fetchSponsorSegmentsStatus', fetchSponsorSegmentsStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.oldId, oldId) || other.oldId == oldId) &&
            (identical(other.isTapComments, isTapComments) ||
                other.isTapComments == isTapComments) &&
            (identical(other.isDescriptionTapped, isDescriptionTapped) ||
                other.isDescriptionTapped == isDescriptionTapped) &&
            (identical(other.isPipEnabled, isPipEnabled) ||
                other.isPipEnabled == isPipEnabled) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playBack, playBack) ||
                other.playBack == playBack) &&
            (identical(other.selectedVideoBasicDetails, selectedVideoBasicDetails) ||
                other.selectedVideoBasicDetails == selectedVideoBasicDetails) &&
            (identical(other.watchResp, watchResp) ||
                other.watchResp == watchResp) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.commentReplies, commentReplies) ||
                other.commentReplies == commentReplies) &&
            (identical(other.fetchWatchInfoStatus, fetchWatchInfoStatus) ||
                other.fetchWatchInfoStatus == fetchWatchInfoStatus) &&
            (identical(other.fetchCommentsStatus, fetchCommentsStatus) ||
                other.fetchCommentsStatus == fetchCommentsStatus) &&
            (identical(other.fetchCommentRepliesStatus, fetchCommentRepliesStatus) ||
                other.fetchCommentRepliesStatus == fetchCommentRepliesStatus) &&
            (identical(other.fetchMoreCommentsStatus, fetchMoreCommentsStatus) ||
                other.fetchMoreCommentsStatus == fetchMoreCommentsStatus) &&
            (identical(other.isMoreCommentsFetchCompleted, isMoreCommentsFetchCompleted) ||
                other.isMoreCommentsFetchCompleted ==
                    isMoreCommentsFetchCompleted) &&
            (identical(other.fetchMoreCommentRepliesStatus, fetchMoreCommentRepliesStatus) ||
                other.fetchMoreCommentRepliesStatus ==
                    fetchMoreCommentRepliesStatus) &&
            (identical(other.isMoreReplyCommentsFetchCompleted, isMoreReplyCommentsFetchCompleted) ||
                other.isMoreReplyCommentsFetchCompleted ==
                    isMoreReplyCommentsFetchCompleted) &&
            (identical(other.explodeWatchResp, explodeWatchResp) ||
                other.explodeWatchResp == explodeWatchResp) &&
            (identical(other.fetchExplodeWatchInfoStatus, fetchExplodeWatchInfoStatus) ||
                other.fetchExplodeWatchInfoStatus ==
                    fetchExplodeWatchInfoStatus) &&
            (identical(other.fetchSubtitlesStatus, fetchSubtitlesStatus) ||
                other.fetchSubtitlesStatus == fetchSubtitlesStatus) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles) &&
            (identical(other.liveStreamUrl, liveStreamUrl) ||
                other.liveStreamUrl == liveStreamUrl) &&
            (identical(other.fetchExplodeLiveStreamStatus, fetchExplodeLiveStreamStatus) ||
                other.fetchExplodeLiveStreamStatus ==
                    fetchExplodeLiveStreamStatus) &&
            const DeepCollectionEquality()
                .equals(other._relatedVideos, _relatedVideos) &&
            (identical(other.fetchExplodedRelatedVideosStatus, fetchExplodedRelatedVideosStatus) || other.fetchExplodedRelatedVideosStatus == fetchExplodedRelatedVideosStatus) &&
            const DeepCollectionEquality().equals(other._muxedStreams, _muxedStreams) &&
            (identical(other.fetchExplodeMuxedStreamsStatus, fetchExplodeMuxedStreamsStatus) || other.fetchExplodeMuxedStreamsStatus == fetchExplodeMuxedStreamsStatus) &&
            (identical(other.invidiousWatchResp, invidiousWatchResp) || other.invidiousWatchResp == invidiousWatchResp) &&
            (identical(other.fetchInvidiousWatchInfoStatus, fetchInvidiousWatchInfoStatus) || other.fetchInvidiousWatchInfoStatus == fetchInvidiousWatchInfoStatus) &&
            (identical(other.invidiousComments, invidiousComments) || other.invidiousComments == invidiousComments) &&
            (identical(other.fetchInvidiousCommentsStatus, fetchInvidiousCommentsStatus) || other.fetchInvidiousCommentsStatus == fetchInvidiousCommentsStatus) &&
            (identical(other.invidiousCommentReplies, invidiousCommentReplies) || other.invidiousCommentReplies == invidiousCommentReplies) &&
            (identical(other.fetchInvidiousCommentRepliesStatus, fetchInvidiousCommentRepliesStatus) || other.fetchInvidiousCommentRepliesStatus == fetchInvidiousCommentRepliesStatus) &&
            (identical(other.fetchMoreInvidiousCommentsStatus, fetchMoreInvidiousCommentsStatus) || other.fetchMoreInvidiousCommentsStatus == fetchMoreInvidiousCommentsStatus) &&
            (identical(other.isMoreInvidiousCommentsFetchCompleted, isMoreInvidiousCommentsFetchCompleted) || other.isMoreInvidiousCommentsFetchCompleted == isMoreInvidiousCommentsFetchCompleted) &&
            (identical(other.fetchMoreInvidiousCommentRepliesStatus, fetchMoreInvidiousCommentRepliesStatus) || other.fetchMoreInvidiousCommentRepliesStatus == fetchMoreInvidiousCommentRepliesStatus) &&
            (identical(other.isMoreInvidiousReplyCommentsFetchCompleted, isMoreInvidiousReplyCommentsFetchCompleted) || other.isMoreInvidiousReplyCommentsFetchCompleted == isMoreInvidiousReplyCommentsFetchCompleted) &&
            (identical(other.newPipeWatchResp, newPipeWatchResp) || other.newPipeWatchResp == newPipeWatchResp) &&
            (identical(other.fetchNewPipeWatchInfoStatus, fetchNewPipeWatchInfoStatus) || other.fetchNewPipeWatchInfoStatus == fetchNewPipeWatchInfoStatus) &&
            (identical(other.newPipeErrorMessage, newPipeErrorMessage) || other.newPipeErrorMessage == newPipeErrorMessage) &&
            (identical(other.newPipeComments, newPipeComments) || other.newPipeComments == newPipeComments) &&
            (identical(other.fetchNewPipeCommentsStatus, fetchNewPipeCommentsStatus) || other.fetchNewPipeCommentsStatus == fetchNewPipeCommentsStatus) &&
            (identical(other.fetchMoreNewPipeCommentsStatus, fetchMoreNewPipeCommentsStatus) || other.fetchMoreNewPipeCommentsStatus == fetchMoreNewPipeCommentsStatus) &&
            (identical(other.isMoreNewPipeCommentsFetchCompleted, isMoreNewPipeCommentsFetchCompleted) || other.isMoreNewPipeCommentsFetchCompleted == isMoreNewPipeCommentsFetchCompleted) &&
            (identical(other.newPipeCommentReplies, newPipeCommentReplies) || other.newPipeCommentReplies == newPipeCommentReplies) &&
            (identical(other.fetchNewPipeCommentRepliesStatus, fetchNewPipeCommentRepliesStatus) || other.fetchNewPipeCommentRepliesStatus == fetchNewPipeCommentRepliesStatus) &&
            (identical(other.fetchMoreNewPipeCommentRepliesStatus, fetchMoreNewPipeCommentRepliesStatus) || other.fetchMoreNewPipeCommentRepliesStatus == fetchMoreNewPipeCommentRepliesStatus) &&
            (identical(other.isMoreNewPipeReplyCommentsFetchCompleted, isMoreNewPipeReplyCommentsFetchCompleted) || other.isMoreNewPipeReplyCommentsFetchCompleted == isMoreNewPipeReplyCommentsFetchCompleted) &&
            const DeepCollectionEquality().equals(other._sponsorSegments, _sponsorSegments) &&
            (identical(other.fetchSponsorSegmentsStatus, fetchSponsorSegmentsStatus) || other.fetchSponsorSegmentsStatus == fetchSponsorSegmentsStatus));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        oldId,
        isTapComments,
        isDescriptionTapped,
        isPipEnabled,
        title,
        playBack,
        selectedVideoBasicDetails,
        watchResp,
        comments,
        commentReplies,
        fetchWatchInfoStatus,
        fetchCommentsStatus,
        fetchCommentRepliesStatus,
        fetchMoreCommentsStatus,
        isMoreCommentsFetchCompleted,
        fetchMoreCommentRepliesStatus,
        isMoreReplyCommentsFetchCompleted,
        explodeWatchResp,
        fetchExplodeWatchInfoStatus,
        fetchSubtitlesStatus,
        const DeepCollectionEquality().hash(_subtitles),
        liveStreamUrl,
        fetchExplodeLiveStreamStatus,
        const DeepCollectionEquality().hash(_relatedVideos),
        fetchExplodedRelatedVideosStatus,
        const DeepCollectionEquality().hash(_muxedStreams),
        fetchExplodeMuxedStreamsStatus,
        invidiousWatchResp,
        fetchInvidiousWatchInfoStatus,
        invidiousComments,
        fetchInvidiousCommentsStatus,
        invidiousCommentReplies,
        fetchInvidiousCommentRepliesStatus,
        fetchMoreInvidiousCommentsStatus,
        isMoreInvidiousCommentsFetchCompleted,
        fetchMoreInvidiousCommentRepliesStatus,
        isMoreInvidiousReplyCommentsFetchCompleted,
        newPipeWatchResp,
        fetchNewPipeWatchInfoStatus,
        newPipeErrorMessage,
        newPipeComments,
        fetchNewPipeCommentsStatus,
        fetchMoreNewPipeCommentsStatus,
        isMoreNewPipeCommentsFetchCompleted,
        newPipeCommentReplies,
        fetchNewPipeCommentRepliesStatus,
        fetchMoreNewPipeCommentRepliesStatus,
        isMoreNewPipeReplyCommentsFetchCompleted,
        const DeepCollectionEquality().hash(_sponsorSegments),
        fetchSponsorSegmentsStatus
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WatchState(oldId: $oldId, isTapComments: $isTapComments, isDescriptionTapped: $isDescriptionTapped, isPipEnabled: $isPipEnabled, title: $title, playBack: $playBack, selectedVideoBasicDetails: $selectedVideoBasicDetails, watchResp: $watchResp, comments: $comments, commentReplies: $commentReplies, fetchWatchInfoStatus: $fetchWatchInfoStatus, fetchCommentsStatus: $fetchCommentsStatus, fetchCommentRepliesStatus: $fetchCommentRepliesStatus, fetchMoreCommentsStatus: $fetchMoreCommentsStatus, isMoreCommentsFetchCompleted: $isMoreCommentsFetchCompleted, fetchMoreCommentRepliesStatus: $fetchMoreCommentRepliesStatus, isMoreReplyCommentsFetchCompleted: $isMoreReplyCommentsFetchCompleted, explodeWatchResp: $explodeWatchResp, fetchExplodeWatchInfoStatus: $fetchExplodeWatchInfoStatus, fetchSubtitlesStatus: $fetchSubtitlesStatus, subtitles: $subtitles, liveStreamUrl: $liveStreamUrl, fetchExplodeLiveStreamStatus: $fetchExplodeLiveStreamStatus, relatedVideos: $relatedVideos, fetchExplodedRelatedVideosStatus: $fetchExplodedRelatedVideosStatus, muxedStreams: $muxedStreams, fetchExplodeMuxedStreamsStatus: $fetchExplodeMuxedStreamsStatus, invidiousWatchResp: $invidiousWatchResp, fetchInvidiousWatchInfoStatus: $fetchInvidiousWatchInfoStatus, invidiousComments: $invidiousComments, fetchInvidiousCommentsStatus: $fetchInvidiousCommentsStatus, invidiousCommentReplies: $invidiousCommentReplies, fetchInvidiousCommentRepliesStatus: $fetchInvidiousCommentRepliesStatus, fetchMoreInvidiousCommentsStatus: $fetchMoreInvidiousCommentsStatus, isMoreInvidiousCommentsFetchCompleted: $isMoreInvidiousCommentsFetchCompleted, fetchMoreInvidiousCommentRepliesStatus: $fetchMoreInvidiousCommentRepliesStatus, isMoreInvidiousReplyCommentsFetchCompleted: $isMoreInvidiousReplyCommentsFetchCompleted, newPipeWatchResp: $newPipeWatchResp, fetchNewPipeWatchInfoStatus: $fetchNewPipeWatchInfoStatus, newPipeErrorMessage: $newPipeErrorMessage, newPipeComments: $newPipeComments, fetchNewPipeCommentsStatus: $fetchNewPipeCommentsStatus, fetchMoreNewPipeCommentsStatus: $fetchMoreNewPipeCommentsStatus, isMoreNewPipeCommentsFetchCompleted: $isMoreNewPipeCommentsFetchCompleted, newPipeCommentReplies: $newPipeCommentReplies, fetchNewPipeCommentRepliesStatus: $fetchNewPipeCommentRepliesStatus, fetchMoreNewPipeCommentRepliesStatus: $fetchMoreNewPipeCommentRepliesStatus, isMoreNewPipeReplyCommentsFetchCompleted: $isMoreNewPipeReplyCommentsFetchCompleted, sponsorSegments: $sponsorSegments, fetchSponsorSegmentsStatus: $fetchSponsorSegmentsStatus)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $WatchStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? oldId,
      bool isTapComments,
      bool isDescriptionTapped,
      bool isPipEnabled,
      String title,
      int playBack,
      VideoBasicInfo? selectedVideoBasicDetails,
      WatchResp watchResp,
      CommentsResp comments,
      CommentsResp commentReplies,
      ApiStatus fetchWatchInfoStatus,
      ApiStatus fetchCommentsStatus,
      ApiStatus fetchCommentRepliesStatus,
      ApiStatus fetchMoreCommentsStatus,
      bool isMoreCommentsFetchCompleted,
      ApiStatus fetchMoreCommentRepliesStatus,
      bool isMoreReplyCommentsFetchCompleted,
      ExplodeWatchResp explodeWatchResp,
      ApiStatus fetchExplodeWatchInfoStatus,
      ApiStatus fetchSubtitlesStatus,
      List<Map<String, String>> subtitles,
      String? liveStreamUrl,
      ApiStatus fetchExplodeLiveStreamStatus,
      List<MyRelatedVideo>? relatedVideos,
      ApiStatus fetchExplodedRelatedVideosStatus,
      List<MyMuxedStreamInfo>? muxedStreams,
      ApiStatus fetchExplodeMuxedStreamsStatus,
      InvidiousWatchResp invidiousWatchResp,
      ApiStatus fetchInvidiousWatchInfoStatus,
      InvidiousCommentsResp invidiousComments,
      ApiStatus fetchInvidiousCommentsStatus,
      InvidiousCommentsResp invidiousCommentReplies,
      ApiStatus fetchInvidiousCommentRepliesStatus,
      ApiStatus fetchMoreInvidiousCommentsStatus,
      bool isMoreInvidiousCommentsFetchCompleted,
      ApiStatus fetchMoreInvidiousCommentRepliesStatus,
      bool isMoreInvidiousReplyCommentsFetchCompleted,
      NewPipeWatchResp newPipeWatchResp,
      ApiStatus fetchNewPipeWatchInfoStatus,
      String? newPipeErrorMessage,
      NewPipeCommentsResp newPipeComments,
      ApiStatus fetchNewPipeCommentsStatus,
      ApiStatus fetchMoreNewPipeCommentsStatus,
      bool isMoreNewPipeCommentsFetchCompleted,
      NewPipeCommentsResp newPipeCommentReplies,
      ApiStatus fetchNewPipeCommentRepliesStatus,
      ApiStatus fetchMoreNewPipeCommentRepliesStatus,
      bool isMoreNewPipeReplyCommentsFetchCompleted,
      List<SponsorSegment> sponsorSegments,
      ApiStatus fetchSponsorSegmentsStatus});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of WatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldId = freezed,
    Object? isTapComments = null,
    Object? isDescriptionTapped = null,
    Object? isPipEnabled = null,
    Object? title = null,
    Object? playBack = null,
    Object? selectedVideoBasicDetails = freezed,
    Object? watchResp = null,
    Object? comments = null,
    Object? commentReplies = null,
    Object? fetchWatchInfoStatus = null,
    Object? fetchCommentsStatus = null,
    Object? fetchCommentRepliesStatus = null,
    Object? fetchMoreCommentsStatus = null,
    Object? isMoreCommentsFetchCompleted = null,
    Object? fetchMoreCommentRepliesStatus = null,
    Object? isMoreReplyCommentsFetchCompleted = null,
    Object? explodeWatchResp = null,
    Object? fetchExplodeWatchInfoStatus = null,
    Object? fetchSubtitlesStatus = null,
    Object? subtitles = null,
    Object? liveStreamUrl = freezed,
    Object? fetchExplodeLiveStreamStatus = null,
    Object? relatedVideos = freezed,
    Object? fetchExplodedRelatedVideosStatus = null,
    Object? muxedStreams = freezed,
    Object? fetchExplodeMuxedStreamsStatus = null,
    Object? invidiousWatchResp = null,
    Object? fetchInvidiousWatchInfoStatus = null,
    Object? invidiousComments = null,
    Object? fetchInvidiousCommentsStatus = null,
    Object? invidiousCommentReplies = null,
    Object? fetchInvidiousCommentRepliesStatus = null,
    Object? fetchMoreInvidiousCommentsStatus = null,
    Object? isMoreInvidiousCommentsFetchCompleted = null,
    Object? fetchMoreInvidiousCommentRepliesStatus = null,
    Object? isMoreInvidiousReplyCommentsFetchCompleted = null,
    Object? newPipeWatchResp = null,
    Object? fetchNewPipeWatchInfoStatus = null,
    Object? newPipeErrorMessage = freezed,
    Object? newPipeComments = null,
    Object? fetchNewPipeCommentsStatus = null,
    Object? fetchMoreNewPipeCommentsStatus = null,
    Object? isMoreNewPipeCommentsFetchCompleted = null,
    Object? newPipeCommentReplies = null,
    Object? fetchNewPipeCommentRepliesStatus = null,
    Object? fetchMoreNewPipeCommentRepliesStatus = null,
    Object? isMoreNewPipeReplyCommentsFetchCompleted = null,
    Object? sponsorSegments = null,
    Object? fetchSponsorSegmentsStatus = null,
  }) {
    return _then(_Initial(
      oldId: freezed == oldId
          ? _self.oldId
          : oldId // ignore: cast_nullable_to_non_nullable
              as String?,
      isTapComments: null == isTapComments
          ? _self.isTapComments
          : isTapComments // ignore: cast_nullable_to_non_nullable
              as bool,
      isDescriptionTapped: null == isDescriptionTapped
          ? _self.isDescriptionTapped
          : isDescriptionTapped // ignore: cast_nullable_to_non_nullable
              as bool,
      isPipEnabled: null == isPipEnabled
          ? _self.isPipEnabled
          : isPipEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playBack: null == playBack
          ? _self.playBack
          : playBack // ignore: cast_nullable_to_non_nullable
              as int,
      selectedVideoBasicDetails: freezed == selectedVideoBasicDetails
          ? _self.selectedVideoBasicDetails
          : selectedVideoBasicDetails // ignore: cast_nullable_to_non_nullable
              as VideoBasicInfo?,
      watchResp: null == watchResp
          ? _self.watchResp
          : watchResp // ignore: cast_nullable_to_non_nullable
              as WatchResp,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsResp,
      commentReplies: null == commentReplies
          ? _self.commentReplies
          : commentReplies // ignore: cast_nullable_to_non_nullable
              as CommentsResp,
      fetchWatchInfoStatus: null == fetchWatchInfoStatus
          ? _self.fetchWatchInfoStatus
          : fetchWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchCommentsStatus: null == fetchCommentsStatus
          ? _self.fetchCommentsStatus
          : fetchCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchCommentRepliesStatus: null == fetchCommentRepliesStatus
          ? _self.fetchCommentRepliesStatus
          : fetchCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreCommentsStatus: null == fetchMoreCommentsStatus
          ? _self.fetchMoreCommentsStatus
          : fetchMoreCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreCommentsFetchCompleted: null == isMoreCommentsFetchCompleted
          ? _self.isMoreCommentsFetchCompleted
          : isMoreCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchMoreCommentRepliesStatus: null == fetchMoreCommentRepliesStatus
          ? _self.fetchMoreCommentRepliesStatus
          : fetchMoreCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreReplyCommentsFetchCompleted: null ==
              isMoreReplyCommentsFetchCompleted
          ? _self.isMoreReplyCommentsFetchCompleted
          : isMoreReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      explodeWatchResp: null == explodeWatchResp
          ? _self.explodeWatchResp
          : explodeWatchResp // ignore: cast_nullable_to_non_nullable
              as ExplodeWatchResp,
      fetchExplodeWatchInfoStatus: null == fetchExplodeWatchInfoStatus
          ? _self.fetchExplodeWatchInfoStatus
          : fetchExplodeWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchSubtitlesStatus: null == fetchSubtitlesStatus
          ? _self.fetchSubtitlesStatus
          : fetchSubtitlesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      subtitles: null == subtitles
          ? _self._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      liveStreamUrl: freezed == liveStreamUrl
          ? _self.liveStreamUrl
          : liveStreamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchExplodeLiveStreamStatus: null == fetchExplodeLiveStreamStatus
          ? _self.fetchExplodeLiveStreamStatus
          : fetchExplodeLiveStreamStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      relatedVideos: freezed == relatedVideos
          ? _self._relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<MyRelatedVideo>?,
      fetchExplodedRelatedVideosStatus: null == fetchExplodedRelatedVideosStatus
          ? _self.fetchExplodedRelatedVideosStatus
          : fetchExplodedRelatedVideosStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      muxedStreams: freezed == muxedStreams
          ? _self._muxedStreams
          : muxedStreams // ignore: cast_nullable_to_non_nullable
              as List<MyMuxedStreamInfo>?,
      fetchExplodeMuxedStreamsStatus: null == fetchExplodeMuxedStreamsStatus
          ? _self.fetchExplodeMuxedStreamsStatus
          : fetchExplodeMuxedStreamsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousWatchResp: null == invidiousWatchResp
          ? _self.invidiousWatchResp
          : invidiousWatchResp // ignore: cast_nullable_to_non_nullable
              as InvidiousWatchResp,
      fetchInvidiousWatchInfoStatus: null == fetchInvidiousWatchInfoStatus
          ? _self.fetchInvidiousWatchInfoStatus
          : fetchInvidiousWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousComments: null == invidiousComments
          ? _self.invidiousComments
          : invidiousComments // ignore: cast_nullable_to_non_nullable
              as InvidiousCommentsResp,
      fetchInvidiousCommentsStatus: null == fetchInvidiousCommentsStatus
          ? _self.fetchInvidiousCommentsStatus
          : fetchInvidiousCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousCommentReplies: null == invidiousCommentReplies
          ? _self.invidiousCommentReplies
          : invidiousCommentReplies // ignore: cast_nullable_to_non_nullable
              as InvidiousCommentsResp,
      fetchInvidiousCommentRepliesStatus: null ==
              fetchInvidiousCommentRepliesStatus
          ? _self.fetchInvidiousCommentRepliesStatus
          : fetchInvidiousCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreInvidiousCommentsStatus: null == fetchMoreInvidiousCommentsStatus
          ? _self.fetchMoreInvidiousCommentsStatus
          : fetchMoreInvidiousCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousCommentsFetchCompleted: null ==
              isMoreInvidiousCommentsFetchCompleted
          ? _self.isMoreInvidiousCommentsFetchCompleted
          : isMoreInvidiousCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchMoreInvidiousCommentRepliesStatus: null ==
              fetchMoreInvidiousCommentRepliesStatus
          ? _self.fetchMoreInvidiousCommentRepliesStatus
          : fetchMoreInvidiousCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousReplyCommentsFetchCompleted: null ==
              isMoreInvidiousReplyCommentsFetchCompleted
          ? _self.isMoreInvidiousReplyCommentsFetchCompleted
          : isMoreInvidiousReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      newPipeWatchResp: null == newPipeWatchResp
          ? _self.newPipeWatchResp
          : newPipeWatchResp // ignore: cast_nullable_to_non_nullable
              as NewPipeWatchResp,
      fetchNewPipeWatchInfoStatus: null == fetchNewPipeWatchInfoStatus
          ? _self.fetchNewPipeWatchInfoStatus
          : fetchNewPipeWatchInfoStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeErrorMessage: freezed == newPipeErrorMessage
          ? _self.newPipeErrorMessage
          : newPipeErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      newPipeComments: null == newPipeComments
          ? _self.newPipeComments
          : newPipeComments // ignore: cast_nullable_to_non_nullable
              as NewPipeCommentsResp,
      fetchNewPipeCommentsStatus: null == fetchNewPipeCommentsStatus
          ? _self.fetchNewPipeCommentsStatus
          : fetchNewPipeCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreNewPipeCommentsStatus: null == fetchMoreNewPipeCommentsStatus
          ? _self.fetchMoreNewPipeCommentsStatus
          : fetchMoreNewPipeCommentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeCommentsFetchCompleted: null ==
              isMoreNewPipeCommentsFetchCompleted
          ? _self.isMoreNewPipeCommentsFetchCompleted
          : isMoreNewPipeCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      newPipeCommentReplies: null == newPipeCommentReplies
          ? _self.newPipeCommentReplies
          : newPipeCommentReplies // ignore: cast_nullable_to_non_nullable
              as NewPipeCommentsResp,
      fetchNewPipeCommentRepliesStatus: null == fetchNewPipeCommentRepliesStatus
          ? _self.fetchNewPipeCommentRepliesStatus
          : fetchNewPipeCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchMoreNewPipeCommentRepliesStatus: null ==
              fetchMoreNewPipeCommentRepliesStatus
          ? _self.fetchMoreNewPipeCommentRepliesStatus
          : fetchMoreNewPipeCommentRepliesStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeReplyCommentsFetchCompleted: null ==
              isMoreNewPipeReplyCommentsFetchCompleted
          ? _self.isMoreNewPipeReplyCommentsFetchCompleted
          : isMoreNewPipeReplyCommentsFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      sponsorSegments: null == sponsorSegments
          ? _self._sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<SponsorSegment>,
      fetchSponsorSegmentsStatus: null == fetchSponsorSegmentsStatus
          ? _self.fetchSponsorSegmentsStatus
          : fetchSponsorSegmentsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
    ));
  }
}

// dart format on
