import 'device_profile.dart';

/// Size and timing knobs that scale with [DeviceProfile.tier].
///
/// The point is not to make the app feel different on a weak phone — it is to
/// keep it *alive* on one. A 2 GB Android Go device has roughly 200 MB of heap
/// for a Flutter app before the LMK starts killing it, so an 8k-pixel-wide
/// cached bitmap or a list that builds three screens ahead is the difference
/// between smooth scrolling and an ANR.
///
/// Read these as `const`-ish values: they do not change during a run, because
/// [DeviceProfile.current] is resolved once before the first frame.
class AppPerf {
  AppPerf._();

  static DeviceProfile get _p => DeviceProfile.current;

  // ---------------------------------------------------------------- images

  /// Cap for Flutter's decoded-image cache, in bytes.
  ///
  /// The upstream default is 100 MB and the app previously raised it to 200 MB,
  /// which is fine on a flagship and a recipe for OOM on a 2 GB device.
  static int get imageCacheBytes {
    switch (_p.tier) {
      case DeviceTier.low:
        return 32 << 20; // 32 MB
      case DeviceTier.medium:
        return 96 << 20; // 96 MB
      case DeviceTier.high:
        return 200 << 20; // 200 MB — the previous global value
    }
  }

  /// Physical-pixel width thumbnails are decoded at.
  ///
  /// A full-width card is ~360 dp; at 3× DPR that is 1080 physical pixels. On
  /// a low-tier device 3× DPR usually means a cheap panel where the difference
  /// between 480 px and 720 px source is invisible, and decoding at 480 px
  /// costs roughly a third of the memory.
  static int get thumbnailCacheWidth {
    switch (_p.tier) {
      case DeviceTier.low:
        return 480;
      case DeviceTier.medium:
        return 640;
      case DeviceTier.high:
        return 720;
    }
  }

  /// Physical-pixel width for sidebar / related-video thumbnails (~120 dp).
  static int get thumbnailCacheWidthSmall {
    switch (_p.tier) {
      case DeviceTier.low:
        return 224;
      case DeviceTier.medium:
        return 288;
      case DeviceTier.high:
        return 320;
    }
  }

  /// Avatar decode size. Avatars are 32–48 dp; anything above 3× is waste.
  static int get avatarCacheWidth => _p.isLowEnd ? 96 : 144;

  // ----------------------------------------------------------------- lists

  /// How far beyond the viewport a list builds ahead.
  ///
  /// `cacheExtent` is where lazy lists turn into eager ones. Flutter's default
  /// is 250 px, but `ListView` with an unbounded child height can still build
  /// a whole screen of complex cards. Dropping to 120 px on a low-tier device
  /// roughly halves the widgets alive per scroll step.
  static double get listCacheExtent {
    switch (_p.tier) {
      case DeviceTier.low:
        return 120;
      case DeviceTier.medium:
        return 250;
      case DeviceTier.high:
        return 400;
    }
  }

  /// `.small` variant for grids of dense tiles (Shorts), where each tile is
  /// cheap but there are four times as many of them per screen.
  static double get gridCacheExtent {
    switch (_p.tier) {
      case DeviceTier.low:
        return 80;
      case DeviceTier.medium:
        return 200;
      case DeviceTier.high:
        return 350;
    }
  }

  /// Pagination trigger distance from the end of a feed.
  ///
  /// Shorter on weak devices so a network round trip overlaps with less
  /// buffered content — a longer prefetch means more pages held in memory at
  /// once for no visible benefit.
  static double get loadMoreThreshold => _p.isLowEnd ? 150 : 200;

  // ------------------------------------------------------------ animation

  /// Multiplier applied to every decorative animation duration.
  ///
  /// Decorative transitions are pure cost on a device that already struggles
  /// to hit 30 fps, so they are shortened rather than removed — removing them
  /// outright makes the UI feel broken, shortening them keeps the affordance
  /// while reclaiming the frames.
  static double get animationScale => _p.isLowEnd ? 0.45 : 1.0;

  /// Scale a duration by [animationScale]. Used by the animation widgets so
  /// the tier decision lives in one place.
  static Duration scaleDuration(Duration base) {
    final ms = (base.inMilliseconds * animationScale).round();
    return Duration(milliseconds: ms < 1 ? 1 : ms);
  }

  /// Whether decorative per-item entrance animations should run at all.
  ///
  /// On a low-tier device a 20-item staggered fade-in means 20 live
  /// AnimationControllers during the first paint of every list — that is the
  /// single biggest first-scroll hitch, so it is skipped entirely there.
  static bool get enableListEntranceAnimations => !_p.isLowEnd;

  /// How many list items may take part in a stagger. Beyond this the delay is
  /// invisible anyway (the item is off-screen), so the controller cost is pure
  /// waste.
  static int get staggerItemLimit => _p.isLowEnd ? 0 : 8;

  // ------------------------------------------------------------- playback

  /// Preferred thumbnail quality key for the player's poster frame.
  static bool get preferLowResPosters => _p.isLowEnd;

  /// Max concurrent downloads. A weak device writing two streams while also
  /// decoding video is competing for the same storage and CPU.
  static int get maxConcurrentDownloads => _p.isLowEnd ? 1 : 2;

  /// Human-readable summary for the debug screen.
  static String get summary {
    final p = _p;
    if (!p.isKnown) return 'unknown (assumed high)';
    return '${p.tier.name} · RAM ${p.totalRamMb}MB · '
        'SDK ${p.sdkInt} · ${p.processorCount} cores'
        '${p.isLowRamDevice ? ' · low-RAM flag' : ''}';
  }
}
