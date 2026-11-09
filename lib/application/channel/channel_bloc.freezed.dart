// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChannelEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChannelEvent()';
  }
}

/// @nodoc
class $ChannelEventCopyWith<$Res> {
  $ChannelEventCopyWith(ChannelEvent _, $Res Function(ChannelEvent) __);
}

/// Adds pattern-matching-related methods to [ChannelEvent].
extension ChannelEventPatterns on ChannelEvent {
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
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData() when getChannelData != null:
        return getChannelData(_that);
      case GetMoreChannelVideos() when getMoreChannelVideos != null:
        return getMoreChannelVideos(_that);
      case GetChannelTabContent() when getChannelTabContent != null:
        return getChannelTabContent(_that);
      case SelectTab() when selectTab != null:
        return selectTab(_that);
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
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData():
        return getChannelData(_that);
      case GetMoreChannelVideos():
        return getMoreChannelVideos(_that);
      case GetChannelTabContent():
        return getChannelTabContent(_that);
      case SelectTab():
        return selectTab(_that);
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
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData() when getChannelData != null:
        return getChannelData(_that);
      case GetMoreChannelVideos() when getMoreChannelVideos != null:
        return getMoreChannelVideos(_that);
      case GetChannelTabContent() when getChannelTabContent != null:
        return getChannelTabContent(_that);
      case SelectTab() when selectTab != null:
        return selectTab(_that);
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
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData() when getChannelData != null:
        return getChannelData(_that.serviceType, _that.channelId);
      case GetMoreChannelVideos() when getMoreChannelVideos != null:
        return getMoreChannelVideos(
            _that.serviceType, _that.channelId, _that.nextPage);
      case GetChannelTabContent() when getChannelTabContent != null:
        return getChannelTabContent(_that.tabData, _that.tabName);
      case SelectTab() when selectTab != null:
        return selectTab(_that.index);
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
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData():
        return getChannelData(_that.serviceType, _that.channelId);
      case GetMoreChannelVideos():
        return getMoreChannelVideos(
            _that.serviceType, _that.channelId, _that.nextPage);
      case GetChannelTabContent():
        return getChannelTabContent(_that.tabData, _that.tabName);
      case SelectTab():
        return selectTab(_that.index);
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
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) {
    final _that = this;
    switch (_that) {
      case GetChannelData() when getChannelData != null:
        return getChannelData(_that.serviceType, _that.channelId);
      case GetMoreChannelVideos() when getMoreChannelVideos != null:
        return getMoreChannelVideos(
            _that.serviceType, _that.channelId, _that.nextPage);
      case GetChannelTabContent() when getChannelTabContent != null:
        return getChannelTabContent(_that.tabData, _that.tabName);
      case SelectTab() when selectTab != null:
        return selectTab(_that.index);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetChannelData implements ChannelEvent {
  const GetChannelData({required this.serviceType, required this.channelId});

  final String serviceType;
  final String channelId;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetChannelDataCopyWith<GetChannelData> get copyWith =>
      _$GetChannelDataCopyWithImpl<GetChannelData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetChannelData &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceType, channelId);

  @override
  String toString() {
    return 'ChannelEvent.getChannelData(serviceType: $serviceType, channelId: $channelId)';
  }
}

/// @nodoc
abstract mixin class $GetChannelDataCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory $GetChannelDataCopyWith(
          GetChannelData value, $Res Function(GetChannelData) _then) =
      _$GetChannelDataCopyWithImpl;
  @useResult
  $Res call({String serviceType, String channelId});
}

