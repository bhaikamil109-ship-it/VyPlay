import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/generated/l10n.dart';

class DownloadPreferencesSettingsSection extends StatelessWidget {
  const DownloadPreferencesSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.downloadPreferencesConfig != current.downloadPreferencesConfig,
      builder: (context, state) {
        final config = state.downloadPreferencesConfig;
        final downloadQuality = config?.downloadQuality ?? DownloadQuality.high;
        final includeSubtitles = config?.includeSubtitles ?? false;
        final overWifiOnly = config?.overWifiOnly ?? true;
        final autoDelete = config?.autoDelete ?? false;
        final autoDeleteDays = config?.autoDeleteDays ?? 7;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locals.downloadPreferences,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            kHeightBox4,
            Text(
              locals.downloadPreferencesDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            Text(
              locals.downloadQuality,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            kHeightBox8,
            SegmentedButton<DownloadQuality>(
              segments: const [
                ButtonSegment(
                  value: DownloadQuality.low,
                  icon: Icon(Icons.low_priority, size: 18),
                  label: Text('LOW'),
                ),
                ButtonSegment(
                  value: DownloadQuality.medium,
                  icon: Icon(Icons.adjust, size: 18),
                  label: Text('MED'),
                ),
                ButtonSegment(
                  value: DownloadQuality.high,
                  icon: Icon(Icons.high_quality, size: 18),
                  label: Text('HIGH'),
                ),
              ],
              selected: {downloadQuality},
              onSelectionChanged: (selection) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.downloadQualityChanged(quality: selection.first.name),
                    );
              },
              showSelectedIcon: false,
            ),
            kHeightBox16,
            SwitchListTile(
              title: Text(locals.includeSubtitles),
              subtitle: Text(locals.includeSubtitlesDescription),
              value: includeSubtitles,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.downloadSubtitlesToggled(enabled: value),
                    );
              },
              contentPadding: EdgeInsets.zero,
            ),
            kHeightBox8,
            SwitchListTile(
              title: Text(locals.downloadOverWifiOnly),
              subtitle: Text(locals.downloadOverWifiOnlyDescription),
              value: overWifiOnly,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.downloadOverWifiOnlyToggled(enabled: value),
                    );
              },
              contentPadding: EdgeInsets.zero,
            ),
            kHeightBox8,
            SwitchListTile(
              title: Text(locals.autoDeleteDownloads),
              subtitle: Text(locals.autoDeleteDescription),
              value: autoDelete,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.downloadAutoDeleteToggled(enabled: value),
                    );
              },
              contentPadding: EdgeInsets.zero,
            ),
            if (autoDelete) ...[
              kHeightBox8,
              Text(
                locals.autoDeleteAfter,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              kHeightBox4,
              SizedBox(
                width: 200,
                child: DropdownButtonFormField<int>(
                  initialValue: autoDeleteDays,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: kPadding12,
                      vertical: kPadding8,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadius8),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('1 day')),
                    DropdownMenuItem(value: 3, child: Text('3 days')),
                    DropdownMenuItem(value: 7, child: Text('7 days')),
                    DropdownMenuItem(value: 14, child: Text('14 days')),
                    DropdownMenuItem(value: 30, child: Text('30 days')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.downloadAutoDeleteDaysChanged(days: value),
                          );
                    }
                  },
                ),
              ),
            ],
            kHeightBox12,
          ],
        );
      },
    );
  }
}
