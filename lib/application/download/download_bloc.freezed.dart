// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DownloadEvent()';
  }
}

/// @nodoc
class $DownloadEventCopyWith<$Res> {
  $DownloadEventCopyWith(DownloadEvent _, $Res Function(DownloadEvent) __);
}

/// Adds pattern-matching-related methods to [DownloadEvent].
extension DownloadEventPatterns on DownloadEvent {
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
    TResult Function(_GetDownloadOptions value)? getDownloadOptions,
    TResult Function(_SetDownloadOptionsFromStreams value)?
        setDownloadOptionsFromStreams,
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DeleteDownload value)? deleteDownload,
    TResult Function(_GetAllDownloads value)? getAllDownloads,
    TResult Function(_UpdateDownloadProgress value)? updateDownloadProgress,
    TResult Function(_DownloadCompleted value)? downloadCompleted,
    TResult Function(_DownloadFailed value)? downloadFailed,
    TResult Function(_ClearDownloadOptions value)? clearDownloadOptions,
    TResult Function(_SaveToDevice value)? saveToDevice,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions() when getDownloadOptions != null:
        return getDownloadOptions(_that);
      case _SetDownloadOptionsFromStreams()
          when setDownloadOptionsFromStreams != null:
        return setDownloadOptionsFromStreams(_that);
      case _StartDownload() when startDownload != null:
        return startDownload(_that);
      case _PauseDownload() when pauseDownload != null:
        return pauseDownload(_that);
      case _ResumeDownload() when resumeDownload != null:
        return resumeDownload(_that);
      case _CancelDownload() when cancelDownload != null:
        return cancelDownload(_that);
      case _DeleteDownload() when deleteDownload != null:
        return deleteDownload(_that);
      case _GetAllDownloads() when getAllDownloads != null:
        return getAllDownloads(_that);
      case _UpdateDownloadProgress() when updateDownloadProgress != null:
        return updateDownloadProgress(_that);
      case _DownloadCompleted() when downloadCompleted != null:
        return downloadCompleted(_that);
      case _DownloadFailed() when downloadFailed != null:
        return downloadFailed(_that);
      case _ClearDownloadOptions() when clearDownloadOptions != null:
        return clearDownloadOptions(_that);
      case _SaveToDevice() when saveToDevice != null:
        return saveToDevice(_that);
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
    required TResult Function(_GetDownloadOptions value) getDownloadOptions,
    required TResult Function(_SetDownloadOptionsFromStreams value)
        setDownloadOptionsFromStreams,
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DeleteDownload value) deleteDownload,
    required TResult Function(_GetAllDownloads value) getAllDownloads,
    required TResult Function(_UpdateDownloadProgress value)
        updateDownloadProgress,
    required TResult Function(_DownloadCompleted value) downloadCompleted,
    required TResult Function(_DownloadFailed value) downloadFailed,
    required TResult Function(_ClearDownloadOptions value) clearDownloadOptions,
    required TResult Function(_SaveToDevice value) saveToDevice,
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions():
        return getDownloadOptions(_that);
      case _SetDownloadOptionsFromStreams():
        return setDownloadOptionsFromStreams(_that);
      case _StartDownload():
        return startDownload(_that);
      case _PauseDownload():
        return pauseDownload(_that);
      case _ResumeDownload():
        return resumeDownload(_that);
      case _CancelDownload():
        return cancelDownload(_that);
      case _DeleteDownload():
        return deleteDownload(_that);
      case _GetAllDownloads():
        return getAllDownloads(_that);
      case _UpdateDownloadProgress():
        return updateDownloadProgress(_that);
      case _DownloadCompleted():
        return downloadCompleted(_that);
      case _DownloadFailed():
        return downloadFailed(_that);
      case _ClearDownloadOptions():
        return clearDownloadOptions(_that);
      case _SaveToDevice():
        return saveToDevice(_that);
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
    TResult? Function(_GetDownloadOptions value)? getDownloadOptions,
    TResult? Function(_SetDownloadOptionsFromStreams value)?
        setDownloadOptionsFromStreams,
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DeleteDownload value)? deleteDownload,
    TResult? Function(_GetAllDownloads value)? getAllDownloads,
    TResult? Function(_UpdateDownloadProgress value)? updateDownloadProgress,
    TResult? Function(_DownloadCompleted value)? downloadCompleted,
    TResult? Function(_DownloadFailed value)? downloadFailed,
    TResult? Function(_ClearDownloadOptions value)? clearDownloadOptions,
    TResult? Function(_SaveToDevice value)? saveToDevice,
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions() when getDownloadOptions != null:
        return getDownloadOptions(_that);
      case _SetDownloadOptionsFromStreams()
          when setDownloadOptionsFromStreams != null:
        return setDownloadOptionsFromStreams(_that);
      case _StartDownload() when startDownload != null:
        return startDownload(_that);
      case _PauseDownload() when pauseDownload != null:
        return pauseDownload(_that);
      case _ResumeDownload() when resumeDownload != null:
        return resumeDownload(_that);
      case _CancelDownload() when cancelDownload != null:
        return cancelDownload(_that);
      case _DeleteDownload() when deleteDownload != null:
        return deleteDownload(_that);
      case _GetAllDownloads() when getAllDownloads != null:
        return getAllDownloads(_that);
      case _UpdateDownloadProgress() when updateDownloadProgress != null:
        return updateDownloadProgress(_that);
      case _DownloadCompleted() when downloadCompleted != null:
        return downloadCompleted(_that);
      case _DownloadFailed() when downloadFailed != null:
        return downloadFailed(_that);
      case _ClearDownloadOptions() when clearDownloadOptions != null:
        return clearDownloadOptions(_that);
      case _SaveToDevice() when saveToDevice != null:
        return saveToDevice(_that);
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
    TResult Function(String videoId, String serviceType)? getDownloadOptions,
    TResult Function(
            String videoId,
            String title,
            String channelName,
            String? thumbnailUrl,
            int? duration,
            List<NewPipeVideoStream> videoStreams,
            List<NewPipeVideoStream> videoOnlyStreams,
            List<NewPipeAudioStream> audioStreams)?
        setDownloadOptionsFromStreams,
    TResult Function(
            String videoId,
            String title,
            String channelName,
            DownloadType downloadType,
            String profileName,
            String? thumbnailUrl,
            int? duration,
            VideoQualityOption? videoQuality,
            AudioQualityOption? audioQuality)?
        startDownload,
    TResult Function(int downloadId)? pauseDownload,
    TResult Function(int downloadId)? resumeDownload,
    TResult Function(int downloadId)? cancelDownload,
    TResult Function(int downloadId)? deleteDownload,
    TResult Function(String profileName)? getAllDownloads,
    TResult Function(DownloadItem downloadItem)? updateDownloadProgress,
    TResult Function(DownloadItem downloadItem)? downloadCompleted,
    TResult Function(DownloadItem downloadItem, String error)? downloadFailed,
    TResult Function()? clearDownloadOptions,
    TResult Function(DownloadItem downloadItem)? saveToDevice,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions() when getDownloadOptions != null:
        return getDownloadOptions(_that.videoId, _that.serviceType);
      case _SetDownloadOptionsFromStreams()
          when setDownloadOptionsFromStreams != null:
        return setDownloadOptionsFromStreams(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoStreams,
            _that.videoOnlyStreams,
            _that.audioStreams);
      case _StartDownload() when startDownload != null:
        return startDownload(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.downloadType,
            _that.profileName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoQuality,
            _that.audioQuality);
      case _PauseDownload() when pauseDownload != null:
        return pauseDownload(_that.downloadId);
      case _ResumeDownload() when resumeDownload != null:
        return resumeDownload(_that.downloadId);
      case _CancelDownload() when cancelDownload != null:
        return cancelDownload(_that.downloadId);
      case _DeleteDownload() when deleteDownload != null:
        return deleteDownload(_that.downloadId);
      case _GetAllDownloads() when getAllDownloads != null:
        return getAllDownloads(_that.profileName);
      case _UpdateDownloadProgress() when updateDownloadProgress != null:
        return updateDownloadProgress(_that.downloadItem);
      case _DownloadCompleted() when downloadCompleted != null:
        return downloadCompleted(_that.downloadItem);
      case _DownloadFailed() when downloadFailed != null:
        return downloadFailed(_that.downloadItem, _that.error);
      case _ClearDownloadOptions() when clearDownloadOptions != null:
        return clearDownloadOptions();
      case _SaveToDevice() when saveToDevice != null:
        return saveToDevice(_that.downloadItem);
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
    required TResult Function(String videoId, String serviceType)
        getDownloadOptions,
    required TResult Function(
            String videoId,
            String title,
            String channelName,
            String? thumbnailUrl,
            int? duration,
            List<NewPipeVideoStream> videoStreams,
            List<NewPipeVideoStream> videoOnlyStreams,
            List<NewPipeAudioStream> audioStreams)
        setDownloadOptionsFromStreams,
    required TResult Function(
            String videoId,
            String title,
            String channelName,
            DownloadType downloadType,
            String profileName,
            String? thumbnailUrl,
            int? duration,
            VideoQualityOption? videoQuality,
            AudioQualityOption? audioQuality)
        startDownload,
    required TResult Function(int downloadId) pauseDownload,
    required TResult Function(int downloadId) resumeDownload,
    required TResult Function(int downloadId) cancelDownload,
    required TResult Function(int downloadId) deleteDownload,
    required TResult Function(String profileName) getAllDownloads,
    required TResult Function(DownloadItem downloadItem) updateDownloadProgress,
    required TResult Function(DownloadItem downloadItem) downloadCompleted,
    required TResult Function(DownloadItem downloadItem, String error)
        downloadFailed,
    required TResult Function() clearDownloadOptions,
    required TResult Function(DownloadItem downloadItem) saveToDevice,
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions():
        return getDownloadOptions(_that.videoId, _that.serviceType);
      case _SetDownloadOptionsFromStreams():
        return setDownloadOptionsFromStreams(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoStreams,
            _that.videoOnlyStreams,
            _that.audioStreams);
      case _StartDownload():
        return startDownload(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.downloadType,
            _that.profileName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoQuality,
            _that.audioQuality);
      case _PauseDownload():
        return pauseDownload(_that.downloadId);
      case _ResumeDownload():
        return resumeDownload(_that.downloadId);
      case _CancelDownload():
        return cancelDownload(_that.downloadId);
      case _DeleteDownload():
        return deleteDownload(_that.downloadId);
      case _GetAllDownloads():
        return getAllDownloads(_that.profileName);
      case _UpdateDownloadProgress():
        return updateDownloadProgress(_that.downloadItem);
      case _DownloadCompleted():
        return downloadCompleted(_that.downloadItem);
      case _DownloadFailed():
        return downloadFailed(_that.downloadItem, _that.error);
      case _ClearDownloadOptions():
        return clearDownloadOptions();
      case _SaveToDevice():
        return saveToDevice(_that.downloadItem);
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
    TResult? Function(String videoId, String serviceType)? getDownloadOptions,
    TResult? Function(
            String videoId,
            String title,
            String channelName,
            String? thumbnailUrl,
            int? duration,
            List<NewPipeVideoStream> videoStreams,
            List<NewPipeVideoStream> videoOnlyStreams,
            List<NewPipeAudioStream> audioStreams)?
        setDownloadOptionsFromStreams,
    TResult? Function(
            String videoId,
            String title,
            String channelName,
            DownloadType downloadType,
            String profileName,
            String? thumbnailUrl,
            int? duration,
            VideoQualityOption? videoQuality,
            AudioQualityOption? audioQuality)?
        startDownload,
    TResult? Function(int downloadId)? pauseDownload,
    TResult? Function(int downloadId)? resumeDownload,
    TResult? Function(int downloadId)? cancelDownload,
    TResult? Function(int downloadId)? deleteDownload,
    TResult? Function(String profileName)? getAllDownloads,
    TResult? Function(DownloadItem downloadItem)? updateDownloadProgress,
    TResult? Function(DownloadItem downloadItem)? downloadCompleted,
    TResult? Function(DownloadItem downloadItem, String error)? downloadFailed,
    TResult? Function()? clearDownloadOptions,
    TResult? Function(DownloadItem downloadItem)? saveToDevice,
  }) {
    final _that = this;
    switch (_that) {
      case _GetDownloadOptions() when getDownloadOptions != null:
        return getDownloadOptions(_that.videoId, _that.serviceType);
      case _SetDownloadOptionsFromStreams()
          when setDownloadOptionsFromStreams != null:
        return setDownloadOptionsFromStreams(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoStreams,
            _that.videoOnlyStreams,
            _that.audioStreams);
      case _StartDownload() when startDownload != null:
        return startDownload(
            _that.videoId,
            _that.title,
            _that.channelName,
            _that.downloadType,
            _that.profileName,
            _that.thumbnailUrl,
            _that.duration,
            _that.videoQuality,
            _that.audioQuality);
      case _PauseDownload() when pauseDownload != null:
        return pauseDownload(_that.downloadId);
      case _ResumeDownload() when resumeDownload != null:
        return resumeDownload(_that.downloadId);
      case _CancelDownload() when cancelDownload != null:
        return cancelDownload(_that.downloadId);
      case _DeleteDownload() when deleteDownload != null:
        return deleteDownload(_that.downloadId);
      case _GetAllDownloads() when getAllDownloads != null:
        return getAllDownloads(_that.profileName);
      case _UpdateDownloadProgress() when updateDownloadProgress != null:
        return updateDownloadProgress(_that.downloadItem);
      case _DownloadCompleted() when downloadCompleted != null:
        return downloadCompleted(_that.downloadItem);
      case _DownloadFailed() when downloadFailed != null:
        return downloadFailed(_that.downloadItem, _that.error);
      case _ClearDownloadOptions() when clearDownloadOptions != null:
        return clearDownloadOptions();
      case _SaveToDevice() when saveToDevice != null:
        return saveToDevice(_that.downloadItem);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetDownloadOptions implements DownloadEvent {
  const _GetDownloadOptions({required this.videoId, required this.serviceType});

  final String videoId;
  final String serviceType;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetDownloadOptionsCopyWith<_GetDownloadOptions> get copyWith =>
      __$GetDownloadOptionsCopyWithImpl<_GetDownloadOptions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetDownloadOptions &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, serviceType);

  @override
  String toString() {
    return 'DownloadEvent.getDownloadOptions(videoId: $videoId, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class _$GetDownloadOptionsCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$GetDownloadOptionsCopyWith(
          _GetDownloadOptions value, $Res Function(_GetDownloadOptions) _then) =
      __$GetDownloadOptionsCopyWithImpl;
  @useResult
  $Res call({String videoId, String serviceType});
}

/// @nodoc
class __$GetDownloadOptionsCopyWithImpl<$Res>
    implements _$GetDownloadOptionsCopyWith<$Res> {
  __$GetDownloadOptionsCopyWithImpl(this._self, this._then);

  final _GetDownloadOptions _self;
  final $Res Function(_GetDownloadOptions) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? serviceType = null,
  }) {
    return _then(_GetDownloadOptions(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SetDownloadOptionsFromStreams implements DownloadEvent {
  const _SetDownloadOptionsFromStreams(
      {required this.videoId,
      required this.title,
      required this.channelName,
      this.thumbnailUrl,
      this.duration,
      required final List<NewPipeVideoStream> videoStreams,
      required final List<NewPipeVideoStream> videoOnlyStreams,
      required final List<NewPipeAudioStream> audioStreams})
      : _videoStreams = videoStreams,
        _videoOnlyStreams = videoOnlyStreams,
        _audioStreams = audioStreams;

  final String videoId;
  final String title;
  final String channelName;
  final String? thumbnailUrl;
  final int? duration;
  final List<NewPipeVideoStream> _videoStreams;
  List<NewPipeVideoStream> get videoStreams {
    if (_videoStreams is EqualUnmodifiableListView) return _videoStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoStreams);
  }

  final List<NewPipeVideoStream> _videoOnlyStreams;
  List<NewPipeVideoStream> get videoOnlyStreams {
    if (_videoOnlyStreams is EqualUnmodifiableListView)
      return _videoOnlyStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoOnlyStreams);
  }

  final List<NewPipeAudioStream> _audioStreams;
  List<NewPipeAudioStream> get audioStreams {
    if (_audioStreams is EqualUnmodifiableListView) return _audioStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioStreams);
  }

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetDownloadOptionsFromStreamsCopyWith<_SetDownloadOptionsFromStreams>
      get copyWith => __$SetDownloadOptionsFromStreamsCopyWithImpl<
          _SetDownloadOptionsFromStreams>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetDownloadOptionsFromStreams &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._videoStreams, _videoStreams) &&
            const DeepCollectionEquality()
                .equals(other._videoOnlyStreams, _videoOnlyStreams) &&
            const DeepCollectionEquality()
                .equals(other._audioStreams, _audioStreams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      title,
      channelName,
      thumbnailUrl,
      duration,
      const DeepCollectionEquality().hash(_videoStreams),
      const DeepCollectionEquality().hash(_videoOnlyStreams),
      const DeepCollectionEquality().hash(_audioStreams));

  @override
  String toString() {
    return 'DownloadEvent.setDownloadOptionsFromStreams(videoId: $videoId, title: $title, channelName: $channelName, thumbnailUrl: $thumbnailUrl, duration: $duration, videoStreams: $videoStreams, videoOnlyStreams: $videoOnlyStreams, audioStreams: $audioStreams)';
  }
}

