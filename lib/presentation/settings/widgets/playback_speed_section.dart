import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class PlaybackSpeedSettingsSection extends StatelessWidget {
  const PlaybackSpeedSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.playbackSpeed != current.playbackSpeed ||
          previous.isAutoplayNextVideoEnabled != current.isAutoplayNextVideoEnabled ||
          previous.isShowRelatedInQueueEnabled != current.isShowRelatedInQueueEnabled ||
          previous.queueDismissTime != current.queueDismissTime,
      builder: (context, state) {
        final currentSpeed = state.playbackSpeed ?? 1.0;
        final isAutoplayEnabled = state.isAutoplayNextVideoEnabled ?? true;
        final isRelatedInQueueEnabled = state.isShowRelatedInQueueEnabled ?? true;
        final dismissTime = state.queueDismissTime ?? 30;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.speed),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.playbackSpeed,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.playbackSpeedDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            Text(
              locals.defaultPlaybackSpeed,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            SegmentedButton<double>(
              segments: const [
                ButtonSegment(
                  value: 0.5,
                  icon: Icon(Icons.speed_5, size: 18),
                  label: Text('0.5x'),
                ),
                ButtonSegment(
                  value: 0.75,
                  icon: Icon(Icons.speed_4, size: 18),
                  label: Text('0.75x'),
                ),
                ButtonSegment(
                  value: 1.0,
                  icon: Icon(Icons.speed_1x, size: 18),
                  label: Text('1x'),
                ),
                ButtonSegment(
                  value: 1.25,
                  icon: Icon(Icons.speed_2, size: 18),
                  label: Text('1.25x'),
                ),
                ButtonSegment(
                  value: 1.5,
                  icon: Icon(Icons.speed_3, size: 18),
                  label: Text('1.5x'),
                ),
                ButtonSegment(
                  value: 2.0,
                  icon: Icon(Icons.speed_4x, size: 18),
                  label: Text('2x'),
                ),
              ],
              selected: {currentSpeed},
              onSelectionChanged: (selection) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.setPlaybackSpeed(speed: selection.first),
                    );
              },
              showSelectedIcon: false,
            ),
            kHeightBox15,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isAutoplayEnabled,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleAutoplayNextVideo(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.autoplayNextVideo,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.autoplayNextVideoDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox15,
            const Divider(),
            kHeightBox8,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isRelatedInQueueEnabled,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleShowRelatedInQueue(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.showRelatedInQueue,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.showRelatedInQueueDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Text(
              locals.queueDismissTimeout,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: dismissTime.toDouble(),
                    min: 0,
                    max: 120,
                    divisions: 12,
                    label: '${dismissTime}s',
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setQueueDismissTime(
                              seconds: value.round()),
                        );
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${dismissTime}s',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            kHeightBox12,
            const Divider(),
            kHeightBox8,
            Text(
              locals.autoplayCountdown,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: (autoplayCountdown ?? 5).toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: '${autoplayCountdown ?? 5}s',
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setAutoplayCountdown(
                              seconds: value.round()),
                        );
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${autoplayCountdown ?? 5}s',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            kHeightBox15,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isDisableAutoplayOnCellularEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleDisableAutoplayOnCellular(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.disableAutoplayOnCellular,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.disableAutoplayOnCellularDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox15,
            const Divider(),
            kHeightBox8,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isAutoQueueEnabled ?? true,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleAutoQueue(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.autoQueue,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.autoQueueDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isBufferPreloadEnabled ?? true,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleBufferPreload(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.bufferPreload,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.bufferPreloadDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isAutoQualityAdjustEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleAutoQualityAdjust(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.autoQualityAdjust,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.autoQualityAdjustDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox15,
            const Divider(),
            kHeightBox8,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isBackgroundPlaybackEnabled ?? true,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleBackgroundPlayback(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.backgroundPlayback,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.backgroundPlaybackDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isNotificationControlsEnabled ?? true,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleNotificationControls(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.notificationControls,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.notificationControlsDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isDataSaverEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleDataSaver(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.dataSaver,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.dataSaverDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            const Divider(),
            kHeightBox8,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isHideWatchedVideosEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleHideWatchedVideos(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.hideWatchedVideos,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.hideWatchedVideosDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Text(
              locals.mobileDataQuality,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: (mobileDataQuality ?? 360).toDouble(),
                    min: 0,
                    max: 1080,
                    divisions: 8,
                    label: '${mobileDataQuality ?? 360}p',
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setMobileDataQuality(
                              quality: value.round()),
                        );
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${mobileDataQuality ?? 360}p',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isDownloadQueueItemsEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleDownloadQueueItems(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.downloadQueueItems,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.downloadQueueItemsDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isRichCaptionRenderingEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleRichCaptionRendering(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.richCaptionRendering,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.richCaptionRenderingDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            const Divider(),
            kHeightBox8,
            Opacity(
              opacity: 0.9,
              child: Row(
                children: [
                  Checkbox(
                    value: isBilibiliEnabled ?? false,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.toggleBilibiliEnabled(
                              enabled: value ?? false,
                            ),
                          );
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locals.bilibiliEnabled,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          locals.bilibiliEnabledDescription,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox12,
            Text(
              locals.swipeDirection,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: (isSwipeLeftToRight ?? false) ? 1.0 : 0.0,
                    min: 0,
                    max: 1,
                    divisions: 1,
                    label: (isSwipeLeftToRight ?? false) ? 'LTR' : 'RTL',
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setSwipeDirection(
                              leftToRight: value.round() == 1,
                        );
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    (isSwipeLeftToRight ?? false) ? 'LTR' : 'RTL',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            kHeightBox12,
          ],
        );
      },
    );
  }
}
