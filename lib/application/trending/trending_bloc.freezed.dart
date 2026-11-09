// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendingEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrendingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent()';
  }
}

/// @nodoc
class $TrendingEventCopyWith<$Res> {
  $TrendingEventCopyWith(TrendingEvent _, $Res Function(TrendingEvent) __);
}

/// Adds pattern-matching-related methods to [TrendingEvent].
extension TrendingEventPatterns on TrendingEvent {
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
    TResult Function(GetTrendingData value)? getTrendingData,
    TResult Function(GetForcedTrendingData value)? getForcedTrendingData,
    TResult Function(GetHomeFeedData value)? getHomeFeedData,
    TResult Function(GetForcedHomeFeedData value)? getForcedHomeFeedData,
    TResult Function(GetNewPipeHomeFeedData value)? getNewPipeHomeFeedData,
    TResult Function(GetForcedNewPipeHomeFeedData value)?
        getForcedNewPipeHomeFeedData,
    TResult Function(GetPersonalizedFeed value)? getPersonalizedFeed,
    TResult Function(GetForcedPersonalizedFeed value)?
        getForcedPersonalizedFeed,
    TResult Function(LoadMorePersonalizedFeed value)? loadMorePersonalizedFeed,
    TResult Function(LoadMoreFeed value)? loadMoreFeed,
    TResult Function(LoadMoreTrending value)? loadMoreTrending,
    TResult Function(LoadMoreNewPipeFeed value)? loadMoreNewPipeFeed,
    TResult Function(LoadMoreNewPipeTrending value)? loadMoreNewPipeTrending,
    TResult Function(LoadMoreInvidiousTrending value)?
        loadMoreInvidiousTrending,
    TResult Function(ResetDisplayCounts value)? resetDisplayCounts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData() when getTrendingData != null:
        return getTrendingData(_that);
      case GetForcedTrendingData() when getForcedTrendingData != null:
        return getForcedTrendingData(_that);
      case GetHomeFeedData() when getHomeFeedData != null:
        return getHomeFeedData(_that);
      case GetForcedHomeFeedData() when getForcedHomeFeedData != null:
        return getForcedHomeFeedData(_that);
      case GetNewPipeHomeFeedData() when getNewPipeHomeFeedData != null:
        return getNewPipeHomeFeedData(_that);
      case GetForcedNewPipeHomeFeedData()
          when getForcedNewPipeHomeFeedData != null:
        return getForcedNewPipeHomeFeedData(_that);
      case GetPersonalizedFeed() when getPersonalizedFeed != null:
        return getPersonalizedFeed(_that);
      case GetForcedPersonalizedFeed() when getForcedPersonalizedFeed != null:
        return getForcedPersonalizedFeed(_that);
      case LoadMorePersonalizedFeed() when loadMorePersonalizedFeed != null:
        return loadMorePersonalizedFeed(_that);
      case LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed(_that);
      case LoadMoreTrending() when loadMoreTrending != null:
        return loadMoreTrending(_that);
      case LoadMoreNewPipeFeed() when loadMoreNewPipeFeed != null:
        return loadMoreNewPipeFeed(_that);
      case LoadMoreNewPipeTrending() when loadMoreNewPipeTrending != null:
        return loadMoreNewPipeTrending(_that);
      case LoadMoreInvidiousTrending() when loadMoreInvidiousTrending != null:
        return loadMoreInvidiousTrending(_that);
      case ResetDisplayCounts() when resetDisplayCounts != null:
        return resetDisplayCounts(_that);
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
    required TResult Function(GetTrendingData value) getTrendingData,
    required TResult Function(GetForcedTrendingData value)
        getForcedTrendingData,
    required TResult Function(GetHomeFeedData value) getHomeFeedData,
    required TResult Function(GetForcedHomeFeedData value)
        getForcedHomeFeedData,
    required TResult Function(GetNewPipeHomeFeedData value)
        getNewPipeHomeFeedData,
    required TResult Function(GetForcedNewPipeHomeFeedData value)
        getForcedNewPipeHomeFeedData,
    required TResult Function(GetPersonalizedFeed value) getPersonalizedFeed,
    required TResult Function(GetForcedPersonalizedFeed value)
        getForcedPersonalizedFeed,
    required TResult Function(LoadMorePersonalizedFeed value)
        loadMorePersonalizedFeed,
    required TResult Function(LoadMoreFeed value) loadMoreFeed,
    required TResult Function(LoadMoreTrending value) loadMoreTrending,
    required TResult Function(LoadMoreNewPipeFeed value) loadMoreNewPipeFeed,
    required TResult Function(LoadMoreNewPipeTrending value)
        loadMoreNewPipeTrending,
    required TResult Function(LoadMoreInvidiousTrending value)
        loadMoreInvidiousTrending,
    required TResult Function(ResetDisplayCounts value) resetDisplayCounts,
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData():
        return getTrendingData(_that);
      case GetForcedTrendingData():
        return getForcedTrendingData(_that);
      case GetHomeFeedData():
        return getHomeFeedData(_that);
      case GetForcedHomeFeedData():
        return getForcedHomeFeedData(_that);
      case GetNewPipeHomeFeedData():
        return getNewPipeHomeFeedData(_that);
      case GetForcedNewPipeHomeFeedData():
        return getForcedNewPipeHomeFeedData(_that);
      case GetPersonalizedFeed():
        return getPersonalizedFeed(_that);
      case GetForcedPersonalizedFeed():
        return getForcedPersonalizedFeed(_that);
      case LoadMorePersonalizedFeed():
        return loadMorePersonalizedFeed(_that);
      case LoadMoreFeed():
        return loadMoreFeed(_that);
      case LoadMoreTrending():
        return loadMoreTrending(_that);
      case LoadMoreNewPipeFeed():
        return loadMoreNewPipeFeed(_that);
      case LoadMoreNewPipeTrending():
        return loadMoreNewPipeTrending(_that);
      case LoadMoreInvidiousTrending():
        return loadMoreInvidiousTrending(_that);
      case ResetDisplayCounts():
        return resetDisplayCounts(_that);
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
    TResult? Function(GetTrendingData value)? getTrendingData,
    TResult? Function(GetForcedTrendingData value)? getForcedTrendingData,
    TResult? Function(GetHomeFeedData value)? getHomeFeedData,
    TResult? Function(GetForcedHomeFeedData value)? getForcedHomeFeedData,
    TResult? Function(GetNewPipeHomeFeedData value)? getNewPipeHomeFeedData,
    TResult? Function(GetForcedNewPipeHomeFeedData value)?
        getForcedNewPipeHomeFeedData,
    TResult? Function(GetPersonalizedFeed value)? getPersonalizedFeed,
    TResult? Function(GetForcedPersonalizedFeed value)?
        getForcedPersonalizedFeed,
    TResult? Function(LoadMorePersonalizedFeed value)? loadMorePersonalizedFeed,
    TResult? Function(LoadMoreFeed value)? loadMoreFeed,
    TResult? Function(LoadMoreTrending value)? loadMoreTrending,
    TResult? Function(LoadMoreNewPipeFeed value)? loadMoreNewPipeFeed,
    TResult? Function(LoadMoreNewPipeTrending value)? loadMoreNewPipeTrending,
    TResult? Function(LoadMoreInvidiousTrending value)?
        loadMoreInvidiousTrending,
    TResult? Function(ResetDisplayCounts value)? resetDisplayCounts,
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData() when getTrendingData != null:
        return getTrendingData(_that);
      case GetForcedTrendingData() when getForcedTrendingData != null:
        return getForcedTrendingData(_that);
      case GetHomeFeedData() when getHomeFeedData != null:
        return getHomeFeedData(_that);
      case GetForcedHomeFeedData() when getForcedHomeFeedData != null:
        return getForcedHomeFeedData(_that);
      case GetNewPipeHomeFeedData() when getNewPipeHomeFeedData != null:
        return getNewPipeHomeFeedData(_that);
      case GetForcedNewPipeHomeFeedData()
          when getForcedNewPipeHomeFeedData != null:
        return getForcedNewPipeHomeFeedData(_that);
      case GetPersonalizedFeed() when getPersonalizedFeed != null:
        return getPersonalizedFeed(_that);
      case GetForcedPersonalizedFeed() when getForcedPersonalizedFeed != null:
        return getForcedPersonalizedFeed(_that);
      case LoadMorePersonalizedFeed() when loadMorePersonalizedFeed != null:
        return loadMorePersonalizedFeed(_that);
      case LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed(_that);
      case LoadMoreTrending() when loadMoreTrending != null:
        return loadMoreTrending(_that);
      case LoadMoreNewPipeFeed() when loadMoreNewPipeFeed != null:
        return loadMoreNewPipeFeed(_that);
      case LoadMoreNewPipeTrending() when loadMoreNewPipeTrending != null:
        return loadMoreNewPipeTrending(_that);
      case LoadMoreInvidiousTrending() when loadMoreInvidiousTrending != null:
        return loadMoreInvidiousTrending(_that);
      case ResetDisplayCounts() when resetDisplayCounts != null:
        return resetDisplayCounts(_that);
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
    TResult Function(String serviceType, String region)? getTrendingData,
    TResult Function(String serviceType, String region)? getForcedTrendingData,
    TResult Function(List<Subscribe> channels)? getHomeFeedData,
    TResult Function(List<Subscribe> channels)? getForcedHomeFeedData,
    TResult Function(List<Subscribe> channels)? getNewPipeHomeFeedData,
    TResult Function(List<Subscribe> channels)? getForcedNewPipeHomeFeedData,
    TResult Function(String profileName, String serviceType)?
        getPersonalizedFeed,
    TResult Function(String profileName, String serviceType)?
        getForcedPersonalizedFeed,
    TResult Function(String profileName, String serviceType)?
        loadMorePersonalizedFeed,
    TResult Function()? loadMoreFeed,
    TResult Function(String serviceType)? loadMoreTrending,
    TResult Function()? loadMoreNewPipeFeed,
    TResult Function()? loadMoreNewPipeTrending,
    TResult Function()? loadMoreInvidiousTrending,
    TResult Function()? resetDisplayCounts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData() when getTrendingData != null:
        return getTrendingData(_that.serviceType, _that.region);
      case GetForcedTrendingData() when getForcedTrendingData != null:
        return getForcedTrendingData(_that.serviceType, _that.region);
      case GetHomeFeedData() when getHomeFeedData != null:
        return getHomeFeedData(_that.channels);
      case GetForcedHomeFeedData() when getForcedHomeFeedData != null:
        return getForcedHomeFeedData(_that.channels);
      case GetNewPipeHomeFeedData() when getNewPipeHomeFeedData != null:
        return getNewPipeHomeFeedData(_that.channels);
      case GetForcedNewPipeHomeFeedData()
          when getForcedNewPipeHomeFeedData != null:
        return getForcedNewPipeHomeFeedData(_that.channels);
      case GetPersonalizedFeed() when getPersonalizedFeed != null:
        return getPersonalizedFeed(_that.profileName, _that.serviceType);
      case GetForcedPersonalizedFeed() when getForcedPersonalizedFeed != null:
        return getForcedPersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMorePersonalizedFeed() when loadMorePersonalizedFeed != null:
        return loadMorePersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed();
      case LoadMoreTrending() when loadMoreTrending != null:
        return loadMoreTrending(_that.serviceType);
      case LoadMoreNewPipeFeed() when loadMoreNewPipeFeed != null:
        return loadMoreNewPipeFeed();
      case LoadMoreNewPipeTrending() when loadMoreNewPipeTrending != null:
        return loadMoreNewPipeTrending();
      case LoadMoreInvidiousTrending() when loadMoreInvidiousTrending != null:
        return loadMoreInvidiousTrending();
      case ResetDisplayCounts() when resetDisplayCounts != null:
        return resetDisplayCounts();
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
    required TResult Function(String serviceType, String region)
        getTrendingData,
    required TResult Function(String serviceType, String region)
        getForcedTrendingData,
    required TResult Function(List<Subscribe> channels) getHomeFeedData,
    required TResult Function(List<Subscribe> channels) getForcedHomeFeedData,
    required TResult Function(List<Subscribe> channels) getNewPipeHomeFeedData,
    required TResult Function(List<Subscribe> channels)
        getForcedNewPipeHomeFeedData,
    required TResult Function(String profileName, String serviceType)
        getPersonalizedFeed,
    required TResult Function(String profileName, String serviceType)
        getForcedPersonalizedFeed,
    required TResult Function(String profileName, String serviceType)
        loadMorePersonalizedFeed,
    required TResult Function() loadMoreFeed,
    required TResult Function(String serviceType) loadMoreTrending,
    required TResult Function() loadMoreNewPipeFeed,
    required TResult Function() loadMoreNewPipeTrending,
    required TResult Function() loadMoreInvidiousTrending,
    required TResult Function() resetDisplayCounts,
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData():
        return getTrendingData(_that.serviceType, _that.region);
      case GetForcedTrendingData():
        return getForcedTrendingData(_that.serviceType, _that.region);
      case GetHomeFeedData():
        return getHomeFeedData(_that.channels);
      case GetForcedHomeFeedData():
        return getForcedHomeFeedData(_that.channels);
      case GetNewPipeHomeFeedData():
        return getNewPipeHomeFeedData(_that.channels);
      case GetForcedNewPipeHomeFeedData():
        return getForcedNewPipeHomeFeedData(_that.channels);
      case GetPersonalizedFeed():
        return getPersonalizedFeed(_that.profileName, _that.serviceType);
      case GetForcedPersonalizedFeed():
        return getForcedPersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMorePersonalizedFeed():
        return loadMorePersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMoreFeed():
        return loadMoreFeed();
      case LoadMoreTrending():
        return loadMoreTrending(_that.serviceType);
      case LoadMoreNewPipeFeed():
        return loadMoreNewPipeFeed();
      case LoadMoreNewPipeTrending():
        return loadMoreNewPipeTrending();
      case LoadMoreInvidiousTrending():
        return loadMoreInvidiousTrending();
      case ResetDisplayCounts():
        return resetDisplayCounts();
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
    TResult? Function(String serviceType, String region)? getTrendingData,
    TResult? Function(String serviceType, String region)? getForcedTrendingData,
    TResult? Function(List<Subscribe> channels)? getHomeFeedData,
    TResult? Function(List<Subscribe> channels)? getForcedHomeFeedData,
    TResult? Function(List<Subscribe> channels)? getNewPipeHomeFeedData,
    TResult? Function(List<Subscribe> channels)? getForcedNewPipeHomeFeedData,
    TResult? Function(String profileName, String serviceType)?
        getPersonalizedFeed,
    TResult? Function(String profileName, String serviceType)?
        getForcedPersonalizedFeed,
    TResult? Function(String profileName, String serviceType)?
        loadMorePersonalizedFeed,
    TResult? Function()? loadMoreFeed,
    TResult? Function(String serviceType)? loadMoreTrending,
    TResult? Function()? loadMoreNewPipeFeed,
    TResult? Function()? loadMoreNewPipeTrending,
    TResult? Function()? loadMoreInvidiousTrending,
    TResult? Function()? resetDisplayCounts,
  }) {
    final _that = this;
    switch (_that) {
      case GetTrendingData() when getTrendingData != null:
        return getTrendingData(_that.serviceType, _that.region);
      case GetForcedTrendingData() when getForcedTrendingData != null:
        return getForcedTrendingData(_that.serviceType, _that.region);
      case GetHomeFeedData() when getHomeFeedData != null:
        return getHomeFeedData(_that.channels);
      case GetForcedHomeFeedData() when getForcedHomeFeedData != null:
        return getForcedHomeFeedData(_that.channels);
      case GetNewPipeHomeFeedData() when getNewPipeHomeFeedData != null:
        return getNewPipeHomeFeedData(_that.channels);
      case GetForcedNewPipeHomeFeedData()
          when getForcedNewPipeHomeFeedData != null:
        return getForcedNewPipeHomeFeedData(_that.channels);
      case GetPersonalizedFeed() when getPersonalizedFeed != null:
        return getPersonalizedFeed(_that.profileName, _that.serviceType);
      case GetForcedPersonalizedFeed() when getForcedPersonalizedFeed != null:
        return getForcedPersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMorePersonalizedFeed() when loadMorePersonalizedFeed != null:
        return loadMorePersonalizedFeed(_that.profileName, _that.serviceType);
      case LoadMoreFeed() when loadMoreFeed != null:
        return loadMoreFeed();
      case LoadMoreTrending() when loadMoreTrending != null:
        return loadMoreTrending(_that.serviceType);
      case LoadMoreNewPipeFeed() when loadMoreNewPipeFeed != null:
        return loadMoreNewPipeFeed();
      case LoadMoreNewPipeTrending() when loadMoreNewPipeTrending != null:
        return loadMoreNewPipeTrending();
      case LoadMoreInvidiousTrending() when loadMoreInvidiousTrending != null:
        return loadMoreInvidiousTrending();
      case ResetDisplayCounts() when resetDisplayCounts != null:
        return resetDisplayCounts();
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetTrendingData implements TrendingEvent {
  const GetTrendingData({required this.serviceType, required this.region});

  final String serviceType;
  final String region;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetTrendingDataCopyWith<GetTrendingData> get copyWith =>
      _$GetTrendingDataCopyWithImpl<GetTrendingData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTrendingData &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceType, region);

  @override
  String toString() {
    return 'TrendingEvent.getTrendingData(serviceType: $serviceType, region: $region)';
  }
}

/// @nodoc
abstract mixin class $GetTrendingDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetTrendingDataCopyWith(
          GetTrendingData value, $Res Function(GetTrendingData) _then) =
      _$GetTrendingDataCopyWithImpl;
  @useResult
  $Res call({String serviceType, String region});
}

