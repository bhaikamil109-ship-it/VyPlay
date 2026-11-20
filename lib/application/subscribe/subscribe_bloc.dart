import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/subscribes/subscribe_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/main_failure.dart';
import '../../domain/subscribes/models/subscribe.dart';

part 'subscribe_event.dart';
part 'subscribe_state.dart';
part 'subscribe_bloc.freezed.dart';

@injectable
class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  final SubscribeServices _subscribeServices;

  int _listRequestGeneration = 0;
  int _mutationRequestGeneration = 0;
  int _channelCheckGeneration = 0;
  String? _activeProfileName;

  void _activateProfile(String profileName, Emitter<SubscribeState> emit) {
    if (_activeProfileName == profileName) return;

    _activeProfileName = profileName;
    _listRequestGeneration++;
    _mutationRequestGeneration++;
    _channelCheckGeneration++;
    emit(state.copyWith(
      subscribeStatus: ApiStatus.initial,
      subscribedChannels: <Subscribe>[],
      oldList: <Subscribe>[],
      channelInfo: null,
    ));
  }

  SubscribeBloc(this._subscribeServices,)
      : super(SubscribeState.initialize()) {
    // get all subscribed channel list from local storage
    on<GetAllSubscribeList>((event, emit) async {
      final requestGeneration = ++_listRequestGeneration;
      final profileChanged = _activeProfileName != event.profileName;
      _activeProfileName = event.profileName;
      if (profileChanged) {
        _mutationRequestGeneration++;
        _channelCheckGeneration++;
      }

      emit(state.copyWith(
        subscribeStatus: ApiStatus.loading,
        subscribedChannels:
            profileChanged ? <Subscribe>[] : state.subscribedChannels,
        oldList: profileChanged ? <Subscribe>[] : state.oldList,
        channelInfo: profileChanged ? null : state.channelInfo,
      ));

      final result = await _subscribeServices.getSubscriberInfoList(
        profileName: event.profileName,
      );
      if (emit.isDone ||
          requestGeneration != _listRequestGeneration ||
          _activeProfileName != event.profileName) {
        return;
      }

      final nextState = result.fold(
        (MainFailure failure) =>
            state.copyWith(subscribeStatus: ApiStatus.error),
        (List<Subscribe> response) => state.copyWith(
          subscribeStatus: ApiStatus.loaded,
          subscribedChannels: response,
          oldList: response,
        ),
      );
      emit(nextState);
    });

    // update old subscribed channels list
    on<UpdateSubscribeOldList>((event, emit) async {
      emit(state.copyWith(oldList: event.subscribedChannels));
    });

    // add subscribed channel data to local storage
    on<AddSubscribe>((event, emit) async {
      _activateProfile(event.profileName, emit);
      final requestGeneration = ++_mutationRequestGeneration;
      _listRequestGeneration++;
      _channelCheckGeneration++;
      emit(state.copyWith(subscribeStatus: ApiStatus.loading));

      final result = await _subscribeServices.addSubscriberInfo(
        subscribeInfo: event.channelInfo,
        profileName: event.profileName,
      );
      if (emit.isDone ||
          requestGeneration != _mutationRequestGeneration ||
          _activeProfileName != event.profileName) {
        return;
      }
      final nextState = result.fold(
        (MainFailure failure) =>
            state.copyWith(subscribeStatus: ApiStatus.error),
        (List<Subscribe> response) => state.copyWith(
          subscribeStatus: ApiStatus.loaded,
          subscribedChannels: response,
        ),
      );

      emit(nextState);
      add(CheckSubscribeInfo(
        id: event.channelInfo.id,
        profileName: event.profileName,
      ));
      // Note: Don't call GetAllSubscribeList here - it's already updated by addSubscriberInfo
      // and calling it would sync oldList, preventing the home screen from detecting the change
    });

    // delete channel data from local storage
    on<DeleteSubscribeInfo>((event, emit) async {
      _activateProfile(event.profileName, emit);
      final requestGeneration = ++_mutationRequestGeneration;
      _listRequestGeneration++;
      _channelCheckGeneration++;
      emit(state.copyWith(subscribeStatus: ApiStatus.loading));

      final result = await _subscribeServices.deleteSubscriberInfo(
        id: event.id,
        profileName: event.profileName,
      );
      if (emit.isDone ||
          requestGeneration != _mutationRequestGeneration ||
          _activeProfileName != event.profileName) {
        return;
      }
      final nextState = result.fold(
        (MainFailure failure) =>
            state.copyWith(subscribeStatus: ApiStatus.error),
        (List<Subscribe> response) => state.copyWith(
          subscribeStatus: ApiStatus.loaded,
          subscribedChannels: response,
        ),
      );

      emit(nextState);
      add(CheckSubscribeInfo(id: event.id, profileName: event.profileName));
      // Note: Don't call GetAllSubscribeList here - it's already updated by deleteSubscriberInfo
      // and calling it would sync oldList, preventing the home screen from detecting the change
    });

    // check the playing video's channel present in the subscribed list
    on<CheckSubscribeInfo>((event, emit) async {
      _activateProfile(event.profileName, emit);
      final requestGeneration = ++_channelCheckGeneration;
      emit(state.copyWith(channelInfo: null));

      final result = await _subscribeServices.checkSubscriberInfo(
        id: event.id,
        profileName: event.profileName,
      );
      if (emit.isDone ||
          requestGeneration != _channelCheckGeneration ||
          _activeProfileName != event.profileName) {
        return;
      }
      final nextState = result.fold(
        (MainFailure failure) => state.copyWith(channelInfo: null),
        (Subscribe response) => state.copyWith(channelInfo: response),
      );
      emit(nextState);
    });
  }
}