/// @nodoc
abstract mixin class _$SetDownloadOptionsFromStreamsCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$SetDownloadOptionsFromStreamsCopyWith(
          _SetDownloadOptionsFromStreams value,
          $Res Function(_SetDownloadOptionsFromStreams) _then) =
      __$SetDownloadOptionsFromStreamsCopyWithImpl;
  @useResult
  $Res call(
      {String videoId,
      String title,
      String channelName,
      String? thumbnailUrl,
      int? duration,
      List<NewPipeVideoStream> videoStreams,
      List<NewPipeVideoStream> videoOnlyStreams,
      List<NewPipeAudioStream> audioStreams});
}

/// @nodoc
class __$SetDownloadOptionsFromStreamsCopyWithImpl<$Res>
    implements _$SetDownloadOptionsFromStreamsCopyWith<$Res> {
  __$SetDownloadOptionsFromStreamsCopyWithImpl(this._self, this._then);

  final _SetDownloadOptionsFromStreams _self;
  final $Res Function(_SetDownloadOptionsFromStreams) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? title = null,
    Object? channelName = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? videoStreams = null,
    Object? videoOnlyStreams = null,
    Object? audioStreams = null,
  }) {
    return _then(_SetDownloadOptionsFromStreams(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      videoStreams: null == videoStreams
          ? _self._videoStreams
          : videoStreams // ignore: cast_nullable_to_non_nullable
              as List<NewPipeVideoStream>,
      videoOnlyStreams: null == videoOnlyStreams
          ? _self._videoOnlyStreams
          : videoOnlyStreams // ignore: cast_nullable_to_non_nullable
              as List<NewPipeVideoStream>,
      audioStreams: null == audioStreams
          ? _self._audioStreams
          : audioStreams // ignore: cast_nullable_to_non_nullable
              as List<NewPipeAudioStream>,
    ));
  }
}

