import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class DeArrowSettingsSection extends StatelessWidget {
  const DeArrowSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isDeArrowEnabled != current.isDeArrowEnabled,
      builder: (context, state) {
        final isEnabled = state.isDeArrowEnabled ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.tune),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.dearrow,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          SettingsEvent.toggleDeArrow(enabled: value),
                        );
                  },
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.dearrowDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            if (isEnabled)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(kPadding12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(kRadius8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 20),
                    const SizedBox(width: kPadding8),
                    Expanded(
                      child: Text(
                        locals.dearrowInfo,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