/// @nodoc
class _$GetTrendingDataCopyWithImpl<$Res>
    implements $GetTrendingDataCopyWith<$Res> {
  _$GetTrendingDataCopyWithImpl(this._self, this._then);

  final GetTrendingData _self;
  final $Res Function(GetTrendingData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = null,
    Object? region = null,
  }) {
    return _then(GetTrendingData(
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetForcedTrendingData implements TrendingEvent {
  const GetForcedTrendingData(
      {required this.serviceType, required this.region});

  final String serviceType;
  final String region;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetForcedTrendingDataCopyWith<GetForcedTrendingData> get copyWith =>
      _$GetForcedTrendingDataCopyWithImpl<GetForcedTrendingData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetForcedTrendingData &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceType, region);

  @override
  String toString() {
    return 'TrendingEvent.getForcedTrendingData(serviceType: $serviceType, region: $region)';
  }
}

/// @nodoc
abstract mixin class $GetForcedTrendingDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetForcedTrendingDataCopyWith(GetForcedTrendingData value,
          $Res Function(GetForcedTrendingData) _then) =
      _$GetForcedTrendingDataCopyWithImpl;
  @useResult
  $Res call({String serviceType, String region});
}

/// @nodoc
class _$GetForcedTrendingDataCopyWithImpl<$Res>
    implements $GetForcedTrendingDataCopyWith<$Res> {
  _$GetForcedTrendingDataCopyWithImpl(this._self, this._then);

  final GetForcedTrendingData _self;
  final $Res Function(GetForcedTrendingData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = null,
    Object? region = null,
  }) {
    return _then(GetForcedTrendingData(
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetHomeFeedData implements TrendingEvent {
  const GetHomeFeedData({required final List<Subscribe> channels})
      : _channels = channels;

  final List<Subscribe> _channels;
  List<Subscribe> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetHomeFeedDataCopyWith<GetHomeFeedData> get copyWith =>
      _$GetHomeFeedDataCopyWithImpl<GetHomeFeedData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHomeFeedData &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channels));

  @override
  String toString() {
    return 'TrendingEvent.getHomeFeedData(channels: $channels)';
  }
}

/// @nodoc
abstract mixin class $GetHomeFeedDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetHomeFeedDataCopyWith(
          GetHomeFeedData value, $Res Function(GetHomeFeedData) _then) =
      _$GetHomeFeedDataCopyWithImpl;
  @useResult
  $Res call({List<Subscribe> channels});
}

/// @nodoc
class _$GetHomeFeedDataCopyWithImpl<$Res>
    implements $GetHomeFeedDataCopyWith<$Res> {
  _$GetHomeFeedDataCopyWithImpl(this._self, this._then);

  final GetHomeFeedData _self;
  final $Res Function(GetHomeFeedData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channels = null,
  }) {
    return _then(GetHomeFeedData(
      channels: null == channels
          ? _self._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// @nodoc

class GetForcedHomeFeedData implements TrendingEvent {
  const GetForcedHomeFeedData({required final List<Subscribe> channels})
      : _channels = channels;

  final List<Subscribe> _channels;
  List<Subscribe> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetForcedHomeFeedDataCopyWith<GetForcedHomeFeedData> get copyWith =>
      _$GetForcedHomeFeedDataCopyWithImpl<GetForcedHomeFeedData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetForcedHomeFeedData &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channels));

  @override
  String toString() {
    return 'TrendingEvent.getForcedHomeFeedData(channels: $channels)';
  }
}

/// @nodoc
abstract mixin class $GetForcedHomeFeedDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetForcedHomeFeedDataCopyWith(GetForcedHomeFeedData value,
          $Res Function(GetForcedHomeFeedData) _then) =
      _$GetForcedHomeFeedDataCopyWithImpl;
  @useResult
  $Res call({List<Subscribe> channels});
}

/// @nodoc
class _$GetForcedHomeFeedDataCopyWithImpl<$Res>
    implements $GetForcedHomeFeedDataCopyWith<$Res> {
  _$GetForcedHomeFeedDataCopyWithImpl(this._self, this._then);

  final GetForcedHomeFeedData _self;
  final $Res Function(GetForcedHomeFeedData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channels = null,
  }) {
    return _then(GetForcedHomeFeedData(
      channels: null == channels
          ? _self._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// @nodoc

class GetNewPipeHomeFeedData implements TrendingEvent {
  const GetNewPipeHomeFeedData({required final List<Subscribe> channels})
      : _channels = channels;

  final List<Subscribe> _channels;
  List<Subscribe> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNewPipeHomeFeedDataCopyWith<GetNewPipeHomeFeedData> get copyWith =>
      _$GetNewPipeHomeFeedDataCopyWithImpl<GetNewPipeHomeFeedData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNewPipeHomeFeedData &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channels));

  @override
  String toString() {
    return 'TrendingEvent.getNewPipeHomeFeedData(channels: $channels)';
  }
}

/// @nodoc
abstract mixin class $GetNewPipeHomeFeedDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetNewPipeHomeFeedDataCopyWith(GetNewPipeHomeFeedData value,
          $Res Function(GetNewPipeHomeFeedData) _then) =
      _$GetNewPipeHomeFeedDataCopyWithImpl;
  @useResult
  $Res call({List<Subscribe> channels});
}

/// @nodoc
class _$GetNewPipeHomeFeedDataCopyWithImpl<$Res>
    implements $GetNewPipeHomeFeedDataCopyWith<$Res> {
  _$GetNewPipeHomeFeedDataCopyWithImpl(this._self, this._then);

  final GetNewPipeHomeFeedData _self;
  final $Res Function(GetNewPipeHomeFeedData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channels = null,
  }) {
    return _then(GetNewPipeHomeFeedData(
      channels: null == channels
          ? _self._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// @nodoc

class GetForcedNewPipeHomeFeedData implements TrendingEvent {
  const GetForcedNewPipeHomeFeedData({required final List<Subscribe> channels})
      : _channels = channels;

  final List<Subscribe> _channels;
  List<Subscribe> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetForcedNewPipeHomeFeedDataCopyWith<GetForcedNewPipeHomeFeedData>
      get copyWith => _$GetForcedNewPipeHomeFeedDataCopyWithImpl<
          GetForcedNewPipeHomeFeedData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetForcedNewPipeHomeFeedData &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_channels));

  @override
  String toString() {
    return 'TrendingEvent.getForcedNewPipeHomeFeedData(channels: $channels)';
  }
}

/// @nodoc
abstract mixin class $GetForcedNewPipeHomeFeedDataCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetForcedNewPipeHomeFeedDataCopyWith(
          GetForcedNewPipeHomeFeedData value,
          $Res Function(GetForcedNewPipeHomeFeedData) _then) =
      _$GetForcedNewPipeHomeFeedDataCopyWithImpl;
  @useResult
  $Res call({List<Subscribe> channels});
}

/// @nodoc
class _$GetForcedNewPipeHomeFeedDataCopyWithImpl<$Res>
    implements $GetForcedNewPipeHomeFeedDataCopyWith<$Res> {
  _$GetForcedNewPipeHomeFeedDataCopyWithImpl(this._self, this._then);

  final GetForcedNewPipeHomeFeedData _self;
  final $Res Function(GetForcedNewPipeHomeFeedData) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channels = null,
  }) {
    return _then(GetForcedNewPipeHomeFeedData(
      channels: null == channels
          ? _self._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Subscribe>,
    ));
  }
}