/// @nodoc

class _StartDownload implements DownloadEvent {
  const _StartDownload(
      {required this.videoId,
      required this.title,
      required this.channelName,
      required this.downloadType,
      this.profileName = 'default',
      this.thumbnailUrl,
      this.duration,
      this.videoQuality,
      this.audioQuality});

  final String videoId;
  final String title;
  final String channelName;
  final DownloadType downloadType;
  @JsonKey()
  final String profileName;
  final String? thumbnailUrl;
  final int? duration;
  final VideoQualityOption? videoQuality;
  final AudioQualityOption? audioQuality;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartDownloadCopyWith<_StartDownload> get copyWith =>
      __$StartDownloadCopyWithImpl<_StartDownload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartDownload &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.downloadType, downloadType) ||
                other.downloadType == downloadType) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.videoQuality, videoQuality) ||
                other.videoQuality == videoQuality) &&
            (identical(other.audioQuality, audioQuality) ||
                other.audioQuality == audioQuality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      title,
      channelName,
      downloadType,
      profileName,
      thumbnailUrl,
      duration,
      videoQuality,
      audioQuality);

  @override
  String toString() {
    return 'DownloadEvent.startDownload(videoId: $videoId, title: $title, channelName: $channelName, downloadType: $downloadType, profileName: $profileName, thumbnailUrl: $thumbnailUrl, duration: $duration, videoQuality: $videoQuality, audioQuality: $audioQuality)';
  }
}

