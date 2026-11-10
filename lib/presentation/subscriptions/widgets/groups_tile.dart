import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/presentation/subscription_groups/groups_sheet.dart';

class SubscriptionGroupsTile extends StatelessWidget {
  final String profileName;

  /// Called when the user taps a group inside the sheet, so the subscription
  /// list can be filtered down to that group's channels.
  final void Function(int groupId, String groupName)? onViewGroup;

  const SubscriptionGroupsTile({
    super.key,
    required this.profileName,
    this.onViewGroup,
  });

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: kPadding16, vertical: kPadding8),
      child: ListTile(
        leading: const Icon(Icons.folder),
        title: Text(locals.subscriptionGroups),
        subtitle: Text(locals.organizeSubscriptions),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SubscriptionGroupsSheet(
              profileName: profileName,
              onViewGroup: onViewGroup,
            ),
          );
        },
      ),
    );
  }
}
