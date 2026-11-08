import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/app_info.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/settings/utils/launch_url.dart';
import 'package:go_router/go_router.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).about,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
        ListTile(
          title: Text(
            AppInfo.myApp.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(AppInfo.myApp.description),
          leading: const Icon(Icons.play_circle_outline_rounded),
          trailing: const Icon(CupertinoIcons.arrow_up_right_square),
          onTap: () => urlLaunch(AppInfo.myApp.url),
        ),
        ListTile(
          title: Text(S.of(context).developer,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(AppInfo.developerInfos.first.name),
          leading: const Icon(Icons.code),
          trailing: const Icon(CupertinoIcons.chat_bubble_2),
          onTap: () => urlLaunch(AppInfo.developerInfos.first.url),
        ),
        ListTile(
          title: Text(S.of(context).translators,
              style: Theme.of(context).textTheme.titleMedium),
          leading: const Icon(Icons.translate_rounded),
          onTap: () => context.goNamed('translators'),
        ),
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return ListTile(
              title: Text(S.of(context).version,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(state.version ?? ""),
              leading: const Icon(CupertinoIcons.info),
              onLongPress: () => context.goNamed('debug'),
            );
          },
        ),
        // GPLv3 requires that the original authors stay credited. This block is
        // deliberately not removable through settings.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(
            'Open source',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
        ),
        for (final upstream in AppInfo.upstreamInfos)
          ListTile(
            dense: true,
            title: Text(upstream.name,
                style: Theme.of(context).textTheme.titleSmall),
            subtitle: Text(upstream.description),
            leading: const Icon(Icons.link_rounded, size: 20),
            onTap: () => urlLaunch(upstream.url),
          ),
      ],
    );
  }
}
