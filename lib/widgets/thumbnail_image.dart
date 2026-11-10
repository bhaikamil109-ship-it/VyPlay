import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/perf/app_perf.dart';

// Cache widths come from AppPerf, which sizes them to the device: a 2 GB phone
// decodes thumbnails at 480 px instead of 720 px, saving roughly two thirds of
// the bitmap memory with no visible difference on its panel.

/// Drop-in replacement for CachedNetworkImage that caps the in-memory decode
/// size so we don't store full 1280×720 bitmaps for 100×56 thumbnails.
///
/// Use [ThumbnailImage.small] for related-video / search-result sidebars.
class ThumbnailImage extends StatelessWidget {
  const ThumbnailImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.memCacheWidth,
    this.memCacheHeight,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
  }) : _isSmall = false;

  /// For related-video / search sidebars, small cards, and avatars.
  const ThumbnailImage.small({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
  })  : memCacheWidth = null,
        memCacheHeight = null,
        _isSmall = true;

  final String url;
  final BoxFit fit;

  /// Explicit override. Null means "use the device-tier default", which is
  /// resolved in [build] rather than in the constructor so a `const`
  /// ThumbnailImage still works after the profile has loaded.
  final int? memCacheWidth;
  final int? memCacheHeight;
  final double? width;
  final double? height;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  /// True for the `.small` constructor, which selects the sidebar-sized
  /// decode width. Stored rather than inferred, because both constructors
  /// leave [memCacheWidth] null when no override is given.
  final bool _isSmall;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant;

    // `.small` gets the sidebar width; the default constructor gets the card
    // width. Both are device-tier aware.
    final int resolvedWidth = memCacheWidth ??
        (_isSmall
            ? AppPerf.thumbnailCacheWidthSmall
            : AppPerf.thumbnailCacheWidth);

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      memCacheWidth: resolvedWidth,
      memCacheHeight: memCacheHeight,
      placeholder: placeholder ?? (context, _) => ColoredBox(color: bg),
      errorWidget: errorWidget ??
          (context, _, __) => ColoredBox(
                color: bg,
                child: const Icon(
                  CupertinoIcons.play_rectangle,
                  size: AppIconSize.xxl,
                  color: AppColors.disabled,
                ),
              ),
    );
  }
}

/// Returns a memory-capped [CachedNetworkImageProvider] for use inside
/// [DecorationImage] or [CircleAvatar.backgroundImage].
///
/// [logicalDiameter] is the widget's side length in logical pixels (dp);
/// the provider caches at 3× that to cover high-DPR screens.
CachedNetworkImageProvider cachedAvatarProvider(
  String url, {
  int logicalDiameter = 40,
}) {
  final px = (logicalDiameter * 3).clamp(48, AppPerf.avatarCacheWidth);
  return CachedNetworkImageProvider(url, maxWidth: px, maxHeight: px);
}

/// Memory-capped provider for thumbnail images used in [DecorationImage].
CachedNetworkImageProvider cachedThumbnailProvider(
  String url, {
  bool small = false,
}) {
  final w = small
      ? AppPerf.thumbnailCacheWidthSmall
      : AppPerf.thumbnailCacheWidth;
  return CachedNetworkImageProvider(url, maxWidth: w);
}
