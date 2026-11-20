import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/application/search/search_bloc.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/search/models/invidious/invidious_search_resp.dart';
import 'package:vyplay/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:vyplay/domain/search/models/piped/item.dart';
import 'package:vyplay/domain/search/models/piped/search_resp.dart';
import 'package:vyplay/domain/search/models/search_history.dart';
import 'package:vyplay/domain/search/search_history_service.dart';
import 'package:vyplay/domain/search/search_service.dart';

class _FakeSearchService implements SearchService {
  final Set<String> deferredSearchQueries = {};
  final Set<String> deferredSuggestionQueries = {};
  final Set<String> deferredNewPipeSearchQueries = {};
  final Map<String, Completer<Either<MainFailure, SearchResp>>> deferredSearchResults = {};
  final Map<String, Completer<Either<MainFailure, List>>> deferredSuggestions = {};
  final Map<String, Completer<Either<MainFailure, NewPipeSearchResp>>> deferredNewPipeSearchResults = {};
  final Map<String, Completer<void>> newPipeSearchStarted = {};
  final Map<String, Completer<void>> searchStarted = {};
  final Map<String, Completer<void>> suggestionsStarted = {};
  final Map<String, SearchResp> pipedFirstPages = {};
  final Map<String, SearchResp> pipedMorePages = {};
  final Map<String, NewPipeSearchResp> newPipeFirstPages = {};
  final Map<String, NewPipeSearchResp> newPipeMorePages = {};
  final List<int?> invidiousRequestedPages = [];

  Future<void> waitForSearch(String query) =>
      searchStarted.putIfAbsent(query, Completer<void>.new).future;

  Future<void> waitForSuggestions(String query) =>
      suggestionsStarted.putIfAbsent(query, Completer<void>.new).future;

  Future<void> waitForNewPipeSearch(String query) =>
      newPipeSearchStarted.putIfAbsent(query, Completer<void>.new).future;

  @override
  Future<Either<MainFailure, SearchResp>> getSearchResult({
    required String query,
    required String filter,
  }) async {
    if (deferredSearchQueries.contains(query)) {
      final started = searchStarted.putIfAbsent(query, Completer<void>.new);
      if (!started.isCompleted) started.complete();
      final request = deferredSearchResults.putIfAbsent(
        query,
        () => Completer<Either<MainFailure, SearchResp>>(),
      );
      return request.future;
    }
    return Right(pipedFirstPages[query] ?? SearchResp());
  }

  @override
  Future<Either<MainFailure, List>> getSearchSuggestion({
    required String query,
  }) async {
    if (deferredSuggestionQueries.contains(query)) {
      final started = suggestionsStarted.putIfAbsent(query, Completer<void>.new);
      if (!started.isCompleted) started.complete();
      final request = deferredSuggestions.putIfAbsent(
        query,
        () => Completer<Either<MainFailure, List>>(),
      );
      return request.future;
    }
    return const Right<MainFailure, List>([]);
  }

  @override
  Future<Either<MainFailure, SearchResp>> getMoreSearchResult({
    required String query,
    required String filter,
    required String? nextPage,
  }) async =>
      Right(pipedMorePages[query] ?? SearchResp());

  @override
  Future<Either<MainFailure, List<InvidiousSearchResp>>>
      getInvidiousSearchResult({
    required String query,
    required String type,
  }) async =>
          Right([InvidiousSearchResp(title: 'first-$query')]);

  @override
  Future<Either<MainFailure, List<InvidiousSearchResp>>>
      getMoreInvidiousSearchResult({
    required String query,
    required String type,
    required int? page,
  }) async {
    invidiousRequestedPages.add(page);
    return Right([InvidiousSearchResp(title: 'page-$page')]);
  }

  @override
  Future<Either<MainFailure, List>> getInvidiousSearchSuggestion({
    required String query,
  }) async =>
      const Right<MainFailure, List>([]);

  @override
  Future<Either<MainFailure, NewPipeSearchResp>> getNewPipeSearchResult({
    required String query,
    required String filter,
  }) async {
    if (deferredNewPipeSearchQueries.contains(query)) {
      final started = newPipeSearchStarted.putIfAbsent(query, Completer<void>.new);
      if (!started.isCompleted) started.complete();
      final request = deferredNewPipeSearchResults.putIfAbsent(
        query,
        () => Completer<Either<MainFailure, NewPipeSearchResp>>(),
      );
      return request.future;
    }
    return Right(newPipeFirstPages[query] ?? NewPipeSearchResp(items: const []));
  }