/// @nodoc
abstract mixin class _$StartDownloadCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$StartDownloadCopyWith(
          _StartDownload value, $Res Function(_StartDownload) _then) =
      __$StartDownloadCopyWithImpl;
  @useResult
  $Res call(
      {String videoId,
      String title,
      String channelName,
      DownloadType downloadType,
      String profileName,
      String? thumbnailUrl,
      int? duration,
      VideoQualityOption? videoQuality,
      AudioQualityOption? audioQuality});
}

/// @nodoc
class __$StartDownloadCopyWithImpl<$Res>
    implements _$StartDownloadCopyWith<$Res> {
  __$StartDownloadCopyWithImpl(this._self, this._then);

  final _StartDownload _self;
  final $Res Function(_StartDownload) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? title = null,
    Object? channelName = null,
    Object? downloadType = null,
    Object? profileName = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? videoQuality = freezed,
    Object? audioQuality = freezed,
  }) {
    return _then(_StartDownload(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadType: null == downloadType
          ? _self.downloadType
          : downloadType // ignore: cast_nullable_to_non_nullable
              as DownloadType,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      videoQuality: freezed == videoQuality
          ? _self.videoQuality
          : videoQuality // ignore: cast_nullable_to_non_nullable
              as VideoQualityOption?,
      audioQuality: freezed == audioQuality
          ? _self.audioQuality
          : audioQuality // ignore: cast_nullable_to_non_nullable
              as AudioQualityOption?,
    ));
  }
}

/// @nodoc

class _PauseDownload implements DownloadEvent {
  const _PauseDownload({required this.downloadId});

  final int downloadId;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauseDownloadCopyWith<_PauseDownload> get copyWith =>
      __$PauseDownloadCopyWithImpl<_PauseDownload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauseDownload &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadId);

  @override
  String toString() {
    return 'DownloadEvent.pauseDownload(downloadId: $downloadId)';
  }
}

/// @nodoc
abstract mixin class _$PauseDownloadCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$PauseDownloadCopyWith(
          _PauseDownload value, $Res Function(_PauseDownload) _then) =
      __$PauseDownloadCopyWithImpl;
  @useResult
  $Res call({int downloadId});
}

