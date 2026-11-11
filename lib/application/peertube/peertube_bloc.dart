import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_failure_message.dart';
import 'package:vyplay/domain/peertube/peertube_instance_store.dart';
import 'package:vyplay/domain/peertube/peertube_repository.dart';

const _unset = Object();

sealed class PeerTubeEvent {
  const PeerTubeEvent();
}

class PeerTubeStarted extends PeerTubeEvent {
  const PeerTubeStarted();
}

class PeerTubeAddInstance extends PeerTubeEvent {
  const PeerTubeAddInstance(this.url);
  final String url;
}

class PeerTubeRemoveInstance extends PeerTubeEvent {
  const PeerTubeRemoveInstance(this.url);
  final String url;
}

class PeerTubeSelectInstance extends PeerTubeEvent {
  const PeerTubeSelectInstance(this.url);
  final String url;
}

class PeerTubeRefresh extends PeerTubeEvent {
  const PeerTubeRefresh();
}

class PeerTubeLoadMore extends PeerTubeEvent {
  const PeerTubeLoadMore();
}

class PeerTubeSearch extends PeerTubeEvent {
  const PeerTubeSearch(this.query);
  final String query;
}

class PeerTubeClearSearch extends PeerTubeEvent {
  const PeerTubeClearSearch();
}

class PeerTubeSetSort extends PeerTubeEvent {
  const PeerTubeSetSort(this.sort);
  final String sort;
}

class PeerTubeState {
  const PeerTubeState({
    required this.instancesStatus,
    required this.instances,
    required this.activeUrl,
    required this.config,
    required this.feedStatus,
    required this.videos,
    required this.total,
    required this.hasMore,
    required this.loadingMore,
    required this.searchStatus,
    required this.searchResults,
    required this.searchTotal,
    required this.searchHasMore,
    required this.searchingMore,
    required this.query,
    required this.sort,
    required this.error,
    required this.searchError,
    required this.addingInstance,
  });

  factory PeerTubeState.initial() => const PeerTubeState(
        instancesStatus: ApiStatus.initial,
        instances: [],
        activeUrl: null,
        config: null,
        feedStatus: ApiStatus.initial,
        videos: [],
        total: 0,
        hasMore: false,
        loadingMore: false,
        searchStatus: ApiStatus.initial,
        searchResults: [],
        searchTotal: 0,
        searchHasMore: false,
        searchingMore: false,
        query: '',
        sort: '-publishedAt',
        error: null,
        searchError: null,
        addingInstance: false,
      );

  final ApiStatus instancesStatus;
  final List<PeerTubeInstance> instances;
  final String? activeUrl;
  final PeerTubeInstanceConfig? config;
  final ApiStatus feedStatus;
  final List<PeerTubeVideo> videos;
  final int total;
  final bool hasMore;
  final bool loadingMore;
  final ApiStatus searchStatus;
  final List<PeerTubeVideo> searchResults;
  final int searchTotal;
  final bool searchHasMore;
  final bool searchingMore;
  final String query;
  final String sort;
  final String? error;
  final String? searchError;
  final bool addingInstance;

  bool get isSearching => query.trim().isNotEmpty;
  PeerTubeInstance? get activeInstance {
    final url = activeUrl;
    if (url == null) return null;
    for (final instance in instances) {
      if (instance.url == url) return instance;
    }
    return null;
  }

