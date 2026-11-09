// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainFailure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainFailure()';
  }
}

/// @nodoc
class $MainFailureCopyWith<$Res> {
  $MainFailureCopyWith(MainFailure _, $Res Function(MainFailure) __);
}

/// Adds pattern-matching-related methods to [MainFailure].
extension MainFailurePatterns on MainFailure {
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
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError() when networkError != null:
        return networkError(_that);
      case _ServerError() when serverError != null:
        return serverError(_that);
      case _NotFound() when notFound != null:
        return notFound(_that);
      case _ParseError() when parseError != null:
        return parseError(_that);
      case _RateLimited() when rateLimited != null:
        return rateLimited(_that);
      case _Timeout() when timeout != null:
        return timeout(_that);
      case _Unknown() when unknown != null:
        return unknown(_that);
      case _ClientFailure() when clientFailure != null:
        return clientFailure(_that);
      case _ServerFailure() when serverFailure != null:
        return serverFailure(_that);
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
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError():
        return networkError(_that);
      case _ServerError():
        return serverError(_that);
      case _NotFound():
        return notFound(_that);
      case _ParseError():
        return parseError(_that);
      case _RateLimited():
        return rateLimited(_that);
      case _Timeout():
        return timeout(_that);
      case _Unknown():
        return unknown(_that);
      case _ClientFailure():
        return clientFailure(_that);
      case _ServerFailure():
        return serverFailure(_that);
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
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError() when networkError != null:
        return networkError(_that);
      case _ServerError() when serverError != null:
        return serverError(_that);
      case _NotFound() when notFound != null:
        return notFound(_that);
      case _ParseError() when parseError != null:
        return parseError(_that);
      case _RateLimited() when rateLimited != null:
        return rateLimited(_that);
      case _Timeout() when timeout != null:
        return timeout(_that);
      case _Unknown() when unknown != null:
        return unknown(_that);
      case _ClientFailure() when clientFailure != null:
        return clientFailure(_that);
      case _ServerFailure() when serverFailure != null:
        return serverFailure(_that);
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
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError() when networkError != null:
        return networkError(_that.message);
      case _ServerError() when serverError != null:
        return serverError(_that.statusCode, _that.message);
      case _NotFound() when notFound != null:
        return notFound(_that.resource);
      case _ParseError() when parseError != null:
        return parseError(_that.message);
      case _RateLimited() when rateLimited != null:
        return rateLimited(_that.retryAfter);
      case _Timeout() when timeout != null:
        return timeout(_that.message);
      case _Unknown() when unknown != null:
        return unknown(_that.message);
      case _ClientFailure() when clientFailure != null:
        return clientFailure();
      case _ServerFailure() when serverFailure != null:
        return serverFailure();
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
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError():
        return networkError(_that.message);
      case _ServerError():
        return serverError(_that.statusCode, _that.message);
      case _NotFound():
        return notFound(_that.resource);
      case _ParseError():
        return parseError(_that.message);
      case _RateLimited():
        return rateLimited(_that.retryAfter);
      case _Timeout():
        return timeout(_that.message);
      case _Unknown():
        return unknown(_that.message);
      case _ClientFailure():
        return clientFailure();
      case _ServerFailure():
        return serverFailure();
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
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkError() when networkError != null:
        return networkError(_that.message);
      case _ServerError() when serverError != null:
        return serverError(_that.statusCode, _that.message);
      case _NotFound() when notFound != null:
        return notFound(_that.resource);
      case _ParseError() when parseError != null:
        return parseError(_that.message);
      case _RateLimited() when rateLimited != null:
        return rateLimited(_that.retryAfter);
      case _Timeout() when timeout != null:
        return timeout(_that.message);
      case _Unknown() when unknown != null:
        return unknown(_that.message);
      case _ClientFailure() when clientFailure != null:
        return clientFailure();
      case _ServerFailure() when serverFailure != null:
        return serverFailure();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NetworkError implements MainFailure {
  const _NetworkError({this.message});

  final String? message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NetworkErrorCopyWith<_NetworkError> get copyWith =>
      __$NetworkErrorCopyWithImpl<_NetworkError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MainFailure.networkError(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(
          _NetworkError value, $Res Function(_NetworkError) _then) =
      __$NetworkErrorCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$NetworkErrorCopyWithImpl<$Res>
    implements _$NetworkErrorCopyWith<$Res> {
  __$NetworkErrorCopyWithImpl(this._self, this._then);

  final _NetworkError _self;
  final $Res Function(_NetworkError) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_NetworkError(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ServerError implements MainFailure {
  const _ServerError({this.statusCode, this.message});

  final int? statusCode;
  final String? message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerError &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @override
  String toString() {
    return 'MainFailure.serverError(statusCode: $statusCode, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) _then) =
      __$ServerErrorCopyWithImpl;
  @useResult
  $Res call({int? statusCode, String? message});
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_ServerError(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _NotFound implements MainFailure {
  const _NotFound({this.resource});

  final String? resource;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotFoundCopyWith<_NotFound> get copyWith =>
      __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotFound &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @override
  String toString() {
    return 'MainFailure.notFound(resource: $resource)';
  }
}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) =
      __$NotFoundCopyWithImpl;
  @useResult
  $Res call({String? resource});
}

/// @nodoc
class __$NotFoundCopyWithImpl<$Res> implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_NotFound(
      resource: freezed == resource
          ? _self.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ParseError implements MainFailure {
  const _ParseError({this.message});

  final String? message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParseErrorCopyWith<_ParseError> get copyWith =>
      __$ParseErrorCopyWithImpl<_ParseError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParseError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MainFailure.parseError(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ParseErrorCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$ParseErrorCopyWith(
          _ParseError value, $Res Function(_ParseError) _then) =
      __$ParseErrorCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$ParseErrorCopyWithImpl<$Res> implements _$ParseErrorCopyWith<$Res> {
  __$ParseErrorCopyWithImpl(this._self, this._then);

  final _ParseError _self;
  final $Res Function(_ParseError) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ParseError(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _RateLimited implements MainFailure {
  const _RateLimited({this.retryAfter});

  final int? retryAfter;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateLimitedCopyWith<_RateLimited> get copyWith =>
      __$RateLimitedCopyWithImpl<_RateLimited>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateLimited &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter);

  @override
  String toString() {
    return 'MainFailure.rateLimited(retryAfter: $retryAfter)';
  }
}

/// @nodoc
abstract mixin class _$RateLimitedCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$RateLimitedCopyWith(
          _RateLimited value, $Res Function(_RateLimited) _then) =
      __$RateLimitedCopyWithImpl;
  @useResult
  $Res call({int? retryAfter});
}

/// @nodoc
class __$RateLimitedCopyWithImpl<$Res> implements _$RateLimitedCopyWith<$Res> {
  __$RateLimitedCopyWithImpl(this._self, this._then);

  final _RateLimited _self;
  final $Res Function(_RateLimited) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? retryAfter = freezed,
  }) {
    return _then(_RateLimited(
      retryAfter: freezed == retryAfter
          ? _self.retryAfter
          : retryAfter // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _Timeout implements MainFailure {
  const _Timeout({this.message});

  final String? message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeoutCopyWith<_Timeout> get copyWith =>
      __$TimeoutCopyWithImpl<_Timeout>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Timeout &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MainFailure.timeout(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$TimeoutCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$TimeoutCopyWith(_Timeout value, $Res Function(_Timeout) _then) =
      __$TimeoutCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$TimeoutCopyWithImpl<$Res> implements _$TimeoutCopyWith<$Res> {
  __$TimeoutCopyWithImpl(this._self, this._then);

  final _Timeout _self;
  final $Res Function(_Timeout) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Timeout(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Unknown implements MainFailure {
  const _Unknown({this.message});

  final String? message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unknown &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MainFailure.unknown(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) =
      __$UnknownCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res> implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(this._self, this._then);

  final _Unknown _self;
  final $Res Function(_Unknown) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Unknown(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ClientFailure implements MainFailure {
  const _ClientFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ClientFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainFailure.clientFailure()';
  }
}

/// @nodoc

class _ServerFailure implements MainFailure {
  const _ServerFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainFailure.serverFailure()';
  }
}

// dart format on
