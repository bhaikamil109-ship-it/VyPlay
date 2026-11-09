// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_quality_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamQualityInfo {
  /// Quality label (e.g., "1080p", "720p 60fps", "360p")
  String get label;

  /// Numeric resolution value (e.g., 1080, 720, 360)
  int get resolution;

  /// Frame rate (null if standard 30fps or less)
  int? get fps;

  /// Video format (MP4, WEBM, etc.)
  String? get format;

  /// Whether this quality requires stream merging (video-only + audio)
  bool get requiresMerging;

  /// Whether this is a video-only stream (no audio)
  bool get isVideoOnly;

  /// The video stream for this quality
  NewPipeVideoStream? get videoStream;

  /// The audio stream (if merging is required)
  NewPipeAudioStream? get audioStream;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreamQualityInfoCopyWith<StreamQualityInfo> get copyWith =>
      _$StreamQualityInfoCopyWithImpl<StreamQualityInfo>(
          this as StreamQualityInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreamQualityInfo &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.requiresMerging, requiresMerging) ||
                other.requiresMerging == requiresMerging) &&
            (identical(other.isVideoOnly, isVideoOnly) ||
                other.isVideoOnly == isVideoOnly) &&
            (identical(other.videoStream, videoStream) ||
                other.videoStream == videoStream) &&
            (identical(other.audioStream, audioStream) ||
                other.audioStream == audioStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, resolution, fps, format,
      requiresMerging, isVideoOnly, videoStream, audioStream);

  @override
  String toString() {
    return 'StreamQualityInfo(label: $label, resolution: $resolution, fps: $fps, format: $format, requiresMerging: $requiresMerging, isVideoOnly: $isVideoOnly, videoStream: $videoStream, audioStream: $audioStream)';
  }
}

/// @nodoc
abstract mixin class $StreamQualityInfoCopyWith<$Res> {
  factory $StreamQualityInfoCopyWith(
          StreamQualityInfo value, $Res Function(StreamQualityInfo) _then) =
      _$StreamQualityInfoCopyWithImpl;
  @useResult
  $Res call(
      {String label,
      int resolution,
      int? fps,
      String? format,
      bool requiresMerging,
      bool isVideoOnly,
      NewPipeVideoStream? videoStream,
      NewPipeAudioStream? audioStream});
}

/// @nodoc
class _$StreamQualityInfoCopyWithImpl<$Res>
    implements $StreamQualityInfoCopyWith<$Res> {
  _$StreamQualityInfoCopyWithImpl(this._self, this._then);

  final StreamQualityInfo _self;
  final $Res Function(StreamQualityInfo) _then;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? resolution = null,
    Object? fps = freezed,
    Object? format = freezed,
    Object? requiresMerging = null,
    Object? isVideoOnly = null,
    Object? videoStream = freezed,
    Object? audioStream = freezed,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as int,
      fps: freezed == fps
          ? _self.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresMerging: null == requiresMerging
          ? _self.requiresMerging
          : requiresMerging // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoOnly: null == isVideoOnly
          ? _self.isVideoOnly
          : isVideoOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      videoStream: freezed == videoStream
          ? _self.videoStream
          : videoStream // ignore: cast_nullable_to_non_nullable
              as NewPipeVideoStream?,
      audioStream: freezed == audioStream
          ? _self.audioStream
          : audioStream // ignore: cast_nullable_to_non_nullable
              as NewPipeAudioStream?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StreamQualityInfo].
