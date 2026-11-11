import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vyplay/core/api_client.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/core/strings.dart';
import 'package:vyplay/domain/content_filter/content_filter_config.dart';
import 'package:vyplay/domain/core/failure/main_failure.dart';
import 'package:vyplay/domain/settings/models/instance.dart';
import 'package:vyplay/domain/settings/settings_service.dart';
import 'package:vyplay/infrastructure/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart' show Value;
import 'package:path_provider/path_provider.dart';
import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';

import '../../core/settings.dart';

@LazySingleton(as: SettingsService)
class SettingImpl implements SettingsService {
  final AppDatabase? _db;
  
  SettingImpl({AppDatabase? db}) : _db = db;
  
  AppDatabase get db => _db ?? AppDatabase.instance;

  // Initialize the database
  static Future<void> initializeDB() async {
    // Drift database is automatically initialized via the singleton
    // Just ensure it's accessed to trigger initialization
    final _ = AppDatabase.instance;
  }

  // Common setting fetch code
  Future<Map<String, String>> _getOrDefault(
      String settingName, String defaultValue) async {
    final setting = await db.getSetting(settingName);

    if (setting == null) {
      await db.setSetting(settingName, defaultValue);
      return {settingName: defaultValue};
    } else {
      return {settingName: setting};
    }
  }

