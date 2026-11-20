import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/application.dart';
import 'package:vyplay/core/deep_link_handler.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/core/services/pip_service.dart';
import 'package:vyplay/core/services/startup_diagnostics.dart';
import 'package:vyplay/generated/l10n.dart';

import '../download/screen_downloads.dart';
import '../home/screen_home.dart';
import '../more/screen_more.dart';
import '../saved/screen_saved.dart';
import '../settings/screen_settings.dart';
import '../shorts/shorts_feed_screen.dart';
import '../subscriptions/screen_subscriptions.dart';
import '../trending/screen_trending.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

/// Notifier for Downloads' inner tab selection.
/// 0 = Downloading, 1 = Completed, 2 = All.
ValueNotifier<int?> downloadsTabNotifier = ValueNotifier(null);

/// Navigation requests need their own signal: assigning index 0 to a notifier
/// already holding 0 does not notify listeners.
final ValueNotifier<int> _mainTabRequestNotifier = ValueNotifier(0);
final Listenable _mainNavigationListenable = Listenable.merge(
  <Listenable>[indexChangeNotifier, _mainTabRequestNotifier],
);

/// Stable page and bottom-navigation identities. Page order may change when
/// Trending is unavailable, but destination selection is always key-based.
class MainNavigationConfig {
  static const List<String> pageKeys = <String>[
    'home',
    'shorts',
    'trending',
    'subscriptions',
    'library',
    'downloads',
    'settings',
    'more',
  ];

  /// Keep the five primary destinations that fit comfortably on a phone.
  /// Trending, Downloads and Settings remain available from the More screen.
  static const List<String> destinationKeys = <String>[
    'home',
    'shorts',
    'subscriptions',
    'library',
    'more',
  ];

  static List<String> activePageKeys({required bool showTrending}) =>
      pageKeys
          .where((key) => showTrending || key != 'trending')
          .toList(growable: false);

  static String destinationKeyForPage(String pageKey) =>
      destinationKeys.contains(pageKey) ? pageKey : 'more';

  static int pageIndexForDestination(
    String destinationKey, {
    required bool showTrending,
  }) =>
      activePageKeys(showTrending: showTrending).indexOf(destinationKey);
}

/// Requests a page by its stable key. The shell resolves the index after the
/// current backend's conditional pages have been applied.
String? _pendingNavigation;
int? _pendingDownloadsTab;

void navigateToMainTab(String pageKey) {
  _pendingNavigation = pageKey;
  _pendingDownloadsTab = null;
  _mainTabRequestNotifier.value++;
}