/// @nodoc
class __$PauseDownloadCopyWithImpl<$Res>
    implements _$PauseDownloadCopyWith<$Res> {
  __$PauseDownloadCopyWithImpl(this._self, this._then);

  final _PauseDownload _self;
  final $Res Function(_PauseDownload) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadId = null,
  }) {
    return _then(_PauseDownload(
      downloadId: null == downloadId
          ? _self.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ResumeDownload implements DownloadEvent {
  const _ResumeDownload({required this.downloadId});

  final int downloadId;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResumeDownloadCopyWith<_ResumeDownload> get copyWith =>
      __$ResumeDownloadCopyWithImpl<_ResumeDownload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResumeDownload &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadId);

  @override
  String toString() {
    return 'DownloadEvent.resumeDownload(downloadId: $downloadId)';
  }
}

/// @nodoc
abstract mixin class _$ResumeDownloadCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$ResumeDownloadCopyWith(
          _ResumeDownload value, $Res Function(_ResumeDownload) _then) =
      __$ResumeDownloadCopyWithImpl;
  @useResult
  $Res call({int downloadId});
}

/// @nodoc
class __$ResumeDownloadCopyWithImpl<$Res>
    implements _$ResumeDownloadCopyWith<$Res> {
  __$ResumeDownloadCopyWithImpl(this._self, this._then);

  final _ResumeDownload _self;
  final $Res Function(_ResumeDownload) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadId = null,
  }) {
    return _then(_ResumeDownload(
      downloadId: null == downloadId
          ? _self.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _CancelDownload implements DownloadEvent {
  const _CancelDownload({required this.downloadId});

  final int downloadId;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CancelDownloadCopyWith<_CancelDownload> get copyWith =>
      __$CancelDownloadCopyWithImpl<_CancelDownload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CancelDownload &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadId);

  @override
  String toString() {
    return 'DownloadEvent.cancelDownload(downloadId: $downloadId)';
  }
}

/// @nodoc
abstract mixin class _$CancelDownloadCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$CancelDownloadCopyWith(
          _CancelDownload value, $Res Function(_CancelDownload) _then) =
      __$CancelDownloadCopyWithImpl;
  @useResult
  $Res call({int downloadId});
}

/// @nodoc
class __$CancelDownloadCopyWithImpl<$Res>
    implements _$CancelDownloadCopyWith<$Res> {
  __$CancelDownloadCopyWithImpl(this._self, this._then);

  final _CancelDownload _self;
  final $Res Function(_CancelDownload) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadId = null,
  }) {
    return _then(_CancelDownload(
      downloadId: null == downloadId
          ? _self.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DeleteDownload implements DownloadEvent {
  const _DeleteDownload({required this.downloadId});

  final int downloadId;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteDownloadCopyWith<_DeleteDownload> get copyWith =>
      __$DeleteDownloadCopyWithImpl<_DeleteDownload>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteDownload &&
            (identical(other.downloadId, downloadId) ||
                other.downloadId == downloadId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadId);

  @override
  String toString() {
    return 'DownloadEvent.deleteDownload(downloadId: $downloadId)';
  }
}

/// @nodoc
abstract mixin class _$DeleteDownloadCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$DeleteDownloadCopyWith(
          _DeleteDownload value, $Res Function(_DeleteDownload) _then) =
      __$DeleteDownloadCopyWithImpl;
  @useResult
  $Res call({int downloadId});
}

/// @nodoc
class __$DeleteDownloadCopyWithImpl<$Res>
    implements _$DeleteDownloadCopyWith<$Res> {
  __$DeleteDownloadCopyWithImpl(this._self, this._then);

  final _DeleteDownload _self;
  final $Res Function(_DeleteDownload) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadId = null,
  }) {
    return _then(_DeleteDownload(
      downloadId: null == downloadId
          ? _self.downloadId
          : downloadId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GetAllDownloads implements DownloadEvent {
  const _GetAllDownloads({this.profileName = 'default'});

  @JsonKey()
  final String profileName;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetAllDownloadsCopyWith<_GetAllDownloads> get copyWith =>
      __$GetAllDownloadsCopyWithImpl<_GetAllDownloads>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetAllDownloads &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'DownloadEvent.getAllDownloads(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class _$GetAllDownloadsCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$GetAllDownloadsCopyWith(
          _GetAllDownloads value, $Res Function(_GetAllDownloads) _then) =
      __$GetAllDownloadsCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class __$GetAllDownloadsCopyWithImpl<$Res>
    implements _$GetAllDownloadsCopyWith<$Res> {
  __$GetAllDownloadsCopyWithImpl(this._self, this._then);

  final _GetAllDownloads _self;
  final $Res Function(_GetAllDownloads) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(_GetAllDownloads(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateDownloadProgress implements DownloadEvent {
  const _UpdateDownloadProgress({required this.downloadItem});

  final DownloadItem downloadItem;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateDownloadProgressCopyWith<_UpdateDownloadProgress> get copyWith =>
      __$UpdateDownloadProgressCopyWithImpl<_UpdateDownloadProgress>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateDownloadProgress &&
            (identical(other.downloadItem, downloadItem) ||
                other.downloadItem == downloadItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadItem);

  @override
  String toString() {
    return 'DownloadEvent.updateDownloadProgress(downloadItem: $downloadItem)';
  }
}

/// @nodoc
abstract mixin class _$UpdateDownloadProgressCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$UpdateDownloadProgressCopyWith(_UpdateDownloadProgress value,
          $Res Function(_UpdateDownloadProgress) _then) =
      __$UpdateDownloadProgressCopyWithImpl;
  @useResult
  $Res call({DownloadItem downloadItem});
}

/// @nodoc
class __$UpdateDownloadProgressCopyWithImpl<$Res>
    implements _$UpdateDownloadProgressCopyWith<$Res> {
  __$UpdateDownloadProgressCopyWithImpl(this._self, this._then);

  final _UpdateDownloadProgress _self;
  final $Res Function(_UpdateDownloadProgress) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadItem = null,
  }) {
    return _then(_UpdateDownloadProgress(
      downloadItem: null == downloadItem
          ? _self.downloadItem
          : downloadItem // ignore: cast_nullable_to_non_nullable
              as DownloadItem,
    ));
  }
}

/// @nodoc

class _DownloadCompleted implements DownloadEvent {
  const _DownloadCompleted({required this.downloadItem});

  final DownloadItem downloadItem;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadCompletedCopyWith<_DownloadCompleted> get copyWith =>
      __$DownloadCompletedCopyWithImpl<_DownloadCompleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadCompleted &&
            (identical(other.downloadItem, downloadItem) ||
                other.downloadItem == downloadItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadItem);

  @override
  String toString() {
    return 'DownloadEvent.downloadCompleted(downloadItem: $downloadItem)';
  }
}

/// @nodoc
abstract mixin class _$DownloadCompletedCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$DownloadCompletedCopyWith(
          _DownloadCompleted value, $Res Function(_DownloadCompleted) _then) =
      __$DownloadCompletedCopyWithImpl;
  @useResult
  $Res call({DownloadItem downloadItem});
}

/// @nodoc
class __$DownloadCompletedCopyWithImpl<$Res>
    implements _$DownloadCompletedCopyWith<$Res> {
  __$DownloadCompletedCopyWithImpl(this._self, this._then);

  final _DownloadCompleted _self;
  final $Res Function(_DownloadCompleted) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadItem = null,
  }) {
    return _then(_DownloadCompleted(
      downloadItem: null == downloadItem
          ? _self.downloadItem
          : downloadItem // ignore: cast_nullable_to_non_nullable
              as DownloadItem,
    ));
  }
}

/// @nodoc

class _DownloadFailed implements DownloadEvent {
  const _DownloadFailed({required this.downloadItem, required this.error});

  final DownloadItem downloadItem;
  final String error;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadFailedCopyWith<_DownloadFailed> get copyWith =>
      __$DownloadFailedCopyWithImpl<_DownloadFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadFailed &&
            (identical(other.downloadItem, downloadItem) ||
                other.downloadItem == downloadItem) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadItem, error);

  @override
  String toString() {
    return 'DownloadEvent.downloadFailed(downloadItem: $downloadItem, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$DownloadFailedCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$DownloadFailedCopyWith(
          _DownloadFailed value, $Res Function(_DownloadFailed) _then) =
      __$DownloadFailedCopyWithImpl;
  @useResult
  $Res call({DownloadItem downloadItem, String error});
}