  /// Generic method to set any setting value
  /// Eliminates duplicate code across all setting methods
  Future<Either<MainFailure, T>> _setSetting<T>({
    required String settingName,
    required T value,
    required String Function(T) toStringValue,
  }) async {
    try {
      final stringValue = toStringValue(value);
      await db.setSetting(settingName, stringValue);
      return Right(value);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Initialize settings state during app startup
  @override
  Future<List<Map<String, String>>> initializeSettings() async {
    // Define your settings and their default values
    final settingsDefaults = [
      {"name": selectedDefaultLanguage, "default": "en"},
      {"name": selectedDefaultQuality, "default": "720p"},
      {"name": selectedDefaultRegion, "default": "IN"},
      {"name": selectedTheme, "default": "system"},
      {"name": historyVisibility, "default": "true"},
      {"name": dislikeVisibility, "default": "false"},
      {"name": hlsPlayer, "default": "false"},
      {"name": commentsVisibility, "default": "false"},
      {"name": relatedVideoVisibility, "default": "false"},
      {"name": instanceApiUrl, "default": BaseUrl.kBaseUrl},
      {
        "name": youtubeService,
        "default": Platform.isAndroid
            ? YouTubeServices.newpipe.name
            : YouTubeServices.piped.name
      },
      {"name": pipDisabled, "default": "false"},
      {"name": homeFeedModeKey, "default": HomeFeedMode.feedOrTrending.name},
      {"name": videoFitModeKey, "default": "contain"},
      {"name": skipIntervalKey, "default": "10"},
      {"name": openLinksInBrowserKey, "default": "false"},
      {"name": audioFocusEnabledKey, "default": "true"},
      {"name": sponsorBlockEnabledKey, "default": "false"},
      {"name": subtitleSizeKey, "default": "32.0"},
      {"name": autoPipEnabledKey, "default": "true"},
    ];

    // Initialize settings list
    List<Map<String, String>> settingsList = [];

    // Iterate over settingsDefaults and initialize each setting
    for (var setting in settingsDefaults) {
      settingsList
          .add(await _getOrDefault(setting["name"]!, setting["default"]!));
    }

    return settingsList;
  }

// DEFAULT LANGUAGE SET
  @override
  Future<Either<MainFailure, String>> selectDefaultLanguage(
      {required String language}) async {
    return _setSetting(
      settingName: selectedDefaultLanguage,
      value: language,
      toStringValue: (v) => v,
    );
  }

  // DEFAULT QUALITY SET
  @override
  Future<Either<MainFailure, String>> selectDefaultQuality(
      {required String quality}) async {
    return _setSetting(
      settingName: selectedDefaultQuality,
      value: quality,
      toStringValue: (v) => v,
    );
  }

  // CONTENT REGION SET
  @override
  Future<Either<MainFailure, String>> selectRegion(
      {required String region}) async {
    return _setSetting(
      settingName: selectedDefaultRegion,
      value: region,
      toStringValue: (v) => v,
    );
  }

  // THEME TOGGLE
  @override
  Future<Either<MainFailure, String>> setTheme(
      {required String themeMode}) async {
    return _setSetting(
      settingName: selectedTheme,
      value: themeMode,
      toStringValue: (v) => v,
    );
  }

  // HISTORY VISIBILITY TOGGLE SETTING
  @override
  Future<Either<MainFailure, bool>> toggleHistoryVisibility(
      {required bool isHistoryVisible}) async {
    return _setSetting(
      settingName: historyVisibility,
      value: isHistoryVisible,
      toStringValue: (v) => v.toString(),
    );
  }

  // DISLIKE VISIBILITY TOGGLE SETTING
  @override
  Future<Either<MainFailure, bool>> toggleDislikeVisibility(
      {required bool isDislikeVisible}) async {
    return _setSetting(
      settingName: dislikeVisibility,
      value: isDislikeVisible,
      toStringValue: (v) => v.toString(),
    );
  }

  // HLS PLAYER TOGGLE SETTING
  @override
  Future<Either<MainFailure, bool>> toggleHlsPlayer(
      {required bool isHlsPlayer}) async {
    return _setSetting(
      settingName: hlsPlayer,
      value: isHlsPlayer,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleHideComments(
      {required bool isHideComments}) async {
    return _setSetting(
      settingName: commentsVisibility,
      value: isHideComments,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleHideRelatedVideos(
      {required bool isHideRelated}) async {
    return _setSetting(
      settingName: relatedVideoVisibility,
      value: isHideRelated,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, List<Instance>>> fetchInstances() async {
    final List<Instance> instances = [];
    try {
      final response = await ApiClient.dio.get(kInstanceUrl);
      int skipped = 0;
      final lines = response.data.toString().split('\n');
      for (final line in lines) {
        final split = line.split('|');
        if (split.length == 5) {
          if (skipped < 2) {
            skipped++;
            continue;
          }
          instances.add(Instance(
            name: split[0].trim(),
            api: '${split[1].trim()}/',
            locations: split[2].trim(),
          ));
        }
      }
      return Right(instances);
    } catch (_) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> setInstance(
      {required String instanceApi}) async {
    return _setSetting(
      settingName: instanceApiUrl,
      value: instanceApi,
      toStringValue: (v) => v,
    );
  }

  @override
  Future<Either<MainFailure, YouTubeServices>> setTYService(
      {required YouTubeServices service}) async {
    return _setSetting(
      settingName: youtubeService,
      value: service,
      toStringValue: (v) => v.name,
    );
  }

  @override
  Future<Either<MainFailure, List<Instance>>> fetchInvidiousInstances() async {
    try {
      final List<Instance> instances = [];
      final response = await ApiClient.dio.get(kInvidiousInstanceUrl);
      final data = response.data as List<dynamic>;

      for (final instanceData in data) {
        final instanceInfo = instanceData[1] as Map<String, dynamic>;

        // Only include instances with API enabled and HTTPS type
        final apiEnabled = instanceInfo['api'] == true;
        final isHttps = instanceInfo['type'] == 'https';

        if (isHttps) {
          instances.add(Instance(
            name:
                '${instanceData[0] as String}${apiEnabled ? '' : ' (API disabled)'}',
            api: instanceInfo['uri'] as String,
            locations: instanceInfo['region'] as String? ?? 'Unknown',
          ));
        }
      }

      return Right(instances);
    } catch (_) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> togglePipPlayer(
      {required bool isPipDisabled}) async {
    return _setSetting(
      settingName: pipDisabled,
      value: isPipDisabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, String>> findWorkingPipedInstance({
    required List<Instance> instances,
    String? preferredInstanceApi,
    void Function(String instanceName)? onTestingInstance,
  }) async {
    // If user has a preferred instance, test it first
    if (preferredInstanceApi != null && preferredInstanceApi.isNotEmpty) {
      final preferredInstance = instances.firstWhere(
        (i) => i.api == preferredInstanceApi,
        orElse: () => Instance(
            name: 'Preferred', api: preferredInstanceApi, locations: ''),
      );

      onTestingInstance?.call(preferredInstance.name);
      final isWorking = await testInstanceConnection(preferredInstanceApi);
      if (isWorking) {
        return Right(preferredInstanceApi);
      }
    }

    // Test other instances
    for (final instance in instances) {
      // Skip the preferred instance since we already tested it
      if (instance.api == preferredInstanceApi) continue;

      try {
        onTestingInstance?.call(instance.name);
        final isWorking = await testInstanceConnection(instance.api);
        if (isWorking) {
          return Right(instance.api);
        }
      } catch (_) {
        continue;
      }
    }

    return const Left(MainFailure.serverFailure());
  }

  @override
  Future<bool> testInstanceConnection(String apiUrl) async {
    try {
      final testUrl = '${apiUrl}trending?region=US';
      final response = await ApiClient.dio.get(
        testUrl,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        if (response.data is List && (response.data as List).isNotEmpty) {
          return true;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<Either<MainFailure, String>> findWorkingInvidiousInstance({
    required List<Instance> instances,
    String? preferredInstanceApi,
    void Function(String instanceName)? onTestingInstance,
  }) async {
    // If user has a preferred instance, test it first
    if (preferredInstanceApi != null && preferredInstanceApi.isNotEmpty) {
      final preferredInstance = instances.firstWhere(
        (i) => i.api == preferredInstanceApi,
        orElse: () => Instance(
            name: 'Preferred', api: preferredInstanceApi, locations: ''),
      );

      onTestingInstance?.call(preferredInstance.name);
      final isWorking =
          await testInvidiousInstanceConnection(preferredInstanceApi);
      if (isWorking) {
        return Right(preferredInstanceApi);
      }
    }

    // Filter to only test instances without "(API disabled)" in name
    final apiEnabledInstances = instances
        .where(
          (i) =>
              !i.name.contains('(API disabled)') &&
              i.api != preferredInstanceApi,
        )
        .toList();

    // Test API-enabled instances first
    for (final instance in apiEnabledInstances) {
      try {
        onTestingInstance?.call(instance.name);
        final isWorking = await testInvidiousInstanceConnection(instance.api);
        if (isWorking) {
          return Right(instance.api);
        }
      } catch (_) {
        continue;
      }
    }

    return const Left(MainFailure.serverFailure());
  }

  @override
  Future<bool> testInvidiousInstanceConnection(String apiUrl) async {
    try {
      final testUrl = '$apiUrl/api/v1/trending?region=US';
      final response = await ApiClient.dio.get(
        testUrl,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        if (response.data is List && (response.data as List).isNotEmpty) {
          return true;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  // New methods for additional features

  @override
  Future<Either<MainFailure, String>> setSearchFilter(
      {required String filter}) async {
    return _setSetting(
      settingName: searchFilterKey,
      value: filter,
      toStringValue: (v) => v,
    );
  }

  @override
  Future<Either<MainFailure, String>> setVideoFitMode(
      {required String fitMode}) async {
    return _setSetting(
      settingName: videoFitModeKey,
      value: fitMode,
      toStringValue: (v) => v,
    );
  }

  @override
  Future<Either<MainFailure, int>> setSkipInterval(
      {required int seconds}) async {
    return _setSetting(
      settingName: skipIntervalKey,
      value: seconds,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleSponsorBlock(
      {required bool isEnabled}) async {
    return _setSetting(
      settingName: sponsorBlockEnabledKey,
      value: isEnabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, List<String>>> setSponsorBlockCategories(
      {required List<String> categories}) async {
    return _setSetting(
      settingName: sponsorBlockCategoriesKey,
      value: categories,
      toStringValue: (v) => v.join(','),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleOpenLinksInBrowser(
      {required bool openInBrowser}) async {
    return _setSetting(
      settingName: openLinksInBrowserKey,
      value: openInBrowser,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, String>> setHomeFeedMode(
      {required String mode}) async {
    return _setSetting(
      settingName: homeFeedModeKey,
      value: mode,
      toStringValue: (v) => v,
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleAudioFocus(
      {required bool isEnabled}) async {
    return _setSetting(
      settingName: audioFocusEnabledKey,
      value: isEnabled,
      toStringValue: (v) => v.toString(),
    );
  }

  // Profile methods
  @override
  Future<Either<MainFailure, List<String>>> getProfiles() async {
    try {
      final setting = await db.getSetting(profilesListKey);

      if (setting == null || setting.isEmpty) {
        return const Right(['default']);
      }
      return Right(setting.split(','));
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> addProfile(
      {required String profileName}) async {
    try {
      final currentProfiles = await getProfiles();
      return await currentProfiles.fold(
        (failure) => Left(failure),
        (profiles) async {
          if (profiles.contains(profileName)) {
            return Right(profiles); // Profile already exists
          }
          final newProfiles = [...profiles, profileName];
          await _setSetting(
            settingName: profilesListKey,
            value: newProfiles,
            toStringValue: (v) => v.join(','),
          );
          return Right(newProfiles);
        },
      );
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> deleteProfile(
      {required String profileName}) async {
    try {
      if (profileName == 'default') {
        return const Left(
            MainFailure.serverFailure()); // Cannot delete default profile
      }
      final currentProfiles = await getProfiles();
      return await currentProfiles.fold(
        (failure) => Left(failure),
        (profiles) async {
          final newProfiles = profiles.where((p) => p != profileName).toList();
          if (newProfiles.isEmpty) {
            newProfiles.add('default');
          }
          await _setSetting(
            settingName: profilesListKey,
            value: newProfiles,
            toStringValue: (v) => v.join(','),
          );
          return Right(newProfiles);
        },
      );
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> switchProfile(
      {required String profileName}) async {
    return _setSetting(
      settingName: currentProfileKey,
      value: profileName,
      toStringValue: (v) => v,
    );
  }

  @override
  Future<Either<MainFailure, List<String>>> renameProfile(
      {required String oldName, required String newName}) async {
    try {
      if (oldName == 'default') {
        return const Left(
            MainFailure.serverFailure()); // Cannot rename default profile
      }
      if (oldName == newName) {
        final profiles = await getProfiles();
        return profiles;
      }
      final currentProfiles = await getProfiles();
      return await currentProfiles.fold(
        (failure) => Left(failure),
        (profiles) async {
          if (!profiles.contains(oldName)) {
            return Right(profiles); // Profile doesn't exist
          }
          if (profiles.contains(newName)) {
            return Right(profiles); // New name already exists
          }
          final newProfiles =
              profiles.map((p) => p == oldName ? newName : p).toList();
          await _setSetting(
            settingName: profilesListKey,
            value: newProfiles,
            toStringValue: (v) => v.join(','),
          );
          return Right(newProfiles);
        },
      );
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Import/Export methods
  @override
  Future<Either<MainFailure, String>> exportSubscriptions(
      {String profileName = 'default'}) async {
    try {
      // Get subscriptions only for the specified profile
      final subscriptions = await db.getAllSubscriptions(profileName);

      // Create NewPipe compatible format
      final subscriptionsList = subscriptions.map((sub) {
        return {
          'service_id': 0, // YouTube
          'url': 'https://www.youtube.com/channel/${sub.channelId}',
          'name': sub.channelName,
        };
      }).toList();

      final exportData = {
        'app_version': '0.9.0',
        'app_version_int': 11,
        'subscriptions': subscriptionsList,
        'profile': profileName,
      };

      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final profileSuffix = profileName == 'default' ? '' : '_$profileName';
      final file = File(
          '${dir.path}/vyplay_subscriptions${profileSuffix}_$timestamp.json');
      await file.writeAsString(jsonEncode(exportData));

      return Right(file.path);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, int>> importSubscriptions(
      {required String filePath, String profileName = 'default'}) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return const Left(MainFailure.serverFailure());
      }

      final content = await file.readAsString();
      final entries = _parseSubscriptionFile(content, filePath);

      int importedCount = 0;
      int resolvedCount = 0;

      for (final entry in entries) {
        var channelId = entry.id;
        // /@handle and /c/name entries carry no channel ID: resolve them from
        // the public channel page. Capped so a huge file cannot stall import.
        if (channelId.isEmpty &&
            entry.url.isNotEmpty &&
            resolvedCount < 100) {
          resolvedCount++;
          channelId = await _resolveChannelIdFromUrl(entry.url) ?? '';
        }
        if (channelId.isEmpty) continue;

        final existing = await db.getSubscription(channelId, profileName);
        if (existing != null) continue;

        await db.upsertSubscription(SubscriptionsCompanion.insert(
          channelId: channelId,
          profileName: profileName,
          channelName: entry.name,
        ));
        importedCount++;
      }

      return Right(importedCount);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, double>> setSubtitleSize(
      {required double size}) async {
    return _setSetting(
      settingName: subtitleSizeKey,
      value: size,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleSearchHistoryEnabled(
      {required bool isEnabled}) async {
    return _setSetting(
      settingName: searchHistoryEnabledKey,
      value: isEnabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleSearchHistoryVisibility(
      {required bool isVisible}) async {
    return _setSetting(
      settingName: searchHistoryVisibilityKey,
      value: isVisible,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> toggleAutoPip(
      {required bool isEnabled}) async {
    return _setSetting(
      settingName: autoPipEnabledKey,
      value: isEnabled,
      toStringValue: (v) => v.toString(),
    );
  }

  // Sleep timer methods
  @override
  Future<Either<MainFailure, SleepTimerConfig>> setSleepTimerConfig(
      {required SleepTimerConfig config}) async {
    try {
      final seconds = config.duration.inSeconds;
      await db.setSetting(sleepTimerKey, seconds.toString());
      return Right(config);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> clearSleepTimer() async {
    try {
      await db.setSetting(sleepTimerKey, '0');
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, SleepTimerConfig?>> getSleepTimerConfig() async {
    try {
      final setting = await db.getSetting(sleepTimerKey);
      if (setting == null || setting == '0') {
        return const Right(null);
      }
      final seconds = int.tryParse(setting) ?? 0;
      if (seconds <= 0) {
        return const Right(null);
      }
      final config = SleepTimerConfig(duration: Duration(seconds: seconds));
      return Right(config);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Subscription Group methods
  @override
  Future<Either<MainFailure, List<Map<String, dynamic>>>> getAllSubscriptionGroups(
      {required String profileName}) async {
    try {
      final groups = await db.getAllGroups(profileName);
      return Right(groups.map((g) => {
        'id': g.id,
        'groupName': g.groupName,
        'colorHex': g.colorHex,
        'sortOrder': g.sortOrder,
      }).toList());
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, int>> createSubscriptionGroup(
      {required String groupName, required String profileName, String? colorHex}) async {
    try {
      final group = SubscriptionGroupsCompanion.insert(
        groupName: groupName,
        profileName: profileName,
        colorHex: Value(colorHex),
        sortOrder: const Value(0),
      );
      final id = await db.insertGroup(group);
      return Right(id);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> renameSubscriptionGroup(
      {required int groupId, required String newName, required String profileName}) async {
    try {
      final update = SubscriptionGroupsCompanion(
        groupName: Value(newName),
      );
      await db.updateGroup(update.copyWith(id: Value(groupId)));
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> deleteSubscriptionGroup(
      {required int groupId, required String profileName}) async {
    try {
      await db.deleteGroup(groupId);
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> addToGroup(
      {required int groupId, required String channelId, required String profileName}) async {
    try {
      await db.addToGroup(groupId, channelId, profileName);
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> removeFromGroup(
      {required int groupId, required String channelId, required String profileName}) async {
    try {
      await db.removeFromGroup(groupId, channelId, profileName);
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Map<String, dynamic>>>> getGroupMembers(
      {required int groupId, required String profileName}) async {
    try {
      final members = await db.getGroupMembers(groupId, profileName);
      return Right(members.map((s) => {
        'channelId': s.channelId,
        'channelName': s.channelName,
        'avatarUrl': s.avatarUrl,
        'isVerified': s.isVerified,
      }).toList());
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Swipe gestures
  @override
  Future<Either<MainFailure, bool>> toggleSwipeGestures({required bool enabled}) async {
    try {
      await db.setSetting(enableSwipeGesturesKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isSwipeGesturesEnabled() async {
    try {
      final setting = await db.getSetting(enableSwipeGesturesKey);
      return Right(setting != 'false');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // DeArrow
  @override
  Future<Either<MainFailure, bool>> toggleDeArrow({required bool enabled}) async {
    try {
      await db.setSetting(dearrowEnabledKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDeArrowEnabled() async {
    try {
      final setting = await db.getSetting(dearrowEnabledKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Playlist Bookmarks
  @override
  Future<Either<MainFailure, bool>> toggleBookmarks({required bool enabled}) async {
    try {
      await db.setSetting(bookmarksEnabledKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isBookmarksEnabled() async {
    try {
      final setting = await db.getSetting(bookmarksEnabledKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> toggleBookmarkPlaylist({required String playlistId, required bool bookmarked}) async {
    try {
      final current = await db.getSetting(bookmarkPlaylistsKey);
      final list = current?.split(',').where((e) => e.isNotEmpty).toList() ?? [];
      if (bookmarked) {
        if (!list.contains(playlistId)) {
          list.add(playlistId);
        }
      } else {
        list.remove(playlistId);
      }
      await db.setSetting(bookmarkPlaylistsKey, list.join(','));
      return Right(bookmarked);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> getBookmarkedPlaylists() async {
    try {
      final setting = await db.getSetting(bookmarkPlaylistsKey);
      final list = setting?.split(',').where((e) => e.isNotEmpty).toList() ?? [];
      return Right(list);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Content Filtering
  @override
  Future<Either<MainFailure, bool>> toggleRestrictedMode({required bool enabled}) async {
    try {
      await db.setSetting(restrictedModeKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isRestrictedModeEnabled() async {
    try {
      final setting = await db.getSetting(restrictedModeKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Mini Player
  @override
  Future<Either<MainFailure, bool>> toggleMiniPlayer({required bool enabled}) async {
    try {
      await db.setSetting(miniPlayerEnabledKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isMiniPlayerEnabled() async {
    try {
      final setting = await db.getSetting(miniPlayerEnabledKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Download Preferences
  @override
  Future<Either<MainFailure, String>> setDownloadQuality({required String quality}) async {
    try {
      await db.setSetting(downloadQualityKey, quality);
      return Right(quality);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> getDownloadQuality() async {
    try {
      final quality = await db.getSetting(downloadQualityKey);
      return Right(quality ?? '720p');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> toggleDownloadSubtitles({required bool enabled}) async {
    try {
      await db.setSetting(downloadSubtitlesKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDownloadSubtitlesEnabled() async {
    try {
      final setting = await db.getSetting(downloadSubtitlesKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> toggleDownloadOverWifiOnly({required bool enabled}) async {
    try {
      await db.setSetting(downloadOverWifiOnlyKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDownloadOverWifiOnlyEnabled() async {
    try {
      final setting = await db.getSetting(downloadOverWifiOnlyKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> toggleDownloadAutoDelete({required bool enabled}) async {
    try {
      await db.setSetting(downloadAutoDeleteKey, enabled.toString());
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDownloadAutoDeleteEnabled() async {
    try {
      final setting = await db.getSetting(downloadAutoDeleteKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Playback speed
  @override
  Future<Either<MainFailure, double>> setPlaybackSpeed({required double speed}) async {
    try {
      await db.setSetting(playbackSpeedKey, speed.toString());
      return Right(speed);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, double>> getPlaybackSpeed() async {
    try {
      final setting = await db.getSetting(playbackSpeedKey);
      return Right(double.tryParse(setting ?? '1.0') ?? 1.0);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Autoplay next video
  @override
  Future<Either<MainFailure, bool>> setAutoplayNextVideo({required bool enabled}) async {
    try {
      await db.setSetting(autoplayNextVideoKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isAutoplayNextVideoEnabled() async {
    try {
      final setting = await db.getSetting(autoplayNextVideoKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Show related videos in queue
  @override
  Future<Either<MainFailure, bool>> setShowRelatedInQueue({required bool enabled}) async {
    try {
      await db.setSetting(showRelatedInQueueKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isShowRelatedInQueueEnabled() async {
    try {
      final setting = await db.getSetting(showRelatedInQueueKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Queue auto-dismiss time
  @override
  Future<Either<MainFailure, int>> setQueueDismissTime({required int seconds}) async {
    try {
      await db.setSetting(queueDismissTimeKey, seconds.toString());
      return Right(seconds);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, int>> getQueueDismissTime() async {
    try {
      final setting = await db.getSetting(queueDismissTimeKey);
      return Right(int.tryParse(setting ?? '30') ?? 30);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Autoplay countdown
  @override
  Future<Either<MainFailure, int>> setAutoplayCountdown({required int seconds}) async {
    try {
      await db.setSetting(autoplayCountdownKey, seconds.toString());
      return Right(seconds);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, int>> getAutoplayCountdown() async {
    try {
      final setting = await db.getSetting(autoplayCountdownKey);
      return Right(int.tryParse(setting ?? '5') ?? 5);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // YouTube service type
  @override
  Future<Either<MainFailure, String>> setYoutubeService({required String service}) async {
    try {
      await db.setSetting(youtubeService, service);
      return Right(service);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Disable autoplay on cellular
  @override
  Future<Either<MainFailure, bool>> setDisableAutoplayOnCellular({required bool enabled}) async {
    try {
      await db.setSetting(disableAutoplayOnCellularKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDisableAutoplayOnCellularEnabled() async {
    try {
      final setting = await db.getSetting(disableAutoplayOnCellularKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Auto-queue
  @override
  Future<Either<MainFailure, bool>> setAutoQueue({required bool enabled}) async {
    try {
      await db.setSetting(autoQueueKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isAutoQueueEnabled() async {
    try {
      final setting = await db.getSetting(autoQueueKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Buffer preloading
  @override
  Future<Either<MainFailure, bool>> setBufferPreload({required bool enabled}) async {
    try {
      await db.setSetting(bufferPreloadKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isBufferPreloadEnabled() async {
    try {
      final setting = await db.getSetting(bufferPreloadKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Video quality auto-adjust
  @override
  Future<Either<MainFailure, bool>> setAutoQualityAdjust({required bool enabled}) async {
    try {
      await db.setSetting(autoQualityAdjustKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isAutoQualityAdjustEnabled() async {
    try {
      final setting = await db.getSetting(autoQualityAdjustKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Background playback
  @override
  Future<Either<MainFailure, bool>> setBackgroundPlayback({required bool enabled}) async {
    try {
      await db.setSetting(backgroundPlaybackKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isBackgroundPlaybackEnabled() async {
    try {
      final setting = await db.getSetting(backgroundPlaybackKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Notification controls
  @override
  Future<Either<MainFailure, bool>> setNotificationControls({required bool enabled}) async {
    try {
      await db.setSetting(notificationControlsKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isNotificationControlsEnabled() async {
    try {
      final setting = await db.getSetting(notificationControlsKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Data saver mode
  @override
  Future<Either<MainFailure, bool>> setDataSaver({required bool enabled}) async {
    try {
      await db.setSetting(dataSaverKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDataSaverEnabled() async {
    try {
      final setting = await db.getSetting(dataSaverKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Hide watched videos in feeds
  @override
  Future<Either<MainFailure, bool>> setHideWatchedVideos({required bool enabled}) async {
    try {
      await db.setSetting(hideWatchedVideosKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isHideWatchedVideosEnabled() async {
    try {
      final setting = await db.getSetting(hideWatchedVideosKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Quality for mobile data
  @override
  Future<Either<MainFailure, int>> setMobileDataQuality({required int quality}) async {
    try {
      await db.setSetting(mobileDataQualityKey, quality.toString());
      return Right(quality);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, int>> getMobileDataQuality() async {
    try {
      final setting = await db.getSetting(mobileDataQualityKey);
      return Right(int.tryParse(setting ?? '360') ?? 360);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Download items in queue
  @override
  Future<Either<MainFailure, bool>> setDownloadQueueItems({required bool enabled}) async {
    try {
      await db.setSetting(downloadQueueItemsKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isDownloadQueueItemsEnabled() async {
    try {
      final setting = await db.getSetting(downloadQueueItemsKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Rich caption rendering
  @override
  Future<Either<MainFailure, bool>> setRichCaptionRendering({required bool enabled}) async {
    try {
      await db.setSetting(richCaptionRenderingKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isRichCaptionRenderingEnabled() async {
    try {
      final setting = await db.getSetting(richCaptionRenderingKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Bilibili video support
  @override
  Future<Either<MainFailure, bool>> setBilibiliEnabled({required bool enabled}) async {
    try {
      await db.setSetting(bilibiliEnabledKey, enabled ? 'true' : 'false');
      return Right(enabled);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isBilibiliEnabled() async {
    try {
      final setting = await db.getSetting(bilibiliEnabledKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Content swipe direction
  @override
  Future<Either<MainFailure, bool>> setSwipeDirection({required bool leftToRight}) async {
    try {
      await db.setSetting(swipeDirectionKey, leftToRight ? 'ltr' : 'rtl');
      return Right(leftToRight);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> isSwipeLeftToRight() async {
    try {
      final setting = await db.getSetting(swipeDirectionKey);
      return Right(setting == 'ltr');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Playlist bookmarks (multi-select)
  @override
  Future<Either<MainFailure, List<String>>> setBookmarkedPlaylists(
      {required List<String> playlists}) async {
    try {
      await db.setSetting(bookmarkedPlaylistsKey, playlists.join(','));
      return Right(playlists);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Mini player expansion behaviour
  @override
  Future<Either<MainFailure, bool>> setMiniPlayerAutoExpand(
      {required bool enabled}) async {
    return _setSetting(
      settingName: miniPlayerAutoExpandKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> isMiniPlayerAutoExpandEnabled() async {
    try {
      final setting = await db.getSetting(miniPlayerAutoExpandKey);
      return Right(setting != 'false');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> setMiniPlayerTapToExpand(
      {required bool enabled}) async {
    return _setSetting(
      settingName: miniPlayerTapToExpandKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> isMiniPlayerTapToExpandEnabled() async {
    try {
      final setting = await db.getSetting(miniPlayerTapToExpandKey);
      return Right(setting != 'false');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> setMiniPlayerDoubleTapToExpand(
      {required bool enabled}) async {
    return _setSetting(
      settingName: miniPlayerDoubleTapToExpandKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> isMiniPlayerDoubleTapToExpandEnabled() async {
    try {
      final setting = await db.getSetting(miniPlayerDoubleTapToExpandKey);
      return Right(setting == 'true');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Restricted mode filter strictness
  @override
  Future<Either<MainFailure, RestrictedModeFilterLevel>>
      setRestrictedModeFilterLevel(
          {required RestrictedModeFilterLevel level}) async {
    try {
      await db.setSetting(restrictedModeFilterKey, level.name);
      return Right(level);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, RestrictedModeFilterLevel>>
      getRestrictedModeFilterLevel() async {
    try {
      final setting = await db.getSetting(restrictedModeFilterKey);
      final level = RestrictedModeFilterLevel.values.firstWhere(
        (v) => v.name == setting,
        orElse: () => RestrictedModeFilterLevel.standard,
      );
      return Right(level);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Download auto-delete retention in days
  @override
  Future<Either<MainFailure, int>> setDownloadAutoDeleteDays(
      {required int days}) async {
    return _setSetting(
      settingName: downloadAutoDeleteDaysKey,
      value: days,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, int>> getDownloadAutoDeleteDays() async {
    try {
      final setting = await db.getSetting(downloadAutoDeleteDaysKey);
      return Right(int.tryParse(setting ?? '') ?? 7);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }


  // Advanced content filter
  @override
  Future<Either<MainFailure, ContentFilterConfig>> getContentFilterConfig() async {
    try {
      final keywordsRaw = await db.getSetting(contentFilterKeywordsKey) ?? '';
      final channelsRaw = await db.getSetting(contentFilterChannelsKey) ?? '';
      final hideShorts =
          await db.getSetting(contentFilterHideShortsKey) == 'true';
      final hidePaid = await db.getSetting(contentFilterHidePaidKey) == 'true';
      return Right(ContentFilterConfig(
        keywords: keywordsRaw
            .split('\n')
            .map((k) => k.trim())
            .where((k) => k.isNotEmpty)
            .toList(),
        blockedChannelIds: channelsRaw
            .split(',')
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .toList(),
        hideShorts: hideShorts,
        hidePaidPromotions: hidePaid,
      ));
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> setContentFilterKeywords(
      {required List<String> keywords}) async {
    final cleaned = keywords
        .map((k) => k.trim())
        .where((k) => k.isNotEmpty)
        .toList();
    return _setSetting(
      settingName: contentFilterKeywordsKey,
      value: cleaned,
      toStringValue: (v) => v.join('\n'),
    );
  }

  @override
  Future<Either<MainFailure, List<String>>> setContentFilterBlockedChannels(
      {required List<String> channelIds}) async {
    final cleaned = channelIds
        .map((c) => c.trim())
        .where((c) => c.isNotEmpty)
        .toList();
    return _setSetting(
      settingName: contentFilterChannelsKey,
      value: cleaned,
      toStringValue: (v) => v.join(','),
    );
  }

  @override
  Future<Either<MainFailure, bool>> setContentFilterHideShorts(
      {required bool enabled}) async {
    return _setSetting(
      settingName: contentFilterHideShortsKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> setContentFilterHidePaid(
      {required bool enabled}) async {
    return _setSetting(
      settingName: contentFilterHidePaidKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  // Download folder
  @override
  Future<Either<MainFailure, String?>> getDownloadFolderPath() async {
    try {
      final path = await db.getSetting(downloadFolderPathKey);
      if (path == null || path.trim().isEmpty) return const Right(null);
      return Right(path);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String?>> setDownloadFolderPath(
      {String? path}) async {
    try {
      if (path == null || path.trim().isEmpty) {
        await db.setSetting(downloadFolderPathKey, '');
        return const Right(null);
      }
      final dir = Directory(path.trim());
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      await db.setSetting(downloadFolderPathKey, dir.path);
      return Right(dir.path);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Return YouTube Dislike fallback
  @override
  Future<Either<MainFailure, bool>> toggleRyd({required bool enabled}) async {
    return _setSetting(
      settingName: rydEnabledKey,
      value: enabled,
      toStringValue: (v) => v.toString(),
    );
  }

  @override
  Future<Either<MainFailure, bool>> isRydEnabled() async {
    try {
      final value = await db.getSetting(rydEnabledKey);
      return Right(value != 'false');
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  // Phase 18: PipePipe / NewPipe / LibreTube parity features
  @override
  Future<Either<MainFailure, bool>> toggleLongPressSpeedUp({required bool enabled}) async {
    return _setSetting(settingName: longPressSpeedUpKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isLongPressSpeedUpEnabled() async {
    try { final v = await db.getSetting(longPressSpeedUpKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleOriginalTitles({required bool enabled}) async {
    return _setSetting(settingName: originalTitlesKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isOriginalTitlesEnabled() async {
    try { final v = await db.getSetting(originalTitlesKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleCommentFilter({required bool enabled}) async {
    return _setSetting(settingName: commentFilterEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isCommentFilterEnabled() async {
    try { final v = await db.getSetting(commentFilterEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, List<String>>> setCommentFilterKeywords({required List<String> keywords}) async {
    try { await db.setSetting(commentFilterKeywordsKey, keywords.join('\n')); return Right(keywords); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, List<String>>> getCommentFilterKeywords() async {
    try { final v = await db.getSetting(commentFilterKeywordsKey); if (v == null || v.isEmpty) return const Right([]); return Right(v.split('\n')); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, String>> setPreferredAudioQuality({required String quality}) async {
    try { await db.setSetting(preferredAudioQualityKey, quality); return Right(quality); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, String>> getPreferredAudioQuality() async {
    try { final v = await db.getSetting(preferredAudioQualityKey); return Right(v ?? 'auto'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleScreenLock({required bool enabled}) async {
    return _setSetting(settingName: screenLockEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isScreenLockEnabled() async {
    try { final v = await db.getSetting(screenLockEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> togglePinchToZoom({required bool enabled}) async {
    return _setSetting(settingName: pinchToZoomEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isPinchToZoomEnabled() async {
    try { final v = await db.getSetting(pinchToZoomEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleSeekbarThumbnails({required bool enabled}) async {
    return _setSetting(settingName: seekbarThumbnailsKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isSeekbarThumbnailsEnabled() async {
    try { final v = await db.getSetting(seekbarThumbnailsKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> togglePopupPlayer({required bool enabled}) async {
    return _setSetting(settingName: popupPlayerEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isPopupPlayerEnabled() async {
    try { final v = await db.getSetting(popupPlayerEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleLiveChatDanmaku({required bool enabled}) async {
    return _setSetting(settingName: liveChatDanmakuEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isLiveChatDanmakuEnabled() async {
    try { final v = await db.getSetting(liveChatDanmakuEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleBluetoothSeek({required bool enabled}) async {
    return _setSetting(settingName: bluetoothSeekEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isBluetoothSeekEnabled() async {
    try { final v = await db.getSetting(bluetoothSeekEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleMultiSelectLists({required bool enabled}) async {
    return _setSetting(settingName: multiSelectListsEnabledKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isMultiSelectListsEnabled() async {
    try { final v = await db.getSetting(multiSelectListsEnabledKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleSbExclusiveMarker({required bool enabled}) async {
    return _setSetting(settingName: sbExclusiveMarkerKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isSbExclusiveMarkerEnabled() async {
    try { final v = await db.getSetting(sbExclusiveMarkerKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }
  @override
  Future<Either<MainFailure, bool>> toggleSbForDownloads({required bool enabled}) async {
    return _setSetting(settingName: sbForDownloadsKey, value: enabled, toStringValue: (v) => v.toString());
  }
  @override
  Future<Either<MainFailure, bool>> isSbForDownloadsEnabled() async {
    try { final v = await db.getSetting(sbForDownloadsKey); return Right(v != 'false'); } catch (e) { return const Left(MainFailure.serverFailure()); }
  }

  @override
  Future<Either<MainFailure, String>> setYoutubeCookie({required String cookie}) async {
    try {
      final trimmed = cookie.trim();
      await db.setSetting(youtubeCookieKey, trimmed);
      return Right(trimmed);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String?>> getYoutubeCookie() async {
    try {
      final v = await db.getSetting(youtubeCookieKey);
      return Right((v == null || v.isEmpty) ? null : v);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> clearYoutubeCookie() async {
    try {
      await db.setSetting(youtubeCookieKey, '');
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  /// Parses YouTube Takeout CSV, NewPipe JSON or VyPlay JSON exports into
  /// subscription entries. Entries without a channel ID keep their URL so the
  /// importer can resolve handles later.
  List<_SubscriptionEntry> _parseSubscriptionFile(
      String content, String filePath) {
    final result = <_SubscriptionEntry>[];
    final trimmed = content.trimLeft();
    final isCsv = filePath.toLowerCase().endsWith('.csv') ||
        (!trimmed.startsWith('{') && !trimmed.startsWith('['));

    if (isCsv) {
      final lines = content.split(RegExp(r'\r?\n'));
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.isEmpty) continue;
        final cells = _splitCsvLine(line);
        if (cells.isEmpty) continue;
        if (i == 0 &&
            cells.any((c) => c.toLowerCase().contains('channel id') ||
                c.toLowerCase() == 'url' ||
                c.toLowerCase() == 'name')) {
          continue;
        }
        String name = '';
        String id = '';
        String url = '';
        for (final cell in cells) {
          final value = cell.trim();
          if (value.startsWith('http')) {
            url = value;
            final extracted = _channelIdFromUrl(value);
            if (extracted != null) id = extracted;
          } else if (value.startsWith('UC') && value.length > 20) {
            id = value;
          } else if (name.isEmpty && value.isNotEmpty) {
            name = value;
          }
        }
        if (id.isNotEmpty || url.isNotEmpty) {
          result.add(_SubscriptionEntry(id: id, name: name, url: url));
        }
      }
      return result;
    }

    try {
      final decoded = jsonDecode(content);
      final dynamic data =
          decoded is Map<String, dynamic> && decoded['subscriptions'] != null
              ? decoded['subscriptions']
              : decoded;
      if (data is List) {
        for (final item in data) {
          if (item is! Map) continue;
          final map = item.cast<String, dynamic>();
          final rawId =
              (map['channel_id'] ?? map['channelId'] ?? map['id'] ?? '')
                  .toString();
          final url =
              (map['url'] ?? map['channel_url'] ?? '').toString();
          final name = (map['name'] ??
                  map['channel_name'] ??
                  map['title'] ??
                  '')
              .toString();
          final id = rawId.startsWith('UC') && rawId.length > 20
              ? rawId
              : (_channelIdFromUrl(url) ?? '');
          if (id.isNotEmpty || url.isNotEmpty) {
            result.add(_SubscriptionEntry(id: id, name: name, url: url));
          }
        }
      }
    } catch (_) {
      // Not JSON and not CSV.
    }
    return result;
  }

  String? _channelIdFromUrl(String url) {
    if (url.contains('/channel/')) {
      final id = url.split('/channel/').last.split(RegExp(r'[/?#]')).first;
      if (id.isNotEmpty) return id;
    }
    return null;
  }

  /// Resolves /@handle, /c/name and /user/name URLs to a channel ID by reading
  /// the public channel page. Returns null when it cannot be resolved.
  Future<String?> _resolveChannelIdFromUrl(String url) async {
    final direct = _channelIdFromUrl(url);
    if (direct != null) return direct;

    var target = url.trim();
    if (target.isEmpty) return null;
    if (!target.startsWith('http')) {
      target = 'https://www.youtube.com/'
          '${target.startsWith('/') ? target.substring(1) : target}';
    }

    try {
      final response = await Dio().get<String>(
        target,
        options: Options(
          responseType: ResponseType.plain,
          followRedirects: true,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          headers: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          },
        ),
      );
      final html = response.data ?? '';
      final patterns = <RegExp>[
        RegExp(r'"channelId":"(UC[0-9A-Za-z_-]{20,})"'),
        RegExp(r'channel/(UC[0-9A-Za-z_-]{20,})'),
        RegExp(r'"(UC[0-9A-Za-z_-]{22})"'),
      ];
      for (final pattern in patterns) {
        final match = pattern.firstMatch(html);
        if (match != null) return match.group(1);
      }
    } catch (_) {
      // Unresolvable (offline, deleted channel, consent wall): skipped.
    }
    return null;
  }

  List<String> _splitCsvLine(String line) {
    final cells = <String>[];
    final buffer = StringBuffer();
    var inQuotes = false;
    for (var i = 0; i < line.length; i++) {
      final char = line[i];
      if (char == '"') {
        if (inQuotes && i + 1 < line.length && line[i + 1] == '"') {
          buffer.write('"');
          i++;
        } else {
          inQuotes = !inQuotes;
        }
      } else if (char == ',' && !inQuotes) {
        cells.add(buffer.toString());
        buffer.clear();
      } else {
        buffer.write(char);
      }
    }
    cells.add(buffer.toString());
    return cells;
  }
}

class _SubscriptionEntry {
  const _SubscriptionEntry({
    required this.id,
    required this.name,
    required this.url,
  });

  final String id;
  final String name;
  final String url;
}
