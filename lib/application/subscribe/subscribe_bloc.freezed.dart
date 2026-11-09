// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscribeEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SubscribeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubscribeEvent()';
  }
}

/// @nodoc
class $SubscribeEventCopyWith<$Res> {
  $SubscribeEventCopyWith(SubscribeEvent _, $Res Function(SubscribeEvent) __);
}

/// Adds pattern-matching-related methods to [SubscribeEvent].
extension SubscribeEventPatterns on SubscribeEvent {
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
    TResult Function(AddSubscribe value)? addSubscribe,
    TResult Function(DeleteSubscribeInfo value)? deleteSubscribeInfo,
    TResult Function(GetAllSubscribeList value)? getAllSubscribeList,
    TResult Function(CheckSubscribeInfo value)? checkSubscribeInfo,
    TResult Function(UpdateSubscribeOldList value)? updateSubscribeOldList,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe() when addSubscribe != null:
        return addSubscribe(_that);
      case DeleteSubscribeInfo() when deleteSubscribeInfo != null:
        return deleteSubscribeInfo(_that);
      case GetAllSubscribeList() when getAllSubscribeList != null:
        return getAllSubscribeList(_that);
      case CheckSubscribeInfo() when checkSubscribeInfo != null:
        return checkSubscribeInfo(_that);
      case UpdateSubscribeOldList() when updateSubscribeOldList != null:
        return updateSubscribeOldList(_that);
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
    required TResult Function(AddSubscribe value) addSubscribe,
    required TResult Function(DeleteSubscribeInfo value) deleteSubscribeInfo,
    required TResult Function(GetAllSubscribeList value) getAllSubscribeList,
    required TResult Function(CheckSubscribeInfo value) checkSubscribeInfo,
    required TResult Function(UpdateSubscribeOldList value)
        updateSubscribeOldList,
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe():
        return addSubscribe(_that);
      case DeleteSubscribeInfo():
        return deleteSubscribeInfo(_that);
      case GetAllSubscribeList():
        return getAllSubscribeList(_that);
      case CheckSubscribeInfo():
        return checkSubscribeInfo(_that);
      case UpdateSubscribeOldList():
        return updateSubscribeOldList(_that);
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
    TResult? Function(AddSubscribe value)? addSubscribe,
    TResult? Function(DeleteSubscribeInfo value)? deleteSubscribeInfo,
    TResult? Function(GetAllSubscribeList value)? getAllSubscribeList,
    TResult? Function(CheckSubscribeInfo value)? checkSubscribeInfo,
    TResult? Function(UpdateSubscribeOldList value)? updateSubscribeOldList,
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe() when addSubscribe != null:
        return addSubscribe(_that);
      case DeleteSubscribeInfo() when deleteSubscribeInfo != null:
        return deleteSubscribeInfo(_that);
      case GetAllSubscribeList() when getAllSubscribeList != null:
        return getAllSubscribeList(_that);
      case CheckSubscribeInfo() when checkSubscribeInfo != null:
        return checkSubscribeInfo(_that);
      case UpdateSubscribeOldList() when updateSubscribeOldList != null:
        return updateSubscribeOldList(_that);
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
    TResult Function(Subscribe channelInfo, String profileName)? addSubscribe,
    TResult Function(String id, String profileName)? deleteSubscribeInfo,
    TResult Function(String profileName)? getAllSubscribeList,
    TResult Function(String id, String profileName)? checkSubscribeInfo,
    TResult Function(List<Subscribe> subscribedChannels)?
        updateSubscribeOldList,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe() when addSubscribe != null:
        return addSubscribe(_that.channelInfo, _that.profileName);
      case DeleteSubscribeInfo() when deleteSubscribeInfo != null:
        return deleteSubscribeInfo(_that.id, _that.profileName);
      case GetAllSubscribeList() when getAllSubscribeList != null:
        return getAllSubscribeList(_that.profileName);
      case CheckSubscribeInfo() when checkSubscribeInfo != null:
        return checkSubscribeInfo(_that.id, _that.profileName);
      case UpdateSubscribeOldList() when updateSubscribeOldList != null:
        return updateSubscribeOldList(_that.subscribedChannels);
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
    required TResult Function(Subscribe channelInfo, String profileName)
        addSubscribe,
    required TResult Function(String id, String profileName)
        deleteSubscribeInfo,
    required TResult Function(String profileName) getAllSubscribeList,
    required TResult Function(String id, String profileName) checkSubscribeInfo,
    required TResult Function(List<Subscribe> subscribedChannels)
        updateSubscribeOldList,
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe():
        return addSubscribe(_that.channelInfo, _that.profileName);
      case DeleteSubscribeInfo():
        return deleteSubscribeInfo(_that.id, _that.profileName);
      case GetAllSubscribeList():
        return getAllSubscribeList(_that.profileName);
      case CheckSubscribeInfo():
        return checkSubscribeInfo(_that.id, _that.profileName);
      case UpdateSubscribeOldList():
        return updateSubscribeOldList(_that.subscribedChannels);
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
    TResult? Function(Subscribe channelInfo, String profileName)? addSubscribe,
    TResult? Function(String id, String profileName)? deleteSubscribeInfo,
    TResult? Function(String profileName)? getAllSubscribeList,
    TResult? Function(String id, String profileName)? checkSubscribeInfo,
    TResult? Function(List<Subscribe> subscribedChannels)?
        updateSubscribeOldList,
  }) {
    final _that = this;
    switch (_that) {
      case AddSubscribe() when addSubscribe != null:
        return addSubscribe(_that.channelInfo, _that.profileName);
      case DeleteSubscribeInfo() when deleteSubscribeInfo != null:
        return deleteSubscribeInfo(_that.id, _that.profileName);
      case GetAllSubscribeList() when getAllSubscribeList != null:
        return getAllSubscribeList(_that.profileName);
      case CheckSubscribeInfo() when checkSubscribeInfo != null:
        return checkSubscribeInfo(_that.id, _that.profileName);
      case UpdateSubscribeOldList() when updateSubscribeOldList != null:
        return updateSubscribeOldList(_that.subscribedChannels);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AddSubscribe implements SubscribeEvent {
  const AddSubscribe({required this.channelInfo, this.profileName = 'default'});

  final Subscribe channelInfo;
  @JsonKey()
  final String profileName;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddSubscribeCopyWith<AddSubscribe> get copyWith =>
      _$AddSubscribeCopyWithImpl<AddSubscribe>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddSubscribe &&
            (identical(other.channelInfo, channelInfo) ||
                other.channelInfo == channelInfo) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelInfo, profileName);

  @override
  String toString() {
    return 'SubscribeEvent.addSubscribe(channelInfo: $channelInfo, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $AddSubscribeCopyWith<$Res>
    implements $SubscribeEventCopyWith<$Res> {
  factory $AddSubscribeCopyWith(
          AddSubscribe value, $Res Function(AddSubscribe) _then) =
      _$AddSubscribeCopyWithImpl;
  @useResult
  $Res call({Subscribe channelInfo, String profileName});
}

/// @nodoc
class _$AddSubscribeCopyWithImpl<$Res> implements $AddSubscribeCopyWith<$Res> {
  _$AddSubscribeCopyWithImpl(this._self, this._then);

  final AddSubscribe _self;
  final $Res Function(AddSubscribe) _then;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelInfo = null,
    Object? profileName = null,
  }) {
    return _then(AddSubscribe(
      channelInfo: null == channelInfo
          ? _self.channelInfo
          : channelInfo // ignore: cast_nullable_to_non_nullable
              as Subscribe,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteSubscribeInfo implements SubscribeEvent {
  const DeleteSubscribeInfo({required this.id, this.profileName = 'default'});

  final String id;
  @JsonKey()
  final String profileName;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteSubscribeInfoCopyWith<DeleteSubscribeInfo> get copyWith =>
      _$DeleteSubscribeInfoCopyWithImpl<DeleteSubscribeInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteSubscribeInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profileName);

  @override
  String toString() {
    return 'SubscribeEvent.deleteSubscribeInfo(id: $id, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $DeleteSubscribeInfoCopyWith<$Res>
    implements $SubscribeEventCopyWith<$Res> {
  factory $DeleteSubscribeInfoCopyWith(
          DeleteSubscribeInfo value, $Res Function(DeleteSubscribeInfo) _then) =
      _$DeleteSubscribeInfoCopyWithImpl;
  @useResult
  $Res call({String id, String profileName});
}

/// @nodoc
class _$DeleteSubscribeInfoCopyWithImpl<$Res>
    implements $DeleteSubscribeInfoCopyWith<$Res> {
  _$DeleteSubscribeInfoCopyWithImpl(this._self, this._then);

  final DeleteSubscribeInfo _self;
  final $Res Function(DeleteSubscribeInfo) _then;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? profileName = null,
  }) {
    return _then(DeleteSubscribeInfo(
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

class GetAllSubscribeList implements SubscribeEvent {
  const GetAllSubscribeList({this.profileName = 'default'});

  @JsonKey()
  final String profileName;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetAllSubscribeListCopyWith<GetAllSubscribeList> get copyWith =>
      _$GetAllSubscribeListCopyWithImpl<GetAllSubscribeList>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetAllSubscribeList &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SubscribeEvent.getAllSubscribeList(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $GetAllSubscribeListCopyWith<$Res>
    implements $SubscribeEventCopyWith<$Res> {
  factory $GetAllSubscribeListCopyWith(
          GetAllSubscribeList value, $Res Function(GetAllSubscribeList) _then) =
      _$GetAllSubscribeListCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$GetAllSubscribeListCopyWithImpl<$Res>
    implements $GetAllSubscribeListCopyWith<$Res> {
  _$GetAllSubscribeListCopyWithImpl(this._self, this._then);

  final GetAllSubscribeList _self;
  final $Res Function(GetAllSubscribeList) _then;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(GetAllSubscribeList(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CheckSubscribeInfo implements SubscribeEvent {
  const CheckSubscribeInfo({required this.id, this.profileName = 'default'});

  final String id;
  @JsonKey()
  final String profileName;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckSubscribeInfoCopyWith<CheckSubscribeInfo> get copyWith =>
      _$CheckSubscribeInfoCopyWithImpl<CheckSubscribeInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckSubscribeInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profileName);

  @override
  String toString() {
    return 'SubscribeEvent.checkSubscribeInfo(id: $id, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $CheckSubscribeInfoCopyWith<$Res>
    implements $SubscribeEventCopyWith<$Res> {
  factory $CheckSubscribeInfoCopyWith(
          CheckSubscribeInfo value, $Res Function(CheckSubscribeInfo) _then) =
      _$CheckSubscribeInfoCopyWithImpl;
  @useResult
  $Res call({String id, String profileName});
}

/// @nodoc
class _$CheckSubscribeInfoCopyWithImpl<$Res>
    implements $CheckSubscribeInfoCopyWith<$Res> {
  _$CheckSubscribeInfoCopyWithImpl(this._self, this._then);

  final CheckSubscribeInfo _self;
  final $Res Function(CheckSubscribeInfo) _then;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? profileName = null,
  }) {
    return _then(CheckSubscribeInfo(
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

class UpdateSubscribeOldList implements SubscribeEvent {
  const UpdateSubscribeOldList(
      {required final List<Subscribe> subscribedChannels})
      : _subscribedChannels = subscribedChannels;

  final List<Subscribe> _subscribedChannels;
  List<Subscribe> get subscribedChannels {
    if (_subscribedChannels is EqualUnmodifiableListView)
      return _subscribedChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscribedChannels);
  }

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateSubscribeOldListCopyWith<UpdateSubscribeOldList> get copyWith =>
      _$UpdateSubscribeOldListCopyWithImpl<UpdateSubscribeOldList>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateSubscribeOldList &&
            const DeepCollectionEquality()
                .equals(other._subscribedChannels, _subscribedChannels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subscribedChannels));

  @override
  String toString() {
    return 'SubscribeEvent.updateSubscribeOldList(subscribedChannels: $subscribedChannels)';
  }
}

/// @nodoc
abstract mixin class $UpdateSubscribeOldListCopyWith<$Res>
    implements $SubscribeEventCopyWith<$Res> {
  factory $UpdateSubscribeOldListCopyWith(UpdateSubscribeOldList value,
          $Res Function(UpdateSubscribeOldList) _then) =
      _$UpdateSubscribeOldListCopyWithImpl;
  @useResult
  $Res call({List<Subscribe> subscribedChannels});
}

/// @nodoc
class _$UpdateSubscribeOldListCopyWithImpl<$Res>
    implements $UpdateSubscribeOldListCopyWith<$Res> {
  _$UpdateSubscribeOldListCopyWithImpl(this._self, this._then);

  final UpdateSubscribeOldList _self;
  final $Res Function(UpdateSubscribeOldList) _then;

  /// Create a copy of SubscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subscribedChannels = null,
  }) {
    return _then(UpdateSubscribeOldList(
      subscribedChannels: null == subscribedChannels
          ? _self._subscribedChannels
          : subscribedChannels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// @nodoc
mixin _$SubscribeState {
  ApiStatus get subscribeStatus;
  Subscribe? get channelInfo;
  List<Subscribe> get subscribedChannels;
  List<Subscribe> get oldList;

  /// Create a copy of SubscribeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscribeStateCopyWith<SubscribeState> get copyWith =>
      _$SubscribeStateCopyWithImpl<SubscribeState>(
          this as SubscribeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscribeState &&
            (identical(other.subscribeStatus, subscribeStatus) ||
                other.subscribeStatus == subscribeStatus) &&
            (identical(other.channelInfo, channelInfo) ||
                other.channelInfo == channelInfo) &&
            const DeepCollectionEquality()
                .equals(other.subscribedChannels, subscribedChannels) &&
            const DeepCollectionEquality().equals(other.oldList, oldList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscribeStatus,
      channelInfo,
      const DeepCollectionEquality().hash(subscribedChannels),
      const DeepCollectionEquality().hash(oldList));

  @override
  String toString() {
    return 'SubscribeState(subscribeStatus: $subscribeStatus, channelInfo: $channelInfo, subscribedChannels: $subscribedChannels, oldList: $oldList)';
  }
}

/// @nodoc
abstract mixin class $SubscribeStateCopyWith<$Res> {
  factory $SubscribeStateCopyWith(
          SubscribeState value, $Res Function(SubscribeState) _then) =
      _$SubscribeStateCopyWithImpl;
  @useResult
  $Res call(
      {ApiStatus subscribeStatus,
      Subscribe? channelInfo,
      List<Subscribe> subscribedChannels,
      List<Subscribe> oldList});
}

/// @nodoc
class _$SubscribeStateCopyWithImpl<$Res>
    implements $SubscribeStateCopyWith<$Res> {
  _$SubscribeStateCopyWithImpl(this._self, this._then);

  final SubscribeState _self;
  final $Res Function(SubscribeState) _then;

  /// Create a copy of SubscribeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribeStatus = null,
    Object? channelInfo = freezed,
    Object? subscribedChannels = null,
    Object? oldList = null,
  }) {
    return _then(_self.copyWith(
      subscribeStatus: null == subscribeStatus
          ? _self.subscribeStatus
          : subscribeStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      channelInfo: freezed == channelInfo
          ? _self.channelInfo
          : channelInfo // ignore: cast_nullable_to_non_nullable
              as Subscribe?,
      subscribedChannels: null == subscribedChannels
          ? _self.subscribedChannels
          : subscribedChannels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
      oldList: null == oldList
          ? _self.oldList
          : oldList // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscribeState].
extension SubscribeStatePatterns on SubscribeState {
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
    TResult Function(ApiStatus subscribeStatus, Subscribe? channelInfo,
            List<Subscribe> subscribedChannels, List<Subscribe> oldList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.subscribeStatus, _that.channelInfo,
            _that.subscribedChannels, _that.oldList);
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
    TResult Function(ApiStatus subscribeStatus, Subscribe? channelInfo,
            List<Subscribe> subscribedChannels, List<Subscribe> oldList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(_that.subscribeStatus, _that.channelInfo,
            _that.subscribedChannels, _that.oldList);
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
    TResult? Function(ApiStatus subscribeStatus, Subscribe? channelInfo,
            List<Subscribe> subscribedChannels, List<Subscribe> oldList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(_that.subscribeStatus, _that.channelInfo,
            _that.subscribedChannels, _that.oldList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SubscribeState {
  const _Initial(
      {required this.subscribeStatus,
      required this.channelInfo,
      required final List<Subscribe> subscribedChannels,
      required final List<Subscribe> oldList})
      : _subscribedChannels = subscribedChannels,
        _oldList = oldList;

  @override
  final ApiStatus subscribeStatus;
  @override
  final Subscribe? channelInfo;
  final List<Subscribe> _subscribedChannels;
  @override
  List<Subscribe> get subscribedChannels {
    if (_subscribedChannels is EqualUnmodifiableListView)
      return _subscribedChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscribedChannels);
  }

  final List<Subscribe> _oldList;
  @override
  List<Subscribe> get oldList {
    if (_oldList is EqualUnmodifiableListView) return _oldList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oldList);
  }

  /// Create a copy of SubscribeState
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
            (identical(other.subscribeStatus, subscribeStatus) ||
                other.subscribeStatus == subscribeStatus) &&
            (identical(other.channelInfo, channelInfo) ||
                other.channelInfo == channelInfo) &&
            const DeepCollectionEquality()
                .equals(other._subscribedChannels, _subscribedChannels) &&
            const DeepCollectionEquality().equals(other._oldList, _oldList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscribeStatus,
      channelInfo,
      const DeepCollectionEquality().hash(_subscribedChannels),
      const DeepCollectionEquality().hash(_oldList));

  @override
  String toString() {
    return 'SubscribeState(subscribeStatus: $subscribeStatus, channelInfo: $channelInfo, subscribedChannels: $subscribedChannels, oldList: $oldList)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $SubscribeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ApiStatus subscribeStatus,
      Subscribe? channelInfo,
      List<Subscribe> subscribedChannels,
      List<Subscribe> oldList});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of SubscribeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subscribeStatus = null,
    Object? channelInfo = freezed,
    Object? subscribedChannels = null,
    Object? oldList = null,
  }) {
    return _then(_Initial(
      subscribeStatus: null == subscribeStatus
          ? _self.subscribeStatus
          : subscribeStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      channelInfo: freezed == channelInfo
          ? _self.channelInfo
          : channelInfo // ignore: cast_nullable_to_non_nullable
              as Subscribe?,
      subscribedChannels: null == subscribedChannels
          ? _self._subscribedChannels
          : subscribedChannels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
      oldList: null == oldList
          ? _self._oldList
          : oldList // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

// dart format on
