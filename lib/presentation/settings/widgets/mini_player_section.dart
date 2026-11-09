import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class MiniPlayerSettingsSection extends StatelessWidget {
  const MiniPlayerSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.miniPlayerConfig != current.miniPlayerConfig,
      builder: (context, state) {
        final config = state.miniPlayerConfig;
        final isEnabled = config?.enabled ?? false;
        final autoExpand = config?.autoExpand ?? true;
        final tapToExpand = config?.tapToExpand ?? true;
        final doubleTapToExpand = config?.doubleTapToExpand ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.play_arrow),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.miniPlayer,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.miniPlayerToggled(enabled: value));
                  },
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.miniPlayerDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            if (isEnabled) ...[
              SwitchListTile(
                title: Text(locals.autoExpandMiniPlayer),
                subtitle: Text(locals.autoExpandDescription),
                value: autoExpand,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.miniPlayerAutoExpandChanged(enabled: value),
                      );
                },
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: Text(locals.tapToExpandMiniPlayer),
                subtitle: Text(locals.tapToExpandDescription),
                value: tapToExpand,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.miniPlayerTapToExpandChanged(enabled: value),
                      );
                },
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: Text(locals.doubleTapToExpandMiniPlayer),
                subtitle: Text(locals.doubleTapToExpandDescription),
                value: doubleTapToExpand,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(
                        SettingsEvent.miniPlayerDoubleTapToExpandChanged(enabled: value),
                      );
                },
                contentPadding: EdgeInsets.zero,
              ),
            ],
            kHeightBox12,
          ],
        );
      },
    );
  }
}