  @override
  Future<Either<MainFailure, NewPipeSearchResp>> getMoreNewPipeSearchResult({
    required String query,
    required String filter,
    required String nextPage,
  }) async =>
      Right(newPipeMorePages[query] ?? NewPipeSearchResp(items: const []));

  @override
  Future<Either<MainFailure, List>> getNewPipeSearchSuggestion({
    required String query,
  }) async =>
      const Right<MainFailure, List>([]);
}

class _FakeSearchHistoryService implements SearchHistoryService {
  @override
  Future<Either<MainFailure, LocalSearchHistory>> addSearchQuery({
    required String query,
    String profileName = 'default',
  }) async =>
      const Left(MainFailure.serverFailure());

  @override
  Future<Either<MainFailure, bool>> clearAllSearchHistory({
    String profileName = 'default',
  }) async =>
      const Left(MainFailure.serverFailure());

  @override
  Future<Either<MainFailure, bool>> deleteSearchQuery({
    required String query,
    String profileName = 'default',
  }) async =>
      const Left(MainFailure.serverFailure());

  @override
  Future<Either<MainFailure, List<LocalSearchHistory>>> getSearchHistory({
    String profileName = 'default',
    int limit = 20,
  }) async =>
      const Right<MainFailure, List<LocalSearchHistory>>([]);
}

Future<void> _waitForState(
  SearchBloc bloc,
  bool Function(SearchState state) predicate,
) async {
  if (predicate(bloc.state)) return;
  await bloc.stream.firstWhere(predicate);
}

