import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

/// Toggle for the Return YouTube Dislike count fallback.
class RydSettingsSection extends StatelessWidget {
  const RydSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isRydEnabled != current.isRydEnabled,
      builder: (context, state) {
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: const Icon(Icons.thumb_down_alt_outlined),
          title: Text(locals.rydTitle),
          subtitle: Text(locals.rydDescription),
          value: state.isRydEnabled ?? true,
          onChanged: (value) {
            context
                .read<SettingsBloc>()
                .add(SettingsEvent.rydToggled(enabled: value));
          },
        );
      },
    );
  }
}
