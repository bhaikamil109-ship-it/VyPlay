# VyPlay — Shorts Feed Live-Backend Test Plan

Phase 4 is the only phase still short of 100%. The code exists and is wired up;
what is missing is proof that it works against a real backend. This document is
that proof plan: what to call, what to expect, and how to tell pass from fail.

## 1. How the Shorts feed actually works

The feed does **not** call a dedicated "shorts" endpoint. There is no such thing
in the NewPipe extractor. Instead it reuses the normal search pipeline and then
filters the results:

1. `ShortsFeedScreen` picks one of five broad queries at random per session:
   `shorts`, `trending shorts`, `viral shorts`, `funny shorts`, `music shorts`.
2. It fires `SearchEvent.getSearchResult(query, filter: 'videos',
   serviceType: 'newpipe')`.
3. That reaches `NewPipeChannel.search()`, which invokes the platform method
   `search` on the channel `com.fazilvk.vyplay/newpipe`.
4. `NewPipeMethodHandler.handleSearch()` runs the real NewPipe extractor
   (`SearchInfo.getInfo` / `SearchInfo.getMoreItems`) and returns JSON.
5. Back in Dart, `_isShort()` keeps only genuine shorts:
   - `type` must be `STREAM` (or null), **and**
   - `isShort == true`, **or** `duration` is between 1 and 60 seconds.
6. The surviving list is handed to `ScreenShorts` for playback.
7. Pagination uses the `nextPage` cursor the extractor returns.

So the thing under test is: **does the NewPipe search pipeline return items that
`_isShort()` accepts, and does pagination keep working?**

## 2. Endpoints and entry points under test

| Layer | Entry point | What it is |
|---|---|---|
| UI | `ShortsFeedScreen._loadInitial()` | Fires the first search |
| UI | `ShortsFeedScreen._loadMore()` | Fires the paginated search |
| UI | `ShortsFeedScreen._refresh()` | Rotates query, re-runs initial load |
| Bloc | `SearchEvent.getSearchResult` | query + filter + serviceType |
| Bloc | `SearchEvent.getMoreSearchResult` | adds `nextPage` |
| Dart bridge | `NewPipeChannel.search()` | MethodChannel `search` |
| Native | `NewPipeMethodHandler.handleSearch()` | NewPipe `SearchInfo` |
| Native | `NewPipeMethodHandler.handleGetChannelTab()` | channel `/shorts` tab |

There is also a second, independent Shorts source: the channel **Shorts tab**,
reached through `NewPipeChannel.getChannelTab(tabUrl)` →
`handleGetChannelTab()`. That path is used when opening a channel and switching
to its Shorts tab. It should be tested separately because it exercises a
different extractor (`getChannelTabExtractor`) than the feed does.

## 3. Test cases

### T1 — Feed loads and contains only shorts
- **Do:** open the Shorts tab on a device with network.
- **Expect:** a non-empty list; every item has `type == STREAM` and either
  `isShort == true` or `duration <= 60`.
- **Fail if:** list is empty, or any item is longer than 60 s, or a non-STREAM
  item (channel/playlist) appears.

### T2 — All five discovery queries return results
- **Do:** pull-to-refresh five times; each refresh rotates to the next query.
- **Expect:** each of `shorts`, `trending shorts`, `viral shorts`,
  `funny shorts`, `music shorts` returns at least one short.
- **Fail if:** any query returns zero shorts — that query is dead and should be
  replaced.

### T3 — Pagination advances
- **Do:** scroll to the bottom of the feed.
- **Expect:** `_loadMore()` fires, new unique items append, `nextPage` changes.
- **Fail if:** the same items reappear (the `known` URL set should prevent
  this), or `_hasMore` stays true while nothing new arrives.

### T4 — Empty state is honest
- **Do:** run a query that genuinely has no shorts (e.g. a nonsense string).
- **Expect:** the empty branch renders, not a blank screen and not a spinner
  that never stops.
- **Fail if:** the screen stays in loading forever.

### T5 — Error state is honest
- **Do:** enable airplane mode, then open the Shorts tab.
- **Expect:** within 30 s the error branch shows
  "Could not load Shorts. Check your connection."
- **Fail if:** the 30 s timeout elapses and the UI is still spinning, or the app
  crashes instead of showing the message.

### T6 — Channel Shorts tab
- **Do:** open any channel, switch to its Shorts tab.
- **Expect:** `getChannelTab` returns that channel's shorts.
- **Fail if:** the tab is empty for a channel that visibly has shorts on
  youtube.com, or the call throws `EXTRACTION_ERROR`.

### T7 — Playback handoff
- **Do:** tap a short from the feed.
- **Expect:** `ScreenShorts` opens at the tapped index and plays.
- **Fail if:** it opens at index 0 regardless of what was tapped, or the player
  shows a black frame.

## 4. How to verify

**On a device (the only way to test the native extractor):**

```
flutter run --release
```

Then walk T1–T7 by hand. The native side logs under the tag `NewPipeHandler`;
watch it with:

```
adb logcat -s NewPipeHandler
```

Useful lines to look for: `Channel tabs count:`, `Using tab: filters=`,
`Channel response: name=..., videos=..., tabs=..., nextPage=...`.

**Automated coverage that already exists:** the Dart-side filter logic
(`_isShort`) and the search response parsing are unit-testable without a device.
If `_isShort` is extracted into a pure function, T1's rule can be asserted in
`flutter test` and only T2–T7 need a device.

**What cannot be tested in CI:** the NewPipe extractor needs a real network and
a real Android runtime. GitHub Actions has neither, which is exactly why Phase 4
is at 90% and not 100%.

## 5. Known risks

- **Query drift.** YouTube's search results for "shorts" change constantly. A
  query that works today can return nothing next month. T2 is the early-warning
  test for this.
- **`isShort` flag is optional.** Some extractor versions omit it, which is why
  the duration fallback exists. If a backend starts returning shorts with
  `duration == null` and no flag, they will be silently dropped.
- **60-second boundary.** A 61-second vertical video is not a short by this
  rule. That is intentional but worth confirming against what users expect.
