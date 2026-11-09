// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SavedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SavedEvent()';
  }
}

/// @nodoc
class $SavedEventCopyWith<$Res> {
  $SavedEventCopyWith(SavedEvent _, $Res Function(SavedEvent) __);
}

/// Adds pattern-matching-related methods to [SavedEvent].
extension SavedEventPatterns on SavedEvent {
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
    TResult Function(AddVideoInfo value)? addVideoInfo,
    TResult Function(DeleteVideoInfo value)? deleteVideoInfo,
    TResult Function(GetAllVideoInfoList value)? getAllVideoInfoList,
    TResult Function(CheckVideoInfo value)? checkVideoInfo,
    TResult Function(TrackVideoWatch value)? trackVideoWatch,
    TResult Function(TrackSearch value)? trackSearch,
    TResult Function(UpdatePlaybackPosition value)? updatePlaybackPosition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo() when addVideoInfo != null:
        return addVideoInfo(_that);
      case DeleteVideoInfo() when deleteVideoInfo != null:
        return deleteVideoInfo(_that);
      case GetAllVideoInfoList() when getAllVideoInfoList != null:
        return getAllVideoInfoList(_that);
      case CheckVideoInfo() when checkVideoInfo != null:
        return checkVideoInfo(_that);
      case TrackVideoWatch() when trackVideoWatch != null:
        return trackVideoWatch(_that);
      case TrackSearch() when trackSearch != null:
        return trackSearch(_that);
      case UpdatePlaybackPosition() when updatePlaybackPosition != null:
        return updatePlaybackPosition(_that);
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
    required TResult Function(AddVideoInfo value) addVideoInfo,
    required TResult Function(DeleteVideoInfo value) deleteVideoInfo,
    required TResult Function(GetAllVideoInfoList value) getAllVideoInfoList,
    required TResult Function(CheckVideoInfo value) checkVideoInfo,
    required TResult Function(TrackVideoWatch value) trackVideoWatch,
    required TResult Function(TrackSearch value) trackSearch,
    required TResult Function(UpdatePlaybackPosition value)
        updatePlaybackPosition,
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo():
        return addVideoInfo(_that);
      case DeleteVideoInfo():
        return deleteVideoInfo(_that);
      case GetAllVideoInfoList():
        return getAllVideoInfoList(_that);
      case CheckVideoInfo():
        return checkVideoInfo(_that);
      case TrackVideoWatch():
        return trackVideoWatch(_that);
      case TrackSearch():
        return trackSearch(_that);
      case UpdatePlaybackPosition():
        return updatePlaybackPosition(_that);
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
    TResult? Function(AddVideoInfo value)? addVideoInfo,
    TResult? Function(DeleteVideoInfo value)? deleteVideoInfo,
    TResult? Function(GetAllVideoInfoList value)? getAllVideoInfoList,
    TResult? Function(CheckVideoInfo value)? checkVideoInfo,
    TResult? Function(TrackVideoWatch value)? trackVideoWatch,
    TResult? Function(TrackSearch value)? trackSearch,
    TResult? Function(UpdatePlaybackPosition value)? updatePlaybackPosition,
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo() when addVideoInfo != null:
        return addVideoInfo(_that);
      case DeleteVideoInfo() when deleteVideoInfo != null:
        return deleteVideoInfo(_that);
      case GetAllVideoInfoList() when getAllVideoInfoList != null:
        return getAllVideoInfoList(_that);
      case CheckVideoInfo() when checkVideoInfo != null:
        return checkVideoInfo(_that);
      case TrackVideoWatch() when trackVideoWatch != null:
        return trackVideoWatch(_that);
      case TrackSearch() when trackSearch != null:
        return trackSearch(_that);
      case UpdatePlaybackPosition() when updatePlaybackPosition != null:
        return updatePlaybackPosition(_that);
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
    TResult Function(LocalStoreVideoInfo videoInfo, String profileName)?
        addVideoInfo,
    TResult Function(String id, String profileName)? deleteVideoInfo,
    TResult Function(String profileName)? getAllVideoInfoList,
    TResult Function(String id, String profileName)? checkVideoInfo,
    TResult Function(String videoId)? trackVideoWatch,
    TResult Function(String query)? trackSearch,
    TResult Function(LocalStoreVideoInfo videoInfo, String profileName)?
        updatePlaybackPosition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo() when addVideoInfo != null:
        return addVideoInfo(_that.videoInfo, _that.profileName);
      case DeleteVideoInfo() when deleteVideoInfo != null:
        return deleteVideoInfo(_that.id, _that.profileName);
      case GetAllVideoInfoList() when getAllVideoInfoList != null:
        return getAllVideoInfoList(_that.profileName);
      case CheckVideoInfo() when checkVideoInfo != null:
        return checkVideoInfo(_that.id, _that.profileName);
      case TrackVideoWatch() when trackVideoWatch != null:
        return trackVideoWatch(_that.videoId);
      case TrackSearch() when trackSearch != null:
        return trackSearch(_that.query);
      case UpdatePlaybackPosition() when updatePlaybackPosition != null:
        return updatePlaybackPosition(_that.videoInfo, _that.profileName);
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
    required TResult Function(LocalStoreVideoInfo videoInfo, String profileName)
        addVideoInfo,
    required TResult Function(String id, String profileName) deleteVideoInfo,
    required TResult Function(String profileName) getAllVideoInfoList,
    required TResult Function(String id, String profileName) checkVideoInfo,
    required TResult Function(String videoId) trackVideoWatch,
    required TResult Function(String query) trackSearch,
    required TResult Function(LocalStoreVideoInfo videoInfo, String profileName)
        updatePlaybackPosition,
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo():
        return addVideoInfo(_that.videoInfo, _that.profileName);
      case DeleteVideoInfo():
        return deleteVideoInfo(_that.id, _that.profileName);
      case GetAllVideoInfoList():
        return getAllVideoInfoList(_that.profileName);
      case CheckVideoInfo():
        return checkVideoInfo(_that.id, _that.profileName);
      case TrackVideoWatch():
        return trackVideoWatch(_that.videoId);
      case TrackSearch():
        return trackSearch(_that.query);
      case UpdatePlaybackPosition():
        return updatePlaybackPosition(_that.videoInfo, _that.profileName);
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
    TResult? Function(LocalStoreVideoInfo videoInfo, String profileName)?
        addVideoInfo,
    TResult? Function(String id, String profileName)? deleteVideoInfo,
    TResult? Function(String profileName)? getAllVideoInfoList,
    TResult? Function(String id, String profileName)? checkVideoInfo,
    TResult? Function(String videoId)? trackVideoWatch,
    TResult? Function(String query)? trackSearch,
    TResult? Function(LocalStoreVideoInfo videoInfo, String profileName)?
        updatePlaybackPosition,
  }) {
    final _that = this;
    switch (_that) {
      case AddVideoInfo() when addVideoInfo != null:
        return addVideoInfo(_that.videoInfo, _that.profileName);
      case DeleteVideoInfo() when deleteVideoInfo != null:
        return deleteVideoInfo(_that.id, _that.profileName);
      case GetAllVideoInfoList() when getAllVideoInfoList != null:
        return getAllVideoInfoList(_that.profileName);
      case CheckVideoInfo() when checkVideoInfo != null:
        return checkVideoInfo(_that.id, _that.profileName);
      case TrackVideoWatch() when trackVideoWatch != null:
        return trackVideoWatch(_that.videoId);
      case TrackSearch() when trackSearch != null:
        return trackSearch(_that.query);
      case UpdatePlaybackPosition() when updatePlaybackPosition != null:
        return updatePlaybackPosition(_that.videoInfo, _that.profileName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AddVideoInfo implements SavedEvent {
  const AddVideoInfo({required this.videoInfo, this.profileName = 'default'});

  final LocalStoreVideoInfo videoInfo;
  @JsonKey()
  final String profileName;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddVideoInfoCopyWith<AddVideoInfo> get copyWith =>
      _$AddVideoInfoCopyWithImpl<AddVideoInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddVideoInfo &&
            (identical(other.videoInfo, videoInfo) ||
                other.videoInfo == videoInfo) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoInfo, profileName);

  @override
  String toString() {
    return 'SavedEvent.addVideoInfo(videoInfo: $videoInfo, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $AddVideoInfoCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $AddVideoInfoCopyWith(
          AddVideoInfo value, $Res Function(AddVideoInfo) _then) =
      _$AddVideoInfoCopyWithImpl;
  @useResult
  $Res call({LocalStoreVideoInfo videoInfo, String profileName});
}

/// @nodoc
class _$AddVideoInfoCopyWithImpl<$Res> implements $AddVideoInfoCopyWith<$Res> {
  _$AddVideoInfoCopyWithImpl(this._self, this._then);

  final AddVideoInfo _self;
  final $Res Function(AddVideoInfo) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoInfo = null,
    Object? profileName = null,
  }) {
    return _then(AddVideoInfo(
      videoInfo: null == videoInfo
          ? _self.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as LocalStoreVideoInfo,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteVideoInfo implements SavedEvent {
  const DeleteVideoInfo({required this.id, this.profileName = 'default'});

  final String id;
  @JsonKey()
  final String profileName;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteVideoInfoCopyWith<DeleteVideoInfo> get copyWith =>
      _$DeleteVideoInfoCopyWithImpl<DeleteVideoInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteVideoInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profileName);

  @override
  String toString() {
    return 'SavedEvent.deleteVideoInfo(id: $id, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $DeleteVideoInfoCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $DeleteVideoInfoCopyWith(
          DeleteVideoInfo value, $Res Function(DeleteVideoInfo) _then) =
      _$DeleteVideoInfoCopyWithImpl;
  @useResult
  $Res call({String id, String profileName});
}

/// @nodoc
class _$DeleteVideoInfoCopyWithImpl<$Res>
    implements $DeleteVideoInfoCopyWith<$Res> {
  _$DeleteVideoInfoCopyWithImpl(this._self, this._then);

  final DeleteVideoInfo _self;
  final $Res Function(DeleteVideoInfo) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? profileName = null,
  }) {
    return _then(DeleteVideoInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetAllVideoInfoList implements SavedEvent {
  const GetAllVideoInfoList({this.profileName = 'default'});

  @JsonKey()
  final String profileName;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetAllVideoInfoListCopyWith<GetAllVideoInfoList> get copyWith =>
      _$GetAllVideoInfoListCopyWithImpl<GetAllVideoInfoList>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetAllVideoInfoList &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SavedEvent.getAllVideoInfoList(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $GetAllVideoInfoListCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $GetAllVideoInfoListCopyWith(
          GetAllVideoInfoList value, $Res Function(GetAllVideoInfoList) _then) =
      _$GetAllVideoInfoListCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$GetAllVideoInfoListCopyWithImpl<$Res>
    implements $GetAllVideoInfoListCopyWith<$Res> {
  _$GetAllVideoInfoListCopyWithImpl(this._self, this._then);

  final GetAllVideoInfoList _self;
  final $Res Function(GetAllVideoInfoList) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(GetAllVideoInfoList(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CheckVideoInfo implements SavedEvent {
  const CheckVideoInfo({required this.id, this.profileName = 'default'});

  final String id;
  @JsonKey()
  final String profileName;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckVideoInfoCopyWith<CheckVideoInfo> get copyWith =>
      _$CheckVideoInfoCopyWithImpl<CheckVideoInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckVideoInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profileName);

  @override
  String toString() {
    return 'SavedEvent.checkVideoInfo(id: $id, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $CheckVideoInfoCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $CheckVideoInfoCopyWith(
          CheckVideoInfo value, $Res Function(CheckVideoInfo) _then) =
      _$CheckVideoInfoCopyWithImpl;
  @useResult
  $Res call({String id, String profileName});
}

/// @nodoc
class _$CheckVideoInfoCopyWithImpl<$Res>
    implements $CheckVideoInfoCopyWith<$Res> {
  _$CheckVideoInfoCopyWithImpl(this._self, this._then);

  final CheckVideoInfo _self;
  final $Res Function(CheckVideoInfo) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? profileName = null,
  }) {
    return _then(CheckVideoInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TrackVideoWatch implements SavedEvent {
  const TrackVideoWatch({required this.videoId});

  final String videoId;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackVideoWatchCopyWith<TrackVideoWatch> get copyWith =>
      _$TrackVideoWatchCopyWithImpl<TrackVideoWatch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackVideoWatch &&
            (identical(other.videoId, videoId) || other.videoId == videoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId);

  @override
  String toString() {
    return 'SavedEvent.trackVideoWatch(videoId: $videoId)';
  }
}

/// @nodoc
abstract mixin class $TrackVideoWatchCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $TrackVideoWatchCopyWith(
          TrackVideoWatch value, $Res Function(TrackVideoWatch) _then) =
      _$TrackVideoWatchCopyWithImpl;
  @useResult
  $Res call({String videoId});
}

/// @nodoc
class _$TrackVideoWatchCopyWithImpl<$Res>
    implements $TrackVideoWatchCopyWith<$Res> {
  _$TrackVideoWatchCopyWithImpl(this._self, this._then);

  final TrackVideoWatch _self;
  final $Res Function(TrackVideoWatch) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
  }) {
    return _then(TrackVideoWatch(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TrackSearch implements SavedEvent {
  const TrackSearch({required this.query});

  final String query;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackSearchCopyWith<TrackSearch> get copyWith =>
      _$TrackSearchCopyWithImpl<TrackSearch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackSearch &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SavedEvent.trackSearch(query: $query)';
  }
}

/// @nodoc
abstract mixin class $TrackSearchCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $TrackSearchCopyWith(
          TrackSearch value, $Res Function(TrackSearch) _then) =
      _$TrackSearchCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$TrackSearchCopyWithImpl<$Res> implements $TrackSearchCopyWith<$Res> {
  _$TrackSearchCopyWithImpl(this._self, this._then);

  final TrackSearch _self;
  final $Res Function(TrackSearch) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(TrackSearch(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdatePlaybackPosition implements SavedEvent {
  const UpdatePlaybackPosition(
      {required this.videoInfo, this.profileName = 'default'});

  final LocalStoreVideoInfo videoInfo;
  @JsonKey()
  final String profileName;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePlaybackPositionCopyWith<UpdatePlaybackPosition> get copyWith =>
      _$UpdatePlaybackPositionCopyWithImpl<UpdatePlaybackPosition>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePlaybackPosition &&
            (identical(other.videoInfo, videoInfo) ||
                other.videoInfo == videoInfo) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoInfo, profileName);

  @override
  String toString() {
    return 'SavedEvent.updatePlaybackPosition(videoInfo: $videoInfo, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $UpdatePlaybackPositionCopyWith<$Res>
    implements $SavedEventCopyWith<$Res> {
  factory $UpdatePlaybackPositionCopyWith(UpdatePlaybackPosition value,
          $Res Function(UpdatePlaybackPosition) _then) =
      _$UpdatePlaybackPositionCopyWithImpl;
  @useResult
  $Res call({LocalStoreVideoInfo videoInfo, String profileName});
}

/// @nodoc
class _$UpdatePlaybackPositionCopyWithImpl<$Res>
    implements $UpdatePlaybackPositionCopyWith<$Res> {
  _$UpdatePlaybackPositionCopyWithImpl(this._self, this._then);

  final UpdatePlaybackPosition _self;
  final $Res Function(UpdatePlaybackPosition) _then;

  /// Create a copy of SavedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoInfo = null,
    Object? profileName = null,
  }) {
    return _then(UpdatePlaybackPosition(
      videoInfo: null == videoInfo
          ? _self.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as LocalStoreVideoInfo,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SavedState {
  ApiStatus get savedVideosFetchStatus;
  LocalStoreVideoInfo? get videoInfo;
  List<LocalStoreVideoInfo> get localSavedVideos;
  List<LocalStoreVideoInfo> get localSavedHistoryVideos;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedStateCopyWith<SavedState> get copyWith =>
      _$SavedStateCopyWithImpl<SavedState>(this as SavedState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedState &&
            (identical(other.savedVideosFetchStatus, savedVideosFetchStatus) ||
                other.savedVideosFetchStatus == savedVideosFetchStatus) &&
            (identical(other.videoInfo, videoInfo) ||
                other.videoInfo == videoInfo) &&
            const DeepCollectionEquality()
                .equals(other.localSavedVideos, localSavedVideos) &&
            const DeepCollectionEquality().equals(
                other.localSavedHistoryVideos, localSavedHistoryVideos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      savedVideosFetchStatus,
      videoInfo,
      const DeepCollectionEquality().hash(localSavedVideos),
      const DeepCollectionEquality().hash(localSavedHistoryVideos));

  @override
  String toString() {
    return 'SavedState(savedVideosFetchStatus: $savedVideosFetchStatus, videoInfo: $videoInfo, localSavedVideos: $localSavedVideos, localSavedHistoryVideos: $localSavedHistoryVideos)';
  }
}

/// @nodoc
abstract mixin class $SavedStateCopyWith<$Res> {
  factory $SavedStateCopyWith(
          SavedState value, $Res Function(SavedState) _then) =
      _$SavedStateCopyWithImpl;
  @useResult
  $Res call(
      {ApiStatus savedVideosFetchStatus,
      LocalStoreVideoInfo? videoInfo,
      List<LocalStoreVideoInfo> localSavedVideos,
      List<LocalStoreVideoInfo> localSavedHistoryVideos});
}

/// @nodoc
class _$SavedStateCopyWithImpl<$Res> implements $SavedStateCopyWith<$Res> {
  _$SavedStateCopyWithImpl(this._self, this._then);

  final SavedState _self;
  final $Res Function(SavedState) _then;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedVideosFetchStatus = null,
    Object? videoInfo = freezed,
    Object? localSavedVideos = null,
    Object? localSavedHistoryVideos = null,
  }) {
    return _then(_self.copyWith(
      savedVideosFetchStatus: null == savedVideosFetchStatus
          ? _self.savedVideosFetchStatus
          : savedVideosFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      videoInfo: freezed == videoInfo
          ? _self.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as LocalStoreVideoInfo?,
      localSavedVideos: null == localSavedVideos
          ? _self.localSavedVideos
          : localSavedVideos // ignore: cast_nullable_to_non_nullable
              as List<LocalStoreVideoInfo>,
      localSavedHistoryVideos: null == localSavedHistoryVideos
          ? _self.localSavedHistoryVideos
          : localSavedHistoryVideos // ignore: cast_nullable_to_non_nullable
              as List<LocalStoreVideoInfo>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SavedState].
extension SavedStatePatterns on SavedState {
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
            ApiStatus savedVideosFetchStatus,
            LocalStoreVideoInfo? videoInfo,
            List<LocalStoreVideoInfo> localSavedVideos,
            List<LocalStoreVideoInfo> localSavedHistoryVideos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.savedVideosFetchStatus, _that.videoInfo,
            _that.localSavedVideos, _that.localSavedHistoryVideos);
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
            ApiStatus savedVideosFetchStatus,
            LocalStoreVideoInfo? videoInfo,
            List<LocalStoreVideoInfo> localSavedVideos,
            List<LocalStoreVideoInfo> localSavedHistoryVideos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that.savedVideosFetchStatus, _that.videoInfo,
            _that.localSavedVideos, _that.localSavedHistoryVideos);
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
            ApiStatus savedVideosFetchStatus,
            LocalStoreVideoInfo? videoInfo,
            List<LocalStoreVideoInfo> localSavedVideos,
            List<LocalStoreVideoInfo> localSavedHistoryVideos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.savedVideosFetchStatus, _that.videoInfo,
            _that.localSavedVideos, _that.localSavedHistoryVideos);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SavedState {
  const _Initial(
      {required this.savedVideosFetchStatus,
      required this.videoInfo,
      required final List<LocalStoreVideoInfo> localSavedVideos,
      required final List<LocalStoreVideoInfo> localSavedHistoryVideos})
      : _localSavedVideos = localSavedVideos,
        _localSavedHistoryVideos = localSavedHistoryVideos;

  @override
  final ApiStatus savedVideosFetchStatus;
  @override
  final LocalStoreVideoInfo? videoInfo;
  final List<LocalStoreVideoInfo> _localSavedVideos;
  @override
  List<LocalStoreVideoInfo> get localSavedVideos {
    if (_localSavedVideos is EqualUnmodifiableListView)
      return _localSavedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localSavedVideos);
  }

  final List<LocalStoreVideoInfo> _localSavedHistoryVideos;
  @override
  List<LocalStoreVideoInfo> get localSavedHistoryVideos {
    if (_localSavedHistoryVideos is EqualUnmodifiableListView)
      return _localSavedHistoryVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localSavedHistoryVideos);
  }

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.savedVideosFetchStatus, savedVideosFetchStatus) ||
                other.savedVideosFetchStatus == savedVideosFetchStatus) &&
            (identical(other.videoInfo, videoInfo) ||
                other.videoInfo == videoInfo) &&
            const DeepCollectionEquality()
                .equals(other._localSavedVideos, _localSavedVideos) &&
            const DeepCollectionEquality().equals(
                other._localSavedHistoryVideos, _localSavedHistoryVideos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      savedVideosFetchStatus,
      videoInfo,
      const DeepCollectionEquality().hash(_localSavedVideos),
      const DeepCollectionEquality().hash(_localSavedHistoryVideos));

  @override
  String toString() {
    return 'SavedState(savedVideosFetchStatus: $savedVideosFetchStatus, videoInfo: $videoInfo, localSavedVideos: $localSavedVideos, localSavedHistoryVideos: $localSavedHistoryVideos)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $SavedStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ApiStatus savedVideosFetchStatus,
      LocalStoreVideoInfo? videoInfo,
      List<LocalStoreVideoInfo> localSavedVideos,
      List<LocalStoreVideoInfo> localSavedHistoryVideos});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of SavedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? savedVideosFetchStatus = null,
    Object? videoInfo = freezed,
    Object? localSavedVideos = null,
    Object? localSavedHistoryVideos = null,
  }) {
    return _then(_Initial(
      savedVideosFetchStatus: null == savedVideosFetchStatus
          ? _self.savedVideosFetchStatus
          : savedVideosFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      videoInfo: freezed == videoInfo
          ? _self.videoInfo
          : videoInfo // ignore: cast_nullable_to_non_nullable
              as LocalStoreVideoInfo?,
      localSavedVideos: null == localSavedVideos
          ? _self._localSavedVideos
          : localSavedVideos // ignore: cast_nullable_to_non_nullable
              as List<LocalStoreVideoInfo>,
      localSavedHistoryVideos: null == localSavedHistoryVideos
          ? _self._localSavedHistoryVideos
          : localSavedHistoryVideos // ignore: cast_nullable_to_non_nullable
              as List<LocalStoreVideoInfo>,
    ));
  }
}

// dart format on