  PeerTubeState copyWith({
    ApiStatus? instancesStatus,
    List<PeerTubeInstance>? instances,
    Object? activeUrl = _unset,
    Object? config = _unset,
    ApiStatus? feedStatus,
    List<PeerTubeVideo>? videos,
    int? total,
    bool? hasMore,
    bool? loadingMore,
    ApiStatus? searchStatus,
    List<PeerTubeVideo>? searchResults,
    int? searchTotal,
    bool? searchHasMore,
    bool? searchingMore,
    String? query,
    String? sort,
    Object? error = _unset,
    Object? searchError = _unset,
    bool? addingInstance,
  }) {
    return PeerTubeState(
      instancesStatus: instancesStatus ?? this.instancesStatus,
      instances: instances ?? this.instances,
      activeUrl:
          identical(activeUrl, _unset) ? this.activeUrl : activeUrl as String?,
      config: identical(config, _unset)
          ? this.config
          : config as PeerTubeInstanceConfig?,
      feedStatus: feedStatus ?? this.feedStatus,
      videos: videos ?? this.videos,
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
      loadingMore: loadingMore ?? this.loadingMore,
      searchStatus: searchStatus ?? this.searchStatus,
      searchResults: searchResults ?? this.searchResults,
      searchTotal: searchTotal ?? this.searchTotal,
      searchHasMore: searchHasMore ?? this.searchHasMore,
      searchingMore: searchingMore ?? this.searchingMore,
      query: query ?? this.query,
      sort: sort ?? this.sort,
      error: identical(error, _unset) ? this.error : error as String?,
      searchError: identical(searchError, _unset)
          ? this.searchError
          : searchError as String?,
      addingInstance: addingInstance ?? this.addingInstance,
    );
  }
}

@injectable
class PeerTubeBloc extends Bloc<PeerTubeEvent, PeerTubeState> {
  PeerTubeBloc(this._repository, this._store) : super(PeerTubeState.initial()) {
    on<PeerTubeStarted>(_onStarted);
    on<PeerTubeAddInstance>(_onAddInstance);
    on<PeerTubeRemoveInstance>(_onRemoveInstance);
    on<PeerTubeSelectInstance>(_onSelectInstance);
    on<PeerTubeRefresh>((event, emit) => _activate(state.activeUrl, emit));
    on<PeerTubeLoadMore>(_onLoadMore);
    on<PeerTubeSearch>(_onSearch);
    on<PeerTubeClearSearch>((event, emit) => _clearSearch(emit));
    on<PeerTubeSetSort>(_onSetSort);
  }

  static const _pageSize = 20;
  static const _seed = PeerTubeInstance(
    url: 'https://framatube.org',
    name: 'Framatube',
  );

  final PeerTubeRepository _repository;
  final PeerTubeInstanceStore _store;

  int _activationRequest = 0;
  int _searchRequest = 0;

  Future<void> _onStarted(
    PeerTubeStarted event,
    Emitter<PeerTubeState> emit,
  ) async {
    emit(state.copyWith(instancesStatus: ApiStatus.loading, error: null));
    final selection = await _store.load();
    var instances = selection.instances.toList(growable: true);
    var active = selection.activeUrl;
    if (instances.isEmpty) {
      instances = [_seed];
      active = _seed.url;
      await _persist(instances, active);
    }
    emit(state.copyWith(
      instancesStatus: ApiStatus.loaded,
      instances: instances,
      activeUrl: active,
    ));
    if (active != null) await _activate(active, emit);
  }

  Future<void> _onAddInstance(
    PeerTubeAddInstance event,
    Emitter<PeerTubeState> emit,
  ) async {
    final url = normalizePeerTubeInstanceUrl(event.url);
    if (url == null) {
      emit(state.copyWith(
        error: 'Enter a valid instance URL, for example https://framatube.org',
      ));
      return;
    }
    if (state.instances.any((instance) => instance.url == url)) {
      add(PeerTubeSelectInstance(url));
      return;
    }

    emit(state.copyWith(addingInstance: true, error: null));
    final result = await _repository.getConfig(url);
    String? failureMessage;
    PeerTubeInstanceConfig? config;
    result.fold(
      (failure) => failureMessage = peerTubeFailureMessage(failure),
      (value) => config = value,
    );
    if (config == null) {
      emit(state.copyWith(
        addingInstance: false,
        error: failureMessage ??
            'That URL did not return a PeerTube configuration. Check the instance.',
      ));
      return;
    }

    final instance = PeerTubeInstance(url: url, name: config!.name);
    final updated = [...state.instances, instance];
    await _persist(updated, url);
    emit(state.copyWith(
      addingInstance: false,
      instances: updated,
      error: null,
    ));
    await _activate(url, emit);
  }

