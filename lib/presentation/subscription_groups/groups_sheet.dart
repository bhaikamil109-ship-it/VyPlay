import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/settings/settings_service.dart';
import 'package:vyplay/generated/l10n.dart';

class SubscriptionGroupsSheet extends StatefulWidget {
  final String profileName;
  final Function(int groupId, String channelId)? onAddToGroup;
  final Function(int groupId, String groupName)? onViewGroup;

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
  final SettingsService _settingsService = getIt<SettingsService>();

  List<Map<String, dynamic>> _groups = [];
  final Map<int, int> _memberCounts = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    final result = await _settingsService.getAllSubscriptionGroups(
      profileName: widget.profileName,
    );
    if (!mounted) return;

    await result.fold(
      (failure) async {
        setState(() {
          _groups = [];
          _isLoading = false;
        });
      },
      (groups) async {
        final counts = <int, int>{};
        await Future.wait(groups.map((group) async {
          final id = group['id'] as int;
          final members = await _settingsService.getGroupMembers(
            groupId: id,
            profileName: widget.profileName,
          );
          counts[id] = members.fold((_) => 0, (list) => list.length);
        }));
        if (!mounted) return;
        setState(() {
          _groups = groups;
          _memberCounts
            ..clear()
            ..addAll(counts);
          _isLoading = false;
        });
      },
    );
  }

  Future<void> _createGroup(String name) async {
    final result = await _settingsService.createSubscriptionGroup(
      groupName: name,
      profileName: widget.profileName,
    );
    if (!mounted) return;

    result.fold(
      (failure) => _showMessage('Unable to create group'),
      (_) {
        _showMessage(S.of(context).groupCreated);
        _loadGroups();
      },
    );
  }

  Future<void> _renameGroup(int groupId, String newName) async {
    final result = await _settingsService.renameSubscriptionGroup(
      groupId: groupId,
      newName: newName,
      profileName: widget.profileName,
    );
    if (!mounted) return;

    result.fold(
      (failure) => _showMessage('Unable to rename group'),
      (_) {
        _showMessage(S.of(context).groupRenamed);
        _loadGroups();
      },
    );
  }

  Future<void> _deleteGroup(int groupId) async {
    final result = await _settingsService.deleteSubscriptionGroup(
      groupId: groupId,
      profileName: widget.profileName,
    );
    if (!mounted) return;

    result.fold(
      (failure) => _showMessage('Unable to delete group'),
      (_) {
        _showMessage(S.of(context).groupDeleted);
        _loadGroups();
      },
    );
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _showCreateGroupDialog() async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
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
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                Navigator.pop(dialogContext, value);
              }
            },
            child: Text(S.of(dialogContext).create),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name != null) {
      await _createGroup(name);
    }
  }

  Future<void> _showRenameDialog(Map<String, dynamic> group) async {
    final controller =
        TextEditingController(text: group['groupName'] as String? ?? '');
    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(dialogContext).renameGroup),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
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
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                Navigator.pop(dialogContext, value);
              }
            },
            child: Text(S.of(dialogContext).save),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name != null) {
      await _renameGroup(group['id'] as int, name);
    }
  }

  Future<void> _confirmDelete(Map<String, dynamic> group) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(dialogContext).deleteGroup),
        content: Text(S.of(dialogContext).deleteGroupConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(S.of(dialogContext).cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(S.of(dialogContext).delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await _deleteGroup(group['id'] as int);
    }
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.subscriptionGroups),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showCreateGroupDialog,
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
                        onPressed: _showCreateGroupDialog,
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
                    final groupId = group['id'] as int;
                    final name = group['groupName'] as String? ?? '';
                    final count = _memberCounts[groupId] ?? 0;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _groupColor(context, group),
                        child: Text(
                          name.isEmpty ? '?' : name[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(name),
                      subtitle: Text('$count ${locals.channels}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        widget.onViewGroup?.call(groupId, name);
                        Navigator.pop(context);
                      },
                      onLongPress: () => _showGroupOptions(group),
                    );
                  },
                ),
    );
  }

  Color _groupColor(BuildContext context, Map<String, dynamic> group) {
    final hex = group['colorHex'] as String?;
    if (hex != null && hex.isNotEmpty) {
      final normalized = hex.replaceFirst('#', '');
      final value = int.tryParse(normalized, radix: 16);
      if (value != null) {
        return Color(normalized.length <= 6 ? 0xFF000000 | value : value);
      }
    }
    return Theme.of(context).colorScheme.primary;
  }

  void _showGroupOptions(Map<String, dynamic> group) {
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
                _showRenameDialog(group);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: Text(
                S.of(ctx).deleteGroup,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(ctx);
                _confirmDelete(group);
              },
            ),
          ],
        ),
      ),
    );
  }
}
