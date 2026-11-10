import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/core/strings.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/core/settings.dart';
import 'package:vyplay/domain/settings/models/instance.dart';
import 'package:vyplay/domain/content_filter/content_filter_config.dart';
import 'package:vyplay/domain/settings/models/settings_configs.dart';
import 'package:vyplay/core/services/dearrow_service.dart';
import 'package:vyplay/domain/settings/settings_service.dart';
import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    SettingsService settingsService,
  ) : super(SettingsState.initialize()) {
    // INITIAIZE SETTINGS
    on<InitializeSettings>((event, emit) async {
      emit(state.copyWith(settingsStatus: ApiStatus.loading));
      final List<Map<String, String>> _result =
          await settingsService.initializeSettings();

      // Initialize an empty map to collect settings
      final Map<String, String> settingsMap = {};

      // Iterate through the list and collect settings
      for (var setting in _result) {
        settingsMap.addAll(setting);
      }

      // Extract individual settings
      final String? defaultLanguage = settingsMap[selectedDefaultLanguage];
      final String? defaultQuality = settingsMap[selectedDefaultQuality];
      final String? defaultRegion = settingsMap[selectedDefaultRegion];
      final String storedTheme = settingsMap[selectedTheme] ?? 'system';
      final String defaultThemeMode = (storedTheme == 'dark' ||
              storedTheme == 'light' ||
              storedTheme == 'oled' ||
              storedTheme == 'dynamic' ||
              storedTheme == 'system')
          ? storedTheme
          : 'system';
      final bool defaultHistoryVisibility =
          settingsMap[historyVisibility] == "true";
      final bool defaultDislikeVisibility =
          settingsMap[dislikeVisibility] == "true";
      final bool defaultHlsPlayer = settingsMap[hlsPlayer] == "true";
      final bool isPipDisabled = settingsMap[pipDisabled] == "true";

      final String ytService =
          settingsMap[youtubeService] ?? YouTubeServices.newpipe.name;

      final String instanceApi;
      log('YT Service: $ytService');
      if (ytService == YouTubeServices.bilibili.name) {
        // Bilibili: use same base URL for video extraction
        instanceApi = settingsMap[instanceApiUrl] ?? BaseUrl.kBaseUrl;
      } else if (ytService == YouTubeServices.invidious.name) {
        instanceApi = settingsMap[instanceApiUrl] ?? BaseUrl.kInvidiousBaseUrl;
      } else {
        instanceApi = settingsMap[instanceApiUrl] ?? BaseUrl.kBaseUrl;
      }

      //package info
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      // Update the state with the collected settings
      var newState = state;

      newState = newState.copyWith(instance: instanceApi);
      newState = newState.copyWith(ytService: ytService);

      if (defaultLanguage != null) {
        newState = newState.copyWith(defaultLanguage: defaultLanguage);
      }

      if (defaultQuality != null) {
        newState = newState.copyWith(defaultQuality: defaultQuality);
      }

      if (defaultRegion != null) {
        newState = newState.copyWith(defaultRegion: defaultRegion);
      }
      // Search history settings
      final bool searchHistoryEnabled =
          settingsMap[searchHistoryEnabledKey] != "false";
      final bool searchHistoryVisible =
          settingsMap[searchHistoryVisibilityKey] != "false";

      // Auto PiP setting (default true)
      final bool autoPipEnabled =
          settingsMap[autoPipEnabledKey] != "false";

      // SponsorBlock settings
      final bool sponsorBlockEnabled =
          settingsMap[sponsorBlockEnabledKey] == "true";
      final List<String> sponsorBlockCats = settingsMap[sponsorBlockCategoriesKey] != null
          ? settingsMap[sponsorBlockCategoriesKey]!.split(',')
          : ['sponsor', 'intro', 'outro', 'selfpromo'];

      // Subtitle size
      final double subtitleSizeValue = double.tryParse(
          settingsMap[subtitleSizeKey] ?? '32.0') ?? 32.0;

      // Comments and Related Videos visibility
      final bool hideComments = settingsMap[commentsVisibility] == "true";
      final bool hideRelated = settingsMap[relatedVideoVisibility] == "true";

      // Home feed mode
      final String homeFeed = settingsMap[homeFeedModeKey] ?? HomeFeedMode.feedOrTrending.name;

      // Video fit mode
      final String videoFit = settingsMap[videoFitModeKey] ?? 'contain';

      // Skip interval
      final int skipIntervalValue = int.tryParse(settingsMap[skipIntervalKey] ?? '10') ?? 10;

      // Open links in browser
      final bool openInBrowser = settingsMap[openLinksInBrowserKey] == "true";

      // Audio focus
      final bool audioFocusEnabled = settingsMap[audioFocusEnabledKey] != "false";
      final List<String> contentFilterKeywords =
          (settingsMap[contentFilterKeywordsKey] ?? '')
              .split('\n')
              .map((k) => k.trim())
              .where((k) => k.isNotEmpty)
              .toList();
      final List<String> contentFilterChannels =
          (settingsMap[contentFilterChannelsKey] ?? '')
              .split(',')
              .map((c) => c.trim())
              .where((c) => c.isNotEmpty)
              .toList();
      final bool contentFilterHideShorts =
          settingsMap[contentFilterHideShortsKey] == 'true';
      final bool contentFilterHidePaid =
          settingsMap[contentFilterHidePaidKey] == 'true';
      final String? downloadFolderPath =
          (settingsMap[downloadFolderPathKey] ?? '').trim().isEmpty
              ? null
              : settingsMap[downloadFolderPathKey];
      final bool rydEnabled = settingsMap[rydEnabledKey] != 'false';

      newState = newState.copyWith(
        version: packageInfo.version,
        themeMode: defaultThemeMode,
        isHistoryVisible: defaultHistoryVisibility,
        isDislikeVisible: defaultDislikeVisibility,
        isHlsPlayer: defaultHlsPlayer,
        initialized: true,
        isPipDisabled: isPipDisabled,
        isSearchHistoryEnabled: searchHistoryEnabled,
        isSearchHistoryVisible: searchHistoryVisible,
        isAutoPipEnabled: autoPipEnabled,
        isSponsorBlockEnabled: sponsorBlockEnabled,
        sponsorBlockCategories: sponsorBlockCats,
        subtitleSize: subtitleSizeValue,
        isHideComments: hideComments,
        isHideRelated: hideRelated,
        homeFeedMode: homeFeed,
        videoFitMode: videoFit,
        skipInterval: skipIntervalValue,
        openLinksInBrowser: openInBrowser,
        isAudioFocusEnabled: audioFocusEnabled,
        contentFilterKeywords: contentFilterKeywords,
        contentFilterBlockedChannels: contentFilterChannels,
        contentFilterHideShorts: contentFilterHideShorts,
        contentFilterHidePaid: contentFilterHidePaid,
        downloadFolderPath: downloadFolderPath,
        isRydEnabled: rydEnabled,
        isLongPressSpeedUpEnabled: (settingsMap[longPressSpeedUpKey] ?? 'false') != 'false',
        isOriginalTitlesEnabled: (settingsMap[originalTitlesKey] ?? 'false') != 'false',
        isCommentFilterEnabled: (settingsMap[commentFilterEnabledKey] ?? 'false') != 'false',
        commentFilterKeywords: (settingsMap[commentFilterKeywordsKey] ?? '').isEmpty ? <String>[] : (settingsMap[commentFilterKeywordsKey]!).split('\n'),
        preferredAudioQuality: settingsMap[preferredAudioQualityKey] ?? 'auto',
        isScreenLockEnabled: (settingsMap[screenLockEnabledKey] ?? 'false') != 'false',
        isPinchToZoomEnabled: (settingsMap[pinchToZoomEnabledKey] ?? 'false') != 'false',
        isSeekbarThumbnailsEnabled: (settingsMap[seekbarThumbnailsKey] ?? 'true') != 'false',
        isPopupPlayerEnabled: (settingsMap[popupPlayerEnabledKey] ?? 'false') != 'false',
        isLiveChatDanmakuEnabled: (settingsMap[liveChatDanmakuEnabledKey] ?? 'false') != 'false',
        isBluetoothSeekEnabled: (settingsMap[bluetoothSeekEnabledKey] ?? 'true') != 'false',
        isMultiSelectListsEnabled: (settingsMap[multiSelectListsEnabledKey] ?? 'false') != 'false',
        isSbExclusiveMarkerEnabled: (settingsMap[sbExclusiveMarkerKey] ?? 'false') != 'false',
        isSbForDownloadsEnabled: (settingsMap[sbForDownloadsKey] ?? 'false') != 'false',
      );

      if (ytService == YouTubeServices.invidious.name) {
        BaseUrl.updateInvidiousBaseUrl(instanceApi);
      } else {
        BaseUrl.updateBaseUrl(instanceApi);
      }

      // Emit the new state
      emit(newState.copyWith(settingsStatus: ApiStatus.loaded));
    });

    // UPDATE LANGUAGE
    on<GetDefaultLanguage>((event, emit) async {
      emit(state);
      final _result = await settingsService.selectDefaultLanguage(
          language: event.language);
      final _state = _result.fold(
          (MainFailure f) =>
              state.copyWith(defaultLanguage: state.defaultLanguage),
          (String language) => state.copyWith(defaultLanguage: language));
      emit(_state);
    });

    // UPDATE QUALITY
    on<GetDefaultQuality>((event, emit) async {
      emit(state);
      final _result = await settingsService.selectDefaultQuality(
          quality: event.quality);
      final _state = _result.fold(
          (MainFailure f) =>
              state.copyWith(defaultQuality: state.defaultQuality),
          (String quality) => state.copyWith(defaultQuality: quality));
      emit(_state);
    });

    // UPDATE REGION
    on<GetDefaultRegion>((event, emit) async {
      emit(state);
      log('Region: ${event.region}');
      final _result =
          await settingsService.selectRegion(region: event.region);
      final _state = _result.fold((MainFailure f) => state,
          (String region) => state.copyWith(defaultRegion: region));
      emit(_state);
    });

    // TOGGLE THE THEME
    on<ChangeTheme>((event, emit) async {
      emit(state);
      final _result =
          await settingsService.setTheme(themeMode: event.themeMode);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(themeMode: state.themeMode),
          (String themeMode) => state.copyWith(themeMode: themeMode));
      emit(_state);
    });

    // TOGGLE HISTORY VISIBILITY
    on<ToggleHistoryVisibility>((event, emit) async {
      emit(state);
      final _result = await settingsService.toggleHistoryVisibility(
          isHistoryVisible: !state.isHistoryVisible);
      final _state = _result.fold(
          (MainFailure f) =>
              state.copyWith(isHistoryVisible: state.isHistoryVisible),
          (bool isHistoryVisible) =>
              state.copyWith(isHistoryVisible: isHistoryVisible));
      emit(_state);
    });

    // TOGGLE DISLIKE VISIBILITY
    on<ToggleDislikeVisibility>((event, emit) async {
      emit(state);
      final _result = await settingsService.toggleDislikeVisibility(
          isDislikeVisible: !state.isDislikeVisible);
      final _state = _result.fold(
          (MainFailure f) =>
              state.copyWith(isDislikeVisible: state.isDislikeVisible),
          (bool isDislikeVisible) =>
              state.copyWith(isDislikeVisible: isDislikeVisible));
      emit(_state);
    });

    // TOGGLE HLS PLAYER VISIBILITY
    on<ToggleHlsPlayer>((event, emit) async {
      emit(state);
      final _result = await settingsService.toggleHlsPlayer(
          isHlsPlayer: !state.isHlsPlayer);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isHlsPlayer: state.isHlsPlayer),
          (bool isHlsPlayer) {
        return state.copyWith(isHlsPlayer: isHlsPlayer);
      });
      emit(_state);
    });

    // TOGGLE COMMENTS VISIBILITY
    on<ToggleCommentVisibility>((event, emit) async {
      emit(state);
      final _result = await settingsService.toggleHideComments(
          isHideComments: !state.isHideComments);
      final _state = _result.fold(
          (MainFailure f) =>
              state.copyWith(isHideComments: state.isHideComments),
          (bool isHideComments) =>
              state.copyWith(isHideComments: isHideComments));
      emit(_state);
    });

    // TOGGLE RELATED VIDEOS VISIBILITY
    on<ToggleRelatedVideoVisibility>((event, emit) async {
      emit(state);
      final _result = await settingsService.toggleHideRelatedVideos(
          isHideRelated: !state.isHideRelated);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isHideRelated: state.isHideRelated),
          (bool isHideRelated) => state.copyWith(isHideRelated: isHideRelated));
      emit(_state);
    });

    on<FetchPipedInstances>((event, emit) async {
      if (state.pipedInstances.isNotEmpty && !event.forceRefresh) {
        return emit(state);
      }

      // Store user's preferred instance to check if it fails
      final userPreferredInstance = state.instance;
      String? userPreferredInstanceName;

      emit(state.copyWith(
        pipedInstanceStatus: ApiStatus.loading,
        isTestingConnection: true,
        connectingToInstance: 'Fetching instances...',
        userInstanceFailed: false,
        failedInstanceName: null,
      ));

      final _result = await settingsService.fetchInstances();

      if (_result.isLeft()) {
        emit(state.copyWith(
          pipedInstanceStatus: ApiStatus.error,
          pipedInstances: state.pipedInstances,
          isTestingConnection: false,
          connectingToInstance: null,
        ));
        return;
      }

      final instances = _result.getOrElse(() => []);

      // Find the name of user's preferred instance
      final preferredInst = instances.where((i) => i.api == userPreferredInstance).firstOrNull;
      userPreferredInstanceName = preferredInst?.name;

      if (state.ytService != YouTubeServices.invidious.name) {
        // Try user's preferred instance first, then find other working instances
        final workingInstanceResult = await settingsService.findWorkingPipedInstance(
          instances: instances,
          preferredInstanceApi: userPreferredInstance,
          onTestingInstance: (instanceName) {
            emit(state.copyWith(
              pipedInstanceStatus: ApiStatus.loading,
              pipedInstances: instances,
              isTestingConnection: true,
              connectingToInstance: instanceName,
            ));
          },
        );

        final workingResult = workingInstanceResult.fold(
          (failure) {
            log('No working piped instance found, using first available');
            return (
              api: instances.isNotEmpty ? instances.first.api : state.instance,
              found: false,
              userFailed: true,
            );
          },
          (workingApi) {
            log('Found working piped instance: $workingApi');
            // Check if user's preferred instance failed (working instance is different)
            final userFailed = userPreferredInstance.isNotEmpty &&
                workingApi != userPreferredInstance;
            return (api: workingApi, found: true, userFailed: userFailed);
          },
        );

        BaseUrl.updateBaseUrl(workingResult.api);

        emit(state.copyWith(
          pipedInstanceStatus: workingResult.found ? ApiStatus.loaded : ApiStatus.error,
          pipedInstances: instances,
          instance: workingResult.api,
          isTestingConnection: false,
          connectingToInstance: null,
          userInstanceFailed: workingResult.userFailed,
          failedInstanceName: workingResult.userFailed ? userPreferredInstanceName : null,
        ));
      } else {
        emit(state.copyWith(
          pipedInstanceStatus: ApiStatus.loaded,
          pipedInstances: instances,
          isTestingConnection: false,
          connectingToInstance: null,
        ));
      }

      add(SetInstance(instanceApi: state.instance));
    });

    on<SetInstance>((event, emit) async {
      final _result =
          await settingsService.setInstance(instanceApi: event.instanceApi);
      final _state = _result
          .fold((MainFailure f) => state.copyWith(instance: state.instance),
              (String r) {
        if (state.ytService == YouTubeServices.invidious.name) {
          BaseUrl.updateInvidiousBaseUrl(r);
        } else {
          BaseUrl.updateBaseUrl(r);
        }
        return state.copyWith(instance: r);
      });
      emit(_state);
    });

    on<FetchInvidiousInstances>((event, emit) async {
      if (state.invidiousInstances.isNotEmpty && !event.forceRefresh) {
        return emit(state);
      }

      // Store user's preferred instance to check if it fails
      final userPreferredInstance = state.instance;
      String? userPreferredInstanceName;

      emit(state.copyWith(
        invidiousInstanceStatus: ApiStatus.loading,
        isTestingConnection: true,
        connectingToInstance: 'Fetching instances...',
        userInstanceFailed: false,
        failedInstanceName: null,
      ));

      final _result = await settingsService.fetchInvidiousInstances();

      if (_result.isLeft()) {
        emit(state.copyWith(
          invidiousInstanceStatus: ApiStatus.error,
          invidiousInstances: state.invidiousInstances,
          isTestingConnection: false,
          connectingToInstance: null,
        ));
        return;
      }

      final instances = _result.getOrElse(() => []);

      // Find the name of user's preferred instance
      final preferredInst = instances.where((i) => i.api == userPreferredInstance).firstOrNull;
      userPreferredInstanceName = preferredInst?.name;

      if (state.ytService == YouTubeServices.invidious.name) {
        // Try user's preferred instance first, then find other working instances
        final workingInstanceResult = await settingsService.findWorkingInvidiousInstance(
          instances: instances,
          preferredInstanceApi: userPreferredInstance,
          onTestingInstance: (instanceName) {
            emit(state.copyWith(
              invidiousInstanceStatus: ApiStatus.loading,
              invidiousInstances: instances,
              isTestingConnection: true,
              connectingToInstance: instanceName,
            ));
          },
        );

        final workingResult = workingInstanceResult.fold(
          (failure) {
            log('No working invidious instance found, using first available');
            return (
              api: instances.isNotEmpty ? instances.first.api : state.instance,
              found: false,
              userFailed: true,
            );
          },
          (workingApi) {
            log('Found working invidious instance: $workingApi');
            // Check if user's preferred instance failed (working instance is different)
            final userFailed = userPreferredInstance.isNotEmpty &&
                workingApi != userPreferredInstance;
            return (api: workingApi, found: true, userFailed: userFailed);
          },
        );

        BaseUrl.updateInvidiousBaseUrl(workingResult.api);

        emit(state.copyWith(
          invidiousInstanceStatus: workingResult.found ? ApiStatus.loaded : ApiStatus.error,
          invidiousInstances: instances,
          instance: workingResult.api,
          isTestingConnection: false,
          connectingToInstance: null,
          userInstanceFailed: workingResult.userFailed,
          failedInstanceName: workingResult.userFailed ? userPreferredInstanceName : null,
        ));
      } else {
        emit(state.copyWith(
          invidiousInstanceStatus: ApiStatus.loaded,
          invidiousInstances: instances,
          isTestingConnection: false,
          connectingToInstance: null,
        ));
      }

      add(SetInstance(instanceApi: state.instance));
    });

    on<SetYTService>((event, emit) async {
      final _result =
          await settingsService.setTYService(service: event.service);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(ytService: state.ytService),
          (YouTubeServices r) {
        if (r == YouTubeServices.invidious) {
          BaseUrl.updateInvidiousBaseUrl(state.instance);
        } else {
          BaseUrl.updateBaseUrl(state.instance);
        }
        return state.copyWith(ytService: r.name);
      });
      emit(_state);
    });

    on<TogglePipPlayer>((event, emit) async {
      final _result = await settingsService.togglePipPlayer(
          isPipDisabled: !state.isPipDisabled);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isPipDisabled: state.isPipDisabled),
          (bool r) => state.copyWith(isPipDisabled: r));
      emit(_state);
    });

    // New event handlers for additional features

    on<SetSearchFilter>((event, emit) async {
      final _result = await settingsService.setSearchFilter(filter: event.filter);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(searchFilter: state.searchFilter),
          (String filter) => state.copyWith(searchFilter: filter));
      emit(_state);
    });

    on<SetVideoFitMode>((event, emit) async {
      final _result = await settingsService.setVideoFitMode(fitMode: event.fitMode);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(videoFitMode: state.videoFitMode),
          (String fitMode) => state.copyWith(videoFitMode: fitMode));
      emit(_state);
    });

    on<SetSkipInterval>((event, emit) async {
      final _result = await settingsService.setSkipInterval(seconds: event.seconds);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(skipInterval: state.skipInterval),
          (int seconds) => state.copyWith(skipInterval: seconds));
      emit(_state);
    });

    on<ToggleSponsorBlock>((event, emit) async {
      final _result = await settingsService.toggleSponsorBlock(
          isEnabled: !state.isSponsorBlockEnabled);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isSponsorBlockEnabled: state.isSponsorBlockEnabled),
          (bool isEnabled) => state.copyWith(isSponsorBlockEnabled: isEnabled));
      emit(_state);
    });

    on<SetSponsorBlockCategories>((event, emit) async {
      final _result = await settingsService.setSponsorBlockCategories(
          categories: event.categories);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(sponsorBlockCategories: state.sponsorBlockCategories),
          (List<String> categories) => state.copyWith(sponsorBlockCategories: categories));
      emit(_state);
    });

    on<ToggleOpenLinksInBrowser>((event, emit) async {
      final _result = await settingsService.toggleOpenLinksInBrowser(
          openInBrowser: !state.openLinksInBrowser);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(openLinksInBrowser: state.openLinksInBrowser),
          (bool openInBrowser) => state.copyWith(openLinksInBrowser: openInBrowser));
      emit(_state);
    });

    on<SetHomeFeedMode>((event, emit) async {
      final _result = await settingsService.setHomeFeedMode(mode: event.mode);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(homeFeedMode: state.homeFeedMode),
          (String mode) => state.copyWith(homeFeedMode: mode));
      emit(_state);
    });

    on<ToggleAudioFocus>((event, emit) async {
      final _result = await settingsService.toggleAudioFocus(
          isEnabled: !state.isAudioFocusEnabled);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isAudioFocusEnabled: state.isAudioFocusEnabled),
          (bool isEnabled) => state.copyWith(isAudioFocusEnabled: isEnabled));
      emit(_state);
    });

    // Profile events
    on<AddProfile>((event, emit) async {
      final _result = await settingsService.addProfile(profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(profiles: state.profiles),
          (List<String> profiles) => state.copyWith(profiles: profiles));
      emit(_state);
    });

    on<DeleteProfile>((event, emit) async {
      final _result = await settingsService.deleteProfile(profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(profiles: state.profiles),
          (List<String> profiles) {
        // If the deleted profile was the current one, switch to default
        String currentProfile = state.currentProfile;
        if (!profiles.contains(currentProfile)) {
          currentProfile = 'default';
        }
        return state.copyWith(profiles: profiles, currentProfile: currentProfile);
      });
      emit(_state);
    });

    on<SwitchProfile>((event, emit) async {
      final _result = await settingsService.switchProfile(profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(currentProfile: state.currentProfile),
          (String profileName) => state.copyWith(currentProfile: profileName));
      emit(_state);
    });

    on<RenameProfile>((event, emit) async {
      final _result = await settingsService.renameProfile(
          oldName: event.oldName, newName: event.newName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(profiles: state.profiles),
          (List<String> profiles) {
        // If the renamed profile was the current one, update current profile name
        String currentProfile = state.currentProfile;
        if (currentProfile == event.oldName) {
          currentProfile = event.newName;
        }
        return state.copyWith(profiles: profiles, currentProfile: currentProfile);
      });
      emit(_state);
    });

    // Import/Export events
    on<ExportSubscriptions>((event, emit) async {
      final result = await settingsService.exportSubscriptions(profileName: event.profileName);
      result.fold(
        (failure) => emit(state.copyWith(lastExportedFilePath: null)),
        (filePath) => emit(state.copyWith(lastExportedFilePath: filePath)),
      );
    });

    on<ImportSubscriptions>((event, emit) async {
      // Import happens - handled in UI with file picker
      await settingsService.importSubscriptions(
        filePath: event.filePath,
        profileName: event.profileName,
      );
    });

    on<SetSubtitleSize>((event, emit) async {
      final _result = await settingsService.setSubtitleSize(size: event.size);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(subtitleSize: state.subtitleSize),
          (double size) => state.copyWith(subtitleSize: size));
      emit(_state);
    });

    // Search history privacy
    on<ToggleSearchHistoryEnabled>((event, emit) async {
      final _result = await settingsService.toggleSearchHistoryEnabled(
          isEnabled: !state.isSearchHistoryEnabled);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isSearchHistoryEnabled: state.isSearchHistoryEnabled),
          (bool isEnabled) => state.copyWith(isSearchHistoryEnabled: isEnabled));
      emit(_state);
    });

    on<ToggleSearchHistoryVisibility>((event, emit) async {
      final _result = await settingsService.toggleSearchHistoryVisibility(
          isVisible: !state.isSearchHistoryVisible);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isSearchHistoryVisible: state.isSearchHistoryVisible),
          (bool isVisible) => state.copyWith(isSearchHistoryVisible: isVisible));
      emit(_state);
    });

    // Set last exported file path (for ZIP exports from NewPipeDataService)
    on<SetLastExportedFilePath>((event, emit) {
      emit(state.copyWith(lastExportedFilePath: event.filePath));
    });

    // Toggle auto PiP (enter PiP when pressing home while video is playing)
    on<ToggleAutoPip>((event, emit) async {
      final newValue = !state.isAutoPipEnabled;
      final _result = await settingsService.toggleAutoPip(isEnabled: newValue);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(isAutoPipEnabled: state.isAutoPipEnabled),
          (bool isEnabled) => state.copyWith(isAutoPipEnabled: isEnabled));
      emit(_state);
    });

    on<SetSleepTimer>((event, emit) async {
      final _result = await settingsService.setSleepTimerConfig(
          config: SleepTimerConfig(duration: Duration(seconds: event.seconds)));
      emit(_result.fold(
          (MainFailure f) => state,
          (config) => state.copyWith(sleepTimerConfig: config)));
    });

    on<ClearSleepTimer>((event, emit) async {
      final _result = await settingsService.clearSleepTimer();
      emit(_result.fold(
          (MainFailure f) => state,
          (_) => state.copyWith(sleepTimerConfig: null)));
    });

    on<ToggleSwipeGestures>((event, emit) async {
      final _result = await settingsService.toggleSwipeGestures(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isSwipeGesturesEnabled: enabled)));
    });

    on<ToggleDeArrow>((event, emit) async {
      final _result = await settingsService.toggleDeArrow(enabled: event.enabled);
      // Keep the service flag in sync so cards stop or start using DeArrow
      // immediately after the switch is flipped.
      _result.fold((_) {}, (enabled) => DeArrowService().enabled = enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDeArrowEnabled: enabled)));
    });

    // Playlist Bookmarks
    on<ToggleBookmarks>((event, emit) async {
      final _result = await settingsService.toggleBookmarks(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isBookmarksEnabled: enabled)));
    });

    on<ToggleBookmarkPlaylist>((event, emit) async {
      final _result = await settingsService.toggleBookmarkPlaylist(
        playlistId: event.playlistId,
        bookmarked: event.bookmarked,
      );
      _result.fold(
        (MainFailure f) => emit(state),
        (bookmarked) {
          final current = state.bookmarkedPlaylists ?? [];
          final updated = bookmarked
              ? [...current, event.playlistId]
              : current.where((id) => id != event.playlistId).toList();
          emit(state.copyWith(bookmarkedPlaylists: updated));
        },
      );
    });

    // Content Filtering
    on<ToggleRestrictedMode>((event, emit) async {
      final _result = await settingsService.toggleRestrictedMode(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isRestrictedModeEnabled: enabled)));
    });

    // Mini Player
    on<ToggleMiniPlayer>((event, emit) async {
      final _result = await settingsService.toggleMiniPlayer(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isMiniPlayerEnabled: enabled)));
    });

    // Download Preferences
    on<SetDownloadQuality>((event, emit) async {
      final _result = await settingsService.setDownloadQuality(quality: event.quality);
      emit(_result.fold(
          (MainFailure f) => state,
          (quality) => state.copyWith(downloadQuality: quality)));
    });

    on<ToggleDownloadSubtitles>((event, emit) async {
      final _result = await settingsService.toggleDownloadSubtitles(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDownloadSubtitlesEnabled: enabled)));
    });

    on<ToggleDownloadOverWifiOnly>((event, emit) async {
      final _result = await settingsService.toggleDownloadOverWifiOnly(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDownloadOverWifiOnlyEnabled: enabled)));
    });

    on<ToggleDownloadAutoDelete>((event, emit) async {
      final _result = await settingsService.toggleDownloadAutoDelete(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDownloadAutoDeleteEnabled: enabled)));
    });

    on<SetPlaybackSpeed>((event, emit) async {
      final _result = await settingsService.setPlaybackSpeed(speed: event.speed);
      emit(_result.fold(
          (MainFailure f) => state,
          (speed) => state.copyWith(playbackSpeed: speed)));
    });

    on<ToggleAutoplayNextVideo>((event, emit) async {
      final _result = await settingsService.setAutoplayNextVideo(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isAutoplayNextVideoEnabled: enabled)));
    });

    on<ToggleShowRelatedInQueue>((event, emit) async {
      final _result = await settingsService.setShowRelatedInQueue(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isShowRelatedInQueueEnabled: enabled)));
    });

    on<SetQueueDismissTime>((event, emit) async {
      final _result = await settingsService.setQueueDismissTime(seconds: event.seconds);
      emit(_result.fold(
          (MainFailure f) => state,
          (seconds) => state.copyWith(queueDismissTime: seconds)));
    });

    on<SetAutoplayCountdown>((event, emit) async {
      final _result = await settingsService.setAutoplayCountdown(seconds: event.seconds);
      emit(_result.fold(
          (MainFailure f) => state,
          (seconds) => state.copyWith(autoplayCountdown: seconds)));
    });

    on<ToggleDisableAutoplayOnCellular>((event, emit) async {
      final _result = await settingsService.setDisableAutoplayOnCellular(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDisableAutoplayOnCellularEnabled: enabled)));
    });

    on<ToggleAutoQueue>((event, emit) async {
      final _result = await settingsService.setAutoQueue(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isAutoQueueEnabled: enabled)));
    });

    on<ToggleBufferPreload>((event, emit) async {
      final _result = await settingsService.setBufferPreload(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isBufferPreloadEnabled: enabled)));
    });

    on<ToggleAutoQualityAdjust>((event, emit) async {
      final _result = await settingsService.setAutoQualityAdjust(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isAutoQualityAdjustEnabled: enabled)));
    });

    on<ToggleBackgroundPlayback>((event, emit) async {
      final _result = await settingsService.setBackgroundPlayback(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isBackgroundPlaybackEnabled: enabled)));
    });

    on<ToggleNotificationControls>((event, emit) async {
      final _result = await settingsService.setNotificationControls(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isNotificationControlsEnabled: enabled)));
    });

    on<ToggleDataSaver>((event, emit) async {
      final _result = await settingsService.setDataSaver(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDataSaverEnabled: enabled)));
    });

    on<ToggleHideWatchedVideos>((event, emit) async {
      final _result = await settingsService.setHideWatchedVideos(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isHideWatchedVideosEnabled: enabled)));
    });

    on<SetMobileDataQuality>((event, emit) async {
      final _result = await settingsService.setMobileDataQuality(quality: event.quality);
      emit(_result.fold(
          (MainFailure f) => state,
          (quality) => state.copyWith(mobileDataQuality: quality)));
    });

    on<ToggleDownloadQueueItems>((event, emit) async {
      final _result = await settingsService.setDownloadQueueItems(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isDownloadQueueItemsEnabled: enabled)));
    });

    on<ToggleRichCaptionRendering>((event, emit) async {
      final _result = await settingsService.setRichCaptionRendering(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isRichCaptionRenderingEnabled: enabled)));
    });

    on<ToggleBilibiliEnabled>((event, emit) async {
      final _result = await settingsService.setBilibiliEnabled(enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) => state.copyWith(isBilibiliEnabled: enabled)));
    });

    on<SetSwipeDirection>((event, emit) async {
      final _result = await settingsService.setSwipeDirection(leftToRight: event.leftToRight);
      emit(_result.fold(
          (MainFailure f) => state,
          (leftToRight) => state.copyWith(isSwipeLeftToRight: leftToRight)));
    });

    on<SetYoutubeService>((event, emit) async {
      final _result = await settingsService.setYoutubeService(service: event.service);
      emit(_result.fold(
          (MainFailure f) => state,
          (service) => state.copyWith(ytService: service)));
    });

    on<BookmarksApplied>((event, emit) async {
      final _result = await settingsService.setBookmarkedPlaylists(
          playlists: event.selectedPlaylists);
      emit(_result.fold((MainFailure f) => state,
          (playlists) => state.copyWith(bookmarkedPlaylists: playlists)));
    });

    on<RestrictedModeFilterChanged>((event, emit) async {
      final _result = await settingsService.setRestrictedModeFilterLevel(
          level: event.level);
      emit(_result.fold((MainFailure f) => state,
          (level) => state.copyWith(restrictedModeFilterLevel: level)));
    });

    on<MiniPlayerAutoExpandChanged>((event, emit) async {
      final _result = await settingsService.setMiniPlayerAutoExpand(
          enabled: event.enabled);
      emit(_result.fold((MainFailure f) => state,
          (enabled) => state.copyWith(isMiniPlayerAutoExpandEnabled: enabled)));
    });

    on<MiniPlayerTapToExpandChanged>((event, emit) async {
      final _result =
          await settingsService.setMiniPlayerTapToExpand(enabled: event.enabled);
      emit(_result.fold((MainFailure f) => state,
          (enabled) => state.copyWith(isMiniPlayerTapToExpandEnabled: enabled)));
    });

    on<MiniPlayerDoubleTapToExpandChanged>((event, emit) async {
      final _result = await settingsService.setMiniPlayerDoubleTapToExpand(
          enabled: event.enabled);
      emit(_result.fold(
          (MainFailure f) => state,
          (enabled) =>
              state.copyWith(isMiniPlayerDoubleTapToExpandEnabled: enabled)));
    });

    on<DownloadAutoDeleteDaysChanged>((event, emit) async {
      final _result =
          await settingsService.setDownloadAutoDeleteDays(days: event.days);
      emit(_result.fold((MainFailure f) => state,
          (days) => state.copyWith(downloadAutoDeleteDays: days)));
    });


    // Advanced content filter
    on<ContentFilterKeywordsChanged>((event, emit) async {
      final _result = await settingsService.setContentFilterKeywords(
          keywords: event.keywords);
      emit(_result.fold(
          (MainFailure f) => state,
          (keywords) => state.copyWith(contentFilterKeywords: keywords)));
    });

    on<ContentFilterChannelsChanged>((event, emit) async {
      final _result = await settingsService.setContentFilterBlockedChannels(
          channelIds: event.channelIds);
      emit(_result.fold(
          (MainFailure f) => state,
          (channels) =>
              state.copyWith(contentFilterBlockedChannels: channels)));
    });

    on<ContentFilterHideShortsChanged>((event, emit) async {
      final _result = await settingsService.setContentFilterHideShorts(
          enabled: event.enabled);
      emit(_result.fold((MainFailure f) => state,
          (enabled) => state.copyWith(contentFilterHideShorts: enabled)));
    });

    on<ContentFilterHidePaidChanged>((event, emit) async {
      final _result = await settingsService.setContentFilterHidePaid(
          enabled: event.enabled);
      emit(_result.fold((MainFailure f) => state,
          (enabled) => state.copyWith(contentFilterHidePaid: enabled)));
    });


    // Download folder
    on<DownloadFolderChanged>((event, emit) async {
      final _result =
          await settingsService.setDownloadFolderPath(path: event.path);
      emit(_result.fold((MainFailure f) => state,
          (path) => state.copyWith(downloadFolderPath: path)));
    });

    // Return YouTube Dislike
    on<ToggleRyd>((event, emit) async {
      final _result = await settingsService.toggleRyd(enabled: event.enabled);
      emit(_result.fold((MainFailure f) => state,
          (enabled) => state.copyWith(isRydEnabled: enabled)));
    });

    // Phase 18
    on<ToggleLongPressSpeedUp>((e, emit) async {
      final r = await settingsService.toggleLongPressSpeedUp(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isLongPressSpeedUpEnabled: v)));
    });
    on<ToggleOriginalTitles>((e, emit) async {
      final r = await settingsService.toggleOriginalTitles(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isOriginalTitlesEnabled: v)));
    });
    on<ToggleCommentFilter>((e, emit) async {
      final r = await settingsService.toggleCommentFilter(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isCommentFilterEnabled: v)));
    });
    on<SetCommentFilterKeywords>((e, emit) async {
      final r = await settingsService.setCommentFilterKeywords(keywords: e.keywords);
      emit(r.fold((_) => state, (v) => state.copyWith(commentFilterKeywords: v)));
    });
    on<SetPreferredAudioQuality>((e, emit) async {
      final r = await settingsService.setPreferredAudioQuality(quality: e.quality);
      emit(r.fold((_) => state, (v) => state.copyWith(preferredAudioQuality: v)));
    });
    on<ToggleScreenLock>((e, emit) async {
      final r = await settingsService.toggleScreenLock(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isScreenLockEnabled: v)));
    });
    on<TogglePinchToZoom>((e, emit) async {
      final r = await settingsService.togglePinchToZoom(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isPinchToZoomEnabled: v)));
    });
    on<ToggleSeekbarThumbnails>((e, emit) async {
      final r = await settingsService.toggleSeekbarThumbnails(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isSeekbarThumbnailsEnabled: v)));
    });
    on<TogglePopupPlayer>((e, emit) async {
      final r = await settingsService.togglePopupPlayer(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isPopupPlayerEnabled: v)));
    });
    on<ToggleLiveChatDanmaku>((e, emit) async {
      final r = await settingsService.toggleLiveChatDanmaku(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isLiveChatDanmakuEnabled: v)));
    });
    on<ToggleBluetoothSeek>((e, emit) async {
      final r = await settingsService.toggleBluetoothSeek(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isBluetoothSeekEnabled: v)));
    });
    on<ToggleMultiSelectLists>((e, emit) async {
      final r = await settingsService.toggleMultiSelectLists(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isMultiSelectListsEnabled: v)));
    });
    on<ToggleSbExclusiveMarker>((e, emit) async {
      final r = await settingsService.toggleSbExclusiveMarker(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isSbExclusiveMarkerEnabled: v)));
    });
    on<ToggleSbForDownloads>((e, emit) async {
      final r = await settingsService.toggleSbForDownloads(enabled: e.enabled);
      emit(r.fold((_) => state, (v) => state.copyWith(isSbForDownloadsEnabled: v)));
    });

  }
}