/// Navigate to the Downloads page and optionally select an inner tab.
/// [downloadsTabIndex]: 0 = Downloading, 1 = Completed, 2 = All.
void navigateToDownloadsTab({int? downloadsTabIndex}) {
  _pendingNavigation = 'downloads';
  _pendingDownloadsTab = downloadsTabIndex;
  if (downloadsTabIndex != null) {
    downloadsTabNotifier.value = downloadsTabIndex;
  }
  _mainTabRequestNotifier.value++;
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  /// Set once the first build of MainNavigation's scaffold completes.
  static bool _mainNavigationBuilt = false;

  @override
  MainNavigationState createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  bool _hasShownInstanceFailedSnackbar = false;
  final DeepLinkHandler _deepLinkHandler = DeepLinkHandler();
  bool? _previousShowTrending;
  final Map<String, Widget> _pageCache = {};

  List<String> _activeKeys(bool showTrending) =>
      MainNavigationConfig.activePageKeys(showTrending: showTrending);

  Widget _pageFor(String key) {
    return _cachedPage(key, switch (key) {
      'home' => const ScreenHome(),
      'shorts' => const ShortsFeedScreen(),
      'trending' => const ScreenTrending(),
      'subscriptions' => const ScreenSubscriptions(),
      'library' => const ScreenSaved(),
      'downloads' => const ScreenDownloads(),
      'settings' => const ScreenSettings(),
      _ => ScreenMore(onOpenPage: navigateToMainTab),
    });
  }

  List<Widget> _getPages(bool showTrending) =>
      _activeKeys(showTrending)
          .map(
            (key) => KeyedSubtree(
              key: ValueKey<String>(key),
              child: _pageFor(key),
            ),
          )
          .toList(growable: false);

  Widget _cachedPage(String key, Widget page) {
    return _pageCache.putIfAbsent(key, () => page);
  }

  String _destinationLabel(String key, S locals) => switch (key) {
        'home' => locals.home,
        'shorts' => locals.shorts,
        'subscriptions' => locals.subscriptions,
        'library' => locals.library,
        _ => 'More',
      };

  IconData _destinationIcon(String key) => switch (key) {
        'home' => CupertinoIcons.house_fill,
        'shorts' => CupertinoIcons.play_rectangle_fill,
        'subscriptions' => CupertinoIcons.person_2_fill,
        'library' => CupertinoIcons.bookmark_fill,
        _ => CupertinoIcons.ellipsis_circle_fill,
      };

  List<NavigationDestination> _getDestinations(S locals) =>
      MainNavigationConfig.destinationKeys
          .map(
            (key) => NavigationDestination(
              icon: Icon(_destinationIcon(key)),
              selectedIcon: Icon(_destinationIcon(key)),
              label: _destinationLabel(key, locals),
              tooltip: _destinationLabel(key, locals),
            ),
          )
          .toList(growable: false);

  @override
  void initState() {
    super.initState();
    StartupDiagnostics().recordMainNavigationInitState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _deepLinkHandler.init(context);
    });
  }

  @override
  void dispose() {
    _deepLinkHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.ytService != current.ytService ||
          previous.userInstanceFailed != current.userInstanceFailed,
      builder: (context, settingsState) {
        // Disable trending tab for NewPipe Extractor service
        final showTrending =
            settingsState.ytService != YouTubeServices.newpipe.name;
        final pages = _getPages(showTrending);
        final destinations = _getDestinations(locals);
        final destinationKeys = MainNavigationConfig.destinationKeys;

        final maxIndex = pages.length - 1;
        final activeKeys = _activeKeys(showTrending);

        // When the tab set changes (Trending appears/disappears with the
        // backend), keep the user on the SAME tab by resolving its key rather
        // than shifting raw indices. Index arithmetic breaks the moment a tab
        // is inserted anywhere but the end — which is exactly what adding
        // Shorts and Library did.
        if (_previousShowTrending != null &&
            _previousShowTrending != showTrending) {
          final currentIndex = indexChangeNotifier.value;
          final previousKeys = _activeKeys(_previousShowTrending!);
          final currentKey = (currentIndex >= 0 && currentIndex < previousKeys.length)
              ? previousKeys[currentIndex]
              : 'home';
          final resolved = activeKeys.indexOf(currentKey);
          final newIndex = resolved >= 0 ? resolved : 0;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            indexChangeNotifier.value = newIndex;
          });
        }
        _previousShowTrending = showTrending;

        return BlocListener<SettingsBloc, SettingsState>(
          listenWhen: (previous, current) =>
              !previous.userInstanceFailed && current.userInstanceFailed,
          listener: (context, state) {
            if (state.userInstanceFailed && !_hasShownInstanceFailedSnackbar) {
              _hasShownInstanceFailedSnackbar = true;
              final failedName =
                  state.failedInstanceName ?? 'Your preferred instance';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '$failedName is not responding. Switched to a working instance.',
                  ),
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }
          },
          child: AnimatedBuilder(
            animation: _mainNavigationListenable,
            builder: (BuildContext context, Widget? _) {
              final index = indexChangeNotifier.value;
              // Record the first build of MainNavigation's scaffold.
              if (!MainNavigation._mainNavigationBuilt) {
                MainNavigation._mainNavigationBuilt = true;
                StartupDiagnostics().recordMainNavigationBuilt();
              }
              // Resolve notification taps and More-menu actions by stable page
              // key. This keeps the behavior correct when Trending is removed
              // for the NewPipe backend.
              final pendingNav = _pendingNavigation;
              if (pendingNav != null) {
                _pendingNavigation = null;
                final targetIndex = activeKeys.indexOf(pendingNav);
                final pendingDownloadsTab = pendingNav == 'downloads'
                    ? _pendingDownloadsTab
                    : null;
                _pendingDownloadsTab = null;
                if (targetIndex >= 0) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    indexChangeNotifier.value = targetIndex;
                    if (pendingDownloadsTab != null) {
                      downloadsTabNotifier.value = pendingDownloadsTab;
                    }
                  });
                }
              }

              // Ensure index is within bounds
              final safeIndex = index.clamp(0, maxIndex);
              final currentPageKey = activeKeys[safeIndex];
              final selectedDestinationKey =
                  MainNavigationConfig.destinationKeyForPage(currentPageKey);
              final selectedDestinationIndex =
                  destinationKeys.indexOf(selectedDestinationKey);
              // Update the notifier if index was out of bounds (e.g., when trending tab is removed)
              if (index != safeIndex) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  indexChangeNotifier.value = safeIndex;
                });
              }
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, _) async {
                  if (didPop) return;
                  final watchState = context.read<WatchBloc>().state;
                  if (watchState.isPipEnabled &&
                      watchState.selectedVideoBasicDetails != null) {
                    final pipService = PipService();
                    await pipService.setVideoPlaying(true);
                    await pipService.setAspectRatio(16, 9);
                    final entered = await pipService.enterPipMode();
                    if (entered) return;
                  }
                  // Confirm before leaving: one stray back press at the root
                  // used to quit instantly, mid-playback.
                  final exitContext = context;
                  if (!exitContext.mounted) return;
                  if (!await _confirmAppExit(exitContext)) return;

                  // Stop the player before exiting to prevent FlutterJNI crash
                  final globalPlayer = GlobalPlayerController();
                  if (globalPlayer.hasActivePlayer) {
                    globalPlayer.disposePlayer();
                    // Small delay to ensure player is fully stopped
                    await Future.delayed(const Duration(milliseconds: 100));
                  }
                  // Exit the app
                  SystemNavigator.pop();
                },
                child: Scaffold(
                  body: SafeArea(
                    child: _LazyIndexedStack(
                      index: safeIndex,
                      children: pages,
                    ),
                  ),
                  bottomNavigationBar: NavigationBar(
                    height: 70,
                    selectedIndex: selectedDestinationIndex,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    indicatorColor: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.14),
                    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                    destinations: destinations,
                    onDestinationSelected: (destinationIndex) {
                      final destinationKey = destinationKeys[destinationIndex];
                      final pageIndex = activeKeys.indexOf(destinationKey);
                      if (pageIndex >= 0) {
                        indexChangeNotifier.value = pageIndex;
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _LazyIndexedStack extends StatefulWidget {
  const _LazyIndexedStack({
    required this.index,
    required this.children,
  });

  final int index;
  final List<Widget> children;

  @override
  State<_LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<_LazyIndexedStack> {
  late Set<Key> _builtKeys;

  Key _keyFor(int index) =>
      widget.children[index].key ?? ValueKey<int>(index);

  @override
  void initState() {
    super.initState();
    _builtKeys = <Key>{_keyFor(widget.index)};
  }

  @override
  void didUpdateWidget(covariant _LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentKeys = widget.children
        .asMap()
        .entries
        .map((entry) => entry.value.key ?? ValueKey<int>(entry.key))
        .toSet();
    _builtKeys.retainAll(currentKeys);
    _builtKeys.add(_keyFor(widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      children: [
        for (var i = 0; i < widget.children.length; i++)
          _builtKeys.contains(_keyFor(i))
              ? widget.children[i]
              : SizedBox.shrink(key: _keyFor(i)),
      ],
    );
  }
}

/// Asks before leaving the app. Returns false when the user backs out of the
/// dialog, which keeps playback and navigation exactly where they were.
Future<bool> _confirmAppExit(BuildContext context) async {
  final locals = S.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(locals.exitConfirmTitle),
      content: Text(locals.exitConfirmMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(locals.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(locals.exitApp),
        ),
      ],
    ),
  );
  return result ?? false;
}
