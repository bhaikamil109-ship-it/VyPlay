// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_thumbnail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageThumbnail {
  String? get url;
  int? get width;
  int? get height;

  /// Only used for video thumbnails (quality: default, medium, high, etc.)
  String? get quality;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageThumbnailCopyWith<ImageThumbnail> get copyWith =>
      _$ImageThumbnailCopyWithImpl<ImageThumbnail>(
          this as ImageThumbnail, _$identity);

  /// Serializes this ImageThumbnail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageThumbnail &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height, quality);

  @override
  String toString() {
    return 'ImageThumbnail(url: $url, width: $width, height: $height, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $ImageThumbnailCopyWith<$Res> {
  factory $ImageThumbnailCopyWith(
          ImageThumbnail value, $Res Function(ImageThumbnail) _then) =
      _$ImageThumbnailCopyWithImpl;
  @useResult
  $Res call({String? url, int? width, int? height, String? quality});
}

/// @nodoc
class _$ImageThumbnailCopyWithImpl<$Res>
    implements $ImageThumbnailCopyWith<$Res> {
  _$ImageThumbnailCopyWithImpl(this._self, this._then);

  final ImageThumbnail _self;
  final $Res Function(ImageThumbnail) _then;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quality = freezed,
  }) {
    return _then(_self.copyWith(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ImageThumbnail].
extension ImageThumbnailPatterns on ImageThumbnail {
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
    TResult Function(_ImageThumbnail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail() when $default != null:
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
    TResult Function(_ImageThumbnail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail():
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
    TResult? Function(_ImageThumbnail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail() when $default != null:
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
    TResult Function(String? url, int? width, int? height, String? quality)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail() when $default != null:
        return $default(_that.url, _that.width, _that.height, _that.quality);
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
    TResult Function(String? url, int? width, int? height, String? quality)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail():
        return $default(_that.url, _that.width, _that.height, _that.quality);
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
    TResult? Function(String? url, int? width, int? height, String? quality)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageThumbnail() when $default != null:
        return $default(_that.url, _that.width, _that.height, _that.quality);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ImageThumbnail implements ImageThumbnail {
  const _ImageThumbnail({this.url, this.width, this.height, this.quality});
  factory _ImageThumbnail.fromJson(Map<String, dynamic> json) =>
      _$ImageThumbnailFromJson(json);

  @override
  final String? url;
  @override
  final int? width;
  @override
  final int? height;

  /// Only used for video thumbnails (quality: default, medium, high, etc.)
  @override
  final String? quality;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageThumbnailCopyWith<_ImageThumbnail> get copyWith =>
      __$ImageThumbnailCopyWithImpl<_ImageThumbnail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageThumbnailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageThumbnail &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height, quality);

  @override
  String toString() {
    return 'ImageThumbnail(url: $url, width: $width, height: $height, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class _$ImageThumbnailCopyWith<$Res>
    implements $ImageThumbnailCopyWith<$Res> {
  factory _$ImageThumbnailCopyWith(
          _ImageThumbnail value, $Res Function(_ImageThumbnail) _then) =
      __$ImageThumbnailCopyWithImpl;
  @override
  @useResult
  $Res call({String? url, int? width, int? height, String? quality});
}

/// @nodoc
class __$ImageThumbnailCopyWithImpl<$Res>
    implements _$ImageThumbnailCopyWith<$Res> {
  __$ImageThumbnailCopyWithImpl(this._self, this._then);

  final _ImageThumbnail _self;
  final $Res Function(_ImageThumbnail) _then;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quality = freezed,
  }) {
    return _then(_ImageThumbnail(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
