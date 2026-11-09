// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent()';
  }
}

/// @nodoc
class $SearchEventCopyWith<$Res> {
  $SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}

/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult() when getSearchResult != null:
        return getSearchResult(_that);
      case GetMoreSearchResult() when getMoreSearchResult != null:
        return getMoreSearchResult(_that);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that);
      case GetSearchHistory() when getSearchHistory != null:
        return getSearchHistory(_that);
      case SaveSearchQuery() when saveSearchQuery != null:
        return saveSearchQuery(_that);
      case DeleteSearchQuery() when deleteSearchQuery != null:
        return deleteSearchQuery(_that);
      case ClearSearchHistory() when clearSearchHistory != null:
        return clearSearchHistory(_that);
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
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult():
        return getSearchResult(_that);
      case GetMoreSearchResult():
        return getMoreSearchResult(_that);
      case GetSearchSuggestion():
        return getSearchSuggestion(_that);
      case GetSearchHistory():
        return getSearchHistory(_that);
      case SaveSearchQuery():
        return saveSearchQuery(_that);
      case DeleteSearchQuery():
        return deleteSearchQuery(_that);
      case ClearSearchHistory():
        return clearSearchHistory(_that);
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
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult() when getSearchResult != null:
        return getSearchResult(_that);
      case GetMoreSearchResult() when getMoreSearchResult != null:
        return getMoreSearchResult(_that);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that);
      case GetSearchHistory() when getSearchHistory != null:
        return getSearchHistory(_that);
      case SaveSearchQuery() when saveSearchQuery != null:
        return saveSearchQuery(_that);
      case DeleteSearchQuery() when deleteSearchQuery != null:
        return deleteSearchQuery(_that);
      case ClearSearchHistory() when clearSearchHistory != null:
        return clearSearchHistory(_that);
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
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult() when getSearchResult != null:
        return getSearchResult(_that.query, _that.filter, _that.serviceType);
      case GetMoreSearchResult() when getMoreSearchResult != null:
        return getMoreSearchResult(
            _that.query, _that.filter, _that.nextPage, _that.serviceType);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that.query, _that.serviceType);
      case GetSearchHistory() when getSearchHistory != null:
        return getSearchHistory(_that.profileName, _that.limit);
      case SaveSearchQuery() when saveSearchQuery != null:
        return saveSearchQuery(_that.query, _that.profileName);
      case DeleteSearchQuery() when deleteSearchQuery != null:
        return deleteSearchQuery(_that.query, _that.profileName);
      case ClearSearchHistory() when clearSearchHistory != null:
        return clearSearchHistory(_that.profileName);
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
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult():
        return getSearchResult(_that.query, _that.filter, _that.serviceType);
      case GetMoreSearchResult():
        return getMoreSearchResult(
            _that.query, _that.filter, _that.nextPage, _that.serviceType);
      case GetSearchSuggestion():
        return getSearchSuggestion(_that.query, _that.serviceType);
      case GetSearchHistory():
        return getSearchHistory(_that.profileName, _that.limit);
      case SaveSearchQuery():
        return saveSearchQuery(_that.query, _that.profileName);
      case DeleteSearchQuery():
        return deleteSearchQuery(_that.query, _that.profileName);
      case ClearSearchHistory():
        return clearSearchHistory(_that.profileName);
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
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    final _that = this;
    switch (_that) {
      case GetSearchResult() when getSearchResult != null:
        return getSearchResult(_that.query, _that.filter, _that.serviceType);
      case GetMoreSearchResult() when getMoreSearchResult != null:
        return getMoreSearchResult(
            _that.query, _that.filter, _that.nextPage, _that.serviceType);
      case GetSearchSuggestion() when getSearchSuggestion != null:
        return getSearchSuggestion(_that.query, _that.serviceType);
      case GetSearchHistory() when getSearchHistory != null:
        return getSearchHistory(_that.profileName, _that.limit);
      case SaveSearchQuery() when saveSearchQuery != null:
        return saveSearchQuery(_that.query, _that.profileName);
      case DeleteSearchQuery() when deleteSearchQuery != null:
        return deleteSearchQuery(_that.query, _that.profileName);
      case ClearSearchHistory() when clearSearchHistory != null:
        return clearSearchHistory(_that.profileName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetSearchResult implements SearchEvent {
  const GetSearchResult(
      {required this.query, required this.filter, required this.serviceType});

  final String query;
  final String? filter;
  final String serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSearchResultCopyWith<GetSearchResult> get copyWith =>
      _$GetSearchResultCopyWithImpl<GetSearchResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSearchResult &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, filter, serviceType);

  @override
  String toString() {
    return 'SearchEvent.getSearchResult(query: $query, filter: $filter, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetSearchResultCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $GetSearchResultCopyWith(
          GetSearchResult value, $Res Function(GetSearchResult) _then) =
      _$GetSearchResultCopyWithImpl;
  @useResult
  $Res call({String query, String? filter, String serviceType});
}

/// @nodoc
class _$GetSearchResultCopyWithImpl<$Res>
    implements $GetSearchResultCopyWith<$Res> {
  _$GetSearchResultCopyWithImpl(this._self, this._then);

  final GetSearchResult _self;
  final $Res Function(GetSearchResult) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? filter = freezed,
    Object? serviceType = null,
  }) {
    return _then(GetSearchResult(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetMoreSearchResult implements SearchEvent {
  const GetMoreSearchResult(
      {required this.query,
      required this.filter,
      required this.nextPage,
      required this.serviceType});

  final String query;
  final String? filter;
  final String? nextPage;
  final String serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetMoreSearchResultCopyWith<GetMoreSearchResult> get copyWith =>
      _$GetMoreSearchResultCopyWithImpl<GetMoreSearchResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetMoreSearchResult &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, filter, nextPage, serviceType);

  @override
  String toString() {
    return 'SearchEvent.getMoreSearchResult(query: $query, filter: $filter, nextPage: $nextPage, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetMoreSearchResultCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $GetMoreSearchResultCopyWith(
          GetMoreSearchResult value, $Res Function(GetMoreSearchResult) _then) =
      _$GetMoreSearchResultCopyWithImpl;
  @useResult
  $Res call(
      {String query, String? filter, String? nextPage, String serviceType});
}

/// @nodoc
class _$GetMoreSearchResultCopyWithImpl<$Res>
    implements $GetMoreSearchResultCopyWith<$Res> {
  _$GetMoreSearchResultCopyWithImpl(this._self, this._then);

  final GetMoreSearchResult _self;
  final $Res Function(GetMoreSearchResult) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? filter = freezed,
    Object? nextPage = freezed,
    Object? serviceType = null,
  }) {
    return _then(GetMoreSearchResult(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetSearchSuggestion implements SearchEvent {
  const GetSearchSuggestion({required this.query, required this.serviceType});

  final String query;
  final String serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSearchSuggestionCopyWith<GetSearchSuggestion> get copyWith =>
      _$GetSearchSuggestionCopyWithImpl<GetSearchSuggestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSearchSuggestion &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, serviceType);

  @override
  String toString() {
    return 'SearchEvent.getSearchSuggestion(query: $query, serviceType: $serviceType)';
  }
}

/// @nodoc
abstract mixin class $GetSearchSuggestionCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $GetSearchSuggestionCopyWith(
          GetSearchSuggestion value, $Res Function(GetSearchSuggestion) _then) =
      _$GetSearchSuggestionCopyWithImpl;
  @useResult
  $Res call({String query, String serviceType});
}

/// @nodoc
class _$GetSearchSuggestionCopyWithImpl<$Res>
    implements $GetSearchSuggestionCopyWith<$Res> {
  _$GetSearchSuggestionCopyWithImpl(this._self, this._then);

  final GetSearchSuggestion _self;
  final $Res Function(GetSearchSuggestion) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? serviceType = null,
  }) {
    return _then(GetSearchSuggestion(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetSearchHistory implements SearchEvent {
  const GetSearchHistory({this.profileName = 'default', this.limit = 20});

  @JsonKey()
  final String profileName;
  @JsonKey()
  final int limit;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSearchHistoryCopyWith<GetSearchHistory> get copyWith =>
      _$GetSearchHistoryCopyWithImpl<GetSearchHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSearchHistory &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName, limit);

  @override
  String toString() {
    return 'SearchEvent.getSearchHistory(profileName: $profileName, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $GetSearchHistoryCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $GetSearchHistoryCopyWith(
          GetSearchHistory value, $Res Function(GetSearchHistory) _then) =
      _$GetSearchHistoryCopyWithImpl;
  @useResult
  $Res call({String profileName, int limit});
}

/// @nodoc
class _$GetSearchHistoryCopyWithImpl<$Res>
    implements $GetSearchHistoryCopyWith<$Res> {
  _$GetSearchHistoryCopyWithImpl(this._self, this._then);

  final GetSearchHistory _self;
  final $Res Function(GetSearchHistory) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
    Object? limit = null,
  }) {
    return _then(GetSearchHistory(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SaveSearchQuery implements SearchEvent {
  const SaveSearchQuery({required this.query, this.profileName = 'default'});

  final String query;
  @JsonKey()
  final String profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveSearchQueryCopyWith<SaveSearchQuery> get copyWith =>
      _$SaveSearchQueryCopyWithImpl<SaveSearchQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveSearchQuery &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, profileName);

  @override
  String toString() {
    return 'SearchEvent.saveSearchQuery(query: $query, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $SaveSearchQueryCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $SaveSearchQueryCopyWith(
          SaveSearchQuery value, $Res Function(SaveSearchQuery) _then) =
      _$SaveSearchQueryCopyWithImpl;
  @useResult
  $Res call({String query, String profileName});
}

/// @nodoc
class _$SaveSearchQueryCopyWithImpl<$Res>
    implements $SaveSearchQueryCopyWith<$Res> {
  _$SaveSearchQueryCopyWithImpl(this._self, this._then);

  final SaveSearchQuery _self;
  final $Res Function(SaveSearchQuery) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? profileName = null,
  }) {
    return _then(SaveSearchQuery(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteSearchQuery implements SearchEvent {
  const DeleteSearchQuery({required this.query, this.profileName = 'default'});

  final String query;
  @JsonKey()
  final String profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteSearchQueryCopyWith<DeleteSearchQuery> get copyWith =>
      _$DeleteSearchQueryCopyWithImpl<DeleteSearchQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteSearchQuery &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, profileName);

  @override
  String toString() {
    return 'SearchEvent.deleteSearchQuery(query: $query, profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $DeleteSearchQueryCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $DeleteSearchQueryCopyWith(
          DeleteSearchQuery value, $Res Function(DeleteSearchQuery) _then) =
      _$DeleteSearchQueryCopyWithImpl;
  @useResult
  $Res call({String query, String profileName});
}

/// @nodoc
class _$DeleteSearchQueryCopyWithImpl<$Res>
    implements $DeleteSearchQueryCopyWith<$Res> {
  _$DeleteSearchQueryCopyWithImpl(this._self, this._then);

  final DeleteSearchQuery _self;
  final $Res Function(DeleteSearchQuery) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? profileName = null,
  }) {
    return _then(DeleteSearchQuery(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClearSearchHistory implements SearchEvent {
  const ClearSearchHistory({this.profileName = 'default'});

  @JsonKey()
  final String profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClearSearchHistoryCopyWith<ClearSearchHistory> get copyWith =>
      _$ClearSearchHistoryCopyWithImpl<ClearSearchHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClearSearchHistory &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  @override
  String toString() {
    return 'SearchEvent.clearSearchHistory(profileName: $profileName)';
  }
}

/// @nodoc
abstract mixin class $ClearSearchHistoryCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $ClearSearchHistoryCopyWith(
          ClearSearchHistory value, $Res Function(ClearSearchHistory) _then) =
      _$ClearSearchHistoryCopyWithImpl;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class _$ClearSearchHistoryCopyWithImpl<$Res>
    implements $ClearSearchHistoryCopyWith<$Res> {
  _$ClearSearchHistoryCopyWithImpl(this._self, this._then);

  final ClearSearchHistory _self;
  final $Res Function(ClearSearchHistory) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileName = null,
  }) {
    return _then(ClearSearchHistory(
      profileName: null == profileName
          ? _self.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SearchState {
//
  bool get isSuggestionDisplay; // PIPED
  ApiStatus get fetchSearchResultStatus;
  SearchResp? get result;
  ApiStatus get fetchSuggestionStatus;
  List get suggestions;
  ApiStatus get fetchMoreSearchResultStatus;
  bool get isMoreFetchCompleted; // INVIDIOUS
  ApiStatus get fetchInvidiousSearchResultStatus;
  List<InvidiousSearchResp> get invidiousSearchResult;
  ApiStatus get fetchInvidiousSuggestionStatus;
  List get invidiousSuggestionResult;
  ApiStatus get fetchMoreInvidiousSearchResultStatus;
  bool get isMoreInvidiousFetchCompleted;
  int? get page; // NEWPIPE
  ApiStatus get fetchNewPipeSearchResultStatus;
  NewPipeSearchResp? get newPipeSearchResult;
  ApiStatus get fetchNewPipeSuggestionStatus;
  List get newPipeSuggestionResult;
  ApiStatus get fetchMoreNewPipeSearchResultStatus;
  bool get isMoreNewPipeFetchCompleted; // SEARCH HISTORY
  ApiStatus get fetchSearchHistoryStatus;
  List<LocalSearchHistory> get searchHistory;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            (identical(other.isSuggestionDisplay, isSuggestionDisplay) ||
                other.isSuggestionDisplay == isSuggestionDisplay) &&
            (identical(other.fetchSearchResultStatus, fetchSearchResultStatus) ||
                other.fetchSearchResultStatus == fetchSearchResultStatus) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.fetchSuggestionStatus, fetchSuggestionStatus) ||
                other.fetchSuggestionStatus == fetchSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions) &&
            (identical(other.fetchMoreSearchResultStatus, fetchMoreSearchResultStatus) ||
                other.fetchMoreSearchResultStatus ==
                    fetchMoreSearchResultStatus) &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.fetchInvidiousSearchResultStatus, fetchInvidiousSearchResultStatus) ||
                other.fetchInvidiousSearchResultStatus ==
                    fetchInvidiousSearchResultStatus) &&
            const DeepCollectionEquality()
                .equals(other.invidiousSearchResult, invidiousSearchResult) &&
            (identical(other.fetchInvidiousSuggestionStatus, fetchInvidiousSuggestionStatus) ||
                other.fetchInvidiousSuggestionStatus ==
                    fetchInvidiousSuggestionStatus) &&
            const DeepCollectionEquality().equals(
                other.invidiousSuggestionResult, invidiousSuggestionResult) &&
            (identical(other.fetchMoreInvidiousSearchResultStatus, fetchMoreInvidiousSearchResultStatus) ||
                other.fetchMoreInvidiousSearchResultStatus ==
                    fetchMoreInvidiousSearchResultStatus) &&
            (identical(other.isMoreInvidiousFetchCompleted, isMoreInvidiousFetchCompleted) ||
                other.isMoreInvidiousFetchCompleted ==
                    isMoreInvidiousFetchCompleted) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.fetchNewPipeSearchResultStatus, fetchNewPipeSearchResultStatus) ||
                other.fetchNewPipeSearchResultStatus ==
                    fetchNewPipeSearchResultStatus) &&
            (identical(other.newPipeSearchResult, newPipeSearchResult) ||
                other.newPipeSearchResult == newPipeSearchResult) &&
            (identical(other.fetchNewPipeSuggestionStatus, fetchNewPipeSuggestionStatus) ||
                other.fetchNewPipeSuggestionStatus ==
                    fetchNewPipeSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other.newPipeSuggestionResult, newPipeSuggestionResult) &&
            (identical(other.fetchMoreNewPipeSearchResultStatus, fetchMoreNewPipeSearchResultStatus) || other.fetchMoreNewPipeSearchResultStatus == fetchMoreNewPipeSearchResultStatus) &&
            (identical(other.isMoreNewPipeFetchCompleted, isMoreNewPipeFetchCompleted) || other.isMoreNewPipeFetchCompleted == isMoreNewPipeFetchCompleted) &&
            (identical(other.fetchSearchHistoryStatus, fetchSearchHistoryStatus) || other.fetchSearchHistoryStatus == fetchSearchHistoryStatus) &&
            const DeepCollectionEquality().equals(other.searchHistory, searchHistory));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isSuggestionDisplay,
        fetchSearchResultStatus,
        result,
        fetchSuggestionStatus,
        const DeepCollectionEquality().hash(suggestions),
        fetchMoreSearchResultStatus,
        isMoreFetchCompleted,
        fetchInvidiousSearchResultStatus,
        const DeepCollectionEquality().hash(invidiousSearchResult),
        fetchInvidiousSuggestionStatus,
        const DeepCollectionEquality().hash(invidiousSuggestionResult),
        fetchMoreInvidiousSearchResultStatus,
        isMoreInvidiousFetchCompleted,
        page,
        fetchNewPipeSearchResultStatus,
        newPipeSearchResult,
        fetchNewPipeSuggestionStatus,
        const DeepCollectionEquality().hash(newPipeSuggestionResult),
        fetchMoreNewPipeSearchResultStatus,
        isMoreNewPipeFetchCompleted,
        fetchSearchHistoryStatus,
        const DeepCollectionEquality().hash(searchHistory)
      ]);

  @override
  String toString() {
    return 'SearchState(isSuggestionDisplay: $isSuggestionDisplay, fetchSearchResultStatus: $fetchSearchResultStatus, result: $result, fetchSuggestionStatus: $fetchSuggestionStatus, suggestions: $suggestions, fetchMoreSearchResultStatus: $fetchMoreSearchResultStatus, isMoreFetchCompleted: $isMoreFetchCompleted, fetchInvidiousSearchResultStatus: $fetchInvidiousSearchResultStatus, invidiousSearchResult: $invidiousSearchResult, fetchInvidiousSuggestionStatus: $fetchInvidiousSuggestionStatus, invidiousSuggestionResult: $invidiousSuggestionResult, fetchMoreInvidiousSearchResultStatus: $fetchMoreInvidiousSearchResultStatus, isMoreInvidiousFetchCompleted: $isMoreInvidiousFetchCompleted, page: $page, fetchNewPipeSearchResultStatus: $fetchNewPipeSearchResultStatus, newPipeSearchResult: $newPipeSearchResult, fetchNewPipeSuggestionStatus: $fetchNewPipeSuggestionStatus, newPipeSuggestionResult: $newPipeSuggestionResult, fetchMoreNewPipeSearchResultStatus: $fetchMoreNewPipeSearchResultStatus, isMoreNewPipeFetchCompleted: $isMoreNewPipeFetchCompleted, fetchSearchHistoryStatus: $fetchSearchHistoryStatus, searchHistory: $searchHistory)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) _then) =
      _$SearchStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isSuggestionDisplay,
      ApiStatus fetchSearchResultStatus,
      SearchResp? result,
      ApiStatus fetchSuggestionStatus,
      List suggestions,
      ApiStatus fetchMoreSearchResultStatus,
      bool isMoreFetchCompleted,
      ApiStatus fetchInvidiousSearchResultStatus,
      List<InvidiousSearchResp> invidiousSearchResult,
      ApiStatus fetchInvidiousSuggestionStatus,
      List invidiousSuggestionResult,
      ApiStatus fetchMoreInvidiousSearchResultStatus,
      bool isMoreInvidiousFetchCompleted,
      int? page,
      ApiStatus fetchNewPipeSearchResultStatus,
      NewPipeSearchResp? newPipeSearchResult,
      ApiStatus fetchNewPipeSuggestionStatus,
      List newPipeSuggestionResult,
      ApiStatus fetchMoreNewPipeSearchResultStatus,
      bool isMoreNewPipeFetchCompleted,
      ApiStatus fetchSearchHistoryStatus,
      List<LocalSearchHistory> searchHistory});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuggestionDisplay = null,
    Object? fetchSearchResultStatus = null,
    Object? result = freezed,
    Object? fetchSuggestionStatus = null,
    Object? suggestions = null,
    Object? fetchMoreSearchResultStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? fetchInvidiousSearchResultStatus = null,
    Object? invidiousSearchResult = null,
    Object? fetchInvidiousSuggestionStatus = null,
    Object? invidiousSuggestionResult = null,
    Object? fetchMoreInvidiousSearchResultStatus = null,
    Object? isMoreInvidiousFetchCompleted = null,
    Object? page = freezed,
    Object? fetchNewPipeSearchResultStatus = null,
    Object? newPipeSearchResult = freezed,
    Object? fetchNewPipeSuggestionStatus = null,
    Object? newPipeSuggestionResult = null,
    Object? fetchMoreNewPipeSearchResultStatus = null,
    Object? isMoreNewPipeFetchCompleted = null,
    Object? fetchSearchHistoryStatus = null,
    Object? searchHistory = null,
  }) {
    return _then(_self.copyWith(
      isSuggestionDisplay: null == isSuggestionDisplay
          ? _self.isSuggestionDisplay
          : isSuggestionDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchResultStatus: null == fetchSearchResultStatus
          ? _self.fetchSearchResultStatus
          : fetchSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as SearchResp?,
      fetchSuggestionStatus: null == fetchSuggestionStatus
          ? _self.fetchSuggestionStatus
          : fetchSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      suggestions: null == suggestions
          ? _self.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreSearchResultStatus: null == fetchMoreSearchResultStatus
          ? _self.fetchMoreSearchResultStatus
          : fetchMoreSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchInvidiousSearchResultStatus: null == fetchInvidiousSearchResultStatus
          ? _self.fetchInvidiousSearchResultStatus
          : fetchInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSearchResult: null == invidiousSearchResult
          ? _self.invidiousSearchResult
          : invidiousSearchResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousSearchResp>,
      fetchInvidiousSuggestionStatus: null == fetchInvidiousSuggestionStatus
          ? _self.fetchInvidiousSuggestionStatus
          : fetchInvidiousSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSuggestionResult: null == invidiousSuggestionResult
          ? _self.invidiousSuggestionResult
          : invidiousSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreInvidiousSearchResultStatus: null ==
              fetchMoreInvidiousSearchResultStatus
          ? _self.fetchMoreInvidiousSearchResultStatus
          : fetchMoreInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousFetchCompleted: null == isMoreInvidiousFetchCompleted
          ? _self.isMoreInvidiousFetchCompleted
          : isMoreInvidiousFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      fetchNewPipeSearchResultStatus: null == fetchNewPipeSearchResultStatus
          ? _self.fetchNewPipeSearchResultStatus
          : fetchNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSearchResult: freezed == newPipeSearchResult
          ? _self.newPipeSearchResult
          : newPipeSearchResult // ignore: cast_nullable_to_non_nullable
              as NewPipeSearchResp?,
      fetchNewPipeSuggestionStatus: null == fetchNewPipeSuggestionStatus
          ? _self.fetchNewPipeSuggestionStatus
          : fetchNewPipeSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSuggestionResult: null == newPipeSuggestionResult
          ? _self.newPipeSuggestionResult
          : newPipeSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreNewPipeSearchResultStatus: null ==
              fetchMoreNewPipeSearchResultStatus
          ? _self.fetchMoreNewPipeSearchResultStatus
          : fetchMoreNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeFetchCompleted: null == isMoreNewPipeFetchCompleted
          ? _self.isMoreNewPipeFetchCompleted
          : isMoreNewPipeFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchHistoryStatus: null == fetchSearchHistoryStatus
          ? _self.fetchSearchHistoryStatus
          : fetchSearchHistoryStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      searchHistory: null == searchHistory
          ? _self.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<LocalSearchHistory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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
    TResult Function(_SearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
    TResult Function(_SearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
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
    TResult? Function(_SearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
            bool isSuggestionDisplay,
            ApiStatus fetchSearchResultStatus,
            SearchResp? result,
            ApiStatus fetchSuggestionStatus,
            List suggestions,
            ApiStatus fetchMoreSearchResultStatus,
            bool isMoreFetchCompleted,
            ApiStatus fetchInvidiousSearchResultStatus,
            List<InvidiousSearchResp> invidiousSearchResult,
            ApiStatus fetchInvidiousSuggestionStatus,
            List invidiousSuggestionResult,
            ApiStatus fetchMoreInvidiousSearchResultStatus,
            bool isMoreInvidiousFetchCompleted,
            int? page,
            ApiStatus fetchNewPipeSearchResultStatus,
            NewPipeSearchResp? newPipeSearchResult,
            ApiStatus fetchNewPipeSuggestionStatus,
            List newPipeSuggestionResult,
            ApiStatus fetchMoreNewPipeSearchResultStatus,
            bool isMoreNewPipeFetchCompleted,
            ApiStatus fetchSearchHistoryStatus,
            List<LocalSearchHistory> searchHistory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.isSuggestionDisplay,
            _that.fetchSearchResultStatus,
            _that.result,
            _that.fetchSuggestionStatus,
            _that.suggestions,
            _that.fetchMoreSearchResultStatus,
            _that.isMoreFetchCompleted,
            _that.fetchInvidiousSearchResultStatus,
            _that.invidiousSearchResult,
            _that.fetchInvidiousSuggestionStatus,
            _that.invidiousSuggestionResult,
            _that.fetchMoreInvidiousSearchResultStatus,
            _that.isMoreInvidiousFetchCompleted,
            _that.page,
            _that.fetchNewPipeSearchResultStatus,
            _that.newPipeSearchResult,
            _that.fetchNewPipeSuggestionStatus,
            _that.newPipeSuggestionResult,
            _that.fetchMoreNewPipeSearchResultStatus,
            _that.isMoreNewPipeFetchCompleted,
            _that.fetchSearchHistoryStatus,
            _that.searchHistory);
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
            bool isSuggestionDisplay,
            ApiStatus fetchSearchResultStatus,
            SearchResp? result,
            ApiStatus fetchSuggestionStatus,
            List suggestions,
            ApiStatus fetchMoreSearchResultStatus,
            bool isMoreFetchCompleted,
            ApiStatus fetchInvidiousSearchResultStatus,
            List<InvidiousSearchResp> invidiousSearchResult,
            ApiStatus fetchInvidiousSuggestionStatus,
            List invidiousSuggestionResult,
            ApiStatus fetchMoreInvidiousSearchResultStatus,
            bool isMoreInvidiousFetchCompleted,
            int? page,
            ApiStatus fetchNewPipeSearchResultStatus,
            NewPipeSearchResp? newPipeSearchResult,
            ApiStatus fetchNewPipeSuggestionStatus,
            List newPipeSuggestionResult,
            ApiStatus fetchMoreNewPipeSearchResultStatus,
            bool isMoreNewPipeFetchCompleted,
            ApiStatus fetchSearchHistoryStatus,
            List<LocalSearchHistory> searchHistory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(
            _that.isSuggestionDisplay,
            _that.fetchSearchResultStatus,
            _that.result,
            _that.fetchSuggestionStatus,
            _that.suggestions,
            _that.fetchMoreSearchResultStatus,
            _that.isMoreFetchCompleted,
            _that.fetchInvidiousSearchResultStatus,
            _that.invidiousSearchResult,
            _that.fetchInvidiousSuggestionStatus,
            _that.invidiousSuggestionResult,
            _that.fetchMoreInvidiousSearchResultStatus,
            _that.isMoreInvidiousFetchCompleted,
            _that.page,
            _that.fetchNewPipeSearchResultStatus,
            _that.newPipeSearchResult,
            _that.fetchNewPipeSuggestionStatus,
            _that.newPipeSuggestionResult,
            _that.fetchMoreNewPipeSearchResultStatus,
            _that.isMoreNewPipeFetchCompleted,
            _that.fetchSearchHistoryStatus,
            _that.searchHistory);
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
            bool isSuggestionDisplay,
            ApiStatus fetchSearchResultStatus,
            SearchResp? result,
            ApiStatus fetchSuggestionStatus,
            List suggestions,
            ApiStatus fetchMoreSearchResultStatus,
            bool isMoreFetchCompleted,
            ApiStatus fetchInvidiousSearchResultStatus,
            List<InvidiousSearchResp> invidiousSearchResult,
            ApiStatus fetchInvidiousSuggestionStatus,
            List invidiousSuggestionResult,
            ApiStatus fetchMoreInvidiousSearchResultStatus,
            bool isMoreInvidiousFetchCompleted,
            int? page,
            ApiStatus fetchNewPipeSearchResultStatus,
            NewPipeSearchResp? newPipeSearchResult,
            ApiStatus fetchNewPipeSuggestionStatus,
            List newPipeSuggestionResult,
            ApiStatus fetchMoreNewPipeSearchResultStatus,
            bool isMoreNewPipeFetchCompleted,
            ApiStatus fetchSearchHistoryStatus,
            List<LocalSearchHistory> searchHistory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.isSuggestionDisplay,
            _that.fetchSearchResultStatus,
            _that.result,
            _that.fetchSuggestionStatus,
            _that.suggestions,
            _that.fetchMoreSearchResultStatus,
            _that.isMoreFetchCompleted,
            _that.fetchInvidiousSearchResultStatus,
            _that.invidiousSearchResult,
            _that.fetchInvidiousSuggestionStatus,
            _that.invidiousSuggestionResult,
            _that.fetchMoreInvidiousSearchResultStatus,
            _that.isMoreInvidiousFetchCompleted,
            _that.page,
            _that.fetchNewPipeSearchResultStatus,
            _that.newPipeSearchResult,
            _that.fetchNewPipeSuggestionStatus,
            _that.newPipeSuggestionResult,
            _that.fetchMoreNewPipeSearchResultStatus,
            _that.isMoreNewPipeFetchCompleted,
            _that.fetchSearchHistoryStatus,
            _that.searchHistory);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchState implements SearchState {
  const _SearchState(
      {required this.isSuggestionDisplay,
      required this.fetchSearchResultStatus,
      required this.result,
      required this.fetchSuggestionStatus,
      required final List suggestions,
      required this.fetchMoreSearchResultStatus,
      required this.isMoreFetchCompleted,
      required this.fetchInvidiousSearchResultStatus,
      required final List<InvidiousSearchResp> invidiousSearchResult,
      required this.fetchInvidiousSuggestionStatus,
      required final List invidiousSuggestionResult,
      required this.fetchMoreInvidiousSearchResultStatus,
      required this.isMoreInvidiousFetchCompleted,
      this.page,
      required this.fetchNewPipeSearchResultStatus,
      required this.newPipeSearchResult,
      required this.fetchNewPipeSuggestionStatus,
      required final List newPipeSuggestionResult,
      required this.fetchMoreNewPipeSearchResultStatus,
      required this.isMoreNewPipeFetchCompleted,
      required this.fetchSearchHistoryStatus,
      required final List<LocalSearchHistory> searchHistory})
      : _suggestions = suggestions,
        _invidiousSearchResult = invidiousSearchResult,
        _invidiousSuggestionResult = invidiousSuggestionResult,
        _newPipeSuggestionResult = newPipeSuggestionResult,
        _searchHistory = searchHistory;

//
  @override
  final bool isSuggestionDisplay;
// PIPED
  @override
  final ApiStatus fetchSearchResultStatus;
  @override
  final SearchResp? result;
  @override
  final ApiStatus fetchSuggestionStatus;
  final List _suggestions;
  @override
  List get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  final ApiStatus fetchMoreSearchResultStatus;
  @override
  final bool isMoreFetchCompleted;
// INVIDIOUS
  @override
  final ApiStatus fetchInvidiousSearchResultStatus;
  final List<InvidiousSearchResp> _invidiousSearchResult;
  @override
  List<InvidiousSearchResp> get invidiousSearchResult {
    if (_invidiousSearchResult is EqualUnmodifiableListView)
      return _invidiousSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousSearchResult);
  }

  @override
  final ApiStatus fetchInvidiousSuggestionStatus;
  final List _invidiousSuggestionResult;
  @override
  List get invidiousSuggestionResult {
    if (_invidiousSuggestionResult is EqualUnmodifiableListView)
      return _invidiousSuggestionResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousSuggestionResult);
  }

  @override
  final ApiStatus fetchMoreInvidiousSearchResultStatus;
  @override
  final bool isMoreInvidiousFetchCompleted;
  @override
  final int? page;
// NEWPIPE
  @override
  final ApiStatus fetchNewPipeSearchResultStatus;
  @override
  final NewPipeSearchResp? newPipeSearchResult;
  @override
  final ApiStatus fetchNewPipeSuggestionStatus;
  final List _newPipeSuggestionResult;
  @override
  List get newPipeSuggestionResult {
    if (_newPipeSuggestionResult is EqualUnmodifiableListView)
      return _newPipeSuggestionResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPipeSuggestionResult);
  }

  @override
  final ApiStatus fetchMoreNewPipeSearchResultStatus;
  @override
  final bool isMoreNewPipeFetchCompleted;
// SEARCH HISTORY
  @override
  final ApiStatus fetchSearchHistoryStatus;
  final List<LocalSearchHistory> _searchHistory;
  @override
  List<LocalSearchHistory> get searchHistory {
    if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHistory);
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            (identical(other.isSuggestionDisplay, isSuggestionDisplay) ||
                other.isSuggestionDisplay == isSuggestionDisplay) &&
            (identical(other.fetchSearchResultStatus, fetchSearchResultStatus) ||
                other.fetchSearchResultStatus == fetchSearchResultStatus) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.fetchSuggestionStatus, fetchSuggestionStatus) ||
                other.fetchSuggestionStatus == fetchSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.fetchMoreSearchResultStatus, fetchMoreSearchResultStatus) ||
                other.fetchMoreSearchResultStatus ==
                    fetchMoreSearchResultStatus) &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.fetchInvidiousSearchResultStatus, fetchInvidiousSearchResultStatus) ||
                other.fetchInvidiousSearchResultStatus ==
                    fetchInvidiousSearchResultStatus) &&
            const DeepCollectionEquality()
                .equals(other._invidiousSearchResult, _invidiousSearchResult) &&
            (identical(other.fetchInvidiousSuggestionStatus, fetchInvidiousSuggestionStatus) ||
                other.fetchInvidiousSuggestionStatus ==
                    fetchInvidiousSuggestionStatus) &&
            const DeepCollectionEquality().equals(
                other._invidiousSuggestionResult, _invidiousSuggestionResult) &&
            (identical(other.fetchMoreInvidiousSearchResultStatus, fetchMoreInvidiousSearchResultStatus) ||
                other.fetchMoreInvidiousSearchResultStatus ==
                    fetchMoreInvidiousSearchResultStatus) &&
            (identical(other.isMoreInvidiousFetchCompleted, isMoreInvidiousFetchCompleted) ||
                other.isMoreInvidiousFetchCompleted ==
                    isMoreInvidiousFetchCompleted) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.fetchNewPipeSearchResultStatus, fetchNewPipeSearchResultStatus) ||
                other.fetchNewPipeSearchResultStatus ==
                    fetchNewPipeSearchResultStatus) &&
            (identical(other.newPipeSearchResult, newPipeSearchResult) ||
                other.newPipeSearchResult == newPipeSearchResult) &&
            (identical(other.fetchNewPipeSuggestionStatus, fetchNewPipeSuggestionStatus) ||
                other.fetchNewPipeSuggestionStatus ==
                    fetchNewPipeSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other._newPipeSuggestionResult, _newPipeSuggestionResult) &&
            (identical(other.fetchMoreNewPipeSearchResultStatus, fetchMoreNewPipeSearchResultStatus) || other.fetchMoreNewPipeSearchResultStatus == fetchMoreNewPipeSearchResultStatus) &&
            (identical(other.isMoreNewPipeFetchCompleted, isMoreNewPipeFetchCompleted) || other.isMoreNewPipeFetchCompleted == isMoreNewPipeFetchCompleted) &&
            (identical(other.fetchSearchHistoryStatus, fetchSearchHistoryStatus) || other.fetchSearchHistoryStatus == fetchSearchHistoryStatus) &&
            const DeepCollectionEquality().equals(other._searchHistory, _searchHistory));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isSuggestionDisplay,
        fetchSearchResultStatus,
        result,
        fetchSuggestionStatus,
        const DeepCollectionEquality().hash(_suggestions),
        fetchMoreSearchResultStatus,
        isMoreFetchCompleted,
        fetchInvidiousSearchResultStatus,
        const DeepCollectionEquality().hash(_invidiousSearchResult),
        fetchInvidiousSuggestionStatus,
        const DeepCollectionEquality().hash(_invidiousSuggestionResult),
        fetchMoreInvidiousSearchResultStatus,
        isMoreInvidiousFetchCompleted,
        page,
        fetchNewPipeSearchResultStatus,
        newPipeSearchResult,
        fetchNewPipeSuggestionStatus,
        const DeepCollectionEquality().hash(_newPipeSuggestionResult),
        fetchMoreNewPipeSearchResultStatus,
        isMoreNewPipeFetchCompleted,
        fetchSearchHistoryStatus,
        const DeepCollectionEquality().hash(_searchHistory)
      ]);

  @override
  String toString() {
    return 'SearchState(isSuggestionDisplay: $isSuggestionDisplay, fetchSearchResultStatus: $fetchSearchResultStatus, result: $result, fetchSuggestionStatus: $fetchSuggestionStatus, suggestions: $suggestions, fetchMoreSearchResultStatus: $fetchMoreSearchResultStatus, isMoreFetchCompleted: $isMoreFetchCompleted, fetchInvidiousSearchResultStatus: $fetchInvidiousSearchResultStatus, invidiousSearchResult: $invidiousSearchResult, fetchInvidiousSuggestionStatus: $fetchInvidiousSuggestionStatus, invidiousSuggestionResult: $invidiousSuggestionResult, fetchMoreInvidiousSearchResultStatus: $fetchMoreInvidiousSearchResultStatus, isMoreInvidiousFetchCompleted: $isMoreInvidiousFetchCompleted, page: $page, fetchNewPipeSearchResultStatus: $fetchNewPipeSearchResultStatus, newPipeSearchResult: $newPipeSearchResult, fetchNewPipeSuggestionStatus: $fetchNewPipeSuggestionStatus, newPipeSuggestionResult: $newPipeSuggestionResult, fetchMoreNewPipeSearchResultStatus: $fetchMoreNewPipeSearchResultStatus, isMoreNewPipeFetchCompleted: $isMoreNewPipeFetchCompleted, fetchSearchHistoryStatus: $fetchSearchHistoryStatus, searchHistory: $searchHistory)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) _then) =
      __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isSuggestionDisplay,
      ApiStatus fetchSearchResultStatus,
      SearchResp? result,
      ApiStatus fetchSuggestionStatus,
      List suggestions,
      ApiStatus fetchMoreSearchResultStatus,
      bool isMoreFetchCompleted,
      ApiStatus fetchInvidiousSearchResultStatus,
      List<InvidiousSearchResp> invidiousSearchResult,
      ApiStatus fetchInvidiousSuggestionStatus,
      List invidiousSuggestionResult,
      ApiStatus fetchMoreInvidiousSearchResultStatus,
      bool isMoreInvidiousFetchCompleted,
      int? page,
      ApiStatus fetchNewPipeSearchResultStatus,
      NewPipeSearchResp? newPipeSearchResult,
      ApiStatus fetchNewPipeSuggestionStatus,
      List newPipeSuggestionResult,
      ApiStatus fetchMoreNewPipeSearchResultStatus,
      bool isMoreNewPipeFetchCompleted,
      ApiStatus fetchSearchHistoryStatus,
      List<LocalSearchHistory> searchHistory});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSuggestionDisplay = null,
    Object? fetchSearchResultStatus = null,
    Object? result = freezed,
    Object? fetchSuggestionStatus = null,
    Object? suggestions = null,
    Object? fetchMoreSearchResultStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? fetchInvidiousSearchResultStatus = null,
    Object? invidiousSearchResult = null,
    Object? fetchInvidiousSuggestionStatus = null,
    Object? invidiousSuggestionResult = null,
    Object? fetchMoreInvidiousSearchResultStatus = null,
    Object? isMoreInvidiousFetchCompleted = null,
    Object? page = freezed,
    Object? fetchNewPipeSearchResultStatus = null,
    Object? newPipeSearchResult = freezed,
    Object? fetchNewPipeSuggestionStatus = null,
    Object? newPipeSuggestionResult = null,
    Object? fetchMoreNewPipeSearchResultStatus = null,
    Object? isMoreNewPipeFetchCompleted = null,
    Object? fetchSearchHistoryStatus = null,
    Object? searchHistory = null,
  }) {
    return _then(_SearchState(
      isSuggestionDisplay: null == isSuggestionDisplay
          ? _self.isSuggestionDisplay
          : isSuggestionDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchResultStatus: null == fetchSearchResultStatus
          ? _self.fetchSearchResultStatus
          : fetchSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as SearchResp?,
      fetchSuggestionStatus: null == fetchSuggestionStatus
          ? _self.fetchSuggestionStatus
          : fetchSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      suggestions: null == suggestions
          ? _self._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreSearchResultStatus: null == fetchMoreSearchResultStatus
          ? _self.fetchMoreSearchResultStatus
          : fetchMoreSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _self.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchInvidiousSearchResultStatus: null == fetchInvidiousSearchResultStatus
          ? _self.fetchInvidiousSearchResultStatus
          : fetchInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSearchResult: null == invidiousSearchResult
          ? _self._invidiousSearchResult
          : invidiousSearchResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousSearchResp>,
      fetchInvidiousSuggestionStatus: null == fetchInvidiousSuggestionStatus
          ? _self.fetchInvidiousSuggestionStatus
          : fetchInvidiousSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSuggestionResult: null == invidiousSuggestionResult
          ? _self._invidiousSuggestionResult
          : invidiousSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreInvidiousSearchResultStatus: null ==
              fetchMoreInvidiousSearchResultStatus
          ? _self.fetchMoreInvidiousSearchResultStatus
          : fetchMoreInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousFetchCompleted: null == isMoreInvidiousFetchCompleted
          ? _self.isMoreInvidiousFetchCompleted
          : isMoreInvidiousFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      fetchNewPipeSearchResultStatus: null == fetchNewPipeSearchResultStatus
          ? _self.fetchNewPipeSearchResultStatus
          : fetchNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSearchResult: freezed == newPipeSearchResult
          ? _self.newPipeSearchResult
          : newPipeSearchResult // ignore: cast_nullable_to_non_nullable
              as NewPipeSearchResp?,
      fetchNewPipeSuggestionStatus: null == fetchNewPipeSuggestionStatus
          ? _self.fetchNewPipeSuggestionStatus
          : fetchNewPipeSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSuggestionResult: null == newPipeSuggestionResult
          ? _self._newPipeSuggestionResult
          : newPipeSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List,
      fetchMoreNewPipeSearchResultStatus: null ==
              fetchMoreNewPipeSearchResultStatus
          ? _self.fetchMoreNewPipeSearchResultStatus
          : fetchMoreNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeFetchCompleted: null == isMoreNewPipeFetchCompleted
          ? _self.isMoreNewPipeFetchCompleted
          : isMoreNewPipeFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchHistoryStatus: null == fetchSearchHistoryStatus
          ? _self.fetchSearchHistoryStatus
          : fetchSearchHistoryStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      searchHistory: null == searchHistory
          ? _self._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<LocalSearchHistory>,
    ));
  }
}

// dart format on