/// @nodoc

class GetPersonalizedFeed implements TrendingEvent {
  const GetPersonalizedFeed(
      {required this.profileName, required this.serviceType});

  final String profileName;
  final String serviceType;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPersonalizedFeedCopyWith<GetPersonalizedFeed> get copyWith =>
      _$GetPersonalizedFeedCopyWithImpl<GetPersonalizedFeed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPersonalizedFeed &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName, serviceType);

  @override
  String toString() {
    return 'TrendingEvent.getPersonalizedFeed(profileName: $profileName, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetPersonalizedFeedCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetPersonalizedFeedCopyWith(
          GetPersonalizedFeed value, $Res Function(GetPersonalizedFeed) _then) =
      _$GetPersonalizedFeedCopyWithImpl;
  @useResult
  $Res call({String profileName, String serviceType});
}

/// @nodoc
class _$GetPersonalizedFeedCopyWithImpl<$Res>
    implements $GetPersonalizedFeedCopyWith<$Res> {
  _$GetPersonalizedFeedCopyWithImpl(this._self, this._then);

  final GetPersonalizedFeed _self;
  final $Res Function(GetPersonalizedFeed) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
    Object? serviceType = null,
  }) {
    return _then(GetPersonalizedFeed(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetForcedPersonalizedFeed implements TrendingEvent {
  const GetForcedPersonalizedFeed(
      {required this.profileName, required this.serviceType});

  final String profileName;
  final String serviceType;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetForcedPersonalizedFeedCopyWith<GetForcedPersonalizedFeed> get copyWith =>
      _$GetForcedPersonalizedFeedCopyWithImpl<GetForcedPersonalizedFeed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetForcedPersonalizedFeed &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName, serviceType);

  @override
  String toString() {
    return 'TrendingEvent.getForcedPersonalizedFeed(profileName: $profileName, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetForcedPersonalizedFeedCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $GetForcedPersonalizedFeedCopyWith(GetForcedPersonalizedFeed value,
          $Res Function(GetForcedPersonalizedFeed) _then) =
      _$GetForcedPersonalizedFeedCopyWithImpl;
  @useResult
  $Res call({String profileName, String serviceType});
}

/// @nodoc
class _$GetForcedPersonalizedFeedCopyWithImpl<$Res>
    implements $GetForcedPersonalizedFeedCopyWith<$Res> {
  _$GetForcedPersonalizedFeedCopyWithImpl(this._self, this._then);

  final GetForcedPersonalizedFeed _self;
  final $Res Function(GetForcedPersonalizedFeed) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
    Object? serviceType = null,
  }) {
    return _then(GetForcedPersonalizedFeed(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadMorePersonalizedFeed implements TrendingEvent {
  const LoadMorePersonalizedFeed(
      {required this.profileName, required this.serviceType});

  final String profileName;
  final String serviceType;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadMorePersonalizedFeedCopyWith<LoadMorePersonalizedFeed> get copyWith =>
      _$LoadMorePersonalizedFeedCopyWithImpl<LoadMorePersonalizedFeed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadMorePersonalizedFeed &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName, serviceType);

  @override
  String toString() {
    return 'TrendingEvent.loadMorePersonalizedFeed(profileName: $profileName, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $LoadMorePersonalizedFeedCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $LoadMorePersonalizedFeedCopyWith(LoadMorePersonalizedFeed value,
          $Res Function(LoadMorePersonalizedFeed) _then) =
      _$LoadMorePersonalizedFeedCopyWithImpl;
  @useResult
  $Res call({String profileName, String serviceType});
}

/// @nodoc
class _$LoadMorePersonalizedFeedCopyWithImpl<$Res>
    implements $LoadMorePersonalizedFeedCopyWith<$Res> {
  _$LoadMorePersonalizedFeedCopyWithImpl(this._self, this._then);

  final LoadMorePersonalizedFeed _self;
  final $Res Function(LoadMorePersonalizedFeed) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
    Object? serviceType = null,
  }) {
    return _then(LoadMorePersonalizedFeed(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadMoreFeed implements TrendingEvent {
  const LoadMoreFeed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadMoreFeed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent.loadMoreFeed()';
  }
}

/// @nodoc

class LoadMoreTrending implements TrendingEvent {
  const LoadMoreTrending({required this.serviceType});

  final String serviceType;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadMoreTrendingCopyWith<LoadMoreTrending> get copyWith =>
      _$LoadMoreTrendingCopyWithImpl<LoadMoreTrending>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadMoreTrending &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceType);

  @override
  String toString() {
    return 'TrendingEvent.loadMoreTrending(serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $LoadMoreTrendingCopyWith<$Res>
    implements $TrendingEventCopyWith<$Res> {
  factory $LoadMoreTrendingCopyWith(
          LoadMoreTrending value, $Res Function(LoadMoreTrending) _then) =
      _$LoadMoreTrendingCopyWithImpl;
  @useResult
  $Res call({String serviceType});
}

/// @nodoc
class _$LoadMoreTrendingCopyWithImpl<$Res>
    implements $LoadMoreTrendingCopyWith<$Res> {
  _$LoadMoreTrendingCopyWithImpl(this._self, this._then);

  final LoadMoreTrending _self;
  final $Res Function(LoadMoreTrending) _then;

  /// Create a copy of TrendingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = null,
  }) {
    return _then(LoadMoreTrending(
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoadMoreNewPipeFeed implements TrendingEvent {
  const LoadMoreNewPipeFeed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadMoreNewPipeFeed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent.loadMoreNewPipeFeed()';
  }
}

/// @nodoc

class LoadMoreNewPipeTrending implements TrendingEvent {
  const LoadMoreNewPipeTrending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadMoreNewPipeTrending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent.loadMoreNewPipeTrending()';
  }
}

/// @nodoc

class LoadMoreInvidiousTrending implements TrendingEvent {
  const LoadMoreInvidiousTrending();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadMoreInvidiousTrending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent.loadMoreInvidiousTrending()';
  }
}

/// @nodoc

class ResetDisplayCounts implements TrendingEvent {
  const ResetDisplayCounts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResetDisplayCounts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrendingEvent.resetDisplayCounts()';
  }
}

/// @nodoc
mixin _$TrendingState {
  String get lastUsedRegion; // PIPED
  List<TrendingResp> get trendingResult;
  List<TrendingResp> get feedResult;
  ApiStatus get fetchTrendingStatus;
  ApiStatus get fetchFeedStatus; // INVIDIOUS
  ApiStatus get fetchInvidiousTrendingStatus;
  List<InvidiousTrendingResp> get invidiousTrendingResult; // NEWPIPE
  ApiStatus get fetchNewPipeTrendingStatus;
  List<NewPipeTrendingResp> get newPipeTrendingResult;
  ApiStatus get fetchNewPipeFeedStatus;
  List<NewPipeTrendingResp>
      get newPipeFeedResult; // PERSONALIZED RECOMMENDATIONS
  ApiStatus get fetchPersonalizedFeedStatus;
  List<dynamic>
      get personalizedFeedResult; // Can be NewPipeSearchItem, TrendingResp, etc.
  bool get hasMorePersonalizedContent;
  int get personalizedFeedQueryOffset; // CACHE TIMESTAMPS - track when data was last fetched
  DateTime? get trendingLastFetched;
  DateTime? get feedLastFetched;
  DateTime? get newPipeTrendingLastFetched;
  DateTime? get newPipeFeedLastFetched;
  DateTime? get invidiousTrendingLastFetched;
  DateTime?
      get personalizedFeedLastFetched; // Pagination state for infinite scroll
// How many items to display (increments as user scrolls)
  int get feedDisplayCount;
  int get trendingDisplayCount;
  int get newPipeFeedDisplayCount;
  int get newPipeTrendingDisplayCount;
  int get invidiousTrendingDisplayCount;
  int get personalizedFeedDisplayCount; // Loading state for "load more"
  bool get isLoadingMoreFeed;
  bool get isLoadingMoreTrending;
  bool get isLoadingMoreNewPipeFeed;
  bool get isLoadingMoreNewPipeTrending;
  bool get isLoadingMoreInvidiousTrending;
  bool get isLoadingMorePersonalizedFeed;

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrendingStateCopyWith<TrendingState> get copyWith =>
      _$TrendingStateCopyWithImpl<TrendingState>(
          this as TrendingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrendingState &&
            (identical(other.lastUsedRegion, lastUsedRegion) ||
                other.lastUsedRegion == lastUsedRegion) &&
            const DeepCollectionEquality()
                .equals(other.trendingResult, trendingResult) &&
            const DeepCollectionEquality()
                .equals(other.feedResult, feedResult) &&
            (identical(other.fetchTrendingStatus, fetchTrendingStatus) ||
                other.fetchTrendingStatus == fetchTrendingStatus) &&
            (identical(other.fetchFeedStatus, fetchFeedStatus) ||
                other.fetchFeedStatus == fetchFeedStatus) &&
            (identical(other.fetchInvidiousTrendingStatus, fetchInvidiousTrendingStatus) ||
                other.fetchInvidiousTrendingStatus ==
                    fetchInvidiousTrendingStatus) &&
            const DeepCollectionEquality().equals(
                other.invidiousTrendingResult, invidiousTrendingResult) &&
            (identical(other.fetchNewPipeTrendingStatus, fetchNewPipeTrendingStatus) ||
                other.fetchNewPipeTrendingStatus ==
                    fetchNewPipeTrendingStatus) &&
            const DeepCollectionEquality()
                .equals(other.newPipeTrendingResult, newPipeTrendingResult) &&
            (identical(other.fetchNewPipeFeedStatus, fetchNewPipeFeedStatus) ||
                other.fetchNewPipeFeedStatus == fetchNewPipeFeedStatus) &&
            const DeepCollectionEquality()
                .equals(other.newPipeFeedResult, newPipeFeedResult) &&
            (identical(other.fetchPersonalizedFeedStatus, fetchPersonalizedFeedStatus) ||
                other.fetchPersonalizedFeedStatus ==
                    fetchPersonalizedFeedStatus) &&
            const DeepCollectionEquality()
                .equals(other.personalizedFeedResult, personalizedFeedResult) &&
            (identical(other.hasMorePersonalizedContent, hasMorePersonalizedContent) ||
                other.hasMorePersonalizedContent ==
                    hasMorePersonalizedContent) &&
            (identical(other.personalizedFeedQueryOffset, personalizedFeedQueryOffset) ||
                other.personalizedFeedQueryOffset ==
                    personalizedFeedQueryOffset) &&
            (identical(other.trendingLastFetched, trendingLastFetched) ||
                other.trendingLastFetched == trendingLastFetched) &&
            (identical(other.feedLastFetched, feedLastFetched) ||
                other.feedLastFetched == feedLastFetched) &&
            (identical(other.newPipeTrendingLastFetched, newPipeTrendingLastFetched) ||
                other.newPipeTrendingLastFetched ==
                    newPipeTrendingLastFetched) &&
            (identical(other.newPipeFeedLastFetched, newPipeFeedLastFetched) ||
                other.newPipeFeedLastFetched == newPipeFeedLastFetched) &&
            (identical(other.invidiousTrendingLastFetched, invidiousTrendingLastFetched) ||
                other.invidiousTrendingLastFetched ==
                    invidiousTrendingLastFetched) &&
            (identical(other.personalizedFeedLastFetched, personalizedFeedLastFetched) ||
                other.personalizedFeedLastFetched == personalizedFeedLastFetched) &&
            (identical(other.feedDisplayCount, feedDisplayCount) || other.feedDisplayCount == feedDisplayCount) &&
            (identical(other.trendingDisplayCount, trendingDisplayCount) || other.trendingDisplayCount == trendingDisplayCount) &&
            (identical(other.newPipeFeedDisplayCount, newPipeFeedDisplayCount) || other.newPipeFeedDisplayCount == newPipeFeedDisplayCount) &&
            (identical(other.newPipeTrendingDisplayCount, newPipeTrendingDisplayCount) || other.newPipeTrendingDisplayCount == newPipeTrendingDisplayCount) &&
            (identical(other.invidiousTrendingDisplayCount, invidiousTrendingDisplayCount) || other.invidiousTrendingDisplayCount == invidiousTrendingDisplayCount) &&
            (identical(other.personalizedFeedDisplayCount, personalizedFeedDisplayCount) || other.personalizedFeedDisplayCount == personalizedFeedDisplayCount) &&
            (identical(other.isLoadingMoreFeed, isLoadingMoreFeed) || other.isLoadingMoreFeed == isLoadingMoreFeed) &&
            (identical(other.isLoadingMoreTrending, isLoadingMoreTrending) || other.isLoadingMoreTrending == isLoadingMoreTrending) &&
            (identical(other.isLoadingMoreNewPipeFeed, isLoadingMoreNewPipeFeed) || other.isLoadingMoreNewPipeFeed == isLoadingMoreNewPipeFeed) &&
            (identical(other.isLoadingMoreNewPipeTrending, isLoadingMoreNewPipeTrending) || other.isLoadingMoreNewPipeTrending == isLoadingMoreNewPipeTrending) &&
            (identical(other.isLoadingMoreInvidiousTrending, isLoadingMoreInvidiousTrending) || other.isLoadingMoreInvidiousTrending == isLoadingMoreInvidiousTrending) &&
            (identical(other.isLoadingMorePersonalizedFeed, isLoadingMorePersonalizedFeed) || other.isLoadingMorePersonalizedFeed == isLoadingMorePersonalizedFeed));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        lastUsedRegion,
        const DeepCollectionEquality().hash(trendingResult),
        const DeepCollectionEquality().hash(feedResult),
        fetchTrendingStatus,
        fetchFeedStatus,
        fetchInvidiousTrendingStatus,
        const DeepCollectionEquality().hash(invidiousTrendingResult),
        fetchNewPipeTrendingStatus,
        const DeepCollectionEquality().hash(newPipeTrendingResult),
        fetchNewPipeFeedStatus,
        const DeepCollectionEquality().hash(newPipeFeedResult),
        fetchPersonalizedFeedStatus,
        const DeepCollectionEquality().hash(personalizedFeedResult),
        hasMorePersonalizedContent,
        personalizedFeedQueryOffset,
        trendingLastFetched,
        feedLastFetched,
        newPipeTrendingLastFetched,
        newPipeFeedLastFetched,
        invidiousTrendingLastFetched,
        personalizedFeedLastFetched,
        feedDisplayCount,
        trendingDisplayCount,
        newPipeFeedDisplayCount,
        newPipeTrendingDisplayCount,
        invidiousTrendingDisplayCount,
        personalizedFeedDisplayCount,
        isLoadingMoreFeed,
        isLoadingMoreTrending,
        isLoadingMoreNewPipeFeed,
        isLoadingMoreNewPipeTrending,
        isLoadingMoreInvidiousTrending,
        isLoadingMorePersonalizedFeed
      ]);

  @override
  String toString() {
    return 'TrendingState(lastUsedRegion: $lastUsedRegion, trendingResult: $trendingResult, feedResult: $feedResult, fetchTrendingStatus: $fetchTrendingStatus, fetchFeedStatus: $fetchFeedStatus, fetchInvidiousTrendingStatus: $fetchInvidiousTrendingStatus, invidiousTrendingResult: $invidiousTrendingResult, fetchNewPipeTrendingStatus: $fetchNewPipeTrendingStatus, newPipeTrendingResult: $newPipeTrendingResult, fetchNewPipeFeedStatus: $fetchNewPipeFeedStatus, newPipeFeedResult: $newPipeFeedResult, fetchPersonalizedFeedStatus: $fetchPersonalizedFeedStatus, personalizedFeedResult: $personalizedFeedResult, hasMorePersonalizedContent: $hasMorePersonalizedContent, personalizedFeedQueryOffset: $personalizedFeedQueryOffset, trendingLastFetched: $trendingLastFetched, feedLastFetched: $feedLastFetched, newPipeTrendingLastFetched: $newPipeTrendingLastFetched, newPipeFeedLastFetched: $newPipeFeedLastFetched, invidiousTrendingLastFetched: $invidiousTrendingLastFetched, personalizedFeedLastFetched: $personalizedFeedLastFetched, feedDisplayCount: $feedDisplayCount, trendingDisplayCount: $trendingDisplayCount, newPipeFeedDisplayCount: $newPipeFeedDisplayCount, newPipeTrendingDisplayCount: $newPipeTrendingDisplayCount, invidiousTrendingDisplayCount: $invidiousTrendingDisplayCount, personalizedFeedDisplayCount: $personalizedFeedDisplayCount, isLoadingMoreFeed: $isLoadingMoreFeed, isLoadingMoreTrending: $isLoadingMoreTrending, isLoadingMoreNewPipeFeed: $isLoadingMoreNewPipeFeed, isLoadingMoreNewPipeTrending: $isLoadingMoreNewPipeTrending, isLoadingMoreInvidiousTrending: $isLoadingMoreInvidiousTrending, isLoadingMorePersonalizedFeed: $isLoadingMorePersonalizedFeed)';
  }
}

/// @nodoc
abstract mixin class $TrendingStateCopyWith<$Res> {
  factory $TrendingStateCopyWith(
          TrendingState value, $Res Function(TrendingState) _then) =
      _$TrendingStateCopyWithImpl;
  @useResult
  $Res call(
      {String lastUsedRegion,
      List<TrendingResp> trendingResult,
      List<TrendingResp> feedResult,
      ApiStatus fetchTrendingStatus,
      ApiStatus fetchFeedStatus,
      ApiStatus fetchInvidiousTrendingStatus,
      List<InvidiousTrendingResp> invidiousTrendingResult,
      ApiStatus fetchNewPipeTrendingStatus,
      List<NewPipeTrendingResp> newPipeTrendingResult,
      ApiStatus fetchNewPipeFeedStatus,
      List<NewPipeTrendingResp> newPipeFeedResult,
      ApiStatus fetchPersonalizedFeedStatus,
      List<dynamic> personalizedFeedResult,
      bool hasMorePersonalizedContent,
      int personalizedFeedQueryOffset,
      DateTime? trendingLastFetched,
      DateTime? feedLastFetched,
      DateTime? newPipeTrendingLastFetched,
      DateTime? newPipeFeedLastFetched,
      DateTime? invidiousTrendingLastFetched,
      DateTime? personalizedFeedLastFetched,
      int feedDisplayCount,
      int trendingDisplayCount,
      int newPipeFeedDisplayCount,
      int newPipeTrendingDisplayCount,
      int invidiousTrendingDisplayCount,
      int personalizedFeedDisplayCount,
      bool isLoadingMoreFeed,
      bool isLoadingMoreTrending,
      bool isLoadingMoreNewPipeFeed,
      bool isLoadingMoreNewPipeTrending,
      bool isLoadingMoreInvidiousTrending,
      bool isLoadingMorePersonalizedFeed});
}

/// @nodoc
class _$TrendingStateCopyWithImpl<$Res>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._self, this._then);

  final TrendingState _self;
  final $Res Function(TrendingState) _then;

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUsedRegion = null,
    Object? trendingResult = null,
    Object? feedResult = null,
    Object? fetchTrendingStatus = null,
    Object? fetchFeedStatus = null,
    Object? fetchInvidiousTrendingStatus = null,
    Object? invidiousTrendingResult = null,
    Object? fetchNewPipeTrendingStatus = null,
    Object? newPipeTrendingResult = null,
    Object? fetchNewPipeFeedStatus = null,
    Object? newPipeFeedResult = null,
    Object? fetchPersonalizedFeedStatus = null,
    Object? personalizedFeedResult = null,
    Object? hasMorePersonalizedContent = null,
    Object? personalizedFeedQueryOffset = null,
    Object? trendingLastFetched = freezed,
    Object? feedLastFetched = freezed,
    Object? newPipeTrendingLastFetched = freezed,
    Object? newPipeFeedLastFetched = freezed,
    Object? invidiousTrendingLastFetched = freezed,
    Object? personalizedFeedLastFetched = freezed,
    Object? feedDisplayCount = null,
    Object? trendingDisplayCount = null,
    Object? newPipeFeedDisplayCount = null,
    Object? newPipeTrendingDisplayCount = null,
    Object? invidiousTrendingDisplayCount = null,
    Object? personalizedFeedDisplayCount = null,
    Object? isLoadingMoreFeed = null,
    Object? isLoadingMoreTrending = null,
    Object? isLoadingMoreNewPipeFeed = null,
    Object? isLoadingMoreNewPipeTrending = null,
    Object? isLoadingMoreInvidiousTrending = null,
    Object? isLoadingMorePersonalizedFeed = null,
  }) {
    return _then(_self.copyWith(
      lastUsedRegion: null == lastUsedRegion
          ? _self.lastUsedRegion
          : lastUsedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      trendingResult: null == trendingResult
          ? _self.trendingResult
          : trendingResult // ignore: cast_nullable_to_non_nullable
              as List<TrendingResp>,
      feedResult: null == feedResult
          ? _self.feedResult
          : feedResult // ignore: cast_nullable_to_non_nullable
              as List<TrendingResp>,
      fetchTrendingStatus: null == fetchTrendingStatus
          ? _self.fetchTrendingStatus
          : fetchTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchFeedStatus: null == fetchFeedStatus
          ? _self.fetchFeedStatus
          : fetchFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchInvidiousTrendingStatus: null == fetchInvidiousTrendingStatus
          ? _self.fetchInvidiousTrendingStatus
          : fetchInvidiousTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousTrendingResult: null == invidiousTrendingResult
          ? _self.invidiousTrendingResult
          : invidiousTrendingResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousTrendingResp>,
      fetchNewPipeTrendingStatus: null == fetchNewPipeTrendingStatus
          ? _self.fetchNewPipeTrendingStatus
          : fetchNewPipeTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeTrendingResult: null == newPipeTrendingResult
          ? _self.newPipeTrendingResult
          : newPipeTrendingResult // ignore: cast_nullable_to_non_nullable
              as List<NewPipeTrendingResp>,
      fetchNewPipeFeedStatus: null == fetchNewPipeFeedStatus
          ? _self.fetchNewPipeFeedStatus
          : fetchNewPipeFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeFeedResult: null == newPipeFeedResult
          ? _self.newPipeFeedResult
          : newPipeFeedResult // ignore: cast_nullable_to_non_nullable
              as List<NewPipeTrendingResp>,
      fetchPersonalizedFeedStatus: null == fetchPersonalizedFeedStatus
          ? _self.fetchPersonalizedFeedStatus
          : fetchPersonalizedFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      personalizedFeedResult: null == personalizedFeedResult
          ? _self.personalizedFeedResult
          : personalizedFeedResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasMorePersonalizedContent: null == hasMorePersonalizedContent
          ? _self.hasMorePersonalizedContent
          : hasMorePersonalizedContent // ignore: cast_nullable_to_non_nullable
              as bool,
      personalizedFeedQueryOffset: null == personalizedFeedQueryOffset
          ? _self.personalizedFeedQueryOffset
          : personalizedFeedQueryOffset // ignore: cast_nullable_to_non_nullable
              as int,
      trendingLastFetched: freezed == trendingLastFetched
          ? _self.trendingLastFetched
          : trendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedLastFetched: freezed == feedLastFetched
          ? _self.feedLastFetched
          : feedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newPipeTrendingLastFetched: freezed == newPipeTrendingLastFetched
          ? _self.newPipeTrendingLastFetched
          : newPipeTrendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newPipeFeedLastFetched: freezed == newPipeFeedLastFetched
          ? _self.newPipeFeedLastFetched
          : newPipeFeedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invidiousTrendingLastFetched: freezed == invidiousTrendingLastFetched
          ? _self.invidiousTrendingLastFetched
          : invidiousTrendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personalizedFeedLastFetched: freezed == personalizedFeedLastFetched
          ? _self.personalizedFeedLastFetched
          : personalizedFeedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedDisplayCount: null == feedDisplayCount
          ? _self.feedDisplayCount
          : feedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      trendingDisplayCount: null == trendingDisplayCount
          ? _self.trendingDisplayCount
          : trendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeFeedDisplayCount: null == newPipeFeedDisplayCount
          ? _self.newPipeFeedDisplayCount
          : newPipeFeedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeTrendingDisplayCount: null == newPipeTrendingDisplayCount
          ? _self.newPipeTrendingDisplayCount
          : newPipeTrendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      invidiousTrendingDisplayCount: null == invidiousTrendingDisplayCount
          ? _self.invidiousTrendingDisplayCount
          : invidiousTrendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      personalizedFeedDisplayCount: null == personalizedFeedDisplayCount
          ? _self.personalizedFeedDisplayCount
          : personalizedFeedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingMoreFeed: null == isLoadingMoreFeed
          ? _self.isLoadingMoreFeed
          : isLoadingMoreFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreTrending: null == isLoadingMoreTrending
          ? _self.isLoadingMoreTrending
          : isLoadingMoreTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreNewPipeFeed: null == isLoadingMoreNewPipeFeed
          ? _self.isLoadingMoreNewPipeFeed
          : isLoadingMoreNewPipeFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreNewPipeTrending: null == isLoadingMoreNewPipeTrending
          ? _self.isLoadingMoreNewPipeTrending
          : isLoadingMoreNewPipeTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreInvidiousTrending: null == isLoadingMoreInvidiousTrending
          ? _self.isLoadingMoreInvidiousTrending
          : isLoadingMoreInvidiousTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMorePersonalizedFeed: null == isLoadingMorePersonalizedFeed
          ? _self.isLoadingMorePersonalizedFeed
          : isLoadingMorePersonalizedFeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TrendingState].
extension TrendingStatePatterns on TrendingState {
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
            String lastUsedRegion,
            List<TrendingResp> trendingResult,
            List<TrendingResp> feedResult,
            ApiStatus fetchTrendingStatus,
            ApiStatus fetchFeedStatus,
            ApiStatus fetchInvidiousTrendingStatus,
            List<InvidiousTrendingResp> invidiousTrendingResult,
            ApiStatus fetchNewPipeTrendingStatus,
            List<NewPipeTrendingResp> newPipeTrendingResult,
            ApiStatus fetchNewPipeFeedStatus,
            List<NewPipeTrendingResp> newPipeFeedResult,
            ApiStatus fetchPersonalizedFeedStatus,
            List<dynamic> personalizedFeedResult,
            bool hasMorePersonalizedContent,
            int personalizedFeedQueryOffset,
            DateTime? trendingLastFetched,
            DateTime? feedLastFetched,
            DateTime? newPipeTrendingLastFetched,
            DateTime? newPipeFeedLastFetched,
            DateTime? invidiousTrendingLastFetched,
            DateTime? personalizedFeedLastFetched,
            int feedDisplayCount,
            int trendingDisplayCount,
            int newPipeFeedDisplayCount,
            int newPipeTrendingDisplayCount,
            int invidiousTrendingDisplayCount,
            int personalizedFeedDisplayCount,
            bool isLoadingMoreFeed,
            bool isLoadingMoreTrending,
            bool isLoadingMoreNewPipeFeed,
            bool isLoadingMoreNewPipeTrending,
            bool isLoadingMoreInvidiousTrending,
            bool isLoadingMorePersonalizedFeed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.lastUsedRegion,
            _that.trendingResult,
            _that.feedResult,
            _that.fetchTrendingStatus,
            _that.fetchFeedStatus,
            _that.fetchInvidiousTrendingStatus,
            _that.invidiousTrendingResult,
            _that.fetchNewPipeTrendingStatus,
            _that.newPipeTrendingResult,
            _that.fetchNewPipeFeedStatus,
            _that.newPipeFeedResult,
            _that.fetchPersonalizedFeedStatus,
            _that.personalizedFeedResult,
            _that.hasMorePersonalizedContent,
            _that.personalizedFeedQueryOffset,
            _that.trendingLastFetched,
            _that.feedLastFetched,
            _that.newPipeTrendingLastFetched,
            _that.newPipeFeedLastFetched,
            _that.invidiousTrendingLastFetched,
            _that.personalizedFeedLastFetched,
            _that.feedDisplayCount,
            _that.trendingDisplayCount,
            _that.newPipeFeedDisplayCount,
            _that.newPipeTrendingDisplayCount,
            _that.invidiousTrendingDisplayCount,
            _that.personalizedFeedDisplayCount,
            _that.isLoadingMoreFeed,
            _that.isLoadingMoreTrending,
            _that.isLoadingMoreNewPipeFeed,
            _that.isLoadingMoreNewPipeTrending,
            _that.isLoadingMoreInvidiousTrending,
            _that.isLoadingMorePersonalizedFeed);
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
            String lastUsedRegion,
            List<TrendingResp> trendingResult,
            List<TrendingResp> feedResult,
            ApiStatus fetchTrendingStatus,
            ApiStatus fetchFeedStatus,
            ApiStatus fetchInvidiousTrendingStatus,
            List<InvidiousTrendingResp> invidiousTrendingResult,
            ApiStatus fetchNewPipeTrendingStatus,
            List<NewPipeTrendingResp> newPipeTrendingResult,
            ApiStatus fetchNewPipeFeedStatus,
            List<NewPipeTrendingResp> newPipeFeedResult,
            ApiStatus fetchPersonalizedFeedStatus,
            List<dynamic> personalizedFeedResult,
            bool hasMorePersonalizedContent,
            int personalizedFeedQueryOffset,
            DateTime? trendingLastFetched,
            DateTime? feedLastFetched,
            DateTime? newPipeTrendingLastFetched,
            DateTime? newPipeFeedLastFetched,
            DateTime? invidiousTrendingLastFetched,
            DateTime? personalizedFeedLastFetched,
            int feedDisplayCount,
            int trendingDisplayCount,
            int newPipeFeedDisplayCount,
            int newPipeTrendingDisplayCount,
            int invidiousTrendingDisplayCount,
            int personalizedFeedDisplayCount,
            bool isLoadingMoreFeed,
            bool isLoadingMoreTrending,
            bool isLoadingMoreNewPipeFeed,
            bool isLoadingMoreNewPipeTrending,
            bool isLoadingMoreInvidiousTrending,
            bool isLoadingMorePersonalizedFeed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return $default(
            _that.lastUsedRegion,
            _that.trendingResult,
            _that.feedResult,
            _that.fetchTrendingStatus,
            _that.fetchFeedStatus,
            _that.fetchInvidiousTrendingStatus,
            _that.invidiousTrendingResult,
            _that.fetchNewPipeTrendingStatus,
            _that.newPipeTrendingResult,
            _that.fetchNewPipeFeedStatus,
            _that.newPipeFeedResult,
            _that.fetchPersonalizedFeedStatus,
            _that.personalizedFeedResult,
            _that.hasMorePersonalizedContent,
            _that.personalizedFeedQueryOffset,
            _that.trendingLastFetched,
            _that.feedLastFetched,
            _that.newPipeTrendingLastFetched,
            _that.newPipeFeedLastFetched,
            _that.invidiousTrendingLastFetched,
            _that.personalizedFeedLastFetched,
            _that.feedDisplayCount,
            _that.trendingDisplayCount,
            _that.newPipeFeedDisplayCount,
            _that.newPipeTrendingDisplayCount,
            _that.invidiousTrendingDisplayCount,
            _that.personalizedFeedDisplayCount,
            _that.isLoadingMoreFeed,
            _that.isLoadingMoreTrending,
            _that.isLoadingMoreNewPipeFeed,
            _that.isLoadingMoreNewPipeTrending,
            _that.isLoadingMoreInvidiousTrending,
            _that.isLoadingMorePersonalizedFeed);
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
            String lastUsedRegion,
            List<TrendingResp> trendingResult,
            List<TrendingResp> feedResult,
            ApiStatus fetchTrendingStatus,
            ApiStatus fetchFeedStatus,
            ApiStatus fetchInvidiousTrendingStatus,
            List<InvidiousTrendingResp> invidiousTrendingResult,
            ApiStatus fetchNewPipeTrendingStatus,
            List<NewPipeTrendingResp> newPipeTrendingResult,
            ApiStatus fetchNewPipeFeedStatus,
            List<NewPipeTrendingResp> newPipeFeedResult,
            ApiStatus fetchPersonalizedFeedStatus,
            List<dynamic> personalizedFeedResult,
            bool hasMorePersonalizedContent,
            int personalizedFeedQueryOffset,
            DateTime? trendingLastFetched,
            DateTime? feedLastFetched,
            DateTime? newPipeTrendingLastFetched,
            DateTime? newPipeFeedLastFetched,
            DateTime? invidiousTrendingLastFetched,
            DateTime? personalizedFeedLastFetched,
            int feedDisplayCount,
            int trendingDisplayCount,
            int newPipeFeedDisplayCount,
            int newPipeTrendingDisplayCount,
            int invidiousTrendingDisplayCount,
            int personalizedFeedDisplayCount,
            bool isLoadingMoreFeed,
            bool isLoadingMoreTrending,
            bool isLoadingMoreNewPipeFeed,
            bool isLoadingMoreNewPipeTrending,
            bool isLoadingMoreInvidiousTrending,
            bool isLoadingMorePersonalizedFeed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Initial() when $default != null:
        return $default(
            _that.lastUsedRegion,
            _that.trendingResult,
            _that.feedResult,
            _that.fetchTrendingStatus,
            _that.fetchFeedStatus,
            _that.fetchInvidiousTrendingStatus,
            _that.invidiousTrendingResult,
            _that.fetchNewPipeTrendingStatus,
            _that.newPipeTrendingResult,
            _that.fetchNewPipeFeedStatus,
            _that.newPipeFeedResult,
            _that.fetchPersonalizedFeedStatus,
            _that.personalizedFeedResult,
            _that.hasMorePersonalizedContent,
            _that.personalizedFeedQueryOffset,
            _that.trendingLastFetched,
            _that.feedLastFetched,
            _that.newPipeTrendingLastFetched,
            _that.newPipeFeedLastFetched,
            _that.invidiousTrendingLastFetched,
            _that.personalizedFeedLastFetched,
            _that.feedDisplayCount,
            _that.trendingDisplayCount,
            _that.newPipeFeedDisplayCount,
            _that.newPipeTrendingDisplayCount,
            _that.invidiousTrendingDisplayCount,
            _that.personalizedFeedDisplayCount,
            _that.isLoadingMoreFeed,
            _that.isLoadingMoreTrending,
            _that.isLoadingMoreNewPipeFeed,
            _that.isLoadingMoreNewPipeTrending,
            _that.isLoadingMoreInvidiousTrending,
            _that.isLoadingMorePersonalizedFeed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TrendingState {
  const _Initial(
      {required this.lastUsedRegion,
      required final List<TrendingResp> trendingResult,
      required final List<TrendingResp> feedResult,
      required this.fetchTrendingStatus,
      required this.fetchFeedStatus,
      required this.fetchInvidiousTrendingStatus,
      required final List<InvidiousTrendingResp> invidiousTrendingResult,
      required this.fetchNewPipeTrendingStatus,
      required final List<NewPipeTrendingResp> newPipeTrendingResult,
      required this.fetchNewPipeFeedStatus,
      required final List<NewPipeTrendingResp> newPipeFeedResult,
      required this.fetchPersonalizedFeedStatus,
      required final List<dynamic> personalizedFeedResult,
      required this.hasMorePersonalizedContent,
      required this.personalizedFeedQueryOffset,
      this.trendingLastFetched,
      this.feedLastFetched,
      this.newPipeTrendingLastFetched,
      this.newPipeFeedLastFetched,
      this.invidiousTrendingLastFetched,
      this.personalizedFeedLastFetched,
      required this.feedDisplayCount,
      required this.trendingDisplayCount,
      required this.newPipeFeedDisplayCount,
      required this.newPipeTrendingDisplayCount,
      required this.invidiousTrendingDisplayCount,
      required this.personalizedFeedDisplayCount,
      required this.isLoadingMoreFeed,
      required this.isLoadingMoreTrending,
      required this.isLoadingMoreNewPipeFeed,
      required this.isLoadingMoreNewPipeTrending,
      required this.isLoadingMoreInvidiousTrending,
      required this.isLoadingMorePersonalizedFeed})
      : _trendingResult = trendingResult,
        _feedResult = feedResult,
        _invidiousTrendingResult = invidiousTrendingResult,
        _newPipeTrendingResult = newPipeTrendingResult,
        _newPipeFeedResult = newPipeFeedResult,
        _personalizedFeedResult = personalizedFeedResult;

  @override
  final String lastUsedRegion;
// PIPED
  final List<TrendingResp> _trendingResult;
// PIPED
  @override
  List<TrendingResp> get trendingResult {
    if (_trendingResult is EqualUnmodifiableListView) return _trendingResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingResult);
  }

  final List<TrendingResp> _feedResult;
  @override
  List<TrendingResp> get feedResult {
    if (_feedResult is EqualUnmodifiableListView) return _feedResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedResult);
  }

  @override
  final ApiStatus fetchTrendingStatus;
  @override
  final ApiStatus fetchFeedStatus;
// INVIDIOUS
  @override
  final ApiStatus fetchInvidiousTrendingStatus;
  final List<InvidiousTrendingResp> _invidiousTrendingResult;
  @override
  List<InvidiousTrendingResp> get invidiousTrendingResult {
    if (_invidiousTrendingResult is EqualUnmodifiableListView)
      return _invidiousTrendingResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousTrendingResult);
  }

// NEWPIPE
  @override
  final ApiStatus fetchNewPipeTrendingStatus;
  final List<NewPipeTrendingResp> _newPipeTrendingResult;
  @override
  List<NewPipeTrendingResp> get newPipeTrendingResult {
    if (_newPipeTrendingResult is EqualUnmodifiableListView)
      return _newPipeTrendingResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPipeTrendingResult);
  }

  @override
  final ApiStatus fetchNewPipeFeedStatus;
  final List<NewPipeTrendingResp> _newPipeFeedResult;
  @override
  List<NewPipeTrendingResp> get newPipeFeedResult {
    if (_newPipeFeedResult is EqualUnmodifiableListView)
      return _newPipeFeedResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPipeFeedResult);
  }