/// @nodoc
class __$DownloadFailedCopyWithImpl<$Res>
    implements _$DownloadFailedCopyWith<$Res> {
  __$DownloadFailedCopyWithImpl(this._self, this._then);

  final _DownloadFailed _self;
  final $Res Function(_DownloadFailed) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadItem = null,
    Object? error = null,
  }) {
    return _then(_DownloadFailed(
      downloadItem: null == downloadItem
          ? _self.downloadItem
          : downloadItem // ignore: cast_nullable_to_non_nullable
              as DownloadItem,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ClearDownloadOptions implements DownloadEvent {
  const _ClearDownloadOptions();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClearDownloadOptions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DownloadEvent.clearDownloadOptions()';
  }
}

/// @nodoc

class _SaveToDevice implements DownloadEvent {
  const _SaveToDevice({required this.downloadItem});

  final DownloadItem downloadItem;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveToDeviceCopyWith<_SaveToDevice> get copyWith =>
      __$SaveToDeviceCopyWithImpl<_SaveToDevice>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveToDevice &&
            (identical(other.downloadItem, downloadItem) ||
                other.downloadItem == downloadItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadItem);

  @override
  String toString() {
    return 'DownloadEvent.saveToDevice(downloadItem: $downloadItem)';
  }
}

/// @nodoc
abstract mixin class _$SaveToDeviceCopyWith<$Res>
    implements $DownloadEventCopyWith<$Res> {
  factory _$SaveToDeviceCopyWith(
          _SaveToDevice value, $Res Function(_SaveToDevice) _then) =
      __$SaveToDeviceCopyWithImpl;
  @useResult
  $Res call({DownloadItem downloadItem});
}

/// @nodoc
class __$SaveToDeviceCopyWithImpl<$Res>
    implements _$SaveToDeviceCopyWith<$Res> {
  __$SaveToDeviceCopyWithImpl(this._self, this._then);

  final _SaveToDevice _self;
  final $Res Function(_SaveToDevice) _then;

  /// Create a copy of DownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadItem = null,
  }) {
    return _then(_SaveToDevice(
      downloadItem: null == downloadItem
          ? _self.downloadItem
          : downloadItem // ignore: cast_nullable_to_non_nullable
              as DownloadItem,
    ));
  }
}

/// @nodoc
mixin _$DownloadState {
  /// Status of fetching download options
  ApiStatus get fetchOptionsStatus;

  /// Status of fetching downloads list
  ApiStatus get fetchDownloadsStatus;

  /// Available download options for current video
  DownloadOptions? get downloadOptions;

  /// All downloads
  List<DownloadItem> get allDownloads;

  /// Completed downloads
  List<DownloadItem> get completedDownloads;

  /// Active (currently downloading) downloads
  List<DownloadItem> get activeDownloads;

  /// Pending or paused downloads
  List<DownloadItem> get pendingDownloads;

  /// Error message if any
  String? get errorMessage;

  /// Title of the failed download (for snackbar display)
  String? get failedDownloadTitle;

  /// Save to device operation status
  ApiStatus get saveToDeviceStatus;

  /// Title of the file that was saved to device (for success message)
  String? get savedToDeviceTitle;

  /// Create a copy of DownloadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadStateCopyWith<DownloadState> get copyWith =>
      _$DownloadStateCopyWithImpl<DownloadState>(
          this as DownloadState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadState &&
            (identical(other.fetchOptionsStatus, fetchOptionsStatus) ||
                other.fetchOptionsStatus == fetchOptionsStatus) &&
            (identical(other.fetchDownloadsStatus, fetchDownloadsStatus) ||
                other.fetchDownloadsStatus == fetchDownloadsStatus) &&
            (identical(other.downloadOptions, downloadOptions) ||
                other.downloadOptions == downloadOptions) &&
            const DeepCollectionEquality()
                .equals(other.allDownloads, allDownloads) &&
            const DeepCollectionEquality()
                .equals(other.completedDownloads, completedDownloads) &&
            const DeepCollectionEquality()
                .equals(other.activeDownloads, activeDownloads) &&
            const DeepCollectionEquality()
                .equals(other.pendingDownloads, pendingDownloads) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.failedDownloadTitle, failedDownloadTitle) ||
                other.failedDownloadTitle == failedDownloadTitle) &&
            (identical(other.saveToDeviceStatus, saveToDeviceStatus) ||
                other.saveToDeviceStatus == saveToDeviceStatus) &&
            (identical(other.savedToDeviceTitle, savedToDeviceTitle) ||
                other.savedToDeviceTitle == savedToDeviceTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchOptionsStatus,
      fetchDownloadsStatus,
      downloadOptions,
      const DeepCollectionEquality().hash(allDownloads),
      const DeepCollectionEquality().hash(completedDownloads),
      const DeepCollectionEquality().hash(activeDownloads),
      const DeepCollectionEquality().hash(pendingDownloads),
      errorMessage,
      failedDownloadTitle,
      saveToDeviceStatus,
      savedToDeviceTitle);

  @override
  String toString() {
    return 'DownloadState(fetchOptionsStatus: $fetchOptionsStatus, fetchDownloadsStatus: $fetchDownloadsStatus, downloadOptions: $downloadOptions, allDownloads: $allDownloads, completedDownloads: $completedDownloads, activeDownloads: $activeDownloads, pendingDownloads: $pendingDownloads, errorMessage: $errorMessage, failedDownloadTitle: $failedDownloadTitle, saveToDeviceStatus: $saveToDeviceStatus, savedToDeviceTitle: $savedToDeviceTitle)';
  }
}

/// @nodoc
abstract mixin class $DownloadStateCopyWith<$Res> {
  factory $DownloadStateCopyWith(
          DownloadState value, $Res Function(DownloadState) _then) =
      _$DownloadStateCopyWithImpl;
  @useResult
  $Res call(
      {ApiStatus fetchOptionsStatus,
      ApiStatus fetchDownloadsStatus,
      DownloadOptions? downloadOptions,
      List<DownloadItem> allDownloads,
      List<DownloadItem> completedDownloads,
      List<DownloadItem> activeDownloads,
      List<DownloadItem> pendingDownloads,
      String? errorMessage,
      String? failedDownloadTitle,
      ApiStatus saveToDeviceStatus,
      String? savedToDeviceTitle});
}

