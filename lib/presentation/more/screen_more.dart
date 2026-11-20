import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/application.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/main_navigation/navigation_labels.dart';

/// Secondary destinations that intentionally stay off the compact phone
/// navigation bar. Core content destinations remain one tap away.
class ScreenMore extends StatelessWidget {
  const ScreenMore({
    required this.onOpenPage,
    super.key,
  });

  final ValueChanged<String> onOpenPage;

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) => previous.ytService != current.ytService,
      builder: (context, state) {
        final showTrending = state.ytService != YouTubeServices.newpipe.name;

        return Scaffold(
          appBar: AppBar(
            title: Text(moreNavigationLabel(Localizations.localeOf(context))),
            scrolledUnderElevation: 0,
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                if (showTrending)
                  _MoreDestinationTile(
                    title: locals.trending,
                    icon: CupertinoIcons.flame_fill,
                    onTap: () => onOpenPage('trending'),
                  ),
                _MoreDestinationTile(
                  title: locals.downloads,
                  icon: CupertinoIcons.arrow_down_circle_fill,
                  onTap: () => onOpenPage('downloads'),
                ),
                _MoreDestinationTile(
                  title: locals.settings,
                  icon: CupertinoIcons.settings,
                  onTap: () => onOpenPage('settings'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MoreDestinationTile extends StatelessWidget {
  const _MoreDestinationTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        minVerticalPadding: 14,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4,
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(CupertinoIcons.chevron_forward, size: 18),
        onTap: onTap,
      ),
    );
  }
}