  Future<void> _onRemoveInstance(
    PeerTubeRemoveInstance event,
    Emitter<PeerTubeState> emit,
  ) async {
    final url = event.url;
    final remaining =
        state.instances.where((instance) => instance.url != url).toList();
    if (remaining.isEmpty) {
      await _persist(const [], null);
      emit(PeerTubeState.initial().copyWith(
        instancesStatus: ApiStatus.loaded,
        error: null,
      ));
      return;
    }
    final removingActive = state.activeUrl == url;
    final active = removingActive ? remaining.first.url : state.activeUrl;
    await _persist(remaining, active);
    emit(state.copyWith(instances: remaining, activeUrl: active, error: null));
    if (removingActive && active != null) {
      await _activate(active, emit);
    }
  }

  Future<void> _onSelectInstance(
    PeerTubeSelectInstance event,
    Emitter<PeerTubeState> emit,
  ) async {
    if (event.url == state.activeUrl) return;
    if (!state.instances.any((instance) => instance.url == event.url)) return;
    await _activate(event.url, emit);
  }

  Future<void> _activate(
    String? url,
    Emitter<PeerTubeState> emit,
  ) async {
    if (url == null) return;
    final request = ++_activationRequest;
    _searchRequest++;
    emit(state.copyWith(
      activeUrl: url,
      config: null,
      feedStatus: ApiStatus.loading,
      videos: [],
      total: 0,
      hasMore: false,
      loadingMore: false,
      query: '',
      searchStatus: ApiStatus.initial,
      searchResults: [],
      searchTotal: 0,
      searchHasMore: false,
      searchingMore: false,
      error: null,
      searchError: null,
    ));

    final configResult = await _repository.getConfig(url);
    if (request != _activationRequest) return;
    PeerTubeInstanceConfig? config;
    String? failureMessage;
    configResult.fold(
      (failure) => failureMessage = peerTubeFailureMessage(failure),
      (value) => config = value,
    );
    if (config == null) {
      emit(state.copyWith(
        feedStatus: ApiStatus.error,
        error: failureMessage ??
            'Could not load this instance. It may be offline or not PeerTube.',
      ));
      return;
    }

    final instances = state.instances
        .map((instance) => instance.url == url
            ? PeerTubeInstance(url: url, name: config!.name)
            : instance)
        .toList(growable: false);
    await _persist(instances, url);
    emit(state.copyWith(
      config: config,
      instances: instances,
      instancesStatus: ApiStatus.loaded,
      feedStatus: ApiStatus.loading,
    ));

    final feedResult = await _repository.getVideos(
      instanceUrl: url,
      start: 0,
      count: _pageSize,
      sort: state.sort,
    );
    if (request != _activationRequest) return;
    feedResult.fold(
      (failure) => emit(state.copyWith(
        feedStatus: ApiStatus.error,
        error: peerTubeFailureMessage(failure),
      )),
      (page) => emit(state.copyWith(
        feedStatus: ApiStatus.loaded,
        videos: page.videos,
        total: page.total,
        hasMore: page.hasMore,
        error: null,
      )),
    );
  }

