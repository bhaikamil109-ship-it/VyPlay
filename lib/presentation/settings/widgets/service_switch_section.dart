import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/enums.dart';

class ServiceSwitchSection extends StatelessWidget {
  const ServiceSwitchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.ytService != current.ytService ||
          previous.isBilibiliEnabled != current.isBilibiliEnabled,
      builder: (context, state) {
        final currentService = state.ytService ?? YouTubeServices.newpipe.name;
        final isBilibiliEnabled = state.isBilibiliEnabled ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.videocam_outlined, size: 24),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.service,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.serviceDescription,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox12,
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // YouTube Service Option
                  _ServiceOption(
                    icon: Icons.youtube_searched_for,
                    title: locals.youtube,
                    subtitle: 'YouTube videos and content',
                    isSelected: currentService != YouTubeServices.bilibili.name,
                    onTap: () {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setYoutubeService(
                              service: YouTubeServices.piped.name,
                            ),
                          );
                    },
                  ),
                  const Divider(height: 1, color: AppColors.divider),
                  // Bilibili Service Option
                  _ServiceOption(
                    icon: Icons.movie_outlined,
                    title: locals.bilibiliEnabled,
                    subtitle: locals.switchToBilibiliDescription,
                    isSelected: currentService == YouTubeServices.bilibili.name,
                    onTap: () {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.setYoutubeService(
                              service: YouTubeServices.bilibili.name,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
            kHeightBox12,
            if (currentService == YouTubeServices.bilibili.name) ...[
              Opacity(
                opacity: 0.9,
                child: Row(
                  children: [
                    Checkbox(
                      value: isBilibiliEnabled,
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
              kHeightBox8,
              Text(
                locals.swipeDirection,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              kHeightBox6,
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: (state.isSwipeLeftToRight ?? false) ? 1.0 : 0.0,
                      min: 0,
                      max: 1,
                      divisions: 1,
                      label: (state.isSwipeLeftToRight ?? false) ? 'LTR' : 'RTL',
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(
                              SettingsEvent.setSwipeDirection(
                                leftToRight: value.round() == 1,
                              ),
                            );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      (state.isSwipeLeftToRight ?? false) ? 'LTR' : 'RTL',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              kHeightBox8,
            ],
          ],
        );
      },
    );
  }
}

class _ServiceOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ServiceOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: kPadding12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.brand,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
