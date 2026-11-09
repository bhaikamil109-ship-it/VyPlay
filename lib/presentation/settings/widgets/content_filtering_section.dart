import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/generated/l10n.dart';

class ContentFilteringSettingsSection extends StatelessWidget {
  const ContentFilteringSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.restrictedModeConfig != current.restrictedModeConfig,
      builder: (context, state) {
        final config = state.restrictedModeConfig;
        final isEnabled = config?.enabled ?? false;
        final filterLevel = config?.filterLevel ?? RestrictedModeFilterLevel.standard;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_alt),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.restrictedMode,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.restrictedModeToggled(enabled: value));
                  },
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.restrictedModeDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            if (isEnabled) ...[
              Text(
                locals.filterLevel,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              kHeightBox8,
              SegmentedButton<RestrictedModeFilterLevel>(
                segments: const [
                  ButtonSegment(
                    value: RestrictedModeFilterLevel.standard,
                    icon: Icon(Icons.filter_1, size: 18),
                    label: Text('STD'),
                  ),
                  ButtonSegment(
                    value: RestrictedModeFilterLevel.strict,
                    icon: Icon(Icons.filter_2, size: 18),
                    label: Text('STRICT'),
                  ),
                ],
                selected: {filterLevel},
                onSelectionChanged: (selection) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.restrictedModeFilterChanged(level: selection.first),
                      );
                },
                showSelectedIcon: false,
              ),
              kHeightBox8,
              Text(
                filterLevel == RestrictedModeFilterLevel.standard
                    ? locals.filterStandardDescription
                    : locals.filterStrictDescription,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
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
