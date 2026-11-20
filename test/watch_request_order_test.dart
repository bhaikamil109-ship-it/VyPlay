import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/application/watch/watch_bloc.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/sponsorblock/models/sponsor_segment.dart';
import 'package:vyplay/domain/watch/models/piped/comments/comments_resp.dart';
import 'package:vyplay/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:vyplay/domain/sponsorblock/sponsorblock_service.dart';
import 'package:vyplay/domain/watch/models/piped/video/watch_resp.dart';
import 'package:vyplay/domain/watch/watch_service.dart';

class _DeferredWatchService implements WatchService {
  final Map<String, Completer<Either<MainFailure, WatchResp>>> requests = {};
  final Map<String, Completer<void>> started = {};
  final Map<String, Completer<Either<MainFailure, NewPipeWatchResp>>> newPipeRequests = {};
  final Map<String, Completer<void>> newPipeStarted = {};
  final Map<String, Completer<Either<MainFailure, CommentsResp>>> commentRequests = {};
  final Map<String, Completer<void>> commentStarted = {};

  Future<void> waitUntilStarted(String id) =>
      started.putIfAbsent(id, Completer<void>.new).future;

  Future<void> waitUntilNewPipeStarted(String id) =>
      newPipeStarted.putIfAbsent(id, Completer<void>.new).future;

  Future<void> waitUntilCommentsStarted(String id) =>
      commentStarted.putIfAbsent(id, Completer<void>.new).future;

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
  Future<Either<MainFailure, NewPipeWatchResp>> getNewPipeVideoData({
    required String id,
  }) {
    final start = newPipeStarted.putIfAbsent(id, Completer<void>.new);
    if (!start.isCompleted) start.complete();
    return newPipeRequests
        .putIfAbsent(id, Completer<Either<MainFailure, NewPipeWatchResp>>.new)
        .future;
  }

  @override
  Future<Either<MainFailure, CommentsResp>> getCommentsData({
    required String id,
  }) {
    final start = commentStarted.putIfAbsent(id, Completer<void>.new);
    if (!start.isCompleted) start.complete();
    return commentRequests
        .putIfAbsent(id, Completer<Either<MainFailure, CommentsResp>>.new)
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
  test('late Piped response cannot replace a newer NewPipe video', () async {
    final service = _DeferredWatchService();
    final bloc = WatchBloc(service, _UnusedSponsorBlockService());
    addTearDown(bloc.close);

    bloc.add(WatchEvent.getWatchInfo(id: 'older'));
    await service.waitUntilStarted('older');

    bloc.add(WatchEvent.getNewPipeWatchInfo(id: 'newer'));
    await service.waitUntilNewPipeStarted('newer');

    final newerLoaded = bloc.stream.firstWhere(
      (state) =>
          state.oldId == 'newer' &&
          state.fetchNewPipeWatchInfoStatus.name == 'loaded',
    );
    service.newPipeRequests['newer']!.complete(
      Right(NewPipeWatchResp(title: 'newer video')),
    );
    await newerLoaded;

    service.requests['older']!.complete(
      Right(WatchResp(title: 'older video')),
    );
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.oldId, 'newer');
    expect(bloc.state.newPipeWatchResp.title, 'newer video');
  });

  test('late comments from the previous video are ignored after navigation',
      () async {
    final service = _DeferredWatchService();
    final bloc = WatchBloc(service, _UnusedSponsorBlockService());
    addTearDown(bloc.close);

    bloc.add(WatchEvent.getCommentData(id: 'older'));
    await service.waitUntilCommentsStarted('older');

    bloc.add(WatchEvent.getWatchInfo(id: 'newer'));
    await service.waitUntilStarted('newer');
    final newerLoaded = bloc.stream.firstWhere(
      (state) => state.oldId == 'newer' &&
          state.fetchWatchInfoStatus.name == 'loaded',
    );
    service.requests['newer']!.complete(
      Right(WatchResp(title: 'newer video')),
    );
    await newerLoaded;

    service.commentRequests['older']!.complete(
      Right(CommentsResp(comments: [])),
    );
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.fetchCommentsStatus.name, 'loading');
    expect(bloc.state.comments.comments, isEmpty);
    expect(bloc.state.oldId, 'newer');
  });

  test('late comments from a previous Short cannot replace the current Short comments',
      () async {
    final service = _DeferredWatchService();
    final bloc = WatchBloc(service, _UnusedSponsorBlockService());
    addTearDown(bloc.close);

    bloc.add(WatchEvent.forceFetchCommentData(id: 'short-1'));
    await service.waitUntilCommentsStarted('short-1');

    bloc.add(WatchEvent.forceFetchCommentData(id: 'short-2'));
    await service.waitUntilCommentsStarted('short-2');

    final currentCommentsLoaded = bloc.stream.firstWhere(
      (state) =>
          state.fetchCommentsStatus.name == 'loaded' &&
          state.comments.commentCount == 2,
    );
    service.commentRequests['short-2']!.complete(
      Right(CommentsResp(comments: [], commentCount: 2)),
    );
    await currentCommentsLoaded;

    service.commentRequests['short-1']!.complete(
      Right(CommentsResp(comments: [], commentCount: 1)),
    );
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.comments.commentCount, 2);
    expect(bloc.state.fetchCommentsStatus.name, 'loaded');
  });
}
