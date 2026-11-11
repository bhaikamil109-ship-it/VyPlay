import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

import '../../widgets/custom_app_bar.dart';
import 'widgets/widgets.dart';
import 'widgets/sleep_timer_section.dart';
import 'widgets/gestures_section.dart';
import 'widgets/dearrow_section.dart';
import 'widgets/bookmarks_section.dart';
import 'widgets/content_filtering_section.dart';
import 'widgets/advanced_content_filter_section.dart';
import 'widgets/mini_player_section.dart';
import 'widgets/download_preferences_section.dart';
import 'widgets/download_location_section.dart';
import 'widgets/ryd_section.dart';
import 'widgets/phase18_features_section.dart';
import 'widgets/playback_speed_section.dart';
import 'widgets/service_switch_section.dart';
import 'widgets/cookie_login_section.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomAppBar(
              title: locals.settings,
            )
          ],
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonSettingsSection(),
                  kHeightBox15,
                  ProfilesSettingsSection(),
                  kHeightBox15,
                  DistractionFreeSettingsSection(),
                  kHeightBox15,
                  VideoSettingsSection(),
                  kHeightBox15,
                  PlaybackSettingsSection(),
                  kHeightBox15,
                  SleepTimerSettingsSection(),
                  kHeightBox15,
                  GesturesSettingsSection(),
                  kHeightBox15,
                  DeArrowSettingsSection(),
                  kHeightBox15,
                  PlaylistBookmarksSettingsSection(),
                  kHeightBox15,
                  ContentFilteringSettingsSection(),
                  kHeightBox15,
                  AdvancedContentFilterSection(),
                  kHeightBox15,
                  MiniPlayerSettingsSection(),
                  kHeightBox15,
                  DownloadPreferencesSettingsSection(),
                  kHeightBox15,
                  DownloadLocationSection(),
                  kHeightBox15,
                  RydSettingsSection(),
                  kHeightBox15,
                  Phase18FeaturesSection(),
                  kHeightBox15,
                  PlaybackSpeedSettingsSection(),
                  kHeightBox15,
                  ServiceSwitchSection(),
                  kHeightBox15,
                  CookieLoginSection(),
                  kHeightBox15,
                  SponsorBlockSettingsSection(),
                  kHeightBox15,
                  BackupSettingsSection(),
                  kHeightBox15,
                  AboutSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}