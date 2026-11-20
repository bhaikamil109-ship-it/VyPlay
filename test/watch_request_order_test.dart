import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/application/watch/watch_bloc.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/sponsorblock/models/sponsor_segment.dart';
import 'package:vyplay/domain/sponsorblock/sponsorblock_service.dart';
import 'package:vyplay/domain/watch/models/piped/video/watch_resp.dart';
import 'package:vyplay/domain/watch/watch_service.dart';

class _DeferredWatchService implements WatchService {
  final Map<String, Completer<Either<MainFailure, WatchResp>>> requests = {};
  final Map<String, Completer<void>> started = {};

  Future<void> waitUntilStarted(String id) =>
      started.putIfAbsent(id, Completer<void>.new).future;

  @override
  Future<Either<MainFailure, WatchResp>> getVideoData({
    required String id,
  }) {
    final start = started.putIfAbsent(id, Completer<void>.new);
    if (!start.isCompleted) start.complete();
    return requests
        .putIfAbsent(id, Completer<Either<MainFailure, WatchResp>>.new)
        .future;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _UnusedSponsorBlockService implements SponsorBlockService {
  @override
  Future<Either<MainFailure, List<SponsorSegment>>> getSegments({
    required String videoId,
    required List<String> categories,
  }) async =>
      const Right<MainFailure, List<SponsorSegment>>([]);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('late Piped watch response cannot replace the latest selected video',
      () async {
    final service = _DeferredWatchService();
    final bloc = WatchBloc(service, _UnusedSponsorBlockService());
    addTearDown(bloc.close);

    bloc.add(WatchEvent.getWatchInfo(id: 'older'));
    await service.waitUntilStarted('older');

    bloc.add(WatchEvent.getWatchInfo(id: 'newer'));
    await service.waitUntilStarted('newer');

    final latestLoaded = bloc.stream.firstWhere(
      (state) => state.oldId == 'newer' &&
          state.fetchWatchInfoStatus.name == 'loaded',
    );
    service.requests['newer']!.complete(
      Right(WatchResp(title: 'newer video')),
    );
    await latestLoaded;

    service.requests['older']!.complete(
      Right(WatchResp(title: 'older video')),
    );
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.oldId, 'newer');
    expect(bloc.state.watchResp.title, 'newer video');
  });
}