void main() {
  group('SearchBloc request ordering', () {
    late _FakeSearchService service;
    late SearchBloc bloc;

    setUp(() {
      service = _FakeSearchService();
      bloc = SearchBloc(service, _FakeSearchHistoryService());
    });

    tearDown(() => bloc.close());

    test('a late older query cannot overwrite the latest search result',
        () async {
      service.deferredSearchQueries.addAll(['older', 'newer']);

      bloc.add(SearchEvent.getSearchResult(
        query: 'older',
        filter: 'all',
        serviceType: 'piped',
      ));
      await service.waitForSearch('older');

      bloc.add(SearchEvent.getSearchResult(
        query: 'newer',
        filter: 'all',
        serviceType: 'piped',
      ));
      await service.waitForSearch('newer');

      final newerResult = _waitForState(
        bloc,
        (state) => state.result?.suggestion == 'newer',
      );
      service.deferredSearchResults['newer']!.complete(
        Right(SearchResp(suggestion: 'newer')),
      );
      await newerResult;

      service.deferredSearchResults['older']!.complete(
        Right(SearchResp(suggestion: 'older')),
      );
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.result?.suggestion, 'newer');
    });

    test('a late Piped result is ignored after switching to NewPipe', () async {
      service.deferredSearchQueries.add('older-piped');
      service.deferredNewPipeSearchQueries.add('current-newpipe');

      bloc.add(SearchEvent.getSearchResult(
        query: 'older-piped',
        filter: 'all',
        serviceType: 'piped',
      ));
      await service.waitForSearch('older-piped');

      bloc.add(SearchEvent.getSearchResult(
        query: 'current-newpipe',
        filter: 'all',
        serviceType: 'newpipe',
      ));
      await service.waitForNewPipeSearch('current-newpipe');

      final currentLoaded = _waitForState(
        bloc,
        (state) =>
            state.fetchNewPipeSearchResultStatus == ApiStatus.loaded &&
            state.newPipeSearchResult?.items?.isNotEmpty == true,
      );
      service.deferredNewPipeSearchResults['current-newpipe']!.complete(
        Right(NewPipeSearchResp(
          items: [NewPipeSearchItem(name: 'current video')],
        )),
      );
      await currentLoaded;

      service.deferredSearchResults['older-piped']!.complete(
        Right(SearchResp(suggestion: 'stale Piped result')),
      );
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.newPipeSearchResult!.items!.single.name, 'current video');
      expect(bloc.state.result, isNull);
    });

    test('clearing suggestions invalidates an older in-flight request',
        () async {
      service.deferredSuggestionQueries.add('stale');
      bloc.add(SearchEvent.getSearchSuggestion(
        query: 'stale',
        serviceType: 'piped',
      ));
      await service.waitForSuggestions('stale');

      final cleared = _waitForState(
        bloc,
        (state) =>
            state.fetchSuggestionStatus == ApiStatus.initial &&
            state.suggestions.isEmpty &&
            !state.isSuggestionDisplay,
      );
      bloc.add(SearchEvent.getSearchSuggestion(
        query: '',
        serviceType: 'piped',
      ));
      await cleared;

      service.deferredSuggestions['stale']!.complete(
        const Right<MainFailure, List>(['stale suggestion']),
      );
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.suggestions, isEmpty);
      expect(bloc.state.isSuggestionDisplay, isFalse);
    });
  });

  group('SearchBloc pagination', () {
    late _FakeSearchService service;
    late SearchBloc bloc;

    setUp(() {
      service = _FakeSearchService();
      bloc = SearchBloc(service, _FakeSearchHistoryService());
    });

    tearDown(() => bloc.close());

    test('Piped appends final page before marking pagination complete',
        () async {
      service.pipedFirstPages['cats'] = SearchResp(
        items: [Item(name: 'first')],
        nextpage: 'cursor-1',
      );
      service.pipedMorePages['cats'] = SearchResp(
        items: [Item(name: 'last-page')],
      );

      bloc.add(SearchEvent.getSearchResult(
        query: 'cats',
        filter: 'all',
        serviceType: 'piped',
      ));
      await _waitForState(
        bloc,
        (state) => state.fetchSearchResultStatus == ApiStatus.loaded,
      );

      bloc.add(SearchEvent.getMoreSearchResult(
        query: 'cats',
        filter: 'all',
        nextPage: 'cursor-1',
        serviceType: 'piped',
      ));
      await _waitForState(bloc, (state) => state.isMoreFetchCompleted);

      expect(
        bloc.state.result!.items.map((item) => item.name).toList(),
        ['first', 'last-page'],
      );
    });

    test('NewPipe appends final page before marking pagination complete',
        () async {
      service.newPipeFirstPages['cats'] = NewPipeSearchResp(
        items: [NewPipeSearchItem(name: 'first')],
        nextPage: 'cursor-1',
      );
      service.newPipeMorePages['cats'] = NewPipeSearchResp(
        items: [NewPipeSearchItem(name: 'last-page')],
      );

      bloc.add(SearchEvent.getSearchResult(
        query: 'cats',
        filter: 'all',
        serviceType: 'newpipe',
      ));
      await _waitForState(
        bloc,
        (state) => state.fetchNewPipeSearchResultStatus == ApiStatus.loaded,
      );

      bloc.add(SearchEvent.getMoreSearchResult(
        query: 'cats',
        filter: 'all',
        nextPage: 'cursor-1',
        serviceType: 'newpipe',
      ));
      await _waitForState(bloc, (state) => state.isMoreNewPipeFetchCompleted);

      expect(
        bloc.state.newPipeSearchResult!.items!.map((item) => item.name).toList(),
        ['first', 'last-page'],
      );
    });

    test('Invidious restarts pagination at page two for each new search',
        () async {
      Future<void> search(String query) async {
        bloc.add(SearchEvent.getSearchResult(
          query: query,
          filter: 'all',
          serviceType: 'invidious',
        ));
        await _waitForState(
          bloc,
          (state) =>
              state.fetchInvidiousSearchResultStatus == ApiStatus.loaded &&
              state.invidiousSearchResult.isNotEmpty &&
              state.invidiousSearchResult.first.title == 'first-$query',
        );
      }

      Future<void> nextPage(String query) async {
        bloc.add(SearchEvent.getMoreSearchResult(
          query: query,
          filter: 'all',
          nextPage: null,
          serviceType: 'invidious',
        ));
        await _waitForState(
          bloc,
          (state) =>
              state.fetchMoreInvidiousSearchResultStatus == ApiStatus.loaded &&
              state.page == 3,
        );
      }

      await search('first');
      await nextPage('first');
      await search('second');
      expect(bloc.state.page, 2);
      await nextPage('second');

      expect(service.invidiousRequestedPages, [2, 2]);
    });
  });
}
