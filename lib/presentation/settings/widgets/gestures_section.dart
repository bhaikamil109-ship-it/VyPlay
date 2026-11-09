import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class GesturesSettingsSection extends StatelessWidget {
  const GesturesSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isSwipeGesturesEnabled != current.isSwipeGesturesEnabled,
      builder: (context, state) {
        final isEnabled = state.isSwipeGesturesEnabled ?? true;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.swipe),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.gestureControls,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          SettingsEvent.toggleSwipeGestures(enabled: value),
                        );
                  },
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.gestureControlsDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            if (isEnabled) ...[
              ListTile(
                leading: const Icon(Icons.touch_app),
                title: Text(locals.swipeToSeek),
                subtitle: Text(locals.swipeToSeekDescription),
                dense: true,
              ),
              ListTile(
                leading: const Icon(Icons.brightness_medium),
                title: Text(locals.swipeForBrightness),
                subtitle: Text(locals.swipeForBrightnessDescription),
                dense: true,
              ),
              ListTile(
                leading: const Icon(Icons.volume_up),
                title: Text(locals.swipeForVolume),
                subtitle: Text(locals.swipeForVolumeDescription),
                dense: true,
              ),
            ],
          ],
        );
      },
    );
  }
}
