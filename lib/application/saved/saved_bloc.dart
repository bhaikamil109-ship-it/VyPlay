import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/saved/saved_services.dart';
import 'package:vyplay/domain/user_preferences/models/user_preferences.dart';
import 'package:vyplay/domain/user_preferences/user_preferences_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/saved/models/local_store.dart';

part 'saved_event.dart';
part 'saved_state.dart';
part 'saved_bloc.freezed.dart';

@injectable
class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedServices _savedServices;
  final UserPreferencesService _userPreferencesService;
  final SettingsBloc _settingsBloc;

  int _listRequestGeneration = 0;
  int _writeRequestGeneration = 0;
  int _videoCheckGeneration = 0;
  String? _loadedProfileName;
  Future<void> _writeQueue = Future<void>.value();

  Future<void> _queueWrite(Future<void> Function() write) {
    final task = _writeQueue.then((_) => write());
    _writeQueue = task.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    return task;
  }

  SavedBloc(
    this._savedServices,
    this._userPreferencesService,
    this._settingsBloc,
  ) : super(SavedState.initialize()) {
    // get all videos from local storage
    on<GetAllVideoInfoList>((event, emit) async {
      final requestGeneration = ++_listRequestGeneration;
      final profileChanged = _loadedProfileName != event.profileName;
      _loadedProfileName = event.profileName;
      if (profileChanged) {
        _writeRequestGeneration++;
        _videoCheckGeneration++;
      }

      emit(state.copyWith(
        savedVideosFetchStatus: ApiStatus.loading,
        localSavedVideos:
            profileChanged ? <LocalStoreVideoInfo>[] : state.localSavedVideos,
        localSavedHistoryVideos: profileChanged
            ? <LocalStoreVideoInfo>[]
            : state.localSavedHistoryVideos,
        videoInfo: profileChanged ? null : state.videoInfo,
      ));

      final result =
          await _savedServices.getVideoInfoList(profileName: event.profileName);
      if (emit.isDone ||
          requestGeneration != _listRequestGeneration ||
          _loadedProfileName != event.profileName ||
          _settingsBloc.state.currentProfile != event.profileName) {
        return;
      }

      final nextState = result.fold(
        (MainFailure failure) =>
            state.copyWith(savedVideosFetchStatus: ApiStatus.error),
        (List<LocalStoreVideoInfo> response) {
          final historyVideos =
              response.where((item) => item.isHistory ?? false).toList();
          final savedVideos =
              response.where((item) => item.isSaved ?? false).toList();
          return state.copyWith(
            savedVideosFetchStatus: ApiStatus.loaded,
            localSavedVideos: savedVideos,
            localSavedHistoryVideos: historyVideos,
          );
        },
      );
      emit(nextState);
    });

    // add video data to local storage
    on<AddVideoInfo>((event, emit) async {
      if (_settingsBloc.state.currentProfile != event.profileName) return;
      _listRequestGeneration++;
      _videoCheckGeneration++;

      await _queueWrite(() async {
        if (emit.isDone ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }
        final requestGeneration = ++_writeRequestGeneration;
        final result = await _savedServices.addVideoInfo(
          videoInfo: event.videoInfo,
          profileName: event.profileName,
        );
        if (emit.isDone ||
            requestGeneration != _writeRequestGeneration ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }

        final nextState = result.fold(
          (MainFailure failure) =>
              state.copyWith(savedVideosFetchStatus: ApiStatus.error),
          (List<LocalStoreVideoInfo> response) {
            final historyVideos =
                response.where((item) => item.isHistory ?? false).toList();
            final savedVideos =
                response.where((item) => item.isSaved ?? false).toList();
            return state.copyWith(
              savedVideosFetchStatus: ApiStatus.loaded,
              localSavedVideos: savedVideos,
              localSavedHistoryVideos: historyVideos,
              videoInfo: event.videoInfo,
            );
          },
        );
        _listRequestGeneration++;
        _videoCheckGeneration++;
        emit(nextState);
      });
    });

    // delete video data from local storage
    on<DeleteVideoInfo>((event, emit) async {
      if (_settingsBloc.state.currentProfile != event.profileName) return;
      _listRequestGeneration++;
      _videoCheckGeneration++;

      await _queueWrite(() async {
        if (emit.isDone ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }
        final requestGeneration = ++_writeRequestGeneration;
        final result = await _savedServices.deleteVideoInfo(
          id: event.id,
          profileName: event.profileName,
        );
        if (emit.isDone ||
            requestGeneration != _writeRequestGeneration ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }

        final nextState = result.fold(
          (MainFailure failure) =>
              state.copyWith(savedVideosFetchStatus: ApiStatus.error),
          (List<LocalStoreVideoInfo> response) {
            final historyVideos =
                response.where((item) => item.isHistory ?? false).toList();
            final savedVideos =
                response.where((item) => item.isSaved ?? false).toList();

            LocalStoreVideoInfo? updatedVideoInfo = state.videoInfo;
            if (state.videoInfo?.id == event.id && state.videoInfo != null) {
              final current = state.videoInfo!;
              updatedVideoInfo = LocalStoreVideoInfo(
                id: current.id,
                title: current.title,
                views: current.views,
                thumbnail: current.thumbnail,
                uploadedDate: current.uploadedDate,
                uploaderName: current.uploaderName,
                uploaderId: current.uploaderId,
                uploaderAvatar: current.uploaderAvatar,
                uploaderSubscriberCount: current.uploaderSubscriberCount,
                duration: current.duration,
                uploaderVerified: current.uploaderVerified,
                isSaved: false,
                isHistory: current.isHistory,
                isLive: current.isLive,
                playbackPosition: current.playbackPosition,
                time: current.time,
                profileName: current.profileName,
              );
            }

            return state.copyWith(
              savedVideosFetchStatus: ApiStatus.loaded,
              localSavedVideos: savedVideos,
              localSavedHistoryVideos: historyVideos,
              videoInfo: updatedVideoInfo,
            );
          },
        );
        _listRequestGeneration++;
        _videoCheckGeneration++;
        emit(nextState);
      });
    });

    // check the playing video present in the saved video
    on<CheckVideoInfo>((event, emit) async {
      if (_settingsBloc.state.currentProfile != event.profileName) return;
      final requestGeneration = ++_videoCheckGeneration;
      final result = await _savedServices.checkVideoInfo(
        id: event.id,
        profileName: event.profileName,
      );
      if (emit.isDone ||
          requestGeneration != _videoCheckGeneration ||
          _settingsBloc.state.currentProfile != event.profileName) {
        return;
      }
      final nextState = result.fold(
        (MainFailure failure) => state.copyWith(videoInfo: null),
        (LocalStoreVideoInfo response) => state.copyWith(videoInfo: response),
      );
      emit(nextState);
    });

    // Track video watch for recommendations
    on<TrackVideoWatch>((event, emit) async {
      await _userPreferencesService.trackInteraction(
        entityId: event.videoId,
        type: InteractionType.videoWatch,
        weight: 1,
        profileName: _settingsBloc.state.currentProfile,
      );
    });

    // Track search for recommendations
    on<TrackSearch>((event, emit) async {
      await _userPreferencesService.trackInteraction(
        entityId: event.query,
        type: InteractionType.search,
        weight: 1,
        profileName: _settingsBloc.state.currentProfile,
      );
    });

    // Update playback position without affecting isSaved state
    // This prevents race condition where history updates overwrite manual save
    on<UpdatePlaybackPosition>((event, emit) async {
      if (_settingsBloc.state.currentProfile != event.profileName) return;
      _listRequestGeneration++;
      _videoCheckGeneration++;

      await _queueWrite(() async {
        if (emit.isDone ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }
        final requestGeneration = ++_writeRequestGeneration;

        // First, check if the video already exists in the database.
        final existingResult = await _savedServices.checkVideoInfo(
          id: event.videoInfo.id,
          profileName: event.profileName,
        );
        if (emit.isDone ||
            requestGeneration != _writeRequestGeneration ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }

        // Preserve the existing isSaved state if the video exists.
        final videoInfoToSave = existingResult.fold(
          (_) => event.videoInfo,
          (existingVideo) => LocalStoreVideoInfo(
            id: event.videoInfo.id,
            title: event.videoInfo.title,
            views: event.videoInfo.views,
            thumbnail: event.videoInfo.thumbnail,
            uploadedDate: event.videoInfo.uploadedDate,
            uploaderName: event.videoInfo.uploaderName,
            uploaderId: event.videoInfo.uploaderId,
            uploaderAvatar: event.videoInfo.uploaderAvatar,
            uploaderSubscriberCount: event.videoInfo.uploaderSubscriberCount,
            duration: event.videoInfo.duration,
            uploaderVerified: event.videoInfo.uploaderVerified,
            isSaved: existingVideo.isSaved,
            isHistory: event.videoInfo.isHistory,
            isLive: event.videoInfo.isLive,
            playbackPosition: event.videoInfo.playbackPosition,
            profileName: event.profileName,
          ),
        );

        final result = await _savedServices.addVideoInfo(
          videoInfo: videoInfoToSave,
          profileName: event.profileName,
        );
        if (emit.isDone ||
            requestGeneration != _writeRequestGeneration ||
            _settingsBloc.state.currentProfile != event.profileName) {
          return;
        }

        final nextState = result.fold(
          (MainFailure failure) =>
              state.copyWith(savedVideosFetchStatus: ApiStatus.error),
          (List<LocalStoreVideoInfo> response) {
            final historyVideos =
                response.where((item) => item.isHistory ?? false).toList();
            final savedVideos =
                response.where((item) => item.isSaved ?? false).toList();
            return state.copyWith(
              savedVideosFetchStatus: ApiStatus.loaded,
              localSavedVideos: savedVideos,
              localSavedHistoryVideos: historyVideos,
              videoInfo: videoInfoToSave,
            );
          },
        );
        _listRequestGeneration++;
        _videoCheckGeneration++;
        emit(nextState);
      });
      // Do not dispatch CheckVideoInfo here: videoInfoToSave is already correct.
    });
  }
}
