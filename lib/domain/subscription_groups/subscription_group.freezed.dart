// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionGroup {
  int get id;
  String get groupName;
  String? get colorHex;
  int get sortOrder;
  String get profileName;
  List<String> get memberChannelIds;

  /// Create a copy of SubscriptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionGroupCopyWith<SubscriptionGroup> get copyWith =>
      _$SubscriptionGroupCopyWithImpl<SubscriptionGroup>(
          this as SubscriptionGroup, _$identity);

  /// Serializes this SubscriptionGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            const DeepCollectionEquality()
                .equals(other.memberChannelIds, memberChannelIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupName,
      colorHex,
      sortOrder,
      profileName,
      const DeepCollectionEquality().hash(memberChannelIds));

  @override
  String toString() {
    return 'SubscriptionGroup(id: $id, groupName: $groupName, colorHex: $colorHex, sortOrder: $sortOrder, profileName: $profileName, memberChannelIds: $memberChannelIds)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionGroupCopyWith<$Res> {
  factory $SubscriptionGroupCopyWith(
          SubscriptionGroup value, $Res Function(SubscriptionGroup) _then) =
      _$SubscriptionGroupCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String groupName,
      String? colorHex,
      int sortOrder,
      String profileName,
      List<String> memberChannelIds});
}

/// @nodoc
class _$SubscriptionGroupCopyWithImpl<$Res>
    implements $SubscriptionGroupCopyWith<$Res> {
  _$SubscriptionGroupCopyWithImpl(this._self, this._then);

  final SubscriptionGroup _self;
  final $Res Function(SubscriptionGroup) _then;

  /// Create a copy of SubscriptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? colorHex = freezed,
    Object? sortOrder = null,
    Object? profileName = null,
    Object? memberChannelIds = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: freezed == colorHex
          ? _self.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      memberChannelIds: null == memberChannelIds
          ? _self.memberChannelIds
          : memberChannelIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionGroup].