/// @nodoc
class _$GetChannelDataCopyWithImpl<$Res>
    implements $GetChannelDataCopyWith<$Res> {
  _$GetChannelDataCopyWithImpl(this._self, this._then);

  final GetChannelData _self;
  final $Res Function(GetChannelData) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = null,
    Object? channelId = null,
  }) {
    return _then(GetChannelData(
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreChannelVideos implements ChannelEvent {
  const GetMoreChannelVideos(
      {required this.serviceType,
      required this.channelId,
      required this.nextPage});

  final String serviceType;
  final String channelId;
  final String? nextPage;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreChannelVideosCopyWith<GetMoreChannelVideos> get copyWith =>
      _$GetMoreChannelVideosCopyWithImpl<GetMoreChannelVideos>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreChannelVideos &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceType, channelId, nextPage);

  @override
  String toString() {
    return 'ChannelEvent.getMoreChannelVideos(serviceType: $serviceType, channelId: $channelId, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $GetMoreChannelVideosCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory $GetMoreChannelVideosCopyWith(GetMoreChannelVideos value,
          $Res Function(GetMoreChannelVideos) _then) =
      _$GetMoreChannelVideosCopyWithImpl;
  @useResult
  $Res call({String serviceType, String channelId, String? nextPage});
}

/// @nodoc
class _$GetMoreChannelVideosCopyWithImpl<$Res>
    implements $GetMoreChannelVideosCopyWith<$Res> {
  _$GetMoreChannelVideosCopyWithImpl(this._self, this._then);

  final GetMoreChannelVideos _self;
  final $Res Function(GetMoreChannelVideos) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = null,
    Object? channelId = null,
    Object? nextPage = freezed,
  }) {
    return _then(GetMoreChannelVideos(
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class GetChannelTabContent implements ChannelEvent {
  const GetChannelTabContent({required this.tabData, required this.tabName});

  final String tabData;
  final String tabName;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetChannelTabContentCopyWith<GetChannelTabContent> get copyWith =>
      _$GetChannelTabContentCopyWithImpl<GetChannelTabContent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetChannelTabContent &&
            (identical(other.tabData, tabData) || other.tabData == tabData) &&
            (identical(other.tabName, tabName) || other.tabName == tabName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabData, tabName);

  @override
  String toString() {
    return 'ChannelEvent.getChannelTabContent(tabData: $tabData, tabName: $tabName)';
  }
}

/// @nodoc
abstract mixin class $GetChannelTabContentCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory $GetChannelTabContentCopyWith(GetChannelTabContent value,
          $Res Function(GetChannelTabContent) _then) =
      _$GetChannelTabContentCopyWithImpl;
  @useResult
  $Res call({String tabData, String tabName});
}

/// @nodoc
class _$GetChannelTabContentCopyWithImpl<$Res>
    implements $GetChannelTabContentCopyWith<$Res> {
  _$GetChannelTabContentCopyWithImpl(this._self, this._then);

  final GetChannelTabContent _self;
  final $Res Function(GetChannelTabContent) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tabData = null,
    Object? tabName = null,
  }) {
    return _then(GetChannelTabContent(
      tabData: null == tabData
          ? _self.tabData
          : tabData // ignore: cast_nullable_to_non_nullable
              as String,
      tabName: null == tabName
          ? _self.tabName
          : tabName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectTab implements ChannelEvent {
  const SelectTab({required this.index});

  final int index;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectTabCopyWith<SelectTab> get copyWith =>
      _$SelectTabCopyWithImpl<SelectTab>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectTab &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'ChannelEvent.selectTab(index: $index)';
  }
}

/// @nodoc
abstract mixin class $SelectTabCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory $SelectTabCopyWith(SelectTab value, $Res Function(SelectTab) _then) =
      _$SelectTabCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$SelectTabCopyWithImpl<$Res> implements $SelectTabCopyWith<$Res> {
  _$SelectTabCopyWithImpl(this._self, this._then);

  final SelectTab _self;
  final $Res Function(SelectTab) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(SelectTab(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ChannelState {
//
  bool get isMoreFetchCompleted; // PIPED
  ApiStatus get channelDetailsFetchStatus;
  ChannelResp? get pipedChannelResp;
  ApiStatus get moreChannelDetailsFetchStatus; // PIPED TABS
  int get selectedTabIndex;
  ApiStatus get tabContentFetchStatus;
  TabContent?
      get selectedTabContent; // Separate tab content for shorts and playlists
  ApiStatus get shortsTabFetchStatus;
  TabContent? get shortsTabContent;
  ApiStatus get playlistsTabFetchStatus;
  TabContent? get playlistsTabContent; // INVIDIOUS
  InvidiousChannelResp? get invidiousChannelResp;
  int get invidiousPage; // NEWPIPE
  NewPipeChannelResp? get newPipeChannelResp;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelStateCopyWith<ChannelState> get copyWith =>
      _$ChannelStateCopyWithImpl<ChannelState>(
          this as ChannelState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelState &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.channelDetailsFetchStatus,
                    channelDetailsFetchStatus) ||
                other.channelDetailsFetchStatus == channelDetailsFetchStatus) &&
            (identical(other.pipedChannelResp, pipedChannelResp) ||
                other.pipedChannelResp == pipedChannelResp) &&
            (identical(other.moreChannelDetailsFetchStatus,
                    moreChannelDetailsFetchStatus) ||
                other.moreChannelDetailsFetchStatus ==
                    moreChannelDetailsFetchStatus) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                other.selectedTabIndex == selectedTabIndex) &&
            (identical(other.tabContentFetchStatus, tabContentFetchStatus) ||
                other.tabContentFetchStatus == tabContentFetchStatus) &&
            (identical(other.selectedTabContent, selectedTabContent) ||
                other.selectedTabContent == selectedTabContent) &&
            (identical(other.shortsTabFetchStatus, shortsTabFetchStatus) ||
                other.shortsTabFetchStatus == shortsTabFetchStatus) &&
            (identical(other.shortsTabContent, shortsTabContent) ||
                other.shortsTabContent == shortsTabContent) &&
            (identical(
                    other.playlistsTabFetchStatus, playlistsTabFetchStatus) ||
                other.playlistsTabFetchStatus == playlistsTabFetchStatus) &&
            (identical(other.playlistsTabContent, playlistsTabContent) ||
                other.playlistsTabContent == playlistsTabContent) &&
            (identical(other.invidiousChannelResp, invidiousChannelResp) ||
                other.invidiousChannelResp == invidiousChannelResp) &&
            (identical(other.invidiousPage, invidiousPage) ||
                other.invidiousPage == invidiousPage) &&
            (identical(other.newPipeChannelResp, newPipeChannelResp) ||
                other.newPipeChannelResp == newPipeChannelResp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isMoreFetchCompleted,
      channelDetailsFetchStatus,
      pipedChannelResp,
      moreChannelDetailsFetchStatus,
      selectedTabIndex,
      tabContentFetchStatus,
      selectedTabContent,
      shortsTabFetchStatus,
      shortsTabContent,
      playlistsTabFetchStatus,
      playlistsTabContent,
      invidiousChannelResp,
      invidiousPage,
      newPipeChannelResp);

  @override
  String toString() {
    return 'ChannelState(isMoreFetchCompleted: $isMoreFetchCompleted, channelDetailsFetchStatus: $channelDetailsFetchStatus, pipedChannelResp: $pipedChannelResp, moreChannelDetailsFetchStatus: $moreChannelDetailsFetchStatus, selectedTabIndex: $selectedTabIndex, tabContentFetchStatus: $tabContentFetchStatus, selectedTabContent: $selectedTabContent, shortsTabFetchStatus: $shortsTabFetchStatus, shortsTabContent: $shortsTabContent, playlistsTabFetchStatus: $playlistsTabFetchStatus, playlistsTabContent: $playlistsTabContent, invidiousChannelResp: $invidiousChannelResp, invidiousPage: $invidiousPage, newPipeChannelResp: $newPipeChannelResp)';
  }
}

/// @nodoc
abstract mixin class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) _then) =
      _$ChannelStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isMoreFetchCompleted,
      ApiStatus channelDetailsFetchStatus,
      ChannelResp? pipedChannelResp,
      ApiStatus moreChannelDetailsFetchStatus,
      int selectedTabIndex,
      ApiStatus tabContentFetchStatus,
      TabContent? selectedTabContent,
      ApiStatus shortsTabFetchStatus,
      TabContent? shortsTabContent,
      ApiStatus playlistsTabFetchStatus,
      TabContent? playlistsTabContent,
      InvidiousChannelResp? invidiousChannelResp,
      int invidiousPage,
      NewPipeChannelResp? newPipeChannelResp});
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res> implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._self, this._then);

  final ChannelState _self;
  final $Res Function(ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMoreFetchCompleted = null,
    Object? channelDetailsFetchStatus = null,
    Object? pipedChannelResp = freezed,
    Object? moreChannelDetailsFetchStatus = null,
    Object? selectedTabIndex = null,
    Object? tabContentFetchStatus = null,
    Object? selectedTabContent = freezed,
    Object? shortsTabFetchStatus = null,
    Object? shortsTabContent = freezed,
    Object? playlistsTabFetchStatus = null,
    Object? playlistsTabContent = freezed,
    Object? invidiousChannelResp = freezed,
    Object? invidiousPage = null,
    Object? newPipeChannelResp = freezed,
  }) {
    return _then(_self.copyWith(
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      channelDetailsFetchStatus: null == channelDetailsFetchStatus
          ? _self.channelDetailsFetchStatus
          : channelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      pipedChannelResp: freezed == pipedChannelResp
          ? _self.pipedChannelResp
          : pipedChannelResp // ignore: cast_nullable_to_non_nullable
              as ChannelResp?,
      moreChannelDetailsFetchStatus: null == moreChannelDetailsFetchStatus
          ? _self.moreChannelDetailsFetchStatus
          : moreChannelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabIndex: null == selectedTabIndex
          ? _self.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabContentFetchStatus: null == tabContentFetchStatus
          ? _self.tabContentFetchStatus
          : tabContentFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabContent: freezed == selectedTabContent
          ? _self.selectedTabContent
          : selectedTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      shortsTabFetchStatus: null == shortsTabFetchStatus
          ? _self.shortsTabFetchStatus
          : shortsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      shortsTabContent: freezed == shortsTabContent
          ? _self.shortsTabContent
          : shortsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      playlistsTabFetchStatus: null == playlistsTabFetchStatus
          ? _self.playlistsTabFetchStatus
          : playlistsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      playlistsTabContent: freezed == playlistsTabContent
          ? _self.playlistsTabContent
          : playlistsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      invidiousChannelResp: freezed == invidiousChannelResp
          ? _self.invidiousChannelResp
          : invidiousChannelResp // ignore: cast_nullable_to_non_nullable
              as InvidiousChannelResp?,
      invidiousPage: null == invidiousPage
          ? _self.invidiousPage
          : invidiousPage // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeChannelResp: freezed == newPipeChannelResp
          ? _self.newPipeChannelResp
          : newPipeChannelResp // ignore: cast_nullable_to_non_nullable
              as NewPipeChannelResp?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChannelState].
extension ChannelStatePatterns on ChannelState {
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
    TResult Function(_ChannelState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
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
    TResult Function(_ChannelState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState():
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
    TResult? Function(_ChannelState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
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
            bool isMoreFetchCompleted,
            ApiStatus channelDetailsFetchStatus,
            ChannelResp? pipedChannelResp,
            ApiStatus moreChannelDetailsFetchStatus,
            int selectedTabIndex,
            ApiStatus tabContentFetchStatus,
            TabContent? selectedTabContent,
            ApiStatus shortsTabFetchStatus,
            TabContent? shortsTabContent,
            ApiStatus playlistsTabFetchStatus,
            TabContent? playlistsTabContent,
            InvidiousChannelResp? invidiousChannelResp,
            int invidiousPage,
            NewPipeChannelResp? newPipeChannelResp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
        return $default(
            _that.isMoreFetchCompleted,
            _that.channelDetailsFetchStatus,
            _that.pipedChannelResp,
            _that.moreChannelDetailsFetchStatus,
            _that.selectedTabIndex,
            _that.tabContentFetchStatus,
            _that.selectedTabContent,
            _that.shortsTabFetchStatus,
            _that.shortsTabContent,
            _that.playlistsTabFetchStatus,
            _that.playlistsTabContent,
            _that.invidiousChannelResp,
            _that.invidiousPage,
            _that.newPipeChannelResp);
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
            bool isMoreFetchCompleted,
            ApiStatus channelDetailsFetchStatus,
            ChannelResp? pipedChannelResp,
            ApiStatus moreChannelDetailsFetchStatus,
            int selectedTabIndex,
            ApiStatus tabContentFetchStatus,
            TabContent? selectedTabContent,
            ApiStatus shortsTabFetchStatus,
            TabContent? shortsTabContent,
            ApiStatus playlistsTabFetchStatus,
            TabContent? playlistsTabContent,
            InvidiousChannelResp? invidiousChannelResp,
            int invidiousPage,
            NewPipeChannelResp? newPipeChannelResp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState():
        return $default(
            _that.isMoreFetchCompleted,
            _that.channelDetailsFetchStatus,
            _that.pipedChannelResp,
            _that.moreChannelDetailsFetchStatus,
            _that.selectedTabIndex,
            _that.tabContentFetchStatus,
            _that.selectedTabContent,
            _that.shortsTabFetchStatus,
            _that.shortsTabContent,
            _that.playlistsTabFetchStatus,
            _that.playlistsTabContent,
            _that.invidiousChannelResp,
            _that.invidiousPage,
            _that.newPipeChannelResp);
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
            bool isMoreFetchCompleted,
            ApiStatus channelDetailsFetchStatus,
            ChannelResp? pipedChannelResp,
            ApiStatus moreChannelDetailsFetchStatus,
            int selectedTabIndex,
            ApiStatus tabContentFetchStatus,
            TabContent? selectedTabContent,
            ApiStatus shortsTabFetchStatus,
            TabContent? shortsTabContent,
            ApiStatus playlistsTabFetchStatus,
            TabContent? playlistsTabContent,
            InvidiousChannelResp? invidiousChannelResp,
            int invidiousPage,
            NewPipeChannelResp? newPipeChannelResp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelState() when $default != null:
        return $default(
            _that.isMoreFetchCompleted,
            _that.channelDetailsFetchStatus,
            _that.pipedChannelResp,
            _that.moreChannelDetailsFetchStatus,
            _that.selectedTabIndex,
            _that.tabContentFetchStatus,
            _that.selectedTabContent,
            _that.shortsTabFetchStatus,
            _that.shortsTabContent,
            _that.playlistsTabFetchStatus,
            _that.playlistsTabContent,
            _that.invidiousChannelResp,
            _that.invidiousPage,
            _that.newPipeChannelResp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelState implements ChannelState {
  _ChannelState(
      {required this.isMoreFetchCompleted,
      required this.channelDetailsFetchStatus,
      required this.pipedChannelResp,
      required this.moreChannelDetailsFetchStatus,
      required this.selectedTabIndex,
      required this.tabContentFetchStatus,
      required this.selectedTabContent,
      required this.shortsTabFetchStatus,
      required this.shortsTabContent,
      required this.playlistsTabFetchStatus,
      required this.playlistsTabContent,
      required this.invidiousChannelResp,
      required this.invidiousPage,
      required this.newPipeChannelResp});

//
  @override
  final bool isMoreFetchCompleted;
// PIPED
  @override
  final ApiStatus channelDetailsFetchStatus;
  @override
  final ChannelResp? pipedChannelResp;
  @override
  final ApiStatus moreChannelDetailsFetchStatus;
// PIPED TABS
  @override
  final int selectedTabIndex;
  @override
  final ApiStatus tabContentFetchStatus;
  @override
  final TabContent? selectedTabContent;
// Separate tab content for shorts and playlists
  @override
  final ApiStatus shortsTabFetchStatus;
  @override
  final TabContent? shortsTabContent;
  @override
  final ApiStatus playlistsTabFetchStatus;
  @override
  final TabContent? playlistsTabContent;
// INVIDIOUS
  @override
  final InvidiousChannelResp? invidiousChannelResp;
  @override
  final int invidiousPage;
// NEWPIPE
  @override
  final NewPipeChannelResp? newPipeChannelResp;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelStateCopyWith<_ChannelState> get copyWith =>
      __$ChannelStateCopyWithImpl<_ChannelState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelState &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.channelDetailsFetchStatus,
                    channelDetailsFetchStatus) ||
                other.channelDetailsFetchStatus == channelDetailsFetchStatus) &&
            (identical(other.pipedChannelResp, pipedChannelResp) ||
                other.pipedChannelResp == pipedChannelResp) &&
            (identical(other.moreChannelDetailsFetchStatus,
                    moreChannelDetailsFetchStatus) ||
                other.moreChannelDetailsFetchStatus ==
                    moreChannelDetailsFetchStatus) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                other.selectedTabIndex == selectedTabIndex) &&
            (identical(other.tabContentFetchStatus, tabContentFetchStatus) ||
                other.tabContentFetchStatus == tabContentFetchStatus) &&
            (identical(other.selectedTabContent, selectedTabContent) ||
                other.selectedTabContent == selectedTabContent) &&
            (identical(other.shortsTabFetchStatus, shortsTabFetchStatus) ||
                other.shortsTabFetchStatus == shortsTabFetchStatus) &&
            (identical(other.shortsTabContent, shortsTabContent) ||
                other.shortsTabContent == shortsTabContent) &&
            (identical(
                    other.playlistsTabFetchStatus, playlistsTabFetchStatus) ||
                other.playlistsTabFetchStatus == playlistsTabFetchStatus) &&
            (identical(other.playlistsTabContent, playlistsTabContent) ||
                other.playlistsTabContent == playlistsTabContent) &&
            (identical(other.invidiousChannelResp, invidiousChannelResp) ||
                other.invidiousChannelResp == invidiousChannelResp) &&
            (identical(other.invidiousPage, invidiousPage) ||
                other.invidiousPage == invidiousPage) &&
            (identical(other.newPipeChannelResp, newPipeChannelResp) ||
                other.newPipeChannelResp == newPipeChannelResp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isMoreFetchCompleted,
      channelDetailsFetchStatus,
      pipedChannelResp,
      moreChannelDetailsFetchStatus,
      selectedTabIndex,
      tabContentFetchStatus,
      selectedTabContent,
      shortsTabFetchStatus,
      shortsTabContent,
      playlistsTabFetchStatus,
      playlistsTabContent,
      invidiousChannelResp,
      invidiousPage,
      newPipeChannelResp);

  @override
  String toString() {
    return 'ChannelState(isMoreFetchCompleted: $isMoreFetchCompleted, channelDetailsFetchStatus: $channelDetailsFetchStatus, pipedChannelResp: $pipedChannelResp, moreChannelDetailsFetchStatus: $moreChannelDetailsFetchStatus, selectedTabIndex: $selectedTabIndex, tabContentFetchStatus: $tabContentFetchStatus, selectedTabContent: $selectedTabContent, shortsTabFetchStatus: $shortsTabFetchStatus, shortsTabContent: $shortsTabContent, playlistsTabFetchStatus: $playlistsTabFetchStatus, playlistsTabContent: $playlistsTabContent, invidiousChannelResp: $invidiousChannelResp, invidiousPage: $invidiousPage, newPipeChannelResp: $newPipeChannelResp)';
  }
}

/// @nodoc
abstract mixin class _$ChannelStateCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$ChannelStateCopyWith(
          _ChannelState value, $Res Function(_ChannelState) _then) =
      __$ChannelStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isMoreFetchCompleted,
      ApiStatus channelDetailsFetchStatus,
      ChannelResp? pipedChannelResp,
      ApiStatus moreChannelDetailsFetchStatus,
      int selectedTabIndex,
      ApiStatus tabContentFetchStatus,
      TabContent? selectedTabContent,
      ApiStatus shortsTabFetchStatus,
      TabContent? shortsTabContent,
      ApiStatus playlistsTabFetchStatus,
      TabContent? playlistsTabContent,
      InvidiousChannelResp? invidiousChannelResp,
      int invidiousPage,
      NewPipeChannelResp? newPipeChannelResp});
}

/// @nodoc
class __$ChannelStateCopyWithImpl<$Res>
    implements _$ChannelStateCopyWith<$Res> {
  __$ChannelStateCopyWithImpl(this._self, this._then);

  final _ChannelState _self;
  final $Res Function(_ChannelState) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isMoreFetchCompleted = null,
    Object? channelDetailsFetchStatus = null,
    Object? pipedChannelResp = freezed,
    Object? moreChannelDetailsFetchStatus = null,
    Object? selectedTabIndex = null,
    Object? tabContentFetchStatus = null,
    Object? selectedTabContent = freezed,
    Object? shortsTabFetchStatus = null,
    Object? shortsTabContent = freezed,
    Object? playlistsTabFetchStatus = null,
    Object? playlistsTabContent = freezed,
    Object? invidiousChannelResp = freezed,
    Object? invidiousPage = null,
    Object? newPipeChannelResp = freezed,
  }) {
    return _then(_ChannelState(
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      channelDetailsFetchStatus: null == channelDetailsFetchStatus
          ? _self.channelDetailsFetchStatus
          : channelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      pipedChannelResp: freezed == pipedChannelResp
          ? _self.pipedChannelResp
          : pipedChannelResp // ignore: cast_nullable_to_non_nullable
              as ChannelResp?,
      moreChannelDetailsFetchStatus: null == moreChannelDetailsFetchStatus
          ? _self.moreChannelDetailsFetchStatus
          : moreChannelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabIndex: null == selectedTabIndex
          ? _self.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabContentFetchStatus: null == tabContentFetchStatus
          ? _self.tabContentFetchStatus
          : tabContentFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabContent: freezed == selectedTabContent
          ? _self.selectedTabContent
          : selectedTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      shortsTabFetchStatus: null == shortsTabFetchStatus
          ? _self.shortsTabFetchStatus
          : shortsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      shortsTabContent: freezed == shortsTabContent
          ? _self.shortsTabContent
          : shortsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      playlistsTabFetchStatus: null == playlistsTabFetchStatus
          ? _self.playlistsTabFetchStatus
          : playlistsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      playlistsTabContent: freezed == playlistsTabContent
          ? _self.playlistsTabContent
          : playlistsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      invidiousChannelResp: freezed == invidiousChannelResp
          ? _self.invidiousChannelResp
          : invidiousChannelResp // ignore: cast_nullable_to_non_nullable
              as InvidiousChannelResp?,
      invidiousPage: null == invidiousPage
          ? _self.invidiousPage
          : invidiousPage // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeChannelResp: freezed == newPipeChannelResp
          ? _self.newPipeChannelResp
          : newPipeChannelResp // ignore: cast_nullable_to_non_nullable
              as NewPipeChannelResp?,
    ));
  }
}

// dart format on
