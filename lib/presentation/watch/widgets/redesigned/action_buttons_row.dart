import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/animations/animations.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/operations/math_operations.dart';
import 'package:vyplay/core/services/return_youtube_dislike_service.dart';
import 'package:vyplay/generated/l10n.dart';

/// Redesigned action buttons row with labeled style (like YouTube)
/// Each button has an icon on top and label text below
class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({
    super.key,
    required this.likes,
    this.dislikes = 0,
    this.onTapLike,
    this.onTapDislike,
    this.onTapSave,
    this.onTapComment,
    this.onTapShare,
    this.onTapDownload,
    this.onTapYoutube,
    this.onTapPip,
    this.isLiked = false,
    this.isDisliked = false,
    this.isSaved = false,
    this.isCommentActive = false,
    this.isDownloaded = false,
    this.showDislike = false,
    this.showPip = true,
    this.isLive = false,
    this.videoId,
  });

  final int likes;
  final int dislikes;
  final VoidCallback? onTapLike;
  final VoidCallback? onTapDislike;
  final VoidCallback? onTapSave;
  final VoidCallback? onTapComment;
  final VoidCallback? onTapShare;
  final VoidCallback? onTapDownload;
  final VoidCallback? onTapYoutube;
  final VoidCallback? onTapPip;
  final bool isLiked;
  final bool isDisliked;
  final bool isSaved;
  final bool isCommentActive;
  final bool isDownloaded;
  final bool showDislike;
  final bool showPip;
  final bool isLive;

  /// When set and the provided dislike count is unavailable (0), the count is
  /// resolved through Return YouTube Dislike.
  final String? videoId;

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final formattedLikes = likes == -1 ? locals.like : formatCount(likes.toString());
    final formattedDislikes = dislikes == -1 ? locals.dislike : formatCount(dislikes.toString());

    final rydEnabled =
        context.select((SettingsBloc bloc) => bloc.state.isRydEnabled) ?? true;

    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            // Like button
            _ActionButton(
              index: 0,
              icon: isLiked
                  ? CupertinoIcons.hand_thumbsup_fill
                  : CupertinoIcons.hand_thumbsup,
              label: formattedLikes,
              onTap: onTapLike,
              isActive: isLiked,
              activeColor: AppColors.likeFilled,
            ),

            // Dislike button (optional)
            if (showDislike)
              _ActionButton(
                index: 1,
                icon: isDisliked
                    ? CupertinoIcons.hand_thumbsdown_fill
                    : CupertinoIcons.hand_thumbsdown,
                label: formattedDislikes,
                labelChild: (rydEnabled &&
                        videoId != null &&
                        videoId!.isNotEmpty &&
                        dislikes <= 0)
                    ? _RydDislikeLabel(videoId: videoId!)
                    : null,
                onTap: onTapDislike,
                isActive: isDisliked,
              ),

            // Save button
            _ActionButton(
              index: showDislike ? 2 : 1,
              icon: isSaved ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
              label: locals.saved,
              onTap: onTapSave,
              isActive: isSaved,
            ),

            // Comments button (controlled by settings)
            BlocBuilder<SettingsBloc, SettingsState>(
              buildWhen: (previous, current) =>
                  previous.isHideComments != current.isHideComments,
              builder: (context, settingsState) {
                if (!settingsState.isHideComments) {
                  return _ActionButton(
                    index: showDislike ? 3 : 2,
                    icon: isCommentActive
                        ? CupertinoIcons.bubble_left_bubble_right_fill
                        : CupertinoIcons.bubble_left_bubble_right,
                    label: 'Comments',
                    onTap: onTapComment,
                    isActive: isCommentActive,
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // Share button
            _ActionButton(
              index: showDislike ? 4 : 3,
              icon: CupertinoIcons.arrowshape_turn_up_right,
              label: locals.share,
              onTap: onTapShare,
            ),

            // Download button (hidden for live videos)
            if (!isLive)
              _ActionButton(
                index: showDislike ? 5 : 4,
                icon: isDownloaded
                    ? CupertinoIcons.arrow_down_circle_fill
                    : CupertinoIcons.arrow_down_circle,
                label: locals.download,
                onTap: onTapDownload,
                isActive: isDownloaded,
                activeColor: AppColors.success,
              ),

            // PiP button (optional)
            if (showPip)
              _ActionButton(
                index: showDislike ? 6 : 5,
                icon: Icons.picture_in_picture_outlined,
                label: 'PiP',
                onTap: onTapPip,
              ),

            // YouTube button
            _YouTubeActionButton(
              index: showDislike ? 7 : 6,
              onTap: onTapYoutube,
            ),

            AppSpacing.width16,
          ],
        ),
      ),
          if (showDislike && rydEnabled && videoId != null && videoId!.isNotEmpty)
            Positioned(
              left: 12,
              right: 12,
              bottom: 2,
              child: _RydRatioBar(videoId: videoId!, likes: likes),
            ),
        ],
      ),
    );
  }
}