// PERSONALIZED RECOMMENDATIONS
  @override
  final ApiStatus fetchPersonalizedFeedStatus;
  final List<dynamic> _personalizedFeedResult;
  @override
  List<dynamic> get personalizedFeedResult {
    if (_personalizedFeedResult is EqualUnmodifiableListView)
      return _personalizedFeedResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalizedFeedResult);
  }

// Can be NewPipeSearchItem, TrendingResp, etc.
  @override
  final bool hasMorePersonalizedContent;
  @override
  final int personalizedFeedQueryOffset;
// CACHE TIMESTAMPS - track when data was last fetched
  @override
  final DateTime? trendingLastFetched;
  @override
  final DateTime? feedLastFetched;
  @override
  final DateTime? newPipeTrendingLastFetched;
  @override
  final DateTime? newPipeFeedLastFetched;
  @override
  final DateTime? invidiousTrendingLastFetched;
  @override
  final DateTime? personalizedFeedLastFetched;
// Pagination state for infinite scroll
// How many items to display (increments as user scrolls)
  @override
  final int feedDisplayCount;
  @override
  final int trendingDisplayCount;
  @override
  final int newPipeFeedDisplayCount;
  @override
  final int newPipeTrendingDisplayCount;
  @override
  final int invidiousTrendingDisplayCount;
  @override
  final int personalizedFeedDisplayCount;
