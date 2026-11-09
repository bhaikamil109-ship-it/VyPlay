// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaybackConfiguration {
  /// Type of media source
  MediaSourceType get sourceType;

  /// Quality label (e.g., "1080p", "720p 60fps")
  String get qualityLabel;

  /// Video URL (for progressive or merging)
  String? get videoUrl;

  /// Audio URL (for merging only)
  String? get audioUrl;

  /// Manifest URL (for HLS or DASH)
  String? get manifestUrl;

  /// Subtitle tracks
  List<NewPipeSubtitle> get subtitles;

  /// HTTP headers (if needed)
  Map<String, String> get headers;

  /// Whether this is a live stream
  bool get isLive;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaybackConfigurationCopyWith<PlaybackConfiguration> get copyWith =>
      _$PlaybackConfigurationCopyWithImpl<PlaybackConfiguration>(
          this as PlaybackConfiguration, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaybackConfiguration &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.qualityLabel, qualityLabel) ||
                other.qualityLabel == qualityLabel) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.manifestUrl, manifestUrl) ||
                other.manifestUrl == manifestUrl) &&
            const DeepCollectionEquality().equals(other.subtitles, subtitles) &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceType,
      qualityLabel,
      videoUrl,
      audioUrl,
      manifestUrl,
      const DeepCollectionEquality().hash(subtitles),
      const DeepCollectionEquality().hash(headers),
      isLive);

  @override
  String toString() {
    return 'PlaybackConfiguration(sourceType: $sourceType, qualityLabel: $qualityLabel, videoUrl: $videoUrl, audioUrl: $audioUrl, manifestUrl: $manifestUrl, subtitles: $subtitles, headers: $headers, isLive: $isLive)';
  }
}

/// @nodoc
abstract mixin class $PlaybackConfigurationCopyWith<$Res> {
  factory $PlaybackConfigurationCopyWith(PlaybackConfiguration value,
          $Res Function(PlaybackConfiguration) _then) =
      _$PlaybackConfigurationCopyWithImpl;
  @useResult
  $Res call(
      {MediaSourceType sourceType,
      String qualityLabel,
      String? videoUrl,
      String? audioUrl,
      String? manifestUrl,
      List<NewPipeSubtitle> subtitles,
      Map<String, String> headers,
      bool isLive});
}

