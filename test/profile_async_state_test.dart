import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/application/saved/saved_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/application/subscribe/subscribe_bloc.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/saved/models/local_store.dart';
import 'package:vyplay/domain/saved/saved_services.dart';
import 'package:vyplay/domain/subscribes/models/subscribe.dart';
import 'package:vyplay/domain/subscribes/subscribe_services.dart';
import 'package:vyplay/domain/user_preferences/user_preferences_service.dart';

class _DeferredSubscribeServices implements SubscribeServices {
  final Map<String, Completer<Either<MainFailure, List<Subscribe>>>>
      listRequests = {};
  final Map<String, Completer<void>> listStarted = {};
  final Map<String, Completer<Either<MainFailure, Subscribe>>> checkRequests =
      {};
  final Map<String, Completer<void>> checkStarted = {};

  Future<void> waitForList(String profile) =>
      listStarted.putIfAbsent(profile, Completer<void>.new).future;

  Future<void> waitForCheck(String profile) =>
      checkStarted.putIfAbsent(profile, Completer<void>.new).future;

  @override
  Future<Either<MainFailure, List<Subscribe>>> getSubscriberInfoList({
    String profileName = 'default',
  }) {
    final started = listStarted.putIfAbsent(profileName, Completer<void>.new);
    if (!started.isCompleted) started.complete();
    return listRequests
        .putIfAbsent(
          profileName,
          () => Completer<Either<MainFailure, List<Subscribe>>>(),
        )
        .future;
  }