// Loading state for "load more"
  @override
  final bool isLoadingMoreFeed;
  @override
  final bool isLoadingMoreTrending;
  @override
  final bool isLoadingMoreNewPipeFeed;
  @override
  final bool isLoadingMoreNewPipeTrending;
  @override
  final bool isLoadingMoreInvidiousTrending;
  @override
  final bool isLoadingMorePersonalizedFeed;

  /// Create a copy of TrendingState
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
            (identical(other.lastUsedRegion, lastUsedRegion) ||
                other.lastUsedRegion == lastUsedRegion) &&
            const DeepCollectionEquality()
                .equals(other._trendingResult, _trendingResult) &&
            const DeepCollectionEquality()
                .equals(other._feedResult, _feedResult) &&
            (identical(other.fetchTrendingStatus, fetchTrendingStatus) ||
                other.fetchTrendingStatus == fetchTrendingStatus) &&
            (identical(other.fetchFeedStatus, fetchFeedStatus) ||
                other.fetchFeedStatus == fetchFeedStatus) &&
            (identical(other.fetchInvidiousTrendingStatus, fetchInvidiousTrendingStatus) ||
                other.fetchInvidiousTrendingStatus ==
                    fetchInvidiousTrendingStatus) &&
            const DeepCollectionEquality().equals(
                other._invidiousTrendingResult, _invidiousTrendingResult) &&
            (identical(other.fetchNewPipeTrendingStatus, fetchNewPipeTrendingStatus) ||
                other.fetchNewPipeTrendingStatus ==
                    fetchNewPipeTrendingStatus) &&
            const DeepCollectionEquality()
                .equals(other._newPipeTrendingResult, _newPipeTrendingResult) &&
            (identical(other.fetchNewPipeFeedStatus, fetchNewPipeFeedStatus) ||
                other.fetchNewPipeFeedStatus == fetchNewPipeFeedStatus) &&
            const DeepCollectionEquality()
                .equals(other._newPipeFeedResult, _newPipeFeedResult) &&
            (identical(other.fetchPersonalizedFeedStatus, fetchPersonalizedFeedStatus) ||
                other.fetchPersonalizedFeedStatus ==
                    fetchPersonalizedFeedStatus) &&
            const DeepCollectionEquality().equals(
                other._personalizedFeedResult, _personalizedFeedResult) &&
            (identical(other.hasMorePersonalizedContent, hasMorePersonalizedContent) ||
                other.hasMorePersonalizedContent ==
                    hasMorePersonalizedContent) &&
            (identical(other.personalizedFeedQueryOffset, personalizedFeedQueryOffset) ||
                other.personalizedFeedQueryOffset ==
                    personalizedFeedQueryOffset) &&
            (identical(other.trendingLastFetched, trendingLastFetched) ||
                other.trendingLastFetched == trendingLastFetched) &&
            (identical(other.feedLastFetched, feedLastFetched) ||
                other.feedLastFetched == feedLastFetched) &&
            (identical(other.newPipeTrendingLastFetched, newPipeTrendingLastFetched) ||
                other.newPipeTrendingLastFetched ==
                    newPipeTrendingLastFetched) &&
            (identical(other.newPipeFeedLastFetched, newPipeFeedLastFetched) ||
                other.newPipeFeedLastFetched == newPipeFeedLastFetched) &&
            (identical(other.invidiousTrendingLastFetched, invidiousTrendingLastFetched) ||
                other.invidiousTrendingLastFetched ==
                    invidiousTrendingLastFetched) &&
            (identical(other.personalizedFeedLastFetched, personalizedFeedLastFetched) ||
                other.personalizedFeedLastFetched == personalizedFeedLastFetched) &&
            (identical(other.feedDisplayCount, feedDisplayCount) || other.feedDisplayCount == feedDisplayCount) &&
            (identical(other.trendingDisplayCount, trendingDisplayCount) || other.trendingDisplayCount == trendingDisplayCount) &&
            (identical(other.newPipeFeedDisplayCount, newPipeFeedDisplayCount) || other.newPipeFeedDisplayCount == newPipeFeedDisplayCount) &&
            (identical(other.newPipeTrendingDisplayCount, newPipeTrendingDisplayCount) || other.newPipeTrendingDisplayCount == newPipeTrendingDisplayCount) &&
            (identical(other.invidiousTrendingDisplayCount, invidiousTrendingDisplayCount) || other.invidiousTrendingDisplayCount == invidiousTrendingDisplayCount) &&
            (identical(other.personalizedFeedDisplayCount, personalizedFeedDisplayCount) || other.personalizedFeedDisplayCount == personalizedFeedDisplayCount) &&
            (identical(other.isLoadingMoreFeed, isLoadingMoreFeed) || other.isLoadingMoreFeed == isLoadingMoreFeed) &&
            (identical(other.isLoadingMoreTrending, isLoadingMoreTrending) || other.isLoadingMoreTrending == isLoadingMoreTrending) &&
            (identical(other.isLoadingMoreNewPipeFeed, isLoadingMoreNewPipeFeed) || other.isLoadingMoreNewPipeFeed == isLoadingMoreNewPipeFeed) &&
            (identical(other.isLoadingMoreNewPipeTrending, isLoadingMoreNewPipeTrending) || other.isLoadingMoreNewPipeTrending == isLoadingMoreNewPipeTrending) &&
            (identical(other.isLoadingMoreInvidiousTrending, isLoadingMoreInvidiousTrending) || other.isLoadingMoreInvidiousTrending == isLoadingMoreInvidiousTrending) &&
            (identical(other.isLoadingMorePersonalizedFeed, isLoadingMorePersonalizedFeed) || other.isLoadingMorePersonalizedFeed == isLoadingMorePersonalizedFeed));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        lastUsedRegion,
        const DeepCollectionEquality().hash(_trendingResult),
        const DeepCollectionEquality().hash(_feedResult),
        fetchTrendingStatus,
        fetchFeedStatus,
        fetchInvidiousTrendingStatus,
        const DeepCollectionEquality().hash(_invidiousTrendingResult),
        fetchNewPipeTrendingStatus,
        const DeepCollectionEquality().hash(_newPipeTrendingResult),
        fetchNewPipeFeedStatus,
        const DeepCollectionEquality().hash(_newPipeFeedResult),
        fetchPersonalizedFeedStatus,
        const DeepCollectionEquality().hash(_personalizedFeedResult),
        hasMorePersonalizedContent,
        personalizedFeedQueryOffset,
        trendingLastFetched,
        feedLastFetched,
        newPipeTrendingLastFetched,
        newPipeFeedLastFetched,
        invidiousTrendingLastFetched,
        personalizedFeedLastFetched,
        feedDisplayCount,
        trendingDisplayCount,
        newPipeFeedDisplayCount,
        newPipeTrendingDisplayCount,
        invidiousTrendingDisplayCount,
        personalizedFeedDisplayCount,
        isLoadingMoreFeed,
        isLoadingMoreTrending,
        isLoadingMoreNewPipeFeed,
        isLoadingMoreNewPipeTrending,
        isLoadingMoreInvidiousTrending,
        isLoadingMorePersonalizedFeed
      ]);

  @override
  String toString() {
    return 'TrendingState(lastUsedRegion: $lastUsedRegion, trendingResult: $trendingResult, feedResult: $feedResult, fetchTrendingStatus: $fetchTrendingStatus, fetchFeedStatus: $fetchFeedStatus, fetchInvidiousTrendingStatus: $fetchInvidiousTrendingStatus, invidiousTrendingResult: $invidiousTrendingResult, fetchNewPipeTrendingStatus: $fetchNewPipeTrendingStatus, newPipeTrendingResult: $newPipeTrendingResult, fetchNewPipeFeedStatus: $fetchNewPipeFeedStatus, newPipeFeedResult: $newPipeFeedResult, fetchPersonalizedFeedStatus: $fetchPersonalizedFeedStatus, personalizedFeedResult: $personalizedFeedResult, hasMorePersonalizedContent: $hasMorePersonalizedContent, personalizedFeedQueryOffset: $personalizedFeedQueryOffset, trendingLastFetched: $trendingLastFetched, feedLastFetched: $feedLastFetched, newPipeTrendingLastFetched: $newPipeTrendingLastFetched, newPipeFeedLastFetched: $newPipeFeedLastFetched, invidiousTrendingLastFetched: $invidiousTrendingLastFetched, personalizedFeedLastFetched: $personalizedFeedLastFetched, feedDisplayCount: $feedDisplayCount, trendingDisplayCount: $trendingDisplayCount, newPipeFeedDisplayCount: $newPipeFeedDisplayCount, newPipeTrendingDisplayCount: $newPipeTrendingDisplayCount, invidiousTrendingDisplayCount: $invidiousTrendingDisplayCount, personalizedFeedDisplayCount: $personalizedFeedDisplayCount, isLoadingMoreFeed: $isLoadingMoreFeed, isLoadingMoreTrending: $isLoadingMoreTrending, isLoadingMoreNewPipeFeed: $isLoadingMoreNewPipeFeed, isLoadingMoreNewPipeTrending: $isLoadingMoreNewPipeTrending, isLoadingMoreInvidiousTrending: $isLoadingMoreInvidiousTrending, isLoadingMorePersonalizedFeed: $isLoadingMorePersonalizedFeed)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $TrendingStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String lastUsedRegion,
      List<TrendingResp> trendingResult,
      List<TrendingResp> feedResult,
      ApiStatus fetchTrendingStatus,
      ApiStatus fetchFeedStatus,
      ApiStatus fetchInvidiousTrendingStatus,
      List<InvidiousTrendingResp> invidiousTrendingResult,
      ApiStatus fetchNewPipeTrendingStatus,
      List<NewPipeTrendingResp> newPipeTrendingResult,
      ApiStatus fetchNewPipeFeedStatus,
      List<NewPipeTrendingResp> newPipeFeedResult,
      ApiStatus fetchPersonalizedFeedStatus,
      List<dynamic> personalizedFeedResult,
      bool hasMorePersonalizedContent,
      int personalizedFeedQueryOffset,
      DateTime? trendingLastFetched,
      DateTime? feedLastFetched,
      DateTime? newPipeTrendingLastFetched,
      DateTime? newPipeFeedLastFetched,
      DateTime? invidiousTrendingLastFetched,
      DateTime? personalizedFeedLastFetched,
      int feedDisplayCount,
      int trendingDisplayCount,
      int newPipeFeedDisplayCount,
      int newPipeTrendingDisplayCount,
      int invidiousTrendingDisplayCount,
      int personalizedFeedDisplayCount,
      bool isLoadingMoreFeed,
      bool isLoadingMoreTrending,
      bool isLoadingMoreNewPipeFeed,
      bool isLoadingMoreNewPipeTrending,
      bool isLoadingMoreInvidiousTrending,
      bool isLoadingMorePersonalizedFeed});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of TrendingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastUsedRegion = null,
    Object? trendingResult = null,
    Object? feedResult = null,
    Object? fetchTrendingStatus = null,
    Object? fetchFeedStatus = null,
    Object? fetchInvidiousTrendingStatus = null,
    Object? invidiousTrendingResult = null,
    Object? fetchNewPipeTrendingStatus = null,
    Object? newPipeTrendingResult = null,
    Object? fetchNewPipeFeedStatus = null,
    Object? newPipeFeedResult = null,
    Object? fetchPersonalizedFeedStatus = null,
    Object? personalizedFeedResult = null,
    Object? hasMorePersonalizedContent = null,
    Object? personalizedFeedQueryOffset = null,
    Object? trendingLastFetched = freezed,
    Object? feedLastFetched = freezed,
    Object? newPipeTrendingLastFetched = freezed,
    Object? newPipeFeedLastFetched = freezed,
    Object? invidiousTrendingLastFetched = freezed,
    Object? personalizedFeedLastFetched = freezed,
    Object? feedDisplayCount = null,
    Object? trendingDisplayCount = null,
    Object? newPipeFeedDisplayCount = null,
    Object? newPipeTrendingDisplayCount = null,
    Object? invidiousTrendingDisplayCount = null,
    Object? personalizedFeedDisplayCount = null,
    Object? isLoadingMoreFeed = null,
    Object? isLoadingMoreTrending = null,
    Object? isLoadingMoreNewPipeFeed = null,
    Object? isLoadingMoreNewPipeTrending = null,
    Object? isLoadingMoreInvidiousTrending = null,
    Object? isLoadingMorePersonalizedFeed = null,
  }) {
    return _then(_Initial(
      lastUsedRegion: null == lastUsedRegion
          ? _self.lastUsedRegion
          : lastUsedRegion // ignore: cast_nullable_to_non_nullable
              as String,
      trendingResult: null == trendingResult
          ? _self._trendingResult
          : trendingResult // ignore: cast_nullable_to_non_nullable
              as List<TrendingResp>,
      feedResult: null == feedResult
          ? _self._feedResult
          : feedResult // ignore: cast_nullable_to_non_nullable
              as List<TrendingResp>,
      fetchTrendingStatus: null == fetchTrendingStatus
          ? _self.fetchTrendingStatus
          : fetchTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchFeedStatus: null == fetchFeedStatus
          ? _self.fetchFeedStatus
          : fetchFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      fetchInvidiousTrendingStatus: null == fetchInvidiousTrendingStatus
          ? _self.fetchInvidiousTrendingStatus
          : fetchInvidiousTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousTrendingResult: null == invidiousTrendingResult
          ? _self._invidiousTrendingResult
          : invidiousTrendingResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousTrendingResp>,
      fetchNewPipeTrendingStatus: null == fetchNewPipeTrendingStatus
          ? _self.fetchNewPipeTrendingStatus
          : fetchNewPipeTrendingStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeTrendingResult: null == newPipeTrendingResult
          ? _self._newPipeTrendingResult
          : newPipeTrendingResult // ignore: cast_nullable_to_non_nullable
              as List<NewPipeTrendingResp>,
      fetchNewPipeFeedStatus: null == fetchNewPipeFeedStatus
          ? _self.fetchNewPipeFeedStatus
          : fetchNewPipeFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeFeedResult: null == newPipeFeedResult
          ? _self._newPipeFeedResult
          : newPipeFeedResult // ignore: cast_nullable_to_non_nullable
              as List<NewPipeTrendingResp>,
      fetchPersonalizedFeedStatus: null == fetchPersonalizedFeedStatus
          ? _self.fetchPersonalizedFeedStatus
          : fetchPersonalizedFeedStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      personalizedFeedResult: null == personalizedFeedResult
          ? _self._personalizedFeedResult
          : personalizedFeedResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasMorePersonalizedContent: null == hasMorePersonalizedContent
          ? _self.hasMorePersonalizedContent
          : hasMorePersonalizedContent // ignore: cast_nullable_to_non_nullable
              as bool,
      personalizedFeedQueryOffset: null == personalizedFeedQueryOffset
          ? _self.personalizedFeedQueryOffset
          : personalizedFeedQueryOffset // ignore: cast_nullable_to_non_nullable
              as int,
      trendingLastFetched: freezed == trendingLastFetched
          ? _self.trendingLastFetched
          : trendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedLastFetched: freezed == feedLastFetched
          ? _self.feedLastFetched
          : feedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newPipeTrendingLastFetched: freezed == newPipeTrendingLastFetched
          ? _self.newPipeTrendingLastFetched
          : newPipeTrendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      newPipeFeedLastFetched: freezed == newPipeFeedLastFetched
          ? _self.newPipeFeedLastFetched
          : newPipeFeedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invidiousTrendingLastFetched: freezed == invidiousTrendingLastFetched
          ? _self.invidiousTrendingLastFetched
          : invidiousTrendingLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      personalizedFeedLastFetched: freezed == personalizedFeedLastFetched
          ? _self.personalizedFeedLastFetched
          : personalizedFeedLastFetched // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedDisplayCount: null == feedDisplayCount
          ? _self.feedDisplayCount
          : feedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      trendingDisplayCount: null == trendingDisplayCount
          ? _self.trendingDisplayCount
          : trendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeFeedDisplayCount: null == newPipeFeedDisplayCount
          ? _self.newPipeFeedDisplayCount
          : newPipeFeedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeTrendingDisplayCount: null == newPipeTrendingDisplayCount
          ? _self.newPipeTrendingDisplayCount
          : newPipeTrendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      invidiousTrendingDisplayCount: null == invidiousTrendingDisplayCount
          ? _self.invidiousTrendingDisplayCount
          : invidiousTrendingDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      personalizedFeedDisplayCount: null == personalizedFeedDisplayCount
          ? _self.personalizedFeedDisplayCount
          : personalizedFeedDisplayCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingMoreFeed: null == isLoadingMoreFeed
          ? _self.isLoadingMoreFeed
          : isLoadingMoreFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreTrending: null == isLoadingMoreTrending
          ? _self.isLoadingMoreTrending
          : isLoadingMoreTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreNewPipeFeed: null == isLoadingMoreNewPipeFeed
          ? _self.isLoadingMoreNewPipeFeed
          : isLoadingMoreNewPipeFeed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreNewPipeTrending: null == isLoadingMoreNewPipeTrending
          ? _self.isLoadingMoreNewPipeTrending
          : isLoadingMoreNewPipeTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMoreInvidiousTrending: null == isLoadingMoreInvidiousTrending
          ? _self.isLoadingMoreInvidiousTrending
          : isLoadingMoreInvidiousTrending // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMorePersonalizedFeed: null == isLoadingMorePersonalizedFeed
          ? _self.isLoadingMorePersonalizedFeed
          : isLoadingMorePersonalizedFeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