extension SubscriptionGroupPatterns on SubscriptionGroup {
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
    TResult Function(_SubscriptionGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup() when $default != null:
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
    TResult Function(_SubscriptionGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup():
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
    TResult? Function(_SubscriptionGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup() when $default != null:
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
    TResult Function(int id, String groupName, String? colorHex, int sortOrder,
            String profileName, List<String> memberChannelIds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup() when $default != null:
        return $default(_that.id, _that.groupName, _that.colorHex,
            _that.sortOrder, _that.profileName, _that.memberChannelIds);
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
    TResult Function(int id, String groupName, String? colorHex, int sortOrder,
            String profileName, List<String> memberChannelIds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup():
        return $default(_that.id, _that.groupName, _that.colorHex,
            _that.sortOrder, _that.profileName, _that.memberChannelIds);
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
    TResult? Function(int id, String groupName, String? colorHex, int sortOrder,
            String profileName, List<String> memberChannelIds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroup() when $default != null:
        return $default(_that.id, _that.groupName, _that.colorHex,
            _that.sortOrder, _that.profileName, _that.memberChannelIds);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionGroup implements SubscriptionGroup {
  const _SubscriptionGroup(
      {required this.id,
      required this.groupName,
      this.colorHex,
      required this.sortOrder,
      required this.profileName,
      final List<String> memberChannelIds = const []})
      : _memberChannelIds = memberChannelIds;
  factory _SubscriptionGroup.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupFromJson(json);

  @override
  final int id;
  @override
  final String groupName;
  @override
  final String? colorHex;
  @override
  final int sortOrder;
  @override
  final String profileName;
  final List<String> _memberChannelIds;
  @override
  @JsonKey()
  List<String> get memberChannelIds {
    if (_memberChannelIds is EqualUnmodifiableListView)
      return _memberChannelIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberChannelIds);
  }

  /// Create a copy of SubscriptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionGroupCopyWith<_SubscriptionGroup> get copyWith =>
      __$SubscriptionGroupCopyWithImpl<_SubscriptionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            const DeepCollectionEquality()
                .equals(other._memberChannelIds, _memberChannelIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupName,
      colorHex,
      sortOrder,
      profileName,
      const DeepCollectionEquality().hash(_memberChannelIds));

  @override
  String toString() {
    return 'SubscriptionGroup(id: $id, groupName: $groupName, colorHex: $colorHex, sortOrder: $sortOrder, profileName: $profileName, memberChannelIds: $memberChannelIds)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionGroupCopyWith<$Res>
    implements $SubscriptionGroupCopyWith<$Res> {
  factory _$SubscriptionGroupCopyWith(
          _SubscriptionGroup value, $Res Function(_SubscriptionGroup) _then) =
      __$SubscriptionGroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String groupName,
      String? colorHex,
      int sortOrder,
      String profileName,
      List<String> memberChannelIds});
}

/// @nodoc
class __$SubscriptionGroupCopyWithImpl<$Res>
    implements _$SubscriptionGroupCopyWith<$Res> {
  __$SubscriptionGroupCopyWithImpl(this._self, this._then);

  final _SubscriptionGroup _self;
  final $Res Function(_SubscriptionGroup) _then;

  /// Create a copy of SubscriptionGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? colorHex = freezed,
    Object? sortOrder = null,
    Object? profileName = null,
    Object? memberChannelIds = null,
  }) {
    return _then(_SubscriptionGroup(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: freezed == colorHex
          ? _self.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      memberChannelIds: null == memberChannelIds
          ? _self._memberChannelIds
          : memberChannelIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionGroupMember {
  int get groupId;
  String get channelId;
  String get profileName;

  /// Create a copy of SubscriptionGroupMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionGroupMemberCopyWith<SubscriptionGroupMember> get copyWith =>
      _$SubscriptionGroupMemberCopyWithImpl<SubscriptionGroupMember>(
          this as SubscriptionGroupMember, _$identity);

  /// Serializes this SubscriptionGroupMember to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionGroupMember &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, channelId, profileName);

  @override
  String toString() {
    return 'SubscriptionGroupMember(groupId: $groupId, channelId: $channelId, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionGroupMemberCopyWith<$Res> {
  factory $SubscriptionGroupMemberCopyWith(SubscriptionGroupMember value,
          $Res Function(SubscriptionGroupMember) _then) =
      _$SubscriptionGroupMemberCopyWithImpl;
  @useResult
  $Res call({int groupId, String channelId, String profileName});
}

/// @nodoc
class _$SubscriptionGroupMemberCopyWithImpl<$Res>
    implements $SubscriptionGroupMemberCopyWith<$Res> {
  _$SubscriptionGroupMemberCopyWithImpl(this._self, this._then);

  final SubscriptionGroupMember _self;
  final $Res Function(SubscriptionGroupMember) _then;

  /// Create a copy of SubscriptionGroupMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? channelId = null,
    Object? profileName = null,
  }) {
    return _then(_self.copyWith(
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionGroupMember].
extension SubscriptionGroupMemberPatterns on SubscriptionGroupMember {
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
    TResult Function(_SubscriptionGroupMember value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember() when $default != null:
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
    TResult Function(_SubscriptionGroupMember value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember():
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
    TResult? Function(_SubscriptionGroupMember value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember() when $default != null:
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
    TResult Function(int groupId, String channelId, String profileName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember() when $default != null:
        return $default(_that.groupId, _that.channelId, _that.profileName);
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
    TResult Function(int groupId, String channelId, String profileName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember():
        return $default(_that.groupId, _that.channelId, _that.profileName);
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
    TResult? Function(int groupId, String channelId, String profileName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGroupMember() when $default != null:
        return $default(_that.groupId, _that.channelId, _that.profileName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionGroupMember implements SubscriptionGroupMember {
  const _SubscriptionGroupMember(
      {required this.groupId,
      required this.channelId,
      required this.profileName});
  factory _SubscriptionGroupMember.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupMemberFromJson(json);

  @override
  final int groupId;
  @override
  final String channelId;
  @override
  final String profileName;

  /// Create a copy of SubscriptionGroupMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionGroupMemberCopyWith<_SubscriptionGroupMember> get copyWith =>
      __$SubscriptionGroupMemberCopyWithImpl<_SubscriptionGroupMember>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionGroupMemberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionGroupMember &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, channelId, profileName);

  @override
  String toString() {
    return 'SubscriptionGroupMember(groupId: $groupId, channelId: $channelId, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionGroupMemberCopyWith<$Res>
    implements $SubscriptionGroupMemberCopyWith<$Res> {
  factory _$SubscriptionGroupMemberCopyWith(_SubscriptionGroupMember value,
          $Res Function(_SubscriptionGroupMember) _then) =
      __$SubscriptionGroupMemberCopyWithImpl;
  @override
  @useResult
  $Res call({int groupId, String channelId, String profileName});
}

/// @nodoc
class __$SubscriptionGroupMemberCopyWithImpl<$Res>
    implements _$SubscriptionGroupMemberCopyWith<$Res> {
  __$SubscriptionGroupMemberCopyWithImpl(this._self, this._then);

  final _SubscriptionGroupMember _self;
  final $Res Function(_SubscriptionGroupMember) _then;

  /// Create a copy of SubscriptionGroupMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groupId = null,
    Object? channelId = null,
    Object? profileName = null,
  }) {
    return _then(_SubscriptionGroupMember(
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