/// Individual action button with icon and label
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.index,
    required this.icon,
    required this.label,
    this.labelChild,
    this.onTap,
    this.isActive = false,
    this.activeColor,
  });

  final int index;
  final IconData icon;
  final String label;
  final Widget? labelChild;
  final VoidCallback? onTap;
  final bool isActive;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultColor = isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceVariant;
    final iconColor = isActive ? (activeColor ?? AppColors.primary) : defaultColor;
    final labelColor = isActive ? (activeColor ?? AppColors.primary) : defaultColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: ScaleTap(
        onTap: onTap,
        scaleDown: 0.9,
        child: AnimatedContainer(
          duration: AppAnimations.fast,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? (activeColor ?? AppColors.primary).withValues(alpha: 0.12)
                : (isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant),
            borderRadius: AppRadius.borderFull,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: AppAnimations.fast,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Icon(
                  icon,
                  key: ValueKey('$icon$isActive'),
                  size: AppIconSize.md,
                  color: iconColor,
                ),
              ),
              AppSpacing.height4,
              labelChild ??
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: AppFontSize.caption,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: labelColor,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

/// YouTube-specific button with SVG icon
class _YouTubeActionButton extends StatelessWidget {
  const _YouTubeActionButton({
    required this.index,
    this.onTap,
  });

  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: ScaleTap(
        onTap: onTap,
        scaleDown: 0.9,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
            borderRadius: AppRadius.borderFull,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/youtube.svg',
                height: AppIconSize.md,
                colorFilter: ColorFilter.mode(
                  AppColors.youtubeRed,
                  BlendMode.srcIn,
                ),
              ),
              AppSpacing.height4,
              Text(
                'YouTube',
                style: TextStyle(
                  fontSize: AppFontSize.caption,
                  fontWeight: FontWeight.w500,
                  color: defaultColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Compact version for landscape mode
class ActionButtonsRowCompact extends StatelessWidget {
  const ActionButtonsRowCompact({
    super.key,
    required this.likes,
    this.onTapLike,
    this.onTapSave,
    this.onTapShare,
    this.isLiked = false,
    this.isSaved = false,
  });

  final int likes;
  final VoidCallback? onTapLike;
  final VoidCallback? onTapSave;
  final VoidCallback? onTapShare;
  final bool isLiked;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final formattedLikes = likes == -1 ? locals.like : formatCount(likes.toString());

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CompactButton(
          icon: isLiked
              ? CupertinoIcons.hand_thumbsup_fill
              : CupertinoIcons.hand_thumbsup,
          label: formattedLikes,
          onTap: onTapLike,
          isActive: isLiked,
          activeColor: AppColors.likeFilled,
        ),
        AppSpacing.width8,
        _CompactButton(
          icon: isSaved ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
          onTap: onTapSave,
          isActive: isSaved,
        ),
        AppSpacing.width8,
        _CompactButton(
          icon: CupertinoIcons.arrowshape_turn_up_right,
          onTap: onTapShare,
        ),
      ],
    );
  }
}

class _CompactButton extends StatelessWidget {
  const _CompactButton({
    required this.icon,
    this.label,
    this.onTap,
    this.isActive = false,
    this.activeColor,
  });

  final IconData icon;
  final String? label;
  final VoidCallback? onTap;
  final bool isActive;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceVariant;
    final iconColor = isActive ? (activeColor ?? AppColors.primary) : defaultColor;

    return ScaleTap(
      onTap: onTap,
      scaleDown: 0.9,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? (activeColor ?? AppColors.primary).withValues(alpha: 0.12)
              : (isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant)
                  .withValues(alpha: 0.5),
          borderRadius: AppRadius.borderSm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppIconSize.sm,
              color: iconColor,
            ),
            if (label != null) ...[
              AppSpacing.width4,
              Text(
                label!,
                style: TextStyle(
                  fontSize: AppFontSize.caption,
                  fontWeight: FontWeight.w500,
                  color: iconColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Resolves the Return YouTube Dislike count for a video once and renders it.
class _RydDislikeLabel extends StatefulWidget {
  const _RydDislikeLabel({required this.videoId});

  final String videoId;

  @override
  State<_RydDislikeLabel> createState() => _RydDislikeLabelState();
}

class _RydDislikeLabelState extends State<_RydDislikeLabel> {
  int? _dislikes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _RydDislikeLabel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _dislikes = null;
      _load();
    }
  }

  Future<void> _load() async {
    final cached = ReturnYoutubeDislikeService().cached(widget.videoId);
    if (cached != null) {
      if (mounted) setState(() => _dislikes = cached.dislikes);
      return;
    }
    final votes =
        await ReturnYoutubeDislikeService().fetchVotes(widget.videoId);
    if (!mounted || votes == null) return;
    setState(() => _dislikes = votes.dislikes);
  }

  @override
  Widget build(BuildContext context) {
    final value = _dislikes;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color =
        isDark ? AppColors.onSurfaceVariantDark : AppColors.onSurfaceVariant;
    return Text(
      value == null ? '-' : formatCount(value.toString()),
      style: TextStyle(
        fontSize: AppFontSize.caption,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

/// Like/dislike ratio bar using the service count plus Return YouTube Dislike.
class _RydRatioBar extends StatefulWidget {
  const _RydRatioBar({required this.videoId, required this.likes});

  final String videoId;
  final int likes;

  @override
  State<_RydRatioBar> createState() => _RydRatioBarState();
}

class _RydRatioBarState extends State<_RydRatioBar> {
  int? _dislikes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _RydRatioBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _dislikes = null;
      _load();
    }
  }

  Future<void> _load() async {
    final votes =
        await ReturnYoutubeDislikeService().fetchVotes(widget.videoId);
    if (!mounted || votes == null) return;
    setState(() => _dislikes = votes.dislikes);
  }

  @override
  Widget build(BuildContext context) {
    final dislikes = _dislikes;
    final likes = widget.likes;
    if (dislikes == null || (likes <= 0 && dislikes <= 0)) {
      return const SizedBox.shrink();
    }
    return ClipRRect(
      borderRadius: AppRadius.borderFull,
      child: SizedBox(
        height: 3,
        child: Row(
          children: [
            Expanded(
              flex: likes <= 0 ? 1 : likes,
              child: Container(color: AppColors.likeFilled),
            ),
            Expanded(
              flex: dislikes <= 0 ? 1 : dislikes,
              child: Container(
                color: (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.onSurfaceVariantDark
                        : AppColors.onSurfaceVariant)
                    .withValues(alpha: 0.35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
