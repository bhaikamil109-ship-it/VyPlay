# VyPlay — Feature Completeness Matrix

Statuses are assigned from source evidence only. Anything that needs a running Android
device is `IMPLEMENTED BUT DEVICE UNVERIFIED`, never `COMPLETE AND VERIFIED`.

| Feature | Status | Evidence | Required test |
|---|---|---|---|
| Search | IMPLEMENTED BUT DEVICE UNVERIFIED | `lib/infrastructure/newpipe/newpipe_channel.dart` `search()`, `NewPipeMethodHandler.handleSearch` | on-device search on NewPipe |
| Home feed | IMPLEMENTED BUT DEVICE UNVERIFIED | `lib/infrastructure/home/home_impl.dart`, trending/home blocs | on-device feed load |
| Video playback (NewPipe, Android) | PARTIALLY IMPLEMENTED | `NewPipeExoPlayer` always used on Android (`newpipe_screen_watch.dart:331-333`); recovery added this pass (`exoplayer_video_player.dart:292-346`) | play >360p, DASH, merged; 404 reproduction |
| Playback on media_kit (NewPipe) | UI ONLY on Android | `NewPipeMediaKitPlayer` is unreachable on Android (branch above); still used on other platforms | none for Android |
| Quality selection | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeStreamHelper`, `player_settings_sheet.dart` | switch 360p↔1080p on device |
| Subscriptions | IMPLEMENTED BUT DEVICE UNVERIFIED | `application/subscribe/*`, `infrastructure/subscribe/subscribe_impl.dart` | subscribe/unsubscribe + restart |
| Channel pages | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeMethodHandler.handleGetChannel`, `getChannelTab` | open channel + tabs |
| Shorts | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeChannel.getShorts` (`newpipe_channel.dart`), `presentation/shorts/` | scroll/play shorts |
| Playlists | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeMethodHandler.handleGetPlaylist`, `playlist_impl.dart` | open YouTube playlist |
| Local playlists | IMPLEMENTED BUT DEVICE UNVERIFIED | `infrastructure/playlist/local_playlist_service.dart` | create/reorder |
| Watch later | IMPLEMENTED BUT DEVICE UNVERIFIED | saved/local store paths | add/remove |
| History | IMPLEMENTED BUT DEVICE UNVERIFIED | `PlayerPreferencesService.resumePosition`, history timer in player | watch → restart → resume |
| Downloads (progressive ≤360p) | IMPLEMENTED BUT DEVICE UNVERIFIED | `download_impl.dart` single-stream path | download 360p |
| Downloads (>360p, merge) | BROKEN → FIXED, DEVICE UNVERIFIED | channel contract mismatch, see `VYPLAY_FIXES_AND_VERIFICATION.md` Fix 1 | download 1080p and play the file |
| Audio-only downloads | IMPLEMENTED BUT DEVICE UNVERIFIED | `demuxAudio` in restored handler (`NewPipeMuxerHandler.kt:80`) | audio download |
| Background downloads | IMPLEMENTED BUT DEVICE UNVERIFIED | `DownloadsForegroundService.kt`, `workmanager` | background + screen off |
| SD-card / SAF storage | IMPLEMENTED BUT DEVICE UNVERIFIED | `SafStorageHandler.kt`, `StorageMethodHandler.kt` | pick folder, download |
| Background playback | IMPLEMENTED BUT DEVICE UNVERIFIED | `AudioHandlerService`, `ExoPlayerNotificationBridge` | lock screen controls |
| Notifications | IMPLEMENTED BUT DEVICE UNVERIFIED | `download_notification_service.dart`, `flutter_local_notifications` | permission + playback notification |
| PiP | IMPLEMENTED BUT DEVICE UNVERIFIED | `PipService`, `MainActivity` PIP channel, `enterPipMode` | home gesture → PiP |
| Cast | PARTIALLY IMPLEMENTED | `CastMethodHandler.kt`, `CastOptionsProvider.kt`, UI `cast_button.dart` | needs a Cast device |
| SponsorBlock | IMPLEMENTED BUT DEVICE UNVERIFIED | `sponsorblock_impl.dart`, skip logic in players | segment skip |
| Comments | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeMethodHandler.handleGetComments` | load + paginate |
| Dislike counts | IMPLEMENTED BUT DEVICE UNVERIFIED | `return_youtube_dislike_service.dart` | open video with dislikes |
| Live streams | PARTIALLY IMPLEMENTED | HLS live path + `_handleLiveUrlExpired`; now invalidates cache before refresh | live playback + expiry refresh |
| External player | IMPLEMENTED BUT DEVICE UNVERIFIED | `NewPipeMethodHandler.handleOpenExternalPlayer` | open in VLC |
| Profiles | IMPLEMENTED BUT DEVICE UNVERIFIED | settings profile fields in `settings_state.dart` | create/switch profile |
| Import/export backup | IMPLEMENTED BUT DEVICE UNVERIFIED | settings backup/restore paths | export → import |
| Region selection | IMPLEMENTED BUT DEVICE UNVERIFIED | `ScreenRegions`, `getTrending(region)` | switch region |
| Localization | IMPLEMENTED BUT DEVICE UNVERIFIED | `lib/generated/l10n.dart`, `l10n/` | switch language |
| PeerTube | PARTIALLY IMPLEMENTED | `peertube_*` service/repository + screen | needs instance test |
| Plugin system | IMPLEMENTED BUT DEVICE UNVERIFIED | `infrastructure/plugin/*`, permission store | install/enable plugin |
| Supabase / cloud sync | NOT IMPLEMENTED | zero `supabase` references in the repo (see Supabase audit) | n/a |
| Invidious backend | BROKEN against default instance | `inv.nadeko.net` returns HTTP 403 (measured 2026-11-19) | user must pick a working instance |
| Piped backend | IMPLEMENTED BUT DEVICE UNVERIFIED | default instance returned 200 for streams/trending | device playback |

## Notes

- "UI ONLY" is used only where the widget exists but the execution path cannot reach it on
  Android (`NewPipeMediaKitPlayer`).
- No feature was marked verified from a mocked unit test.
