import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_failure_message.dart';
import 'package:vyplay/domain/peertube/peertube_repository.dart';

sealed class PeerTubeChannelEvent {
  const PeerTubeChannelEvent();
}

class PeerTubeChannelStarted extends PeerTubeChannelEvent {
  const PeerTubeChannelStarted({
    required this.instanceUrl,
    required this.handle,
  });

  final String instanceUrl;
  final String handle;
}

class PeerTubeChannelLoadMore extends PeerTubeChannelEvent {
  const PeerTubeChannelLoadMore();
}

class PeerTubeChannelRetry extends PeerTubeChannelEvent {
  const PeerTubeChannelRetry();
}

class PeerTubeChannelState {
  const PeerTubeChannelState({
    required this.status,
    required this.channel,
    required this.videos,
    required this.total,
    required this.hasMore,
    required this.loadingMore,
    required this.error,
    required this.instanceUrl,
    required this.handle,
  });

  factory PeerTubeChannelState.initial() => const PeerTubeChannelState(
        status: ApiStatus.initial,
        channel: null,
        videos: [],
        total: 0,
        hasMore: false,
        loadingMore: false,
        error: null,
        instanceUrl: '',
        handle: '',
      );

  final ApiStatus status;
  final PeerTubeChannel? channel;
  final List<PeerTubeVideo> videos;
  final int total;
  final bool hasMore;
  final bool loadingMore;
  final String? error;
  final String instanceUrl;
  final String handle;

  PeerTubeChannelState copyWith({
    ApiStatus? status,
    PeerTubeChannel? channel,
    List<PeerTubeVideo>? videos,
    int? total,
    bool? hasMore,
    bool? loadingMore,
    String? error,
    String? instanceUrl,
    String? handle,
  }) {
    return PeerTubeChannelState(
      status: status ?? this.status,
      channel: channel ?? this.channel,
      videos: videos ?? this.videos,
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
      loadingMore: loadingMore ?? this.loadingMore,
      error: error ?? this.error,
      instanceUrl: instanceUrl ?? this.instanceUrl,
      handle: handle ?? this.handle,
    );
  }
}

@injectable
class PeerTubeChannelBloc
    extends Bloc<PeerTubeChannelEvent, PeerTubeChannelState> {
  PeerTubeChannelBloc(this._repository)
      : super(PeerTubeChannelState.initial()) {
    on<PeerTubeChannelStarted>(_onStarted);
    on<PeerTubeChannelLoadMore>(_onLoadMore);
    on<PeerTubeChannelRetry>((event, emit) async {
      final url = state.instanceUrl;
      final handle = state.handle;
      if (url.isNotEmpty && handle.isNotEmpty) {
        await _load(url, handle, emit);
      }
    });
  }

  static const _pageSize = 20;

  final PeerTubeRepository _repository;
  int _request = 0;

  Future<void> _onStarted(
    PeerTubeChannelStarted event,
    Emitter<PeerTubeChannelState> emit,
  ) =>
      _load(event.instanceUrl, event.handle, emit);

  Future<void> _load(
    String instanceUrl,
    String handle,
    Emitter<PeerTubeChannelState> emit,
  ) async {
    final request = ++_request;
    emit(PeerTubeChannelState.initial().copyWith(
      status: ApiStatus.loading,
      instanceUrl: instanceUrl,
      handle: handle,
    ));

    final channelResult = await _repository.getChannel(
      instanceUrl: instanceUrl,
      handle: handle,
    );
    if (request != _request) return;
    PeerTubeChannel? channel;
    String? failure;
    channelResult.fold(
      (error) => failure = peerTubeFailureMessage(error),
      (value) => channel = value,
    );
    if (channel == null) {
      emit(state.copyWith(status: ApiStatus.error, error: failure));
      return;
    }
    emit(state.copyWith(
      status: ApiStatus.loading,
      channel: channel,
      error: null,
    ));

    final videosResult = await _repository.getChannelVideos(
      instanceUrl: instanceUrl,
      handle: handle,
      start: 0,
      count: _pageSize,
    );
    if (request != _request) return;
    videosResult.fold(
      (error) => emit(state.copyWith(
        status: ApiStatus.error,
        error: peerTubeFailureMessage(error),
      )),
      (page) => emit(state.copyWith(
        status: ApiStatus.loaded,
        videos: page.videos,
        total: page.total,
        hasMore: page.hasMore,
        error: null,
      )),
    );
  }

  Future<void> _onLoadMore(
    PeerTubeChannelLoadMore event,
    Emitter<PeerTubeChannelState> emit,
  ) async {
    if (state.loadingMore ||
        state.status != ApiStatus.loaded ||
        !state.hasMore) {
      return;
    }
    final request = _request;
    emit(state.copyWith(loadingMore: true, error: null));
    final result = await _repository.getChannelVideos(
      instanceUrl: state.instanceUrl,
      handle: state.handle,
      start: state.videos.length,
      count: _pageSize,
    );
    if (request != _request) return;
    result.fold(
      (error) => emit(state.copyWith(
        loadingMore: false,
        error: peerTubeFailureMessage(error),
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
}
