// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistEvent {
  String get playlistId;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistEventCopyWith<PlaylistEvent> get copyWith =>
      _$PlaylistEventCopyWithImpl<PlaylistEvent>(
          this as PlaylistEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistEvent &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId);

  @override
  String toString() {
    return 'PlaylistEvent(playlistId: $playlistId)';
  }
}

/// @nodoc
abstract mixin class $PlaylistEventCopyWith<$Res> {
  factory $PlaylistEventCopyWith(
          PlaylistEvent value, $Res Function(PlaylistEvent) _then) =
      _$PlaylistEventCopyWithImpl;
  @useResult
  $Res call({String playlistId});
}

/// @nodoc
class _$PlaylistEventCopyWithImpl<$Res>
    implements $PlaylistEventCopyWith<$Res> {
  _$PlaylistEventCopyWithImpl(this._self, this._then);

  final PlaylistEvent _self;
  final $Res Function(PlaylistEvent) _then;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistId = null,
  }) {
    return _then(_self.copyWith(
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaylistEvent].
extension PlaylistEventPatterns on PlaylistEvent {
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
    TResult Function(GetPlaylistData value)? getPlaylistData,
    TResult Function(GetMorePlaylistVideos value)? getMorePlaylistVideos,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData() when getPlaylistData != null:
        return getPlaylistData(_that);
      case GetMorePlaylistVideos() when getMorePlaylistVideos != null:
        return getMorePlaylistVideos(_that);
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
    required TResult Function(GetPlaylistData value) getPlaylistData,
    required TResult Function(GetMorePlaylistVideos value)
        getMorePlaylistVideos,
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData():
        return getPlaylistData(_that);
      case GetMorePlaylistVideos():
        return getMorePlaylistVideos(_that);
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
    TResult? Function(GetPlaylistData value)? getPlaylistData,
    TResult? Function(GetMorePlaylistVideos value)? getMorePlaylistVideos,
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData() when getPlaylistData != null:
        return getPlaylistData(_that);
      case GetMorePlaylistVideos() when getMorePlaylistVideos != null:
        return getMorePlaylistVideos(_that);
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
    TResult Function(String playlistId, String serviceType)? getPlaylistData,
    TResult Function(String playlistId, String? nextPage)?
        getMorePlaylistVideos,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData() when getPlaylistData != null:
        return getPlaylistData(_that.playlistId, _that.serviceType);
      case GetMorePlaylistVideos() when getMorePlaylistVideos != null:
        return getMorePlaylistVideos(_that.playlistId, _that.nextPage);
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
    required TResult Function(String playlistId, String serviceType)
        getPlaylistData,
    required TResult Function(String playlistId, String? nextPage)
        getMorePlaylistVideos,
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData():
        return getPlaylistData(_that.playlistId, _that.serviceType);
      case GetMorePlaylistVideos():
        return getMorePlaylistVideos(_that.playlistId, _that.nextPage);
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
    TResult? Function(String playlistId, String serviceType)? getPlaylistData,
    TResult? Function(String playlistId, String? nextPage)?
        getMorePlaylistVideos,
  }) {
    final _that = this;
    switch (_that) {
      case GetPlaylistData() when getPlaylistData != null:
        return getPlaylistData(_that.playlistId, _that.serviceType);
      case GetMorePlaylistVideos() when getMorePlaylistVideos != null:
        return getMorePlaylistVideos(_that.playlistId, _that.nextPage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetPlaylistData implements PlaylistEvent {
  const GetPlaylistData({required this.playlistId, required this.serviceType});

  @override
  final String playlistId;
  final String serviceType;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPlaylistDataCopyWith<GetPlaylistData> get copyWith =>
      _$GetPlaylistDataCopyWithImpl<GetPlaylistData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPlaylistData &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId, serviceType);

  @override
  String toString() {
    return 'PlaylistEvent.getPlaylistData(playlistId: $playlistId, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetPlaylistDataCopyWith<$Res>
    implements $PlaylistEventCopyWith<$Res> {
  factory $GetPlaylistDataCopyWith(
          GetPlaylistData value, $Res Function(GetPlaylistData) _then) =
      _$GetPlaylistDataCopyWithImpl;
  @override
  @useResult
  $Res call({String playlistId, String serviceType});
}

/// @nodoc
class _$GetPlaylistDataCopyWithImpl<$Res>
    implements $GetPlaylistDataCopyWith<$Res> {
  _$GetPlaylistDataCopyWithImpl(this._self, this._then);

  final GetPlaylistData _self;
  final $Res Function(GetPlaylistData) _then;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playlistId = null,
    Object? serviceType = null,
  }) {
    return _then(GetPlaylistData(
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMorePlaylistVideos implements PlaylistEvent {
  const GetMorePlaylistVideos({required this.playlistId, this.nextPage});

  @override
  final String playlistId;
  final String? nextPage;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMorePlaylistVideosCopyWith<GetMorePlaylistVideos> get copyWith =>
      _$GetMorePlaylistVideosCopyWithImpl<GetMorePlaylistVideos>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMorePlaylistVideos &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistId, nextPage);

  @override
  String toString() {
    return 'PlaylistEvent.getMorePlaylistVideos(playlistId: $playlistId, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMorePlaylistVideosCopyWith<$Res>
    implements $PlaylistEventCopyWith<$Res> {
  factory $GetMorePlaylistVideosCopyWith(GetMorePlaylistVideos value,
          $Res Function(GetMorePlaylistVideos) _then) =
      _$GetMorePlaylistVideosCopyWithImpl;
  @override
  @useResult
  $Res call({String playlistId, String? nextPage});
}

/// @nodoc
class _$GetMorePlaylistVideosCopyWithImpl<$Res>
    implements $GetMorePlaylistVideosCopyWith<$Res> {
  _$GetMorePlaylistVideosCopyWithImpl(this._self, this._then);

  final GetMorePlaylistVideos _self;
  final $Res Function(GetMorePlaylistVideos) _then;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playlistId = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMorePlaylistVideos(
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PlaylistState {
  ApiStatus get fetchStatus;
  ApiStatus get moreFetchStatus;
  bool get isMoreFetchCompleted;
  PlaylistResp? get pipedPlaylistResp;
  InvidiousPlaylistResp? get invidiousPlaylistResp;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      _$PlaylistStateCopyWithImpl<PlaylistState>(
          this as PlaylistState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistState &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            (identical(other.moreFetchStatus, moreFetchStatus) ||
                other.moreFetchStatus == moreFetchStatus) &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.pipedPlaylistResp, pipedPlaylistResp) ||
                other.pipedPlaylistResp == pipedPlaylistResp) &&
            (identical(other.invidiousPlaylistResp, invidiousPlaylistResp) ||
                other.invidiousPlaylistResp == invidiousPlaylistResp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchStatus, moreFetchStatus,
      isMoreFetchCompleted, pipedPlaylistResp, invidiousPlaylistResp);

  @override
  String toString() {
    return 'PlaylistState(fetchStatus: $fetchStatus, moreFetchStatus: $moreFetchStatus, isMoreFetchCompleted: $isMoreFetchCompleted, pipedPlaylistResp: $pipedPlaylistResp, invidiousPlaylistResp: $invidiousPlaylistResp)';
  }
}

/// @nodoc
abstract mixin class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) _then) =
      _$PlaylistStateCopyWithImpl;
  @useResult
  $Res call(
      {ApiStatus fetchStatus,
      ApiStatus moreFetchStatus,
      bool isMoreFetchCompleted,
      PlaylistResp? pipedPlaylistResp,
      InvidiousPlaylistResp? invidiousPlaylistResp});
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._self, this._then);

  final PlaylistState _self;
  final $Res Function(PlaylistState) _then;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchStatus = null,
    Object? moreFetchStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? pipedPlaylistResp = freezed,
    Object? invidiousPlaylistResp = freezed,
  }) {
    return _then(_self.copyWith(
      fetchStatus: null == fetchStatus
          ? _self.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      moreFetchStatus: null == moreFetchStatus
          ? _self.moreFetchStatus
          : moreFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pipedPlaylistResp: freezed == pipedPlaylistResp
          ? _self.pipedPlaylistResp
          : pipedPlaylistResp // ignore: cast_nullable_to_non_nullable
              as PlaylistResp?,
      invidiousPlaylistResp: freezed == invidiousPlaylistResp
          ? _self.invidiousPlaylistResp
          : invidiousPlaylistResp // ignore: cast_nullable_to_non_nullable
              as InvidiousPlaylistResp?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaylistState].
extension PlaylistStatePatterns on PlaylistState {
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
    TResult Function(_PlaylistState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
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
    TResult Function(_PlaylistState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState():
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
    TResult? Function(_PlaylistState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
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
            ApiStatus fetchStatus,
            ApiStatus moreFetchStatus,
            bool isMoreFetchCompleted,
            PlaylistResp? pipedPlaylistResp,
            InvidiousPlaylistResp? invidiousPlaylistResp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
        return $default(
            _that.fetchStatus,
            _that.moreFetchStatus,
            _that.isMoreFetchCompleted,
            _that.pipedPlaylistResp,
            _that.invidiousPlaylistResp);
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
            ApiStatus fetchStatus,
            ApiStatus moreFetchStatus,
            bool isMoreFetchCompleted,
            PlaylistResp? pipedPlaylistResp,
            InvidiousPlaylistResp? invidiousPlaylistResp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState():
        return $default(
            _that.fetchStatus,
            _that.moreFetchStatus,
            _that.isMoreFetchCompleted,
            _that.pipedPlaylistResp,
            _that.invidiousPlaylistResp);
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
            ApiStatus fetchStatus,
            ApiStatus moreFetchStatus,
            bool isMoreFetchCompleted,
            PlaylistResp? pipedPlaylistResp,
            InvidiousPlaylistResp? invidiousPlaylistResp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
        return $default(
            _that.fetchStatus,
            _that.moreFetchStatus,
            _that.isMoreFetchCompleted,
            _that.pipedPlaylistResp,
            _that.invidiousPlaylistResp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaylistState implements PlaylistState {
  _PlaylistState(
      {required this.fetchStatus,
      required this.moreFetchStatus,
      required this.isMoreFetchCompleted,
      this.pipedPlaylistResp,
      this.invidiousPlaylistResp});

  @override
  final ApiStatus fetchStatus;
  @override
  final ApiStatus moreFetchStatus;
  @override
  final bool isMoreFetchCompleted;
  @override
  final PlaylistResp? pipedPlaylistResp;
  @override
  final InvidiousPlaylistResp? invidiousPlaylistResp;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistStateCopyWith<_PlaylistState> get copyWith =>
      __$PlaylistStateCopyWithImpl<_PlaylistState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaylistState &&
            (identical(other.fetchStatus, fetchStatus) ||
                other.fetchStatus == fetchStatus) &&
            (identical(other.moreFetchStatus, moreFetchStatus) ||
                other.moreFetchStatus == moreFetchStatus) &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.pipedPlaylistResp, pipedPlaylistResp) ||
                other.pipedPlaylistResp == pipedPlaylistResp) &&
            (identical(other.invidiousPlaylistResp, invidiousPlaylistResp) ||
                other.invidiousPlaylistResp == invidiousPlaylistResp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchStatus, moreFetchStatus,
      isMoreFetchCompleted, pipedPlaylistResp, invidiousPlaylistResp);

  @override
  String toString() {
    return 'PlaylistState(fetchStatus: $fetchStatus, moreFetchStatus: $moreFetchStatus, isMoreFetchCompleted: $isMoreFetchCompleted, pipedPlaylistResp: $pipedPlaylistResp, invidiousPlaylistResp: $invidiousPlaylistResp)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistStateCopyWith<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  factory _$PlaylistStateCopyWith(
          _PlaylistState value, $Res Function(_PlaylistState) _then) =
      __$PlaylistStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ApiStatus fetchStatus,
      ApiStatus moreFetchStatus,
      bool isMoreFetchCompleted,
      PlaylistResp? pipedPlaylistResp,
      InvidiousPlaylistResp? invidiousPlaylistResp});
}

/// @nodoc
class __$PlaylistStateCopyWithImpl<$Res>
    implements _$PlaylistStateCopyWith<$Res> {
  __$PlaylistStateCopyWithImpl(this._self, this._then);

  final _PlaylistState _self;
  final $Res Function(_PlaylistState) _then;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fetchStatus = null,
    Object? moreFetchStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? pipedPlaylistResp = freezed,
    Object? invidiousPlaylistResp = freezed,
  }) {
    return _then(_PlaylistState(
      fetchStatus: null == fetchStatus
          ? _self.fetchStatus
          : fetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      moreFetchStatus: null == moreFetchStatus
          ? _self.moreFetchStatus
          : moreFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pipedPlaylistResp: freezed == pipedPlaylistResp
          ? _self.pipedPlaylistResp
          : pipedPlaylistResp // ignore: cast_nullable_to_non_nullable
              as PlaylistResp?,
      invidiousPlaylistResp: freezed == invidiousPlaylistResp
          ? _self.invidiousPlaylistResp
          : invidiousPlaylistResp // ignore: cast_nullable_to_non_nullable
              as InvidiousPlaylistResp?,
    ));
  }
}

// dart format on