extension StreamQualityInfoPatterns on StreamQualityInfo {
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
    TResult Function(_StreamQualityInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo() when $default != null:
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
    TResult Function(_StreamQualityInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_StreamQualityInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo() when $default != null:
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
            String label,
            int resolution,
            int? fps,
            String? format,
            bool requiresMerging,
            bool isVideoOnly,
            NewPipeVideoStream? videoStream,
            NewPipeAudioStream? audioStream)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo() when $default != null:
        return $default(
            _that.label,
            _that.resolution,
            _that.fps,
            _that.format,
            _that.requiresMerging,
            _that.isVideoOnly,
            _that.videoStream,
            _that.audioStream);
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
            String label,
            int resolution,
            int? fps,
            String? format,
            bool requiresMerging,
            bool isVideoOnly,
            NewPipeVideoStream? videoStream,
            NewPipeAudioStream? audioStream)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo():
        return $default(
            _that.label,
            _that.resolution,
            _that.fps,
            _that.format,
            _that.requiresMerging,
            _that.isVideoOnly,
            _that.videoStream,
            _that.audioStream);
      case _:
        throw StateError('Unexpected subclass');
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
            String label,
            int resolution,
            int? fps,
            String? format,
            bool requiresMerging,
            bool isVideoOnly,
            NewPipeVideoStream? videoStream,
            NewPipeAudioStream? audioStream)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StreamQualityInfo() when $default != null:
        return $default(
            _that.label,
            _that.resolution,
            _that.fps,
            _that.format,
            _that.requiresMerging,
            _that.isVideoOnly,
            _that.videoStream,
            _that.audioStream);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StreamQualityInfo extends StreamQualityInfo {
  const _StreamQualityInfo(
      {required this.label,
      required this.resolution,
      this.fps,
      this.format,
      required this.requiresMerging,
      required this.isVideoOnly,
      this.videoStream,
      this.audioStream})
      : super._();

  /// Quality label (e.g., "1080p", "720p 60fps", "360p")
  @override
  final String label;

  /// Numeric resolution value (e.g., 1080, 720, 360)
  @override
  final int resolution;

  /// Frame rate (null if standard 30fps or less)
  @override
  final int? fps;

  /// Video format (MP4, WEBM, etc.)
  @override
  final String? format;

  /// Whether this quality requires stream merging (video-only + audio)
  @override
  final bool requiresMerging;

  /// Whether this is a video-only stream (no audio)
  @override
  final bool isVideoOnly;

  /// The video stream for this quality
  @override
  final NewPipeVideoStream? videoStream;

  /// The audio stream (if merging is required)
  @override
  final NewPipeAudioStream? audioStream;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreamQualityInfoCopyWith<_StreamQualityInfo> get copyWith =>
      __$StreamQualityInfoCopyWithImpl<_StreamQualityInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreamQualityInfo &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.requiresMerging, requiresMerging) ||
                other.requiresMerging == requiresMerging) &&
            (identical(other.isVideoOnly, isVideoOnly) ||
                other.isVideoOnly == isVideoOnly) &&
            (identical(other.videoStream, videoStream) ||
                other.videoStream == videoStream) &&
            (identical(other.audioStream, audioStream) ||
                other.audioStream == audioStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, resolution, fps, format,
      requiresMerging, isVideoOnly, videoStream, audioStream);

  @override
  String toString() {
    return 'StreamQualityInfo(label: $label, resolution: $resolution, fps: $fps, format: $format, requiresMerging: $requiresMerging, isVideoOnly: $isVideoOnly, videoStream: $videoStream, audioStream: $audioStream)';
  }
}

/// @nodoc
abstract mixin class _$StreamQualityInfoCopyWith<$Res>
    implements $StreamQualityInfoCopyWith<$Res> {
  factory _$StreamQualityInfoCopyWith(
          _StreamQualityInfo value, $Res Function(_StreamQualityInfo) _then) =
      __$StreamQualityInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String label,
      int resolution,
      int? fps,
      String? format,
      bool requiresMerging,
      bool isVideoOnly,
      NewPipeVideoStream? videoStream,
      NewPipeAudioStream? audioStream});
}

/// @nodoc
class __$StreamQualityInfoCopyWithImpl<$Res>
    implements _$StreamQualityInfoCopyWith<$Res> {
  __$StreamQualityInfoCopyWithImpl(this._self, this._then);

  final _StreamQualityInfo _self;
  final $Res Function(_StreamQualityInfo) _then;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? resolution = null,
    Object? fps = freezed,
    Object? format = freezed,
    Object? requiresMerging = null,
    Object? isVideoOnly = null,
    Object? videoStream = freezed,
    Object? audioStream = freezed,
  }) {
    return _then(_StreamQualityInfo(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as int,
      fps: freezed == fps
          ? _self.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresMerging: null == requiresMerging
          ? _self.requiresMerging
          : requiresMerging // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoOnly: null == isVideoOnly
          ? _self.isVideoOnly
          : isVideoOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      videoStream: freezed == videoStream
          ? _self.videoStream
          : videoStream // ignore: cast_nullable_to_non_nullable
              as NewPipeVideoStream?,
      audioStream: freezed == audioStream
          ? _self.audioStream
          : audioStream // ignore: cast_nullable_to_non_nullable
              as NewPipeAudioStream?,
    ));
  }
}

// dart format on
