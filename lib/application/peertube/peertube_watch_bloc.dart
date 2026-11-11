import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/domain/peertube/peertube_failure_message.dart';
import 'package:vyplay/domain/peertube/peertube_repository.dart';

sealed class PeerTubeWatchEvent {
  const PeerTubeWatchEvent();
}

class PeerTubeWatchStarted extends PeerTubeWatchEvent {
  const PeerTubeWatchStarted({
    required this.instanceUrl,
    required this.uuid,
  });

  final String instanceUrl;
  final String uuid;
}

class PeerTubeWatchRetry extends PeerTubeWatchEvent {
  const PeerTubeWatchRetry();
}

class PeerTubeWatchState {
  const PeerTubeWatchState({
    required this.status,
    required this.video,
    required this.error,
    required this.instanceUrl,
    required this.uuid,
  });

  factory PeerTubeWatchState.initial() => const PeerTubeWatchState(
        status: ApiStatus.initial,
        video: null,
        error: null,
        instanceUrl: '',
        uuid: '',
      );

  final ApiStatus status;
  final PeerTubeVideo? video;
  final String? error;
  final String instanceUrl;
  final String uuid;

  PeerTubeWatchState copyWith({
    ApiStatus? status,
    PeerTubeVideo? video,
    String? error,
    String? instanceUrl,
    String? uuid,
  }) {
    return PeerTubeWatchState(
      status: status ?? this.status,
      video: video ?? this.video,
      error: error ?? this.error,
      instanceUrl: instanceUrl ?? this.instanceUrl,
      uuid: uuid ?? this.uuid,
    );
  }
}

@injectable
class PeerTubeWatchBloc extends Bloc<PeerTubeWatchEvent, PeerTubeWatchState> {
  PeerTubeWatchBloc(this._repository) : super(PeerTubeWatchState.initial()) {
    on<PeerTubeWatchStarted>(_onStarted);
    on<PeerTubeWatchRetry>((event, emit) async {
      final instanceUrl = state.instanceUrl;
      final uuid = state.uuid;
      if (instanceUrl.isNotEmpty && uuid.isNotEmpty) {
        await _load(instanceUrl, uuid, emit);
      }
    });
  }

  final PeerTubeRepository _repository;
  int _request = 0;

  Future<void> _onStarted(
    PeerTubeWatchStarted event,
    Emitter<PeerTubeWatchState> emit,
  ) =>
      _load(event.instanceUrl, event.uuid, emit);

  Future<void> _load(
    String instanceUrl,
    String uuid,
    Emitter<PeerTubeWatchState> emit,
  ) async {
    final request = ++_request;
    emit(PeerTubeWatchState.initial().copyWith(
      status: ApiStatus.loading,
      instanceUrl: instanceUrl,
      uuid: uuid,
    ));
    final result = await _repository.getVideo(
      instanceUrl: instanceUrl,
      uuid: uuid,
    );
    if (request != _request) return;
    result.fold(
      (failure) => emit(state.copyWith(
        status: ApiStatus.error,
        error: peerTubeFailureMessage(failure),
      )),
      (video) => emit(state.copyWith(
        status: ApiStatus.loaded,
        video: video,
        error: null,
      )),
    );
  }
}
