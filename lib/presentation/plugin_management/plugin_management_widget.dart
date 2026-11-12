import 'package:flutter/material.dart';

import 'package:vyplay/domain/plugin/plugin_manager.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart' as pc;

List<Map<String, String>> _pluginEntries(PluginManager manager) {
  final entries = <Map<String, String>>[];
  for (final plugin in manager.plugins) {
    final manifest = plugin.manifest;
    entries.add({
      'id': manifest.id,
      'name': manifest.name,
      'description': manifest.description,
      'provider': manifest.provider,
      'version': manifest.version,
      'status': manager.status(plugin.manifest.id).name,
    });
  }
  return entries;
}

Widget pluginManagementOverlay(BuildContext context, PluginManager manager) {
  final entries = _pluginEntries(manager);
  return Scaffold(
    appBar: AppBar(title: const Text('Plugins')),
    body: ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          leading: Icon(Icons.bug_report),
          title: Text(entry['name'] ?? ''),
          subtitle: Text(entry['description'] ?? ''),
          trailing: Switch(
            value: entry['status'] == 'enabled',
            onChanged: (value) {
              final id = entry['id']!;
              manager.setEnabled(id, value);
            },
          ),
        );
      },
    ),
  );
}

class PluginManagementScreen extends StatelessWidget {
  const PluginManagementScreen({super.key, required this.manager});

  final PluginManager manager;

  @override
  Widget build(BuildContext context) {
    return pluginManagementOverlay(context, manager);
  }
}

class PluginInfoList extends StatelessWidget {
  const PluginInfoList({super.key, required this.manager});

  final PluginManager manager;

  @override
  Widget build(BuildContext context) {
    final entries = _pluginEntries(manager);
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          title: Text(entry['name'] ?? ''),
          subtitle: Text(entry['description'] ?? ''),
          trailing: Chip(label: Text(entry['status'] ?? '')),
        );
      },
    );
  }
}

class PluginCapabilitiesView extends StatelessWidget {
  const PluginCapabilitiesView({super.key, required this.manager});

  final PluginManager manager;

  @override
  Widget build(BuildContext context) {
    final capabilities = <String, Set<pc.PluginCapability>>{};
    for (final plugin in manager.plugins) {
      capabilities[plugin.manifest.id] = Set<pc.PluginCapability>.from(manager.grantedCapabilities(plugin.manifest.id));
    }
    return ListView.builder(
      itemCount: capabilities.length,
      itemBuilder: (context, index) {
        final id = capabilities.keys.elementAt(index);
        return ListTile(
          title: Text(id),
          subtitle: Text(
            capabilities[id]!
                .map((c) => c.id)
                .toList(growable: false)
                .join(', '),
          ),
        );
      },
    );
  }
}