/// @nodoc
class _$PlaybackConfigurationCopyWithImpl<$Res>
    implements $PlaybackConfigurationCopyWith<$Res> {
  _$PlaybackConfigurationCopyWithImpl(this._self, this._then);

  final PlaybackConfiguration _self;
  final $Res Function(PlaybackConfiguration) _then;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceType = null,
    Object? qualityLabel = null,
    Object? videoUrl = freezed,
    Object? audioUrl = freezed,
    Object? manifestUrl = freezed,
    Object? subtitles = null,
    Object? headers = null,
    Object? isLive = null,
  }) {
    return _then(_self.copyWith(
      sourceType: null == sourceType
          ? _self.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as MediaSourceType,
      qualityLabel: null == qualityLabel
          ? _self.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _self.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _self.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      manifestUrl: freezed == manifestUrl
          ? _self.manifestUrl
          : manifestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitles: null == subtitles
          ? _self.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<NewPipeSubtitle>,
      headers: null == headers
          ? _self.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isLive: null == isLive
          ? _self.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaybackConfiguration].
extension PlaybackConfigurationPatterns on PlaybackConfiguration {
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
    TResult Function(_PlaybackConfiguration value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration() when $default != null:
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
    TResult Function(_PlaybackConfiguration value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration():
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
    TResult? Function(_PlaybackConfiguration value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration() when $default != null:
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
            MediaSourceType sourceType,
            String qualityLabel,
            String? videoUrl,
            String? audioUrl,
            String? manifestUrl,
            List<NewPipeSubtitle> subtitles,
            Map<String, String> headers,
            bool isLive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration() when $default != null:
        return $default(
            _that.sourceType,
            _that.qualityLabel,
            _that.videoUrl,
            _that.audioUrl,
            _that.manifestUrl,
            _that.subtitles,
            _that.headers,
            _that.isLive);
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
            MediaSourceType sourceType,
            String qualityLabel,
            String? videoUrl,
            String? audioUrl,
            String? manifestUrl,
            List<NewPipeSubtitle> subtitles,
            Map<String, String> headers,
            bool isLive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration():
        return $default(
            _that.sourceType,
            _that.qualityLabel,
            _that.videoUrl,
            _that.audioUrl,
            _that.manifestUrl,
            _that.subtitles,
            _that.headers,
            _that.isLive);
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
            MediaSourceType sourceType,
            String qualityLabel,
            String? videoUrl,
            String? audioUrl,
            String? manifestUrl,
            List<NewPipeSubtitle> subtitles,
            Map<String, String> headers,
            bool isLive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaybackConfiguration() when $default != null:
        return $default(
            _that.sourceType,
            _that.qualityLabel,
            _that.videoUrl,
            _that.audioUrl,
            _that.manifestUrl,
            _that.subtitles,
            _that.headers,
            _that.isLive);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaybackConfiguration extends PlaybackConfiguration {
  const _PlaybackConfiguration(
      {required this.sourceType,
      required this.qualityLabel,
      this.videoUrl,
      this.audioUrl,
      this.manifestUrl,
      final List<NewPipeSubtitle> subtitles = const [],
      final Map<String, String> headers = const {},
      this.isLive = false})
      : _subtitles = subtitles,
        _headers = headers,
        super._();

  /// Type of media source
  @override
  final MediaSourceType sourceType;

  /// Quality label (e.g., "1080p", "720p 60fps")
  @override
  final String qualityLabel;

  /// Video URL (for progressive or merging)
  @override
  final String? videoUrl;

  /// Audio URL (for merging only)
  @override
  final String? audioUrl;

  /// Manifest URL (for HLS or DASH)
  @override
  final String? manifestUrl;

  /// Subtitle tracks
  final List<NewPipeSubtitle> _subtitles;

  /// Subtitle tracks
  @override
  @JsonKey()
  List<NewPipeSubtitle> get subtitles {
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitles);
  }

  /// HTTP headers (if needed)
  final Map<String, String> _headers;

  /// HTTP headers (if needed)
  @override
  @JsonKey()
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  /// Whether this is a live stream
  @override
  @JsonKey()
  final bool isLive;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaybackConfigurationCopyWith<_PlaybackConfiguration> get copyWith =>
      __$PlaybackConfigurationCopyWithImpl<_PlaybackConfiguration>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaybackConfiguration &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.qualityLabel, qualityLabel) ||
                other.qualityLabel == qualityLabel) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.manifestUrl, manifestUrl) ||
                other.manifestUrl == manifestUrl) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceType,
      qualityLabel,
      videoUrl,
      audioUrl,
      manifestUrl,
      const DeepCollectionEquality().hash(_subtitles),
      const DeepCollectionEquality().hash(_headers),
      isLive);

  @override
  String toString() {
    return 'PlaybackConfiguration(sourceType: $sourceType, qualityLabel: $qualityLabel, videoUrl: $videoUrl, audioUrl: $audioUrl, manifestUrl: $manifestUrl, subtitles: $subtitles, headers: $headers, isLive: $isLive)';
  }
}

/// @nodoc
abstract mixin class _$PlaybackConfigurationCopyWith<$Res>
    implements $PlaybackConfigurationCopyWith<$Res> {
  factory _$PlaybackConfigurationCopyWith(_PlaybackConfiguration value,
          $Res Function(_PlaybackConfiguration) _then) =
      __$PlaybackConfigurationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MediaSourceType sourceType,
      String qualityLabel,
      String? videoUrl,
      String? audioUrl,
      String? manifestUrl,
      List<NewPipeSubtitle> subtitles,
      Map<String, String> headers,
      bool isLive});
}

/// @nodoc
class __$PlaybackConfigurationCopyWithImpl<$Res>
    implements _$PlaybackConfigurationCopyWith<$Res> {
  __$PlaybackConfigurationCopyWithImpl(this._self, this._then);

  final _PlaybackConfiguration _self;
  final $Res Function(_PlaybackConfiguration) _then;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceType = null,
    Object? qualityLabel = null,
    Object? videoUrl = freezed,
    Object? audioUrl = freezed,
    Object? manifestUrl = freezed,
    Object? subtitles = null,
    Object? headers = null,
    Object? isLive = null,
  }) {
    return _then(_PlaybackConfiguration(
      sourceType: null == sourceType
          ? _self.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as MediaSourceType,
      qualityLabel: null == qualityLabel
          ? _self.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _self.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _self.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      manifestUrl: freezed == manifestUrl
          ? _self.manifestUrl
          : manifestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitles: null == subtitles
          ? _self._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<NewPipeSubtitle>,
      headers: null == headers
          ? _self._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isLive: null == isLive
          ? _self.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
