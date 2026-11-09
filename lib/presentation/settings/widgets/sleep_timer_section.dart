import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/sleep_timer/sleep_timer_sheet.dart';

class SleepTimerSettingsSection extends StatelessWidget {
  const SleepTimerSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.sleepTimerConfig != current.sleepTimerConfig,
      builder: (context, state) {
        final config = state.sleepTimerConfig;
        final isSet = config != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.timer),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.sleepTimer,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (isSet)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding12,
                      vertical: kPadding4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius:
                          BorderRadius.circular(kRadius8),
                    ),
                    child: Text(
                      '${config!.totalDuration.inMinutes}:${(config.totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                    ),
                  ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.sleepTimerDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const DismissibleSleepTimerSheet(),
                  );
                },
                icon: const Icon(Icons.timer),
                label: Text(isSet ? locals.clearSleepTimer : locals.sleepTimer),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: kPadding12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DismissibleSleepTimerSheet extends StatelessWidget {
  const DismissibleSleepTimerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('sleep_timer_sheet'),
      onDismissed: (_) => Navigator.pop(context),
      child: const SleepTimerSheet(),
    );
  }
}
