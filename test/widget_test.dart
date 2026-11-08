import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/app_info.dart';
import 'package:vyplay/core/app_theme.dart';
import 'package:vyplay/widgets/error_widget.dart';

/// Widget tests for the shared UI building blocks.
///
/// These deliberately avoid `MyApp` and the service locator: booting the real
/// app pulls in drift, media_kit and platform channels, none of which exist in
/// a headless test binding. Testing the leaf widgets gives real coverage of the
/// states users actually see without a fragile integration harness.
void main() {
  group('AppInfo', () {
    test('exposes the VyPlay product identity', () {
      expect(AppInfo.myApp.name, 'VyPlay');
      expect(AppInfo.myApp.nickname, 'vyplay');
      expect(AppInfo.myApp.description, isNotEmpty);
    });

    test('keeps upstream GPL attribution', () {
      // The GPLv3 licence on the upstream project requires this to survive.
      final names = AppInfo.upstreamInfos.map((e) => e.name).toList();
      expect(names, contains('VyPlay'));
      expect(names, contains('NewPipe Extractor'));
    });

    test('every attribution entry has a resolvable url', () {
      for (final entry in [
        ...AppInfo.upstreamInfos,
        ...AppInfo.developerInfos,
        ...AppInfo.translatorsInfos,
      ]) {
        expect(entry.url, startsWith('http'),
            reason: '${entry.name} has a non-http url');
        expect(entry.name, isNotEmpty);
      }
    });
  });

  group('AppTheme', () {
    test('dark theme uses a dark scaffold background', () {
      final theme = AppTheme.darkTheme;
      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, isTrue);
    });

    test('light theme uses a light scaffold background', () {
      final theme = AppTheme.lightTheme;
      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, isTrue);
    });

    test('OLED theme differs from the standard dark theme', () {
      final oled = AppTheme.oledTheme;
      final dark = AppTheme.darkTheme;
      expect(oled.scaffoldBackgroundColor, isNot(dark.scaffoldBackgroundColor));
    });
  });

  group('EmptyStateWidget', () {
    testWidgets('renders title, subtitle and action', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: EmptyStateWidget(
              icon: Icons.video_library_outlined,
              title: 'No videos yet',
              subtitle: 'Subscribe to a channel to fill this up.',
              actionLabel: 'Browse',
              action: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('No videos yet'), findsOneWidget);
      expect(
          find.text('Subscribe to a channel to fill this up.'), findsOneWidget);
      expect(find.text('Browse'), findsOneWidget);

      await tester.tap(find.text('Browse'));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('omits the action button when no callback is given',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(
            body: EmptyStateWidget(
              icon: Icons.search_off,
              title: 'No results',
            ),
          ),
        ),
      );

      expect(find.text('No results'), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });
  });

  group('CompactErrorWidget', () {
    testWidgets('shows the message and fires retry', (tester) async {
      var retried = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: CompactErrorWidget(
              message: 'Could not reach the instance.',
              onRetry: () => retried = true,
            ),
          ),
        ),
      );

      expect(find.text('Could not reach the instance.'), findsOneWidget);

      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(retried, isTrue);
    });

    testWidgets('falls back to a generic message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(body: CompactErrorWidget()),
        ),
      );

      expect(find.text('An error occurred'), findsOneWidget);
    });
  });

  group('VideoErrorWidget', () {
    testWidgets('renders the retry affordance and custom message',
        (tester) async {
      var retried = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: VideoErrorWidget(
              errorMessage: 'Stream expired.',
              onRetry: () => retried = true,
            ),
          ),
        ),
      );

      expect(find.text('Unable to play video'), findsOneWidget);
      expect(find.text('Stream expired.'), findsOneWidget);

      await tester.tap(find.text('Try Again'));
      await tester.pump();
      expect(retried, isTrue);
    });
  });
}