  Future<void> _onLoadMore(
    PeerTubeLoadMore event,
    Emitter<PeerTubeState> emit,
  ) async {
    final url = state.activeUrl;
    if (url == null) return;

    if (state.isSearching) {
      if (state.searchingMore ||
          state.searchStatus != ApiStatus.loaded ||
          !state.searchHasMore) {
        return;
      }
      final request = _searchRequest;
      final query = state.query;
      emit(state.copyWith(searchingMore: true, searchError: null));
      final result = await _repository.searchVideos(
        instanceUrl: url,
        query: query,
        start: state.searchResults.length,
        count: _pageSize,
        sort: '-match',
      );
      if (request != _searchRequest || state.query != query) return;
      result.fold(
        (failure) => emit(state.copyWith(
          searchingMore: false,
          searchError: peerTubeFailureMessage(failure),
        )),
        (page) {
          final seen = state.searchResults.map((video) => video.uuid).toSet();
          final more =
              page.videos.where((video) => seen.add(video.uuid)).toList();
          emit(state.copyWith(
            searchingMore: false,
            searchResults: [...state.searchResults, ...more],
            searchTotal: page.total,
            searchHasMore: page.hasMore,
            searchError: null,
          ));
        },
      );
      return;
    }

    if (state.loadingMore ||
        state.feedStatus != ApiStatus.loaded ||
        !state.hasMore) {
      return;
    }
    final request = _activationRequest;
    emit(state.copyWith(loadingMore: true, error: null));
    final result = await _repository.getVideos(
      instanceUrl: url,
      start: state.videos.length,
      count: _pageSize,
      sort: state.sort,
    );
    if (request != _activationRequest) return;
    result.fold(
      (failure) => emit(state.copyWith(
        loadingMore: false,
        error: peerTubeFailureMessage(failure),
      )),
      (page) {
        final seen = state.videos.map((video) => video.uuid).toSet();
        final more =
            page.videos.where((video) => seen.add(video.uuid)).toList();
        emit(state.copyWith(
          loadingMore: false,
          videos: [...state.videos, ...more],
          total: page.total,
          hasMore: page.hasMore,
          error: null,
        ));
      },
    );
  }

  Future<void> _onSearch(
    PeerTubeSearch event,
    Emitter<PeerTubeState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      _clearSearch(emit);
      return;
    }
    final url = state.activeUrl;
    if (url == null) {
      emit(state.copyWith(searchError: 'Add a PeerTube instance first.'));
      return;
    }
    final request = ++_searchRequest;
    emit(state.copyWith(
      query: query,
      searchStatus: ApiStatus.loading,
      searchResults: [],
      searchTotal: 0,
      searchHasMore: false,
      searchingMore: false,
      searchError: null,
    ));
    final result = await _repository.searchVideos(
      instanceUrl: url,
      query: query,
      start: 0,
      count: _pageSize,
      sort: '-match',
    );
    if (request != _searchRequest || state.query != query) return;
    result.fold(
      (failure) => emit(state.copyWith(
        searchStatus: ApiStatus.error,
        searchError: peerTubeFailureMessage(failure),
      )),
      (page) => emit(state.copyWith(
        searchStatus: ApiStatus.loaded,
        searchResults: page.videos,
        searchTotal: page.total,
        searchHasMore: page.hasMore,
        searchError: null,
      )),
    );
  }

  void _clearSearch(Emitter<PeerTubeState> emit) {
    _searchRequest++;
    emit(state.copyWith(
      query: '',
      searchStatus: ApiStatus.initial,
      searchResults: [],
      searchTotal: 0,
      searchHasMore: false,
      searchingMore: false,
      searchError: null,
    ));
  }

  Future<void> _onSetSort(
    PeerTubeSetSort event,
    Emitter<PeerTubeState> emit,
  ) async {
    if (event.sort == state.sort) return;
    emit(state.copyWith(sort: event.sort));
    if (state.isSearching) {
      add(PeerTubeSearch(state.query));
    } else {
      await _activate(state.activeUrl, emit);
    }
  }

  Future<void> _persist(
    List<PeerTubeInstance> instances,
    String? activeUrl,
  ) async {
    try {
      await _store.save(
        PeerTubeInstanceSelection(instances: instances, activeUrl: activeUrl),
      );
    } catch (_) {
      // Browsing still works even if the local cache cannot be written.
    }
  }
}