  @override
  Future<Either<MainFailure, Subscribe>> checkSubscriberInfo({
    required String id,
    String profileName = 'default',
  }) {
    final started = checkStarted.putIfAbsent(profileName, Completer<void>.new);
    if (!started.isCompleted) started.complete();
    return checkRequests
        .putIfAbsent(
          profileName,
          () => Completer<Either<MainFailure, Subscribe>>(),
        )
        .future;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _RacingMutationSubscribeServices implements SubscribeServices {
  final List<Subscribe> rows = [];
  final List<String> startedMutationIds = [];

  @override
  Future<Either<MainFailure, List<Subscribe>>> addSubscriberInfo({
    required Subscribe subscribeInfo,
    String profileName = 'default',
  }) async {
    startedMutationIds.add(subscribeInfo.id);
    await Future<void>.delayed(
      Duration(milliseconds: subscribeInfo.id == 'a' ? 30 : 1),
    );
    rows.add(subscribeInfo);
    return Right(List<Subscribe>.from(rows));
  }

  @override
  Future<Either<MainFailure, Subscribe>> checkSubscriberInfo({
    required String id,
    String profileName = 'default',
  }) async =>
      Right(Subscribe(
        id: id,
        channelName: id,
        profileName: profileName,
      ));

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _DeferredSavedServices implements SavedServices {
  final Map<String, Completer<Either<MainFailure, List<LocalStoreVideoInfo>>>>
      listRequests = {};
  final Map<String, Completer<void>> listStarted = {};

  Future<void> waitForList(String profile) =>
      listStarted.putIfAbsent(profile, Completer<void>.new).future;

  @override
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> getVideoInfoList({
    String profileName = 'default',
  }) {
    final started = listStarted.putIfAbsent(profileName, Completer<void>.new);
    if (!started.isCompleted) started.complete();
    return listRequests
        .putIfAbsent(
          profileName,
          () => Completer<Either<MainFailure, List<LocalStoreVideoInfo>>>(),
        )
        .future;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _RacingDeleteSavedServices implements SavedServices {
  final Map<String, List<LocalStoreVideoInfo>> rows;

  _RacingDeleteSavedServices(List<LocalStoreVideoInfo> initial)
      : rows = {'work': List<LocalStoreVideoInfo>.from(initial)};

  @override
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> getVideoInfoList({
    String profileName = 'default',
  }) async =>
      Right(List<LocalStoreVideoInfo>.from(rows[profileName] ?? const []));

  @override
  Future<Either<MainFailure, List<LocalStoreVideoInfo>>> deleteVideoInfo({
    required String id,
    String profileName = 'default',
  }) async {
    // Without serialized writes the later request finishes first, returns a
    // partial list, and can become the only state update accepted by the BLoC.
    await Future<void>.delayed(
      Duration(milliseconds: id == 'a' ? 30 : 1),
    );
    final profileRows = rows.putIfAbsent(profileName, () => []);
    profileRows.removeWhere((video) => video.id == id);
    return Right(List<LocalStoreVideoInfo>.from(profileRows));
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSettingsBloc implements SettingsBloc {
  SettingsState _state = SettingsState.initialize();

  @override
  SettingsState get state => _state;

  void setProfile(String profileName) {
    _state = _state.copyWith(currentProfile: profileName);
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _UnusedUserPreferencesService implements UserPreferencesService {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('SubscribeBloc profile request ordering', () {
    test('late subscription list from previous profile is ignored', () async {
      final services = _DeferredSubscribeServices();
      final bloc = SubscribeBloc(services);
      addTearDown(bloc.close);

      bloc.add(
        const SubscribeEvent.getAllSubscribeList(profileName: 'personal'),
      );
      await services.waitForList('personal');

      bloc.add(
        const SubscribeEvent.getAllSubscribeList(profileName: 'work'),
      );
      await services.waitForList('work');

      final workLoaded = bloc.stream.firstWhere(
        (state) =>
            state.subscribeStatus == ApiStatus.loaded &&
            state.subscribedChannels.any((channel) => channel.id == 'work'),
      );
      services.listRequests['work']!.complete(
        Right([
          Subscribe(
            id: 'work',
            channelName: 'Work channel',
            profileName: 'work',
          ),
        ]),
      );
      await workLoaded;

      services.listRequests['personal']!.complete(
        Right([
          Subscribe(
            id: 'personal',
            channelName: 'Personal channel',
            profileName: 'personal',
          ),
        ]),
      );
      await Future<void>.delayed(Duration.zero);

      expect(
        bloc.state.subscribedChannels.map((channel) => channel.id),
        ['work'],
      );
      expect(bloc.state.oldList.map((channel) => channel.id), ['work']);
    });

    test('concurrent subscription adds persist and emit in request order',
        () async {
      final services = _RacingMutationSubscribeServices();
      final bloc = SubscribeBloc(services);
      addTearDown(bloc.close);

      final finalState = bloc.stream.firstWhere(
        (state) =>
            state.subscribedChannels.length == 2 &&
            state.subscribedChannels[0].id == 'a' &&
            state.subscribedChannels[1].id == 'b',
      );
      bloc.add(SubscribeEvent.addSubscribe(
        channelInfo: Subscribe(
          id: 'a',
          channelName: 'Channel A',
          profileName: 'work',
        ),
        profileName: 'work',
      ));
      bloc.add(SubscribeEvent.addSubscribe(
        channelInfo: Subscribe(
          id: 'b',
          channelName: 'Channel B',
          profileName: 'work',
        ),
        profileName: 'work',
      ));

      await finalState;

      expect(services.startedMutationIds, ['a', 'b']);
      expect(services.rows.map((channel) => channel.id), ['a', 'b']);
      expect(
        bloc.state.subscribedChannels.map((channel) => channel.id),
        ['a', 'b'],
      );
    });

    test('late channel check from previous profile cannot set channelInfo',
        () async {
      final services = _DeferredSubscribeServices();
      final bloc = SubscribeBloc(services);
      addTearDown(bloc.close);

      bloc.add(
        const SubscribeEvent.checkSubscribeInfo(
          id: 'personal-channel',
          profileName: 'personal',
        ),
      );
      await services.waitForCheck('personal');

      bloc.add(
        const SubscribeEvent.getAllSubscribeList(profileName: 'work'),
      );
      await services.waitForList('work');

      final workLoaded = bloc.stream.firstWhere(
        (state) => state.subscribeStatus == ApiStatus.loaded,
      );
      services.listRequests['work']!
          .complete(const Right<MainFailure, List<Subscribe>>([]));
      await workLoaded;

      services.checkRequests['personal']!.complete(
        Right(Subscribe(
          id: 'personal-channel',
          channelName: 'Personal channel',
          profileName: 'personal',
        )),
      );
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.channelInfo, isNull);
    });
    test('watch-page channel check activates a newly selected profile',
        () async {
      final services = _DeferredSubscribeServices();
      final bloc = SubscribeBloc(services);
      addTearDown(bloc.close);

      bloc.add(
        const SubscribeEvent.checkSubscribeInfo(
          id: 'personal-channel',
          profileName: 'personal',
        ),
      );
      await services.waitForCheck('personal');

      final personalLoaded = bloc.stream.firstWhere(
        (state) => state.channelInfo?.id == 'personal-channel',
      );
      services.checkRequests['personal']!.complete(
        Right(Subscribe(
          id: 'personal-channel',
          channelName: 'Personal channel',
          profileName: 'personal',
        )),
      );
      await personalLoaded;

      bloc.add(
        const SubscribeEvent.checkSubscribeInfo(
          id: 'work-channel',
          profileName: 'work',
        ),
      );
      await services.waitForCheck('work');

      final workLoaded = bloc.stream.firstWhere(
        (state) => state.channelInfo?.id == 'work-channel',
      );
      services.checkRequests['work']!.complete(
        Right(Subscribe(
          id: 'work-channel',
          channelName: 'Work channel',
          profileName: 'work',
        )),
      );
      await workLoaded;

      expect(bloc.state.channelInfo?.id, 'work-channel');
      expect(bloc.state.subscribedChannels, isEmpty);
      expect(bloc.state.oldList, isEmpty);
    });
  });

  group('SavedBloc profile request ordering', () {
    test('batch deletes publish the final database result in event order',
        () async {
      final services = _RacingDeleteSavedServices([
        LocalStoreVideoInfo(
          id: 'a',
          title: 'A',
          isSaved: true,
          profileName: 'work',
        ),
        LocalStoreVideoInfo(
          id: 'b',
          title: 'B',
          isSaved: true,
          profileName: 'work',
        ),
        LocalStoreVideoInfo(
          id: 'c',
          title: 'C',
          isSaved: true,
          profileName: 'work',
        ),
      ]);
      final settingsBloc = _FakeSettingsBloc()..setProfile('work');
      final bloc = SavedBloc(
        services,
        _UnusedUserPreferencesService(),
        settingsBloc,
      );
      addTearDown(bloc.close);

      bloc.add(const SavedEvent.getAllVideoInfoList(profileName: 'work'));
      await bloc.stream.firstWhere(
        (state) =>
            state.savedVideosFetchStatus == ApiStatus.loaded &&
            state.localSavedVideos.length == 3,
      );

      final finalState = bloc.stream.firstWhere(
        (state) =>
            state.savedVideosFetchStatus == ApiStatus.loaded &&
            state.localSavedVideos.length == 1 &&
            state.localSavedVideos.single.id == 'c',
      );
      bloc.add(
        const SavedEvent.deleteVideoInfo(id: 'a', profileName: 'work'),
      );
      bloc.add(
        const SavedEvent.deleteVideoInfo(id: 'b', profileName: 'work'),
      );

      await finalState;
      expect(
        bloc.state.localSavedVideos.map((video) => video.id),
        ['c'],
      );
      expect(services.rows['work']!.map((video) => video.id), ['c']);
    });

    test('late library response from previous profile is ignored', () async {
      final services = _DeferredSavedServices();
      final settingsBloc = _FakeSettingsBloc()..setProfile('personal');
      final bloc = SavedBloc(
        services,
        _UnusedUserPreferencesService(),
        settingsBloc,
      );
      addTearDown(bloc.close);

      bloc.add(
        const SavedEvent.getAllVideoInfoList(profileName: 'personal'),
      );
      await services.waitForList('personal');

      settingsBloc.setProfile('work');
      bloc.add(
        const SavedEvent.getAllVideoInfoList(profileName: 'work'),
      );
      await services.waitForList('work');

      final workLoaded = bloc.stream.firstWhere(
        (state) =>
            state.savedVideosFetchStatus == ApiStatus.loaded &&
            state.localSavedVideos.any((video) => video.id == 'work-video'),
      );
      services.listRequests['work']!.complete(
        Right([
          LocalStoreVideoInfo(
            id: 'work-video',
            title: 'Work video',
            isSaved: true,
            profileName: 'work',
          ),
        ]),
      );
      await workLoaded;

      services.listRequests['personal']!.complete(
        Right([
          LocalStoreVideoInfo(
            id: 'personal-video',
            title: 'Personal video',
            isSaved: true,
            profileName: 'personal',
          ),
        ]),
      );
      await Future<void>.delayed(Duration.zero);

      expect(
        bloc.state.localSavedVideos.map((video) => video.id),
        ['work-video'],
      );
      expect(bloc.state.localSavedHistoryVideos, isEmpty);
    });
  });
}
