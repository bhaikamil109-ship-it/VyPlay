// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: 'Home label', args: []);
  }

  /// `System`
  String get themeSystem {
    return Intl.message('System', name: 'themeSystem', desc: '', args: []);
  }

  /// `Light`
  String get themeLight {
    return Intl.message('Light', name: 'themeLight', desc: '', args: []);
  }

  /// `Dark`
  String get themeDark {
    return Intl.message('Dark', name: 'themeDark', desc: '', args: []);
  }

  /// `OLED Black`
  String get themeOled {
    return Intl.message('OLED Black', name: 'themeOled', desc: '', args: []);
  }

  /// `Material You`
  String get themeDynamic {
    return Intl.message(
      'Material You',
      name: 'themeDynamic',
      desc: '',
      args: [],
    );
  }

  /// `YouTube Service`
  String get youtubeService {
    return Intl.message(
      'YouTube Service',
      name: 'youtubeService',
      desc: '',
      args: [],
    );
  }

  /// `Piped`
  String get servicePiped {
    return Intl.message('Piped', name: 'servicePiped', desc: '', args: []);
  }

  /// `Explode`
  String get serviceExplode {
    return Intl.message('Explode', name: 'serviceExplode', desc: '', args: []);
  }

  /// `Invidious`
  String get serviceInvidious {
    return Intl.message(
      'Invidious',
      name: 'serviceInvidious',
      desc: '',
      args: [],
    );
  }

  /// `NewPipe Extractor`
  String get serviceNewPipe {
    return Intl.message(
      'NewPipe Extractor',
      name: 'serviceNewPipe',
      desc: '',
      args: [],
    );
  }

  /// `144p`
  String get quality144p {
    return Intl.message('144p', name: 'quality144p', desc: '', args: []);
  }

  /// `240p`
  String get quality240p {
    return Intl.message('240p', name: 'quality240p', desc: '', args: []);
  }

  /// `360p`
  String get quality360p {
    return Intl.message('360p', name: 'quality360p', desc: '', args: []);
  }

  /// `480p`
  String get quality480p {
    return Intl.message('480p', name: 'quality480p', desc: '', args: []);
  }

  /// `720p`
  String get quality720p {
    return Intl.message('720p', name: 'quality720p', desc: '', args: []);
  }

  /// `1080p`
  String get quality1080p {
    return Intl.message('1080p', name: 'quality1080p', desc: '', args: []);
  }

  /// `1440p`
  String get quality1440p {
    return Intl.message('1440p', name: 'quality1440p', desc: '', args: []);
  }

  /// `Filters`
  String get searchFilters {
    return Intl.message('Filters', name: 'searchFilters', desc: '', args: []);
  }

  /// `All`
  String get filterAll {
    return Intl.message('All', name: 'filterAll', desc: '', args: []);
  }

  /// `Videos`
  String get filterVideos {
    return Intl.message('Videos', name: 'filterVideos', desc: '', args: []);
  }

  /// `Channels`
  String get filterChannels {
    return Intl.message('Channels', name: 'filterChannels', desc: '', args: []);
  }

  /// `Playlists`
  String get filterPlaylists {
    return Intl.message(
      'Playlists',
      name: 'filterPlaylists',
      desc: '',
      args: [],
    );
  }

  /// `Playlist`
  String get playlist {
    return Intl.message('Playlist', name: 'playlist', desc: '', args: []);
  }

  /// `Music`
  String get filterMusic {
    return Intl.message('Music', name: 'filterMusic', desc: '', args: []);
  }

  /// `Video Fit`
  String get videoFit {
    return Intl.message('Video Fit', name: 'videoFit', desc: '', args: []);
  }

  /// `Contain`
  String get videoFitContain {
    return Intl.message('Contain', name: 'videoFitContain', desc: '', args: []);
  }

  /// `Cover`
  String get videoFitCover {
    return Intl.message('Cover', name: 'videoFitCover', desc: '', args: []);
  }

  /// `Fill`
  String get videoFitFill {
    return Intl.message('Fill', name: 'videoFitFill', desc: '', args: []);
  }

  /// `Fit Width`
  String get videoFitFitWidth {
    return Intl.message(
      'Fit Width',
      name: 'videoFitFitWidth',
      desc: '',
      args: [],
    );
  }

  /// `Fit Height`
  String get videoFitFitHeight {
    return Intl.message(
      'Fit Height',
      name: 'videoFitFitHeight',
      desc: '',
      args: [],
    );
  }

  /// `Skip Interval`
  String get skipInterval {
    return Intl.message(
      'Skip Interval',
      name: 'skipInterval',
      desc: '',
      args: [],
    );
  }

  /// `Double-tap skip duration in seconds`
  String get skipIntervalDescription {
    return Intl.message(
      'Double-tap skip duration in seconds',
      name: 'skipIntervalDescription',
      desc: '',
      args: [],
    );
  }

  /// `seconds`
  String get seconds {
    return Intl.message('seconds', name: 'seconds', desc: '', args: []);
  }

  /// `SponsorBlock`
  String get sponsorBlock {
    return Intl.message(
      'SponsorBlock',
      name: 'sponsorBlock',
      desc: '',
      args: [],
    );
  }

  /// `Skip sponsored segments automatically`
  String get sponsorBlockDescription {
    return Intl.message(
      'Skip sponsored segments automatically',
      name: 'sponsorBlockDescription',
      desc: '',
      args: [],
    );
  }

  /// `Skip Categories`
  String get sponsorBlockCategories {
    return Intl.message(
      'Skip Categories',
      name: 'sponsorBlockCategories',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor`
  String get sponsor {
    return Intl.message('Sponsor', name: 'sponsor', desc: '', args: []);
  }

  /// `Intro`
  String get intro {
    return Intl.message('Intro', name: 'intro', desc: '', args: []);
  }

  /// `Outro`
  String get outro {
    return Intl.message('Outro', name: 'outro', desc: '', args: []);
  }

  /// `Self Promotion`
  String get selfPromotion {
    return Intl.message(
      'Self Promotion',
      name: 'selfPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Interaction`
  String get interaction {
    return Intl.message('Interaction', name: 'interaction', desc: '', args: []);
  }

  /// `Music: Non-Music`
  String get musicOfftopic {
    return Intl.message(
      'Music: Non-Music',
      name: 'musicOfftopic',
      desc: '',
      args: [],
    );
  }

  /// `Open in Browser`
  String get openInBrowser {
    return Intl.message(
      'Open in Browser',
      name: 'openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Open links in external browser`
  String get openLinksExternally {
    return Intl.message(
      'Open links in external browser',
      name: 'openLinksExternally',
      desc: '',
      args: [],
    );
  }

  /// `Export Data`
  String get exportData {
    return Intl.message('Export Data', name: 'exportData', desc: '', args: []);
  }

  /// `Import Data`
  String get importData {
    return Intl.message('Import Data', name: 'importData', desc: '', args: []);
  }

  /// `Export Subscriptions`
  String get exportSubscriptions {
    return Intl.message(
      'Export Subscriptions',
      name: 'exportSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Import Subscriptions`
  String get importSubscriptions {
    return Intl.message(
      'Import Subscriptions',
      name: 'importSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Backup & Restore`
  String get backupRestore {
    return Intl.message(
      'Backup & Restore',
      name: 'backupRestore',
      desc: '',
      args: [],
    );
  }

  /// `Export or import your subscriptions`
  String get backupRestoreDescription {
    return Intl.message(
      'Export or import your subscriptions',
      name: 'backupRestoreDescription',
      desc: '',
      args: [],
    );
  }

  /// `Export successful`
  String get exportSuccess {
    return Intl.message(
      'Export successful',
      name: 'exportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Import successful`
  String get importSuccess {
    return Intl.message(
      'Import successful',
      name: 'importSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Import failed`
  String get importError {
    return Intl.message(
      'Import failed',
      name: 'importError',
      desc: '',
      args: [],
    );
  }

  /// `Select File`
  String get selectFile {
    return Intl.message('Select File', name: 'selectFile', desc: '', args: []);
  }

  /// `Home Feed`
  String get homeFeedMode {
    return Intl.message('Home Feed', name: 'homeFeedMode', desc: '', args: []);
  }

  /// `Auto`
  String get homeFeedModeAuto {
    return Intl.message('Auto', name: 'homeFeedModeAuto', desc: '', args: []);
  }

  /// `Subscriptions`
  String get homeFeedModeFeedOnly {
    return Intl.message(
      'Subscriptions',
      name: 'homeFeedModeFeedOnly',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get homeFeedModeTrendingOnly {
    return Intl.message(
      'Trending',
      name: 'homeFeedModeTrendingOnly',
      desc: '',
      args: [],
    );
  }

  /// `Show subscriptions if available, otherwise trending`
  String get homeFeedModeAutoHint {
    return Intl.message(
      'Show subscriptions if available, otherwise trending',
      name: 'homeFeedModeAutoHint',
      desc: '',
      args: [],
    );
  }

  /// `Only show videos from subscribed channels`
  String get homeFeedModeFeedOnlyHint {
    return Intl.message(
      'Only show videos from subscribed channels',
      name: 'homeFeedModeFeedOnlyHint',
      desc: '',
      args: [],
    );
  }

  /// `Always show trending videos only`
  String get homeFeedModeTrendingOnlyHint {
    return Intl.message(
      'Always show trending videos only',
      name: 'homeFeedModeTrendingOnlyHint',
      desc: '',
      args: [],
    );
  }

  /// `No Subscriptions`
  String get noSubscriptions {
    return Intl.message(
      'No Subscriptions',
      name: 'noSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe to channels to see their videos here`
  String get noSubscriptionsHint {
    return Intl.message(
      'Subscribe to channels to see their videos here',
      name: 'noSubscriptionsHint',
      desc: '',
      args: [],
    );
  }

  /// `Profiles`
  String get profiles {
    return Intl.message('Profiles', name: 'profiles', desc: '', args: []);
  }

  /// `Create separate profiles for different accounts or preferences`
  String get profilesDescription {
    return Intl.message(
      'Create separate profiles for different accounts or preferences',
      name: 'profilesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add Profile`
  String get addProfile {
    return Intl.message('Add Profile', name: 'addProfile', desc: '', args: []);
  }

  /// `Delete Profile`
  String get deleteProfile {
    return Intl.message(
      'Delete Profile',
      name: 'deleteProfile',
      desc: '',
      args: [],
    );
  }

  /// `Rename Profile`
  String get renameProfile {
    return Intl.message(
      'Rename Profile',
      name: 'renameProfile',
      desc: '',
      args: [],
    );
  }

  /// `Switch Profile`
  String get switchProfile {
    return Intl.message(
      'Switch Profile',
      name: 'switchProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile Name`
  String get profileName {
    return Intl.message(
      'Profile Name',
      name: 'profileName',
      desc: '',
      args: [],
    );
  }

  /// `New Profile Name`
  String get newProfileName {
    return Intl.message(
      'New Profile Name',
      name: 'newProfileName',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get defaultProfile {
    return Intl.message('Default', name: 'defaultProfile', desc: '', args: []);
  }

  /// `Active`
  String get profileInUse {
    return Intl.message('Active', name: 'profileInUse', desc: '', args: []);
  }

  /// `Cannot delete default profile`
  String get cannotDeleteDefault {
    return Intl.message(
      'Cannot delete default profile',
      name: 'cannotDeleteDefault',
      desc: '',
      args: [],
    );
  }

  /// `Cannot rename default profile`
  String get cannotRenameDefault {
    return Intl.message(
      'Cannot rename default profile',
      name: 'cannotRenameDefault',
      desc: '',
      args: [],
    );
  }

  /// `Audio Focus`
  String get audioFocus {
    return Intl.message('Audio Focus', name: 'audioFocus', desc: '', args: []);
  }

  /// `Pause playback on interruptions`
  String get audioFocusDescription {
    return Intl.message(
      'Pause playback on interruptions',
      name: 'audioFocusDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sleep timer`
  String get sleepTimer {
    return Intl.message(
      'Sleep timer',
      name: 'sleepTimer',
      desc: 'Sleep timer setting',
      args: [],
    );
  }

  /// `Pause playback after a set duration`
  String get sleepTimerDescription {
    return Intl.message(
      'Pause playback after a set duration',
      name: 'sleepTimerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Timer is running`
  String get timerRunning {
    return Intl.message(
      'Timer is running',
      name: 'timerRunning',
      desc: '',
      args: [],
    );
  }

  /// `Timer is paused`
  String get timerPaused {
    return Intl.message(
      'Timer is paused',
      name: 'timerPaused',
      desc: '',
      args: [],
    );
  }

  /// `Timer finished`
  String get timerFinished {
    return Intl.message(
      'Timer finished',
      name: 'timerFinished',
      desc: '',
      args: [],
    );
  }

  /// `Playback will not be affected`
  String get timerAlreadyFinished {
    return Intl.message(
      'Playback will not be affected',
      name: 'timerAlreadyFinished',
      desc: '',
      args: [],
    );
  }

  /// `Pause Timer`
  String get pauseTimer {
    return Intl.message('Pause Timer', name: 'pauseTimer', desc: '', args: []);
  }

  /// `Resume Timer`
  String get resumeTimer {
    return Intl.message(
      'Resume Timer',
      name: 'resumeTimer',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Timer`
  String get cancelTimer {
    return Intl.message(
      'Cancel Timer',
      name: 'cancelTimer',
      desc: '',
      args: [],
    );
  }

  /// `Quick Options`
  String get quickOptions {
    return Intl.message(
      'Quick Options',
      name: 'quickOptions',
      desc: '',
      args: [],
    );
  }

  /// `Custom Timer`
  String get customTimer {
    return Intl.message(
      'Custom Timer',
      name: 'customTimer',
      desc: '',
      args: [],
    );
  }

  /// `Set a custom duration for the timer`
  String get customTimerDescription {
    return Intl.message(
      'Set a custom duration for the timer',
      name: 'customTimerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Set`
  String get sleepTimerSet {
    return Intl.message(
      'Set',
      name: 'sleepTimerSet',
      desc: 'Confirms the custom timer',
      args: [],
    );
  }

  /// `Sleep timer cancelled`
  String get sleepTimerCancelled {
    return Intl.message(
      'Sleep timer cancelled',
      name: 'sleepTimerCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Clear Sleep Timer`
  String get clearSleepTimer {
    return Intl.message(
      'Clear Sleep Timer',
      name: 'clearSleepTimer',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Groups`
  String get subscriptionGroups {
    return Intl.message(
      'Subscription Groups',
      name: 'subscriptionGroups',
      desc: '',
      args: [],
    );
  }

  /// `Organize your subscriptions into groups`
  String get organizeSubscriptions {
    return Intl.message(
      'Organize your subscriptions into groups',
      name: 'organizeSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `New Group`
  String get newGroup {
    return Intl.message('New Group', name: 'newGroup', desc: '', args: []);
  }

  /// `Enter group name`
  String get groupNameHint {
    return Intl.message(
      'Enter group name',
      name: 'groupNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `No groups yet`
  String get noGroupsYet {
    return Intl.message(
      'No groups yet',
      name: 'noGroupsYet',
      desc: '',
      args: [],
    );
  }

  /// `Create your first subscription group to organize channels`
  String get createFirstGroup {
    return Intl.message(
      'Create your first subscription group to organize channels',
      name: 'createFirstGroup',
      desc: '',
      args: [],
    );
  }

  /// `Group created successfully`
  String get groupCreated {
    return Intl.message(
      'Group created successfully',
      name: 'groupCreated',
      desc: '',
      args: [],
    );
  }

  /// `Group renamed`
  String get groupRenamed {
    return Intl.message(
      'Group renamed',
      name: 'groupRenamed',
      desc: '',
      args: [],
    );
  }

  /// `Group deleted`
  String get groupDeleted {
    return Intl.message(
      'Group deleted',
      name: 'groupDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Delete Group`
  String get deleteGroup {
    return Intl.message(
      'Delete Group',
      name: 'deleteGroup',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this group? Channels will not be deleted.`
  String get deleteGroupConfirm {
    return Intl.message(
      'Are you sure you want to delete this group? Channels will not be deleted.',
      name: 'deleteGroupConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Rename Group`
  String get renameGroup {
    return Intl.message(
      'Rename Group',
      name: 'renameGroup',
      desc: '',
      args: [],
    );
  }

  /// `0 channels`
  String get groupChannelCount {
    return Intl.message(
      '0 channels',
      name: 'groupChannelCount',
      desc: '',
      args: [],
    );
  }

  /// `Gesture Controls`
  String get gestureControls {
    return Intl.message(
      'Gesture Controls',
      name: 'gestureControls',
      desc: '',
      args: [],
    );
  }

  /// `Swipe gestures for video playback`
  String get gestureControlsDescription {
    return Intl.message(
      'Swipe gestures for video playback',
      name: 'gestureControlsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Swipe to Seek`
  String get swipeToSeek {
    return Intl.message(
      'Swipe to Seek',
      name: 'swipeToSeek',
      desc: '',
      args: [],
    );
  }

  /// `Swipe left/right on video to seek forward/backward`
  String get swipeToSeekDescription {
    return Intl.message(
      'Swipe left/right on video to seek forward/backward',
      name: 'swipeToSeekDescription',
      desc: '',
      args: [],
    );
  }

  /// `Swipe for Brightness`
  String get swipeForBrightness {
    return Intl.message(
      'Swipe for Brightness',
      name: 'swipeForBrightness',
      desc: '',
      args: [],
    );
  }

  /// `Swipe up/down on left side to adjust brightness`
  String get swipeForBrightnessDescription {
    return Intl.message(
      'Swipe up/down on left side to adjust brightness',
      name: 'swipeForBrightnessDescription',
      desc: '',
      args: [],
    );
  }

  /// `Swipe for Volume`
  String get swipeForVolume {
    return Intl.message(
      'Swipe for Volume',
      name: 'swipeForVolume',
      desc: '',
      args: [],
    );
  }

  /// `Swipe up/down on right side to adjust volume`
  String get swipeForVolumeDescription {
    return Intl.message(
      'Swipe up/down on right side to adjust volume',
      name: 'swipeForVolumeDescription',
      desc: '',
      args: [],
    );
  }

  /// `DeArrow`
  String get dearrow {
    return Intl.message('DeArrow', name: 'dearrow', desc: '', args: []);
  }

  /// `Get better titles and thumbnails without clickbait`
  String get dearrowDescription {
    return Intl.message(
      'Get better titles and thumbnails without clickbait',
      name: 'dearrowDescription',
      desc: '',
      args: [],
    );
  }

  /// `DeArrow provides cleaner titles and thumbnails. Works best when enabled.`
  String get dearrowInfo {
    return Intl.message(
      'DeArrow provides cleaner titles and thumbnails. Works best when enabled.',
      name: 'dearrowInfo',
      desc: '',
      args: [],
    );
  }

  /// `Playlist Bookmarks`
  String get playlistBookmarks {
    return Intl.message(
      'Playlist Bookmarks',
      name: 'playlistBookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Automatically bookmark playlists you subscribe to.`
  String get playlistBookmarksDescription {
    return Intl.message(
      'Automatically bookmark playlists you subscribe to.',
      name: 'playlistBookmarksDescription',
      desc: '',
      args: [],
    );
  }

  /// `Selected Playlists`
  String get selectedPlaylists {
    return Intl.message(
      'Selected Playlists',
      name: 'selectedPlaylists',
      desc: '',
      args: [],
    );
  }

  /// `Manage Playlists`
  String get managePlaylists {
    return Intl.message(
      'Manage Playlists',
      name: 'managePlaylists',
      desc: '',
      args: [],
    );
  }

  /// `No playlists selected`
  String get noPlaylistsSelected {
    return Intl.message(
      'No playlists selected',
      name: 'noPlaylistsSelected',
      desc: '',
      args: [],
    );
  }

  /// `Select Playlists`
  String get selectPlaylists {
    return Intl.message(
      'Select Playlists',
      name: 'selectPlaylists',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Restricted Mode`
  String get restrictedMode {
    return Intl.message(
      'Restricted Mode',
      name: 'restrictedMode',
      desc: '',
      args: [],
    );
  }

  /// `Filter out potentially mature content`
  String get restrictedModeDescription {
    return Intl.message(
      'Filter out potentially mature content',
      name: 'restrictedModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Filter Level`
  String get filterLevel {
    return Intl.message(
      'Filter Level',
      name: 'filterLevel',
      desc: '',
      args: [],
    );
  }

  /// `Standard filtering - blocks most inappropriate content`
  String get filterStandardDescription {
    return Intl.message(
      'Standard filtering - blocks most inappropriate content',
      name: 'filterStandardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Strict filtering - blocks all potentially inappropriate content`
  String get filterStrictDescription {
    return Intl.message(
      'Strict filtering - blocks all potentially inappropriate content',
      name: 'filterStrictDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mini Player`
  String get miniPlayer {
    return Intl.message('Mini Player', name: 'miniPlayer', desc: '', args: []);
  }

  /// `Play videos in a small floating window`
  String get miniPlayerDescription {
    return Intl.message(
      'Play videos in a small floating window',
      name: 'miniPlayerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto Expand`
  String get autoExpandMiniPlayer {
    return Intl.message(
      'Auto Expand',
      name: 'autoExpandMiniPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Automatically expand mini player on video end`
  String get autoExpandDescription {
    return Intl.message(
      'Automatically expand mini player on video end',
      name: 'autoExpandDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Expand`
  String get tapToExpandMiniPlayer {
    return Intl.message(
      'Tap to Expand',
      name: 'tapToExpandMiniPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Tap mini player to expand to full screen`
  String get tapToExpandDescription {
    return Intl.message(
      'Tap mini player to expand to full screen',
      name: 'tapToExpandDescription',
      desc: '',
      args: [],
    );
  }

  /// `Double Tap to Expand`
  String get doubleTapToExpandMiniPlayer {
    return Intl.message(
      'Double Tap to Expand',
      name: 'doubleTapToExpandMiniPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Double tap mini player to expand`
  String get doubleTapToExpandDescription {
    return Intl.message(
      'Double tap mini player to expand',
      name: 'doubleTapToExpandDescription',
      desc: '',
      args: [],
    );
  }

  /// `Download Preferences`
  String get downloadPreferences {
    return Intl.message(
      'Download Preferences',
      name: 'downloadPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Configure download preferences`
  String get downloadPreferencesDescription {
    return Intl.message(
      'Configure download preferences',
      name: 'downloadPreferencesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Download Quality`
  String get downloadQuality {
    return Intl.message(
      'Download Quality',
      name: 'downloadQuality',
      desc: '',
      args: [],
    );
  }

  /// `Include Subtitles`
  String get includeSubtitles {
    return Intl.message(
      'Include Subtitles',
      name: 'includeSubtitles',
      desc: '',
      args: [],
    );
  }

  /// `Include subtitles in downloaded videos`
  String get includeSubtitlesDescription {
    return Intl.message(
      'Include subtitles in downloaded videos',
      name: 'includeSubtitlesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Download Over Wi-Fi Only`
  String get downloadOverWifiOnly {
    return Intl.message(
      'Download Over Wi-Fi Only',
      name: 'downloadOverWifiOnly',
      desc: '',
      args: [],
    );
  }

  /// `Only download when connected to Wi-Fi`
  String get downloadOverWifiOnlyDescription {
    return Intl.message(
      'Only download when connected to Wi-Fi',
      name: 'downloadOverWifiOnlyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto Delete`
  String get autoDeleteDownloads {
    return Intl.message(
      'Auto Delete',
      name: 'autoDeleteDownloads',
      desc: '',
      args: [],
    );
  }

  /// `Automatically delete old downloads`
  String get autoDeleteDescription {
    return Intl.message(
      'Automatically delete old downloads',
      name: 'autoDeleteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto delete after`
  String get autoDeleteAfter {
    return Intl.message(
      'Auto delete after',
      name: 'autoDeleteAfter',
      desc: '',
      args: [],
    );
  }

  /// `Playback Speed`
  String get playbackSpeed {
    return Intl.message(
      'Playback Speed',
      name: 'playbackSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Set default playback speed for videos`
  String get playbackSpeedDescription {
    return Intl.message(
      'Set default playback speed for videos',
      name: 'playbackSpeedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Default Speed`
  String get defaultPlaybackSpeed {
    return Intl.message(
      'Default Speed',
      name: 'defaultPlaybackSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Enable Swipe Gestures`
  String get enableSwipeGestures {
    return Intl.message(
      'Enable Swipe Gestures',
      name: 'enableSwipeGestures',
      desc: '',
      args: [],
    );
  }

  /// `Is Swipe Gestures Enabled`
  String get isSwipeGesturesEnabled {
    return Intl.message(
      'Is Swipe Gestures Enabled',
      name: 'isSwipeGesturesEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Swipe Gestures`
  String get toggleSwipeGestures {
    return Intl.message(
      'Toggle Swipe Gestures',
      name: 'toggleSwipeGestures',
      desc: '',
      args: [],
    );
  }

  /// `Is DeArrow Enabled`
  String get isDeArrowEnabled {
    return Intl.message(
      'Is DeArrow Enabled',
      name: 'isDeArrowEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Toggle DeArrow`
  String get toggleDeArrow {
    return Intl.message(
      'Toggle DeArrow',
      name: 'toggleDeArrow',
      desc: '',
      args: [],
    );
  }

  /// `Pause on Phone Call`
  String get pauseOnCall {
    return Intl.message(
      'Pause on Phone Call',
      name: 'pauseOnCall',
      desc: '',
      args: [],
    );
  }

  /// `Pause on Headphone Disconnect`
  String get pauseOnHeadphones {
    return Intl.message(
      'Pause on Headphone Disconnect',
      name: 'pauseOnHeadphones',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle Size`
  String get subtitleSize {
    return Intl.message(
      'Subtitle Size',
      name: 'subtitleSize',
      desc: '',
      args: [],
    );
  }

  /// `Adjust the size of subtitles on video`
  String get subtitleSizeDescription {
    return Intl.message(
      'Adjust the size of subtitles on video',
      name: 'subtitleSizeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get subtitleSizeSmall {
    return Intl.message('Small', name: 'subtitleSizeSmall', desc: '', args: []);
  }

  /// `Medium`
  String get subtitleSizeMedium {
    return Intl.message(
      'Medium',
      name: 'subtitleSizeMedium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get subtitleSizeLarge {
    return Intl.message('Large', name: 'subtitleSizeLarge', desc: '', args: []);
  }

  /// `Extra Large`
  String get subtitleSizeExtraLarge {
    return Intl.message(
      'Extra Large',
      name: 'subtitleSizeExtraLarge',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: 'Trending label',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message('Saved', name: 'saved', desc: 'Saved label', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings label',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: 'History label',
      args: [],
    );
  }

  /// `Saved Videos`
  String get savedVideosTitle {
    return Intl.message(
      'Saved Videos',
      name: 'savedVideosTitle',
      desc: 'Saved videos app bar title',
      args: [],
    );
  }

  /// `No name`
  String get noUploaderName {
    return Intl.message(
      'No name',
      name: 'noUploaderName',
      desc: 'There is no uploader (channel) name available',
      args: [],
    );
  }

  /// `No title`
  String get noVideoTitle {
    return Intl.message(
      'No title',
      name: 'noVideoTitle',
      desc: 'There is no video title available',
      args: [],
    );
  }

  /// `{count, plural, =0{No views} =1{view} other{views}}`
  String videoViews(num count) {
    return Intl.plural(
      count,
      zero: 'No views',
      one: 'view',
      other: 'views',
      name: 'videoViews',
      desc: '{number} views',
      args: [count],
    );
  }

  /// `{count, plural, =0{No subscribers} =1{subscriber} other{subscribers}}`
  String channelSubscribers(num count) {
    return Intl.plural(
      count,
      zero: 'No subscribers',
      one: 'subscriber',
      other: 'subscribers',
      name: 'channelSubscribers',
      desc: '{number} subscribers',
      args: [count],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: 'Subscribe button label',
      args: [],
    );
  }

  /// `No date`
  String get noUploadDate {
    return Intl.message(
      'No date',
      name: 'noUploadDate',
      desc: 'There is no video upload date available',
      args: [],
    );
  }

  /// `There are no saved videos`
  String get thereIsNoSavedVideos {
    return Intl.message(
      'There are no saved videos',
      name: 'thereIsNoSavedVideos',
      desc: 'There are no saved videos found',
      args: [],
    );
  }

  /// `There are no saved/history videos`
  String get thereIsNoSavedOrHistoryVideos {
    return Intl.message(
      'There are no saved/history videos',
      name: 'thereIsNoSavedOrHistoryVideos',
      desc: '',
      args: [],
    );
  }

  /// `No video source available, automatically changed to hls`
  String get noVideoAvailableChangedToHls {
    return Intl.message(
      'No video source available, automatically changed to hls',
      name: 'noVideoAvailableChangedToHls',
      desc:
          'When there is no standard player link available, then it changed to hls player',
      args: [],
    );
  }

  /// `Unknown Quality`
  String get unknownQuality {
    return Intl.message(
      'Unknown Quality',
      name: 'unknownQuality',
      desc: 'Quality name not found',
      args: [],
    );
  }

  /// `Hls Player`
  String get hlsPlayer {
    return Intl.message(
      'Hls Player',
      name: 'hlsPlayer',
      desc: 'Hls player label',
      args: [],
    );
  }

  /// `Enable HLS player to unlock all quality options. Disable if errors occur.`
  String get enableHlsPlayerDescription {
    return Intl.message(
      'Enable HLS player to unlock all quality options. Disable if errors occur.',
      name: 'enableHlsPlayerDescription',
      desc:
          'Enabling HLS player may slow down performance but unlocks all quality options. Disable this setting if errors occur.',
      args: [],
    );
  }

  /// `Disable video history`
  String get disableVideoHistory {
    return Intl.message(
      'Disable video history',
      name: 'disableVideoHistory',
      desc: 'Hide watch history',
      args: [],
    );
  }

  /// `Retrieve Dislikes`
  String get retrieveDislikes {
    return Intl.message(
      'Retrieve Dislikes',
      name: 'retrieveDislikes',
      desc: 'Retrieve dislikes label',
      args: [],
    );
  }

  /// `Retrieve dislike counts`
  String get retrieveDislikeCounts {
    return Intl.message(
      'Retrieve dislike counts',
      name: 'retrieveDislikeCounts',
      desc: 'Return the dislike button of videos',
      args: [],
    );
  }

  /// `No description`
  String get noVideoDescription {
    return Intl.message(
      'No description',
      name: 'noVideoDescription',
      desc: 'There is no video description available',
      args: [],
    );
  }

  /// `Related`
  String get relatedTitle {
    return Intl.message(
      'Related',
      name: 'relatedTitle',
      desc: 'Related videos label',
      args: [],
    );
  }

  /// `Not found`
  String get commentAuthorNotFound {
    return Intl.message(
      'Not found',
      name: 'commentAuthorNotFound',
      desc: 'Name of the comment author is not found',
      args: [],
    );
  }

  /// `Read more`
  String get readMoreText {
    return Intl.message(
      'Read more',
      name: 'readMoreText',
      desc: 'Expand the comment text',
      args: [],
    );
  }

  /// `Show less`
  String get showLessText {
    return Intl.message(
      'Show less',
      name: 'showLessText',
      desc: 'Collapse the comment text',
      args: [],
    );
  }

  /// `Common`
  String get commonSettingsTitle {
    return Intl.message(
      'Common',
      name: 'commonSettingsTitle',
      desc: 'Common settings label',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language label',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: 'Region label',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: 'Theme label', args: []);
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: 'Developer label',
      args: [],
    );
  }

  /// `Translators`
  String get translators {
    return Intl.message(
      'Translators',
      name: 'translators',
      desc: 'Translators label',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: 'Version label',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: 'About label', args: []);
  }

  /// `Video`
  String get video {
    return Intl.message('Video', name: 'video', desc: 'Video label', args: []);
  }

  /// `unknown`
  String get unknown {
    return Intl.message(
      'unknown',
      name: 'unknown',
      desc: 'Unknown label',
      args: [],
    );
  }

  /// `Default Quality`
  String get defaultQuality {
    return Intl.message(
      'Default Quality',
      name: 'defaultQuality',
      desc: 'Default video quality label',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: 'Retry label', args: []);
  }

  /// `{count, plural, =1{Reply} other{Replies}}`
  String repliesPlural(num count) {
    return Intl.plural(
      count,
      one: 'Reply',
      other: 'Replies',
      name: 'repliesPlural',
      desc: '{number} Replies',
      args: [count],
    );
  }

  /// `Canada`
  String get canada {
    return Intl.message('Canada', name: 'canada', desc: '', args: []);
  }

  /// `France`
  String get france {
    return Intl.message('France', name: 'france', desc: '', args: []);
  }

  /// `India`
  String get india {
    return Intl.message('India', name: 'india', desc: '', args: []);
  }

  /// `Netherlands`
  String get netherlands {
    return Intl.message('Netherlands', name: 'netherlands', desc: '', args: []);
  }

  /// `United Kingdom`
  String get unitedKingdom {
    return Intl.message(
      'United Kingdom',
      name: 'unitedKingdom',
      desc: '',
      args: [],
    );
  }

  /// `United States`
  String get unitedStates {
    return Intl.message(
      'United States',
      name: 'unitedStates',
      desc: '',
      args: [],
    );
  }

  /// `Distraction Free`
  String get distractionFree {
    return Intl.message(
      'Distraction Free',
      name: 'distractionFree',
      desc: 'A section for control distracting elements.',
      args: [],
    );
  }

  /// `Hide Comments`
  String get hideComments {
    return Intl.message(
      'Hide Comments',
      name: 'hideComments',
      desc: 'Hide Comments label.',
      args: [],
    );
  }

  /// `Hide comments button from watch screen.`
  String get hideCommentsButtonFromWatchScreen {
    return Intl.message(
      'Hide comments button from watch screen.',
      name: 'hideCommentsButtonFromWatchScreen',
      desc: 'Hide the comment button from video streaming screen.',
      args: [],
    );
  }

  /// `Hide Related`
  String get hideRelated {
    return Intl.message(
      'Hide Related',
      name: 'hideRelated',
      desc: 'Hide Related videos label.',
      args: [],
    );
  }

  /// `Hide related videos from watch screen`
  String get hideRelatedVideosFromWatchScreen {
    return Intl.message(
      'Hide related videos from watch screen',
      name: 'hideRelatedVideosFromWatchScreen',
      desc: 'Hide the related videos from video streaming screen.',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: 'Share label.', args: []);
  }

  /// `Include title`
  String get includeTitle {
    return Intl.message(
      'Include title',
      name: 'includeTitle',
      desc: 'Include title along with url',
      args: [],
    );
  }

  /// `Instances`
  String get instances {
    return Intl.message('Instances', name: 'instances', desc: '', args: []);
  }

  /// `Please consider switching to a different region for better results.`
  String get switchRegion {
    return Intl.message(
      'Please consider switching to a different region for better results.',
      name: 'switchRegion',
      desc: '',
      args: [],
    );
  }

  /// `'Swipe down to dismiss' disabled`
  String get swipeDownToDismissDisabled {
    return Intl.message(
      '\'Swipe down to dismiss\' disabled',
      name: 'swipeDownToDismissDisabled',
      desc: '',
      args: [],
    );
  }

  /// `'Swipe up to dismiss' enabled`
  String get swipeUpToDismissEnabled {
    return Intl.message(
      '\'Swipe up to dismiss\' enabled',
      name: 'swipeUpToDismissEnabled',
      desc: '',
      args: [],
    );
  }

  /// `No Comments Found`
  String get noCommentsFound {
    return Intl.message(
      'No Comments Found',
      name: 'noCommentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Comments are disabled`
  String get commentsDisabled {
    return Intl.message(
      'Comments are disabled',
      name: 'commentsDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Replies are not available yet`
  String get repliesNotSupported {
    return Intl.message(
      'Replies are not available yet',
      name: 'repliesNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `Pinned`
  String get pinned {
    return Intl.message('Pinned', name: 'pinned', desc: '', args: []);
  }

  /// `Disable PIP player`
  String get disablePipPlayer {
    return Intl.message(
      'Disable PIP player',
      name: 'disablePipPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message('Videos', name: 'videos', desc: '', args: []);
  }

  /// `Shorts`
  String get shorts {
    return Intl.message('Shorts', name: 'shorts', desc: '', args: []);
  }

  /// `Playlists`
  String get playlists {
    return Intl.message('Playlists', name: 'playlists', desc: '', args: []);
  }

  /// `No shorts available`
  String get noShorts {
    return Intl.message(
      'No shorts available',
      name: 'noShorts',
      desc: '',
      args: [],
    );
  }

  /// `No playlists available`
  String get noPlaylists {
    return Intl.message(
      'No playlists available',
      name: 'noPlaylists',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Date added`
  String get dateAdded {
    return Intl.message('Date added', name: 'dateAdded', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `selected`
  String get selected {
    return Intl.message('selected', name: 'selected', desc: '', args: []);
  }

  /// `Select all`
  String get selectAll {
    return Intl.message('Select all', name: 'selectAll', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Sort`
  String get sort {
    return Intl.message('Sort', name: 'sort', desc: '', args: []);
  }

  /// `Select videos`
  String get selectVideos {
    return Intl.message(
      'Select videos',
      name: 'selectVideos',
      desc: '',
      args: [],
    );
  }

  /// `Clear all saved`
  String get clearAllSaved {
    return Intl.message(
      'Clear all saved',
      name: 'clearAllSaved',
      desc: '',
      args: [],
    );
  }

  /// `Clear all history`
  String get clearAllHistory {
    return Intl.message(
      'Clear all history',
      name: 'clearAllHistory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove all saved videos?`
  String get clearAllSavedConfirm {
    return Intl.message(
      'Are you sure you want to remove all saved videos?',
      name: 'clearAllSavedConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all watch history?`
  String get clearAllHistoryConfirm {
    return Intl.message(
      'Are you sure you want to clear all watch history?',
      name: 'clearAllHistoryConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get clearAll {
    return Intl.message('Clear all', name: 'clearAll', desc: '', args: []);
  }

  /// `Search saved videos...`
  String get searchSavedVideos {
    return Intl.message(
      'Search saved videos...',
      name: 'searchSavedVideos',
      desc: '',
      args: [],
    );
  }

  /// `No saved videos`
  String get noSavedVideos {
    return Intl.message(
      'No saved videos',
      name: 'noSavedVideos',
      desc: '',
      args: [],
    );
  }

  /// `Start saving videos to watch later`
  String get startSavingVideos {
    return Intl.message(
      'Start saving videos to watch later',
      name: 'startSavingVideos',
      desc: '',
      args: [],
    );
  }

  /// `No watch history`
  String get noHistory {
    return Intl.message(
      'No watch history',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `Videos you watch will appear here`
  String get watchSomeVideos {
    return Intl.message(
      'Videos you watch will appear here',
      name: 'watchSomeVideos',
      desc: '',
      args: [],
    );
  }

  /// `Delete video`
  String get deleteVideo {
    return Intl.message(
      'Delete video',
      name: 'deleteVideo',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this video?`
  String get deleteVideoConfirm {
    return Intl.message(
      'Are you sure you want to remove this video?',
      name: 'deleteVideoConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Remove from saved`
  String get removeFromSaved {
    return Intl.message(
      'Remove from saved',
      name: 'removeFromSaved',
      desc: '',
      args: [],
    );
  }

  /// `Remove from history`
  String get removeFromHistory {
    return Intl.message(
      'Remove from history',
      name: 'removeFromHistory',
      desc: '',
      args: [],
    );
  }

  /// `views`
  String get views {
    return Intl.message('views', name: 'views', desc: '', args: []);
  }

  /// `Subscriptions`
  String get subscriptions {
    return Intl.message(
      'Subscriptions',
      name: 'subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Channels`
  String get channels {
    return Intl.message('Channels', name: 'channels', desc: '', args: []);
  }

  /// `Search subscriptions...`
  String get searchSubscriptions {
    return Intl.message(
      'Search subscriptions...',
      name: 'searchSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `No videos found`
  String get noVideosFound {
    return Intl.message(
      'No videos found',
      name: 'noVideosFound',
      desc: '',
      args: [],
    );
  }

  /// `Pull down to refresh`
  String get refreshToLoad {
    return Intl.message(
      'Pull down to refresh',
      name: 'refreshToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get unsubscribe {
    return Intl.message('Unsubscribe', name: 'unsubscribe', desc: '', args: []);
  }

  /// `Unsubscribe from this channel?`
  String get unsubscribeConfirm {
    return Intl.message(
      'Unsubscribe from this channel?',
      name: 'unsubscribeConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search YouTube...`
  String get searchYouTube {
    return Intl.message(
      'Search YouTube...',
      name: 'searchYouTube',
      desc: '',
      args: [],
    );
  }

  /// `Search for videos, channels, and playlists`
  String get searchForVideosChannels {
    return Intl.message(
      'Search for videos, channels, and playlists',
      name: 'searchForVideosChannels',
      desc: '',
      args: [],
    );
  }

  /// `Recent searches`
  String get recentSearches {
    return Intl.message(
      'Recent searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Save Search History`
  String get searchHistoryEnabled {
    return Intl.message(
      'Save Search History',
      name: 'searchHistoryEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Save your search queries for quick access`
  String get searchHistoryEnabledDescription {
    return Intl.message(
      'Save your search queries for quick access',
      name: 'searchHistoryEnabledDescription',
      desc: '',
      args: [],
    );
  }

  /// `Show Search History`
  String get showSearchHistory {
    return Intl.message(
      'Show Search History',
      name: 'showSearchHistory',
      desc: '',
      args: [],
    );
  }

  /// `Display your recent searches in search screen`
  String get showSearchHistoryDescription {
    return Intl.message(
      'Display your recent searches in search screen',
      name: 'showSearchHistoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Copy link`
  String get copyLink {
    return Intl.message(
      'Copy link',
      name: 'copyLink',
      desc: 'Copy link button label',
      args: [],
    );
  }

  /// `Share via`
  String get shareVia {
    return Intl.message(
      'Share via',
      name: 'shareVia',
      desc: 'Share via apps button label',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: 'Snackbar message when link is copied',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: 'Like button label when count is unavailable',
      args: [],
    );
  }

  /// `Dislike`
  String get dislike {
    return Intl.message(
      'Dislike',
      name: 'dislike',
      desc: 'Dislike button label when count is unavailable',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: 'Download button label',
      args: [],
    );
  }

  /// `Downloads`
  String get downloads {
    return Intl.message(
      'Downloads',
      name: 'downloads',
      desc: 'Downloads screen title',
      args: [],
    );
  }

  /// `Downloading`
  String get downloading {
    return Intl.message(
      'Downloading',
      name: 'downloading',
      desc: 'Downloading status label',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: 'Completed status label',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: 'Pending status label',
      args: [],
    );
  }

  /// `Paused`
  String get paused {
    return Intl.message(
      'Paused',
      name: 'paused',
      desc: 'Paused status label',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: 'Failed status label',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: 'Cancelled status label',
      args: [],
    );
  }

  /// `Merging`
  String get merging {
    return Intl.message(
      'Merging',
      name: 'merging',
      desc: 'Merging audio and video status',
      args: [],
    );
  }

  /// `Downloading video`
  String get downloadingVideo {
    return Intl.message(
      'Downloading video',
      name: 'downloadingVideo',
      desc: 'Phase indicator when downloading video track',
      args: [],
    );
  }

  /// `Downloading audio`
  String get downloadingAudio {
    return Intl.message(
      'Downloading audio',
      name: 'downloadingAudio',
      desc: 'Phase indicator when downloading audio track',
      args: [],
    );
  }

  /// `No Downloads`
  String get noDownloads {
    return Intl.message(
      'No Downloads',
      name: 'noDownloads',
      desc: 'Empty downloads state title',
      args: [],
    );
  }

  /// `Downloaded videos will appear here`
  String get noDownloadsHint {
    return Intl.message(
      'Downloaded videos will appear here',
      name: 'noDownloadsHint',
      desc: 'Empty downloads state hint',
      args: [],
    );
  }

  /// `Download Type`
  String get downloadType {
    return Intl.message(
      'Download Type',
      name: 'downloadType',
      desc: 'Download type selector label',
      args: [],
    );
  }

  /// `Video + Audio`
  String get videoWithAudio {
    return Intl.message(
      'Video + Audio',
      name: 'videoWithAudio',
      desc: 'Video with audio download type',
      args: [],
    );
  }

  /// `Video Only`
  String get videoOnly {
    return Intl.message(
      'Video Only',
      name: 'videoOnly',
      desc: 'Video only download type',
      args: [],
    );
  }

  /// `Audio Only`
  String get audioOnly {
    return Intl.message(
      'Audio Only',
      name: 'audioOnly',
      desc: 'Audio only download type',
      args: [],
    );
  }

  /// `Audio`
  String get audio {
    return Intl.message(
      'Audio',
      name: 'audio',
      desc: 'Audio badge label',
      args: [],
    );
  }

  /// `Video+Audio`
  String get videoAudio {
    return Intl.message(
      'Video+Audio',
      name: 'videoAudio',
      desc: 'Video with audio badge label',
      args: [],
    );
  }

  /// `Video Quality`
  String get videoQuality {
    return Intl.message(
      'Video Quality',
      name: 'videoQuality',
      desc: 'Video quality selector label',
      args: [],
    );
  }

  /// `Audio Quality`
  String get audioQuality {
    return Intl.message(
      'Audio Quality',
      name: 'audioQuality',
      desc: 'Audio quality selector label',
      args: [],
    );
  }

  /// `Start Download`
  String get startDownload {
    return Intl.message(
      'Start Download',
      name: 'startDownload',
      desc: 'Start download button label',
      args: [],
    );
  }

  /// `Download started`
  String get downloadStarted {
    return Intl.message(
      'Download started',
      name: 'downloadStarted',
      desc: 'Download started snackbar message',
      args: [],
    );
  }

  /// `Delete Download`
  String get deleteDownload {
    return Intl.message(
      'Delete Download',
      name: 'deleteDownload',
      desc: 'Delete download dialog title',
      args: [],
    );
  }

  /// `Are you sure you want to delete this download?`
  String get deleteDownloadConfirm {
    return Intl.message(
      'Are you sure you want to delete this download?',
      name: 'deleteDownloadConfirm',
      desc: 'Delete download confirmation message',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: 'Pause button label',
      args: [],
    );
  }

  /// `Resume`
  String get resume {
    return Intl.message(
      'Resume',
      name: 'resume',
      desc: 'Resume button label',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: 'All tab label', args: []);
  }

  /// `An unknown error occurred`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred',
      name: 'unknownError',
      desc: 'Unknown error message',
      args: [],
    );
  }

  /// `Failed to open file`
  String get failedToOpenFile {
    return Intl.message(
      'Failed to open file',
      name: 'failedToOpenFile',
      desc: 'Error message when file cannot be opened',
      args: [],
    );
  }

  /// `File not found`
  String get fileNotFound {
    return Intl.message(
      'File not found',
      name: 'fileNotFound',
      desc: 'Error message when downloaded file is missing',
      args: [],
    );
  }

  /// `Download failed: {title}`
  String downloadFailed(String title) {
    return Intl.message(
      'Download failed: $title',
      name: 'downloadFailed',
      desc: 'Error message when download fails',
      args: [title],
    );
  }

  /// `Auto Picture-in-Picture`
  String get autoPip {
    return Intl.message(
      'Auto Picture-in-Picture',
      name: 'autoPip',
      desc: 'Setting to enable auto PiP when pressing home button',
      args: [],
    );
  }

  /// `Automatically enter PiP mode when pressing home button while video is playing`
  String get autoPipDescription {
    return Intl.message(
      'Automatically enter PiP mode when pressing home button while video is playing',
      name: 'autoPipDescription',
      desc: 'Description for auto PiP setting',
      args: [],
    );
  }

  /// `Save to Device`
  String get saveToDevice {
    return Intl.message(
      'Save to Device',
      name: 'saveToDevice',
      desc: 'Save downloaded file to device storage',
      args: [],
    );
  }

  /// `Saving to device...`
  String get savingToDevice {
    return Intl.message(
      'Saving to device...',
      name: 'savingToDevice',
      desc: 'Message shown while saving file to device',
      args: [],
    );
  }

  /// `Saved to device`
  String get savedToDevice {
    return Intl.message(
      'Saved to device',
      name: 'savedToDevice',
      desc: 'Success message when file is saved to device',
      args: [],
    );
  }

  /// `Failed to save to device`
  String get saveToDeviceFailed {
    return Intl.message(
      'Failed to save to device',
      name: 'saveToDeviceFailed',
      desc: 'Error message when save to device fails',
      args: [],
    );
  }

  /// `Cast`
  String get castTitle {
    return Intl.message(
      'Cast',
      name: 'castTitle',
      desc: 'Cast button label',
      args: [],
    );
  }

  /// `Connected`
  String get castConnected {
    return Intl.message(
      'Connected',
      name: 'castConnected',
      desc: 'Cast connected state',
      args: [],
    );
  }

  /// `Casting to {device}`
  String castConnectedTo(String device) {
    return Intl.message(
      'Casting to $device',
      name: 'castConnectedTo',
      desc: 'Cast target device',
      args: [device],
    );
  }

  /// `Stop casting`
  String get castStop {
    return Intl.message(
      'Stop casting',
      name: 'castStop',
      desc: 'Ends the Cast session',
      args: [],
    );
  }

  /// `Cast is not available on this device`
  String get castUnavailable {
    return Intl.message(
      'Cast is not available on this device',
      name: 'castUnavailable',
      desc: 'Shown when the Cast framework is missing',
      args: [],
    );
  }

  /// `This video cannot be cast`
  String get castFailed {
    return Intl.message(
      'This video cannot be cast',
      name: 'castFailed',
      desc: 'No castable stream exists',
      args: [],
    );
  }

  /// `New upload notifications`
  String get newVideoNotifications {
    return Intl.message(
      'New upload notifications',
      name: 'newVideoNotifications',
      desc: 'Setting for subscription upload notifications',
      args: [],
    );
  }

  /// `Get notified when channels you subscribe to upload`
  String get newVideoNotificationsDescription {
    return Intl.message(
      'Get notified when channels you subscribe to upload',
      name: 'newVideoNotificationsDescription',
      desc: 'Description for upload notification setting',
      args: [],
    );
  }

  /// `Notification permission was denied`
  String get notificationsDenied {
    return Intl.message(
      'Notification permission was denied',
      name: 'notificationsDenied',
      desc: 'Shown when the notification permission is refused',
      args: [],
    );
  }

  /// `Queue`
  String get queue {
    return Intl.message(
      'Queue',
      name: 'queue',
      desc: 'Playback queue title',
      args: [],
    );
  }

  /// `Queue is empty`
  String get queueEmpty {
    return Intl.message(
      'Queue is empty',
      name: 'queueEmpty',
      desc: 'Empty playback queue',
      args: [],
    );
  }

  /// `Shuffle`
  String get queueShuffle {
    return Intl.message(
      'Shuffle',
      name: 'queueShuffle',
      desc: 'Shuffles the upcoming queue',
      args: [],
    );
  }

  /// `Clear`
  String get queueClear {
    return Intl.message(
      'Clear',
      name: 'queueClear',
      desc: 'Clears the playback queue',
      args: [],
    );
  }

  /// `Auto Dismiss Queue`
  String get queueAutoDismiss {
    return Intl.message(
      'Auto Dismiss Queue',
      name: 'queueAutoDismiss',
      desc: '',
      args: [],
    );
  }

  /// `Automatically hide queue after a set time`
  String get queueAutoDismissDescription {
    return Intl.message(
      'Automatically hide queue after a set time',
      name: 'queueAutoDismissDescription',
      desc: '',
      args: [],
    );
  }

  /// `Queue Dismiss Timeout`
  String get queueDismissTimeout {
    return Intl.message(
      'Queue Dismiss Timeout',
      name: 'queueDismissTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Show Related Videos in Queue`
  String get showRelatedInQueue {
    return Intl.message(
      'Show Related Videos in Queue',
      name: 'showRelatedInQueue',
      desc: '',
      args: [],
    );
  }

  /// `Autoplay Countdown`
  String get autoplayCountdown {
    return Intl.message(
      'Autoplay Countdown',
      name: 'autoplayCountdown',
      desc: '',
      args: [],
    );
  }

  /// `Show a countdown before autoplaying the next video`
  String get autoplayCountdownDescription {
    return Intl.message(
      'Show a countdown before autoplaying the next video',
      name: 'autoplayCountdownDescription',
      desc: '',
      args: [],
    );
  }

  /// `Disable Autoplay on Cellular`
  String get disableAutoplayOnCellular {
    return Intl.message(
      'Disable Autoplay on Cellular',
      name: 'disableAutoplayOnCellular',
      desc: '',
      args: [],
    );
  }

  /// `Don't autoplay videos when using mobile data`
  String get disableAutoplayOnCellularDescription {
    return Intl.message(
      'Don\'t autoplay videos when using mobile data',
      name: 'disableAutoplayOnCellularDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto-Queue`
  String get autoQueue {
    return Intl.message('Auto-Queue', name: 'autoQueue', desc: '', args: []);
  }

  /// `Continue playback by auto-adding related videos to queue`
  String get autoQueueDescription {
    return Intl.message(
      'Continue playback by auto-adding related videos to queue',
      name: 'autoQueueDescription',
      desc: '',
      args: [],
    );
  }

  /// `Buffer Preloading`
  String get bufferPreload {
    return Intl.message(
      'Buffer Preloading',
      name: 'bufferPreload',
      desc: '',
      args: [],
    );
  }

  /// `Preload buffer for the next video`
  String get bufferPreloadDescription {
    return Intl.message(
      'Preload buffer for the next video',
      name: 'bufferPreloadDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto Quality Adjustment`
  String get autoQualityAdjust {
    return Intl.message(
      'Auto Quality Adjustment',
      name: 'autoQualityAdjust',
      desc: '',
      args: [],
    );
  }

  /// `Automatically adjust video quality based on network speed`
  String get autoQualityAdjustDescription {
    return Intl.message(
      'Automatically adjust video quality based on network speed',
      name: 'autoQualityAdjustDescription',
      desc: '',
      args: [],
    );
  }

  /// `Background Playback`
  String get backgroundPlayback {
    return Intl.message(
      'Background Playback',
      name: 'backgroundPlayback',
      desc: '',
      args: [],
    );
  }

  /// `Continue audio playback when app is in background`
  String get backgroundPlaybackDescription {
    return Intl.message(
      'Continue audio playback when app is in background',
      name: 'backgroundPlaybackDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notification Controls`
  String get notificationControls {
    return Intl.message(
      'Notification Controls',
      name: 'notificationControls',
      desc: '',
      args: [],
    );
  }

  /// `Show media playback controls in notification`
  String get notificationControlsDescription {
    return Intl.message(
      'Show media playback controls in notification',
      name: 'notificationControlsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Data Saver Mode`
  String get dataSaver {
    return Intl.message(
      'Data Saver Mode',
      name: 'dataSaver',
      desc: '',
      args: [],
    );
  }

  /// `Reduce data usage while streaming videos`
  String get dataSaverDescription {
    return Intl.message(
      'Reduce data usage while streaming videos',
      name: 'dataSaverDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hide Watched Videos`
  String get hideWatchedVideos {
    return Intl.message(
      'Hide Watched Videos',
      name: 'hideWatchedVideos',
      desc: '',
      args: [],
    );
  }

  /// `Don't show already watched videos in feeds`
  String get hideWatchedVideosDescription {
    return Intl.message(
      'Don\'t show already watched videos in feeds',
      name: 'hideWatchedVideosDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Data Quality`
  String get mobileDataQuality {
    return Intl.message(
      'Mobile Data Quality',
      name: 'mobileDataQuality',
      desc: '',
      args: [],
    );
  }

  /// `Video quality for mobile data connections`
  String get mobileDataQualityDescription {
    return Intl.message(
      'Video quality for mobile data connections',
      name: 'mobileDataQualityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Download Queue Items`
  String get downloadQueueItems {
    return Intl.message(
      'Download Queue Items',
      name: 'downloadQueueItems',
      desc: '',
      args: [],
    );
  }

  /// `Download videos that are added to the queue`
  String get downloadQueueItemsDescription {
    return Intl.message(
      'Download videos that are added to the queue',
      name: 'downloadQueueItemsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Rich Caption Rendering`
  String get richCaptionRendering {
    return Intl.message(
      'Rich Caption Rendering',
      name: 'richCaptionRendering',
      desc: '',
      args: [],
    );
  }

  /// `Render captions with styling and formatting`
  String get richCaptionRenderingDescription {
    return Intl.message(
      'Render captions with styling and formatting',
      name: 'richCaptionRenderingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bilibili`
  String get bilibiliEnabled {
    return Intl.message(
      'Bilibili',
      name: 'bilibiliEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Enable Bilibili video support and service`
  String get bilibiliEnabledDescription {
    return Intl.message(
      'Enable Bilibili video support and service',
      name: 'bilibiliEnabledDescription',
      desc: '',
      args: [],
    );
  }

  /// `Switch to Bilibili`
  String get switchToBilibili {
    return Intl.message(
      'Switch to Bilibili',
      name: 'switchToBilibili',
      desc: '',
      args: [],
    );
  }

  /// `Change service from YouTube to Bilibili`
  String get switchToBilibiliDescription {
    return Intl.message(
      'Change service from YouTube to Bilibili',
      name: 'switchToBilibiliDescription',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `Choose your video service provider`
  String get serviceDescription {
    return Intl.message(
      'Choose your video service provider',
      name: 'serviceDescription',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get youtube {
    return Intl.message('YouTube', name: 'youtube', desc: '', args: []);
  }

  /// `Swipe Direction`
  String get swipeDirection {
    return Intl.message(
      'Swipe Direction',
      name: 'swipeDirection',
      desc: '',
      args: [],
    );
  }

  /// `Content swipe direction (left-to-right or right-to-left)`
  String get swipeDirectionDescription {
    return Intl.message(
      'Content swipe direction (left-to-right or right-to-left)',
      name: 'swipeDirectionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Automatically add related videos to the playlist queue`
  String get showRelatedInQueueDescription {
    return Intl.message(
      'Automatically add related videos to the playlist queue',
      name: 'showRelatedInQueueDescription',
      desc: '',
      args: [],
    );
  }

  /// `Autoplay Next Video`
  String get autoplayNextVideo {
    return Intl.message(
      'Autoplay Next Video',
      name: 'autoplayNextVideo',
      desc: '',
      args: [],
    );
  }

  /// `Automatically play the next video when current video ends`
  String get autoplayNextVideoDescription {
    return Intl.message(
      'Automatically play the next video when current video ends',
      name: 'autoplayNextVideoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Repeat off`
  String get repeatOff {
    return Intl.message(
      'Repeat off',
      name: 'repeatOff',
      desc: 'Repeat mode is disabled',
      args: [],
    );
  }

  /// `Repeat all`
  String get repeatAll {
    return Intl.message(
      'Repeat all',
      name: 'repeatAll',
      desc: 'Repeat the whole queue',
      args: [],
    );
  }

  /// `Repeat one`
  String get repeatOne {
    return Intl.message(
      'Repeat one',
      name: 'repeatOne',
      desc: 'Repeat the current video',
      args: [],
    );
  }

  /// `Remove from queue`
  String get removeFromQueue {
    return Intl.message(
      'Remove from queue',
      name: 'removeFromQueue',
      desc: 'Removes one queue entry',
      args: [],
    );
  }

  /// `Play next`
  String get playNext {
    return Intl.message(
      'Play next',
      name: 'playNext',
      desc: 'Queues a video directly after the current one',
      args: [],
    );
  }

  /// `Add to queue`
  String get addToQueue {
    return Intl.message(
      'Add to queue',
      name: 'addToQueue',
      desc: 'Appends a video to the queue',
      args: [],
    );
  }

  /// `Added to queue`
  String get addedToQueue {
    return Intl.message(
      'Added to queue',
      name: 'addedToQueue',
      desc: 'Confirmation for queue append',
      args: [],
    );
  }

  /// `Added to play next`
  String get addedToPlayNext {
    return Intl.message(
      'Added to play next',
      name: 'addedToPlayNext',
      desc: 'Confirmation for play next',
      args: [],
    );
  }

  /// `Save to playlist`
  String get saveToPlaylist {
    return Intl.message(
      'Save to playlist',
      name: 'saveToPlaylist',
      desc: 'Playlist picker title',
      args: [],
    );
  }

  /// `Playlists`
  String get localPlaylists {
    return Intl.message(
      'Playlists',
      name: 'localPlaylists',
      desc: 'Local playlists screen title',
      args: [],
    );
  }

  /// `New Playlist`
  String get newPlaylist {
    return Intl.message(
      'New Playlist',
      name: 'newPlaylist',
      desc: 'New playlist dialog title',
      args: [],
    );
  }

  /// `+ New`
  String get newPlaylistShort {
    return Intl.message(
      '+ New',
      name: 'newPlaylistShort',
      desc: 'Compact create-playlist action',
      args: [],
    );
  }

  /// `Playlist name`
  String get playlistNameHint {
    return Intl.message(
      'Playlist name',
      name: 'playlistNameHint',
      desc: 'Playlist name field hint',
      args: [],
    );
  }

  /// `Create`
  String get createAction {
    return Intl.message(
      'Create',
      name: 'createAction',
      desc: 'Confirms creation',
      args: [],
    );
  }

  /// `Rename`
  String get renameAction {
    return Intl.message(
      'Rename',
      name: 'renameAction',
      desc: 'Renames an item',
      args: [],
    );
  }

  /// `Rename Playlist`
  String get renamePlaylistTitle {
    return Intl.message(
      'Rename Playlist',
      name: 'renamePlaylistTitle',
      desc: 'Rename playlist dialog title',
      args: [],
    );
  }

  /// `New name`
  String get newNameHint {
    return Intl.message(
      'New name',
      name: 'newNameHint',
      desc: 'New name field hint',
      args: [],
    );
  }

  /// `Delete Playlist`
  String get deletePlaylistTitle {
    return Intl.message(
      'Delete Playlist',
      name: 'deletePlaylistTitle',
      desc: 'Delete playlist dialog title',
      args: [],
    );
  }

  /// `Delete playlist`
  String get deletePlaylistAction {
    return Intl.message(
      'Delete playlist',
      name: 'deletePlaylistAction',
      desc: 'Deletes a playlist',
      args: [],
    );
  }

  /// `Delete {name}?`
  String deletePlaylistConfirm(String name) {
    return Intl.message(
      'Delete $name?',
      name: 'deletePlaylistConfirm',
      desc: 'Confirms deleting a named playlist',
      args: [name],
    );
  }

  /// `No playlists yet.\nTap + to create one.`
  String get noPlaylistsYet {
    return Intl.message(
      'No playlists yet.\nTap + to create one.',
      name: 'noPlaylistsYet',
      desc: 'Empty local playlists screen',
      args: [],
    );
  }

  /// `No playlists yet.\nTap + New to create one.`
  String get noPlaylistsYetPicker {
    return Intl.message(
      'No playlists yet.\nTap + New to create one.',
      name: 'noPlaylistsYetPicker',
      desc: 'Empty playlist picker',
      args: [],
    );
  }

  /// `Added to {name}`
  String addedToPlaylist(String name) {
    return Intl.message(
      'Added to $name',
      name: 'addedToPlaylist',
      desc: 'Confirms adding a video to a named playlist',
      args: [name],
    );
  }

  /// `Play all`
  String get playAll {
    return Intl.message(
      'Play all',
      name: 'playAll',
      desc: 'Plays every video in a playlist',
      args: [],
    );
  }

  /// `Playlist not found`
  String get playlistNotFound {
    return Intl.message(
      'Playlist not found',
      name: 'playlistNotFound',
      desc: 'Missing playlist',
      args: [],
    );
  }

  /// `No videos yet`
  String get noVideosInPlaylist {
    return Intl.message(
      'No videos yet',
      name: 'noVideosInPlaylist',
      desc: 'Empty playlist',
      args: [],
    );
  }

  /// `Long-press a video to save it to a playlist`
  String get addVideosHint {
    return Intl.message(
      'Long-press a video to save it to a playlist',
      name: 'addVideosHint',
      desc: 'Hint for filling an empty playlist',
      args: [],
    );
  }

  /// `{count} videos`
  String videoCountLabel(int count) {
    return Intl.message(
      '$count videos',
      name: 'videoCountLabel',
      desc: 'Number of videos',
      args: [count],
    );
  }

  /// `Debug Console`
  String get debugConsole {
    return Intl.message(
      'Debug Console',
      name: 'debugConsole',
      desc: 'Debug console screen title',
      args: [],
    );
  }

  /// `Share logs`
  String get shareLogs {
    return Intl.message(
      'Share logs',
      name: 'shareLogs',
      desc: 'Shares the collected log file',
      args: [],
    );
  }

  /// `Clear logs`
  String get clearLogs {
    return Intl.message(
      'Clear logs',
      name: 'clearLogs',
      desc: 'Clears collected logs',
      args: [],
    );
  }

  /// `Auto-scroll on`
  String get autoScrollOn {
    return Intl.message(
      'Auto-scroll on',
      name: 'autoScrollOn',
      desc: 'Log auto-scroll enabled',
      args: [],
    );
  }

  /// `Auto-scroll off`
  String get autoScrollOff {
    return Intl.message(
      'Auto-scroll off',
      name: 'autoScrollOff',
      desc: 'Log auto-scroll disabled',
      args: [],
    );
  }

  /// `No logs yet`
  String get noLogs {
    return Intl.message(
      'No logs yet',
      name: 'noLogs',
      desc: 'Empty log console',
      args: [],
    );
  }

  /// `Logs`
  String get logsLabel {
    return Intl.message(
      'Logs',
      name: 'logsLabel',
      desc: 'Log count label',
      args: [],
    );
  }

  /// `Image Cache`
  String get imageCacheLabel {
    return Intl.message(
      'Image Cache',
      name: 'imageCacheLabel',
      desc: 'Image cache size label',
      args: [],
    );
  }

  /// `Platform`
  String get platformLabel {
    return Intl.message(
      'Platform',
      name: 'platformLabel',
      desc: 'Operating system label',
      args: [],
    );
  }

  /// `Off`
  String get sleepTimerOff {
    return Intl.message(
      'Off',
      name: 'sleepTimerOff',
      desc: 'Sleep timer disabled',
      args: [],
    );
  }

  /// `End of video`
  String get sleepTimerEndOfVideo {
    return Intl.message(
      'End of video',
      name: 'sleepTimerEndOfVideo',
      desc: 'Sleep timer stops when the video ends',
      args: [],
    );
  }

  /// `{count} minutes`
  String sleepTimerMinutes(int count) {
    return Intl.message(
      '$count minutes',
      name: 'sleepTimerMinutes',
      desc: 'Sleep timer duration',
      args: [count],
    );
  }

  /// `{count} min`
  String sleepTimerMinutesShort(int count) {
    return Intl.message(
      '$count min',
      name: 'sleepTimerMinutesShort',
      desc: 'Compact sleep timer duration',
      args: [count],
    );
  }

  /// `Custom`
  String get sleepTimerCustom {
    return Intl.message(
      'Custom',
      name: 'sleepTimerCustom',
      desc: 'Custom sleep timer duration',
      args: [],
    );
  }

  /// `Custom timer`
  String get sleepTimerCustomTitle {
    return Intl.message(
      'Custom timer',
      name: 'sleepTimerCustomTitle',
      desc: 'Custom timer dialog title',
      args: [],
    );
  }

  /// `Enter minutes`
  String get sleepTimerEnterMinutes {
    return Intl.message(
      'Enter minutes',
      name: 'sleepTimerEnterMinutes',
      desc: 'Custom timer field hint',
      args: [],
    );
  }

  /// `Sleep timer ended`
  String get sleepTimerEnded {
    return Intl.message(
      'Sleep timer ended',
      name: 'sleepTimerEnded',
      desc: 'Sleep timer fired',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: 'Refresh button label',
      args: [],
    );
  }

  /// `Short videos will appear here`
  String get noShortsHint {
    return Intl.message(
      'Short videos will appear here',
      name: 'noShortsHint',
      desc: 'Empty state hint on the Shorts tab',
      args: [],
    );
  }

  /// `Playlist Bookmarks`
  String get bookmarks {
    return Intl.message(
      'Playlist Bookmarks',
      name: 'bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark your favorite playlists for quick access`
  String get bookmarksDescription {
    return Intl.message(
      'Bookmark your favorite playlists for quick access',
      name: 'bookmarksDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks Enabled`
  String get bookmarksEnabled {
    return Intl.message(
      'Bookmarks Enabled',
      name: 'bookmarksEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Bookmarks`
  String get toggleBookmarks {
    return Intl.message(
      'Toggle Bookmarks',
      name: 'toggleBookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Bookmark Playlist`
  String get toggleBookmarkPlaylist {
    return Intl.message(
      'Toggle Bookmark Playlist',
      name: 'toggleBookmarkPlaylist',
      desc: '',
      args: [],
    );
  }

  /// `Is Bookmarks Enabled`
  String get isBookmarksEnabled {
    return Intl.message(
      'Is Bookmarks Enabled',
      name: 'isBookmarksEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarked Playlists`
  String get bookmarkedPlaylists {
    return Intl.message(
      'Bookmarked Playlists',
      name: 'bookmarkedPlaylists',
      desc: '',
      args: [],
    );
  }

  /// `Restricted Mode Enabled`
  String get restrictedModeEnabled {
    return Intl.message(
      'Restricted Mode Enabled',
      name: 'restrictedModeEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Restricted Mode`
  String get toggleRestrictedMode {
    return Intl.message(
      'Toggle Restricted Mode',
      name: 'toggleRestrictedMode',
      desc: '',
      args: [],
    );
  }

  /// `Is Restricted Mode Enabled`
  String get isRestrictedModeEnabled {
    return Intl.message(
      'Is Restricted Mode Enabled',
      name: 'isRestrictedModeEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Mini Player Enabled`
  String get miniPlayerEnabled {
    return Intl.message(
      'Mini Player Enabled',
      name: 'miniPlayerEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Mini Player`
  String get toggleMiniPlayer {
    return Intl.message(
      'Toggle Mini Player',
      name: 'toggleMiniPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Is Mini Player Enabled`
  String get isMiniPlayerEnabled {
    return Intl.message(
      'Is Mini Player Enabled',
      name: 'isMiniPlayerEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Download Subtitles`
  String get downloadSubtitles {
    return Intl.message(
      'Download Subtitles',
      name: 'downloadSubtitles',
      desc: '',
      args: [],
    );
  }

  /// `Automatically download subtitles with videos`
  String get downloadSubtitlesDescription {
    return Intl.message(
      'Automatically download subtitles with videos',
      name: 'downloadSubtitlesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Auto Delete After Watch`
  String get downloadAutoDelete {
    return Intl.message(
      'Auto Delete After Watch',
      name: 'downloadAutoDelete',
      desc: '',
      args: [],
    );
  }

  /// `Automatically delete downloaded videos after watching`
  String get downloadAutoDeleteDescription {
    return Intl.message(
      'Automatically delete downloaded videos after watching',
      name: 'downloadAutoDeleteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Set Download Quality`
  String get setDownloadQuality {
    return Intl.message(
      'Set Download Quality',
      name: 'setDownloadQuality',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Download Subtitles`
  String get toggleDownloadSubtitles {
    return Intl.message(
      'Toggle Download Subtitles',
      name: 'toggleDownloadSubtitles',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Download Over Wi-Fi Only`
  String get toggleDownloadOverWifiOnly {
    return Intl.message(
      'Toggle Download Over Wi-Fi Only',
      name: 'toggleDownloadOverWifiOnly',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Download Auto Delete`
  String get toggleDownloadAutoDelete {
    return Intl.message(
      'Toggle Download Auto Delete',
      name: 'toggleDownloadAutoDelete',
      desc: '',
      args: [],
    );
  }

  /// `Is Download Subtitles Enabled`
  String get isDownloadSubtitlesEnabled {
    return Intl.message(
      'Is Download Subtitles Enabled',
      name: 'isDownloadSubtitlesEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Is Download Over Wi-Fi Only Enabled`
  String get isDownloadOverWifiOnlyEnabled {
    return Intl.message(
      'Is Download Over Wi-Fi Only Enabled',
      name: 'isDownloadOverWifiOnlyEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Is Download Auto Delete Enabled`
  String get isDownloadAutoDeleteEnabled {
    return Intl.message(
      'Is Download Auto Delete Enabled',
      name: 'isDownloadAutoDeleteEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Advanced content filter`
  String get contentFilterAdvanced {
    return Intl.message(
      'Advanced content filter',
      name: 'contentFilterAdvanced',
      desc: '',
      args: [],
    );
  }

  /// `Hide videos by keyword, channel or type. Keywords wrapped in slashes are treated as regular expressions.`
  String get contentFilterAdvancedDescription {
    return Intl.message(
      'Hide videos by keyword, channel or type. Keywords wrapped in slashes are treated as regular expressions.',
      name: 'contentFilterAdvancedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Blocked keywords`
  String get blockedKeywords {
    return Intl.message(
      'Blocked keywords',
      name: 'blockedKeywords',
      desc: '',
      args: [],
    );
  }

  /// `Add a keyword or /regex/`
  String get blockedKeywordsHint {
    return Intl.message(
      'Add a keyword or /regex/',
      name: 'blockedKeywordsHint',
      desc: '',
      args: [],
    );
  }

  /// `Blocked channel IDs`
  String get blockedChannels {
    return Intl.message(
      'Blocked channel IDs',
      name: 'blockedChannels',
      desc: '',
      args: [],
    );
  }

  /// `Add a channel ID`
  String get blockedChannelsHint {
    return Intl.message(
      'Add a channel ID',
      name: 'blockedChannelsHint',
      desc: '',
      args: [],
    );
  }

  /// `Hide Shorts`
  String get hideShorts {
    return Intl.message('Hide Shorts', name: 'hideShorts', desc: '', args: []);
  }

  /// `Hide YouTube Shorts entries from feeds.`
  String get hideShortsDescription {
    return Intl.message(
      'Hide YouTube Shorts entries from feeds.',
      name: 'hideShortsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hide paid promotions`
  String get hidePaidPromotions {
    return Intl.message(
      'Hide paid promotions',
      name: 'hidePaidPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Hide paid, membership-only and promoted videos.`
  String get hidePaidPromotionsDescription {
    return Intl.message(
      'Hide paid, membership-only and promoted videos.',
      name: 'hidePaidPromotionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ml'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
