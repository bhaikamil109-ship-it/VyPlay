import 'package:flutter/material.dart';
import 'package:vyplay/widgets/dearrow_widgets.dart';
import 'package:vyplay/widgets/thumbnail_image.dart';
import 'package:vyplay/core/animations/animations.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/operations/math_operations.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'common_video_description_widget.dart';

/// Video card widget for home, trending, and search screens
/// Includes tap animation and staggered entrance animation
class HomeVideoInfoCardWidget extends StatelessWidget {
  const HomeVideoInfoCardWidget({
    super.key,
    this.cardInfo,
    this.isSubscribed = false,
    this.subscribeRowVisible = true,
    this.onSubscribeTap,
    this.onTap,
    this.isLive = false,
    required this.channelId,
    this.index = 0,
    this.videoId,
  });

  final String channelId;

  /// Video id used for DeArrow title/thumbnail lookups.
  final String? videoId;
  final dynamic cardInfo;
  final bool isSubscribed;
  final bool subscribeRowVisible;
  final VoidCallback? onSubscribeTap;
  final VoidCallback? onTap;
  final bool isLive;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locals = S.of(context);
    final String duration = formatDuration(isLive ? -1 : cardInfo?.duration);
    final isLiveVideo = duration == "Live";

    return AnimatedListItem(
      index: index,
      child: ScaleTap(
        scaleDown: 0.98,
        enableHaptic: false,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.xs,
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: AppSpacing.md,
          ),
          child: Column(
            children: [
              // Thumbnail container
              Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.surfaceVariantDark
                      : AppColors.surfaceVariant,
                  borderRadius: AppRadius.borderMd,
                ),
                child: ClipRRect(
                  borderRadius: AppRadius.borderMd,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Thumbnail image
                      DeArrowThumbnail(
                        videoId: videoId ?? '',
                        originalUrl: cardInfo?.thumbnail as String?,
                        builder: (context, url) => ThumbnailImage(url: url),
                      ),

                      // Duration badge
                      Positioned(
                        bottom: AppSpacing.sm,
                        right: AppSpacing.sm,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: isLiveVideo
                                ? AppColors.youtubeRed
                                : kBlackColor,
                            borderRadius: AppRadius.borderXs,
                          ),
                          child: Text(
                            duration,
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: AppFontSize.caption,
                              fontWeight: isLiveVideo
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Video info section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                child: Column(
                  children: [
                    // Title
                    CaptionRowWidget(
                      caption: cardInfo?.title ?? locals.noVideoTitle,
                      videoId: videoId,
                    ),

                    AppSpacing.height4,

                    // Views and date
                    ViewRowWidget(
                      views: cardInfo?.views ?? 0,
                      uploadedDate:
                          cardInfo?.uploadedDate ?? locals.noUploadDate,
                    ),

                    AppSpacing.height8,

                    // Channel info row
                    if (subscribeRowVisible)
                      ScaleTap(
                        onTap: () => context.goNamed(
                          'channel',
                          pathParameters: {'channelId': channelId},
                          queryParameters: {
                            'avatarUrl': cardInfo?.uploaderAvatar
                          },
                        ),
                        enableHaptic: false,
                        child: SubscribeRowWidget(
                          uploaderUrl: cardInfo?.uploaderAvatar ?? '',
                          uploader:
                              cardInfo?.uploaderName ?? locals.noUploaderName,
                          isVerified: cardInfo.uploaderVerified,
                          subscribed: isSubscribed,
                          onSubscribeTap: onSubscribeTap,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