/// @nodoc
class _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._self, this._then);

  final DownloadState _self;
  final $Res Function(DownloadState) _then;

  /// Create a copy of DownloadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchOptionsStatus = null,
    Object? fetchDownloadsStatus = null,
    Object? downloadOptions = freezed,
    Object? allDownloads = null,
    Object? completedDownloads = null,
    Object? activeDownloads = null,
    Object? pendingDownloads = null,
    Object? errorMessage = freezed,
    Object? failedDownloadTitle = freezed,
    Object? saveToDeviceStatus = null,
    Object? savedToDeviceTitle = freezed,
  }) {
    return _then(_self.copyWith(
      fetchOptionsStatus: null == fetchOptionsStatus
          ? _self.fetchOptionsStatus
          : fetchOptionsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchDownloadsStatus: null == fetchDownloadsStatus
          ? _self.fetchDownloadsStatus
          : fetchDownloadsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      downloadOptions: freezed == downloadOptions
          ? _self.downloadOptions
          : downloadOptions // ignore: cast_nullable_to_non_nullable
              as DownloadOptions?,
      allDownloads: null == allDownloads
          ? _self.allDownloads
          : allDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      completedDownloads: null == completedDownloads
          ? _self.completedDownloads
          : completedDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      activeDownloads: null == activeDownloads
          ? _self.activeDownloads
          : activeDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      pendingDownloads: null == pendingDownloads
          ? _self.pendingDownloads
          : pendingDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      failedDownloadTitle: freezed == failedDownloadTitle
          ? _self.failedDownloadTitle
          : failedDownloadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      saveToDeviceStatus: null == saveToDeviceStatus
          ? _self.saveToDeviceStatus
          : saveToDeviceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      savedToDeviceTitle: freezed == savedToDeviceTitle
          ? _self.savedToDeviceTitle
          : savedToDeviceTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DownloadState].
extension DownloadStatePatterns on DownloadState {
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
    TResult Function(_DownloadState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadState() when $default != null:
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
    TResult Function(_DownloadState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadState():
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
    TResult? Function(_DownloadState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadState() when $default != null:
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
            ApiStatus fetchOptionsStatus,
            ApiStatus fetchDownloadsStatus,
            DownloadOptions? downloadOptions,
            List<DownloadItem> allDownloads,
            List<DownloadItem> completedDownloads,
            List<DownloadItem> activeDownloads,
            List<DownloadItem> pendingDownloads,
            String? errorMessage,
            String? failedDownloadTitle,
            ApiStatus saveToDeviceStatus,
            String? savedToDeviceTitle)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadState() when $default != null:
        return $default(
            _that.fetchOptionsStatus,
            _that.fetchDownloadsStatus,
            _that.downloadOptions,
            _that.allDownloads,
            _that.completedDownloads,
            _that.activeDownloads,
            _that.pendingDownloads,
            _that.errorMessage,
            _that.failedDownloadTitle,
            _that.saveToDeviceStatus,
            _that.savedToDeviceTitle);
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
            ApiStatus fetchOptionsStatus,
            ApiStatus fetchDownloadsStatus,
            DownloadOptions? downloadOptions,
            List<DownloadItem> allDownloads,
            List<DownloadItem> completedDownloads,
            List<DownloadItem> activeDownloads,
            List<DownloadItem> pendingDownloads,
            String? errorMessage,
            String? failedDownloadTitle,
            ApiStatus saveToDeviceStatus,
            String? savedToDeviceTitle)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadState():
        return $default(
            _that.fetchOptionsStatus,
            _that.fetchDownloadsStatus,
            _that.downloadOptions,
            _that.allDownloads,
            _that.completedDownloads,
            _that.activeDownloads,
            _that.pendingDownloads,
            _that.errorMessage,
            _that.failedDownloadTitle,
            _that.saveToDeviceStatus,
            _that.savedToDeviceTitle);
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
            ApiStatus fetchOptionsStatus,
            ApiStatus fetchDownloadsStatus,
            DownloadOptions? downloadOptions,
            List<DownloadItem> allDownloads,
            List<DownloadItem> completedDownloads,
            List<DownloadItem> activeDownloads,
            List<DownloadItem> pendingDownloads,
            String? errorMessage,
            String? failedDownloadTitle,
            ApiStatus saveToDeviceStatus,
            String? savedToDeviceTitle)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadState() when $default != null:
        return $default(
            _that.fetchOptionsStatus,
            _that.fetchDownloadsStatus,
            _that.downloadOptions,
            _that.allDownloads,
            _that.completedDownloads,
            _that.activeDownloads,
            _that.pendingDownloads,
            _that.errorMessage,
            _that.failedDownloadTitle,
            _that.saveToDeviceStatus,
            _that.savedToDeviceTitle);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DownloadState implements DownloadState {
  const _DownloadState(
      {required this.fetchOptionsStatus,
      required this.fetchDownloadsStatus,
      this.downloadOptions,
      required final List<DownloadItem> allDownloads,
      required final List<DownloadItem> completedDownloads,
      required final List<DownloadItem> activeDownloads,
      required final List<DownloadItem> pendingDownloads,
      this.errorMessage,
      this.failedDownloadTitle,
      required this.saveToDeviceStatus,
      this.savedToDeviceTitle})
      : _allDownloads = allDownloads,
        _completedDownloads = completedDownloads,
        _activeDownloads = activeDownloads,
        _pendingDownloads = pendingDownloads;

  /// Status of fetching download options
  @override
  final ApiStatus fetchOptionsStatus;

  /// Status of fetching downloads list
  @override
  final ApiStatus fetchDownloadsStatus;

  /// Available download options for current video
  @override
  final DownloadOptions? downloadOptions;

  /// All downloads
  final List<DownloadItem> _allDownloads;

  /// All downloads
  @override
  List<DownloadItem> get allDownloads {
    if (_allDownloads is EqualUnmodifiableListView) return _allDownloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDownloads);
  }

  /// Completed downloads
  final List<DownloadItem> _completedDownloads;

  /// Completed downloads
  @override
  List<DownloadItem> get completedDownloads {
    if (_completedDownloads is EqualUnmodifiableListView)
      return _completedDownloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDownloads);
  }

  /// Active (currently downloading) downloads
  final List<DownloadItem> _activeDownloads;

  /// Active (currently downloading) downloads
  @override
  List<DownloadItem> get activeDownloads {
    if (_activeDownloads is EqualUnmodifiableListView) return _activeDownloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeDownloads);
  }

  /// Pending or paused downloads
  final List<DownloadItem> _pendingDownloads;

  /// Pending or paused downloads
  @override
  List<DownloadItem> get pendingDownloads {
    if (_pendingDownloads is EqualUnmodifiableListView)
      return _pendingDownloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingDownloads);
  }

  /// Error message if any
  @override
  final String? errorMessage;

  /// Title of the failed download (for snackbar display)
  @override
  final String? failedDownloadTitle;

  /// Save to device operation status
  @override
  final ApiStatus saveToDeviceStatus;

  /// Title of the file that was saved to device (for success message)
  @override
  final String? savedToDeviceTitle;

  /// Create a copy of DownloadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadStateCopyWith<_DownloadState> get copyWith =>
      __$DownloadStateCopyWithImpl<_DownloadState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadState &&
            (identical(other.fetchOptionsStatus, fetchOptionsStatus) ||
                other.fetchOptionsStatus == fetchOptionsStatus) &&
            (identical(other.fetchDownloadsStatus, fetchDownloadsStatus) ||
                other.fetchDownloadsStatus == fetchDownloadsStatus) &&
            (identical(other.downloadOptions, downloadOptions) ||
                other.downloadOptions == downloadOptions) &&
            const DeepCollectionEquality()
                .equals(other._allDownloads, _allDownloads) &&
            const DeepCollectionEquality()
                .equals(other._completedDownloads, _completedDownloads) &&
            const DeepCollectionEquality()
                .equals(other._activeDownloads, _activeDownloads) &&
            const DeepCollectionEquality()
                .equals(other._pendingDownloads, _pendingDownloads) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.failedDownloadTitle, failedDownloadTitle) ||
                other.failedDownloadTitle == failedDownloadTitle) &&
            (identical(other.saveToDeviceStatus, saveToDeviceStatus) ||
                other.saveToDeviceStatus == saveToDeviceStatus) &&
            (identical(other.savedToDeviceTitle, savedToDeviceTitle) ||
                other.savedToDeviceTitle == savedToDeviceTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fetchOptionsStatus,
      fetchDownloadsStatus,
      downloadOptions,
      const DeepCollectionEquality().hash(_allDownloads),
      const DeepCollectionEquality().hash(_completedDownloads),
      const DeepCollectionEquality().hash(_activeDownloads),
      const DeepCollectionEquality().hash(_pendingDownloads),
      errorMessage,
      failedDownloadTitle,
      saveToDeviceStatus,
      savedToDeviceTitle);

  @override
  String toString() {
    return 'DownloadState(fetchOptionsStatus: $fetchOptionsStatus, fetchDownloadsStatus: $fetchDownloadsStatus, downloadOptions: $downloadOptions, allDownloads: $allDownloads, completedDownloads: $completedDownloads, activeDownloads: $activeDownloads, pendingDownloads: $pendingDownloads, errorMessage: $errorMessage, failedDownloadTitle: $failedDownloadTitle, saveToDeviceStatus: $saveToDeviceStatus, savedToDeviceTitle: $savedToDeviceTitle)';
  }
}

