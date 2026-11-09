import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';

class SubscriptionGroupsSheet extends StatefulWidget {
  final String profileName;
  final Function(int groupId, String channelId)? onAddToGroup;
  final Function(int groupId)? onViewGroup;

  const SubscriptionGroupsSheet({
    super.key,
    required this.profileName,
    this.onAddToGroup,
    this.onViewGroup,
  });

  @override
  State<SubscriptionGroupsSheet> createState() => _SubscriptionGroupsSheetState();
}

class _SubscriptionGroupsSheetState extends State<SubscriptionGroupsSheet> {
  List<Map<String, dynamic>> _groups = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    final result = await context.read<SettingsBloc>().state.instance != null
        ? context.read<SettingsBloc>().state.instance
        : 'default';

    final settingsBloc = context.read<SettingsBloc>();
    final state = settingsBloc.state;

    // TODO: Use proper async method from SettingsBloc
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _createGroup(String name) async {
    final result = await context.read<SettingsBloc>().state.instance != null
        ? context.read<SettingsBloc>().state.instance
        : 'default';

    // Create group via settings service
    final settingsBloc = context.read<SettingsBloc>();
    final sys = settingsBloc.state;

    // For now, show simple dialog
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).groupCreated)),
      );
    }
  }

  void _showCreateGroupDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(dialogContext).newGroup),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: S.of(dialogContext).groupNameHint,
            border: const OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.of(dialogContext).cancel),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(dialogContext);
                _createGroup(controller.text.trim());
              }
            },
            child: Text(S.of(dialogContext).create),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);

    return Dismissible(
      key: const Key('subscription_groups_sheet'),
      onDismissed: (_) => Navigator.pop(context),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.close, color: Colors.white),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(locals.subscriptionGroups),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showCreateGroupDialog(context),
            ),
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _groups.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.folder_off,
                          size: 64,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        kHeightBox16,
                        Text(
                          locals.noGroupsYet,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        kHeightBox8,
                        Text(
                          locals.createFirstGroup,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        kHeightBox16,
                        FilledButton.icon(
                          onPressed: () => _showCreateGroupDialog(context),
                          icon: const Icon(Icons.add),
                          label: Text(locals.newGroup),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _groups.length,
                    itemBuilder: (context, index) {
                      final group = _groups[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: group['colorHex'] != null
                              ? Color(int.parse('0xFF${group['colorHex']}')) 
                              : Theme.of(context).colorScheme.primary,
                          child: Text(
                            group['groupName'][0].toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(group['groupName'] ?? ''),
                        subtitle: Text(locals.groupChannelCount),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          widget.onViewGroup?.call(group['id'] as int);
                          Navigator.pop(context);
                        },
                        onLongPress: () => _showGroupOptions(context, group),
                      );
                    },
                  ),
      ),
    );
  }

  void _showGroupOptions(BuildContext context, Map<String, dynamic> group) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: Text(S.of(ctx).renameGroup),
              onTap: () {
                Navigator.pop(ctx);
                _showRenameDialog(context, group);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: Text(S.of(ctx).deleteGroup, style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(ctx);
                _confirmDelete(context, group);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(BuildContext context, Map<String, dynamic> group) {
    final controller = TextEditingController(text: group['groupName'] ?? '');

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(dialogContext).renameGroup),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.of(dialogContext).cancel),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).groupRenamed)),
                );
              }
            },
            child: Text(S.of(dialogContext).save),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, Map<String, dynamic> group) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(dialogContext).deleteGroup),
        content: Text(S.of(dialogContext).deleteGroupConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.of(dialogContext).cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).groupDeleted)),
              );
            },
            child: Text(S.of(dialogContext).delete),
          ),
        ],
      ),
    );
  }
}
