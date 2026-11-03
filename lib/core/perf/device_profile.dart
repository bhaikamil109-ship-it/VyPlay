import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// How much muscle the device has, as a single coarse bucket.
///
/// Three buckets is deliberate. Finer gradations (a dozen "performance scores")
/// buy nothing here: every knob this class feeds is either a cache width or a
/// list window, and those only need an order-of-magnitude answer. It also means
/// an unknown device lands on a sensible middle ground instead of a guess that
/// is wrong in the dangerous direction.
enum DeviceTier {
  /// 2 GB or less, or flagged low-RAM by the platform (typically Android Go
  /// and 2015-era hardware). Every knob is pulled towards "stay alive".
  low,

  /// 3–5 GB. The bulk of mid-range phones sold between 2019 and 2023.
  medium,

  /// 6 GB and up.
  high,
}

/// Hardware facts about the current device, resolved once at startup.
///
/// The values come from Android (see `DeviceCapabilityHandler.kt`). On every
/// other platform — and on Android if the channel is missing — the profile
/// degrades to [DeviceTier.high] with [isKnown] false, so a desktop build is
/// never accidentally throttled by defaults meant for a 2 GB phone.
class DeviceProfile {
  const DeviceProfile({
    required this.tier,
    required this.sdkInt,
    required this.totalRamMb,
    required this.processorCount,
    required this.isLowRamDevice,
    required this.isKnown,
  });

  /// Resolved before the first frame; never null by the time widgets read it.
  static DeviceProfile _current = const DeviceProfile(
    tier: DeviceTier.high,
    sdkInt: 0,
    totalRamMb: 0,
    processorCount: 0,
    isLowRamDevice: false,
    isKnown: false,
  );

  static const MethodChannel _channel =
      MethodChannel('com.fazilvk.fluxtube/device');

  /// The profile for this process. Safe to read from any widget.
  static DeviceProfile get current => _current;

  final DeviceTier tier;
  final int sdkInt;
  final int totalRamMb;
  final int processorCount;
  final bool isLowRamDevice;

  /// False when nothing could be measured (non-Android, or a channel error),
  /// in which case [tier] is [DeviceTier.high] and every knob is at full size.
  final bool isKnown;

  bool get isLowEnd => tier == DeviceTier.low;

  /// True on Android releases that predate scoped storage (API 29).
  ///
  /// Worth branching on: those devices need the legacy WRITE_EXTERNAL_STORAGE
  /// path for saved downloads, while newer ones must go through MediaStore.
  bool get needsLegacyStorage => isKnown && sdkInt > 0 && sdkInt < 29;

  /// Android 13 (API 33) introduced the POST_NOTIFICATIONS runtime grant.
  /// Below that the system shows notifications without asking.
  bool get needsNotificationPermission => isKnown && sdkInt >= 33;

  /// Reads the native profile. Never throws: a failure leaves the defaults in
  /// place so the app still starts on a device where the channel is absent.
  static Future<DeviceProfile> load() async {
    // Only Android has the native side. Elsewhere, report a desktop-class
    // profile rather than pretending the device is weak.
    if (kIsWeb || !Platform.isAndroid) {
      _current = const DeviceProfile(
        tier: DeviceTier.high,
        sdkInt: 0,
        totalRamMb: 0,
        processorCount: 0,
        isLowRamDevice: false,
        isKnown: false,
      );
      return _current;
    }

    try {
      final raw = await _channel.invokeMapMethod<String, dynamic>(
        'getDeviceProfile',
      );
      if (raw == null) return _current;

      final sdkInt = (raw['sdkInt'] as num?)?.toInt() ?? 0;
      final totalRamMb = (raw['totalRamMb'] as num?)?.toInt() ?? 0;
      final cores = (raw['processorCount'] as num?)?.toInt() ?? 0;
      final lowRam = raw['lowRamDevice'] == true;

      _current = DeviceProfile(
        tier: _tierFor(totalRamMb: totalRamMb, lowRamDevice: lowRam),
        sdkInt: sdkInt,
        totalRamMb: totalRamMb,
        processorCount: cores,
        isLowRamDevice: lowRam,
        isKnown: true,
      );
    } on MissingPluginException {
      // Release built without the native handler registered — keep defaults.
    } on PlatformException catch (e) {
      debugPrint('[DeviceProfile] native read failed: ${e.message}');
    } catch (e) {
      debugPrint('[DeviceProfile] unexpected failure: $e');
    }
    return _current;
  }

  /// RAM is the single best predictor of "will this phone drop frames", far
  /// ahead of core count, so it drives the bucket. An explicit low-RAM flag
  /// from the platform always wins: it already accounts for the vendor's own
  /// memory constraints, which can be tighter than the raw figure suggests.
  static DeviceTier _tierFor({
    required int totalRamMb,
    required bool lowRamDevice,
  }) {
    if (lowRamDevice) return DeviceTier.low;
    if (totalRamMb <= 0) return DeviceTier.high; // Unknown — do not throttle.
    if (totalRamMb <= 2048) return DeviceTier.low;
    if (totalRamMb <= 5120) return DeviceTier.medium;
    return DeviceTier.high;
  }
}