/// @nodoc
abstract mixin class _$DownloadStateCopyWith<$Res>
    implements $DownloadStateCopyWith<$Res> {
  factory _$DownloadStateCopyWith(
          _DownloadState value, $Res Function(_DownloadState) _then) =
      __$DownloadStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ApiStatus fetchOptionsStatus,
      ApiStatus fetchDownloadsStatus,
      DownloadOptions? downloadOptions,
      List<DownloadItem> allDownloads,
      List<DownloadItem> completedDownloads,
      List<DownloadItem> activeDownloads,
      List<DownloadItem> pendingDownloads,
      String? errorMessage,
      String? failedDownloadTitle,
      ApiStatus saveToDeviceStatus,
      String? savedToDeviceTitle});
}

/// @nodoc
class __$DownloadStateCopyWithImpl<$Res>
    implements _$DownloadStateCopyWith<$Res> {
  __$DownloadStateCopyWithImpl(this._self, this._then);

  final _DownloadState _self;
  final $Res Function(_DownloadState) _then;

  /// Create a copy of DownloadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fetchOptionsStatus = null,
    Object? fetchDownloadsStatus = null,
    Object? downloadOptions = freezed,
    Object? allDownloads = null,
    Object? completedDownloads = null,
    Object? activeDownloads = null,
    Object? pendingDownloads = null,
    Object? errorMessage = freezed,
    Object? failedDownloadTitle = freezed,
    Object? saveToDeviceStatus = null,
    Object? savedToDeviceTitle = freezed,
  }) {
    return _then(_DownloadState(
      fetchOptionsStatus: null == fetchOptionsStatus
          ? _self.fetchOptionsStatus
          : fetchOptionsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchDownloadsStatus: null == fetchDownloadsStatus
          ? _self.fetchDownloadsStatus
          : fetchDownloadsStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      downloadOptions: freezed == downloadOptions
          ? _self.downloadOptions
          : downloadOptions // ignore: cast_nullable_to_non_nullable
              as DownloadOptions?,
      allDownloads: null == allDownloads
          ? _self._allDownloads
          : allDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      completedDownloads: null == completedDownloads
          ? _self._completedDownloads
          : completedDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      activeDownloads: null == activeDownloads
          ? _self._activeDownloads
          : activeDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      pendingDownloads: null == pendingDownloads
          ? _self._pendingDownloads
          : pendingDownloads // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      failedDownloadTitle: freezed == failedDownloadTitle
          ? _self.failedDownloadTitle
          : failedDownloadTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      saveToDeviceStatus: null == saveToDeviceStatus
          ? _self.saveToDeviceStatus
          : saveToDeviceStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      savedToDeviceTitle: freezed == savedToDeviceTitle
          ? _self.savedToDeviceTitle
          : savedToDeviceTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
