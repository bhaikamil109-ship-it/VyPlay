import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/domain/plugin/plugin_manifest.dart';

PluginManifest _validManifest() {
  return const PluginManifest(
    id: 'com.example.testplugin',
    name: 'Test Plugin',
    version: '1.0.0',
    description: 'A test plugin',
    provider: 'VyPlay',
    platforms: ['android'],
    capabilities: [PluginCapability.search, PluginCapability.diagnostics],
    minAppVersion: '1.0.0',
  );
}

void main() {
  group('PluginManifest validation', () {
    test('valid manifest reports no errors', () {
      expect(_validManifest().validate(), isEmpty);
      expect(_validManifest().isValid, isTrue);
    });

    test('rejects empty id', () {
      final manifest = _validManifest().copyWithId('');
      expect(manifest.validate(), isNotEmpty);
    });

    test('rejects invalid id characters', () {
      final manifest = _validManifest().copyWithId('Bad ID!');
      expect(manifest.validate(), isNotEmpty);
    });

    test('rejects empty name', () {
      final manifest = _validManifest().copyWithName('');
      expect(manifest.validate(), isNotEmpty);
    });

    test('rejects non-semver version', () {
      final manifest = _validManifest().copyWithVersion('1.0');
      expect(manifest.validate(), isNotEmpty);
    });

    test('rejects empty platforms', () {
      final manifest = _validManifest().copyWithPlatforms(const []);
      expect(manifest.validate(), isNotEmpty);
    });

    test('rejects duplicate capabilities', () {
      final manifest = const PluginManifest(
        id: 'com.example.dup',
        name: 'Dup',
        version: '1.0.0',
        description: 'd',
        provider: 'p',
        platforms: ['android'],
        capabilities: [
          PluginCapability.search,
          PluginCapability.search,
        ],
        minAppVersion: '1.0.0',
      );
      expect(manifest.validate(), isNotEmpty);
    });

    test('fromJson round-trips', () {
      final json = _validManifest().toJson();
      final parsed = PluginManifest.fromJson(json);
      expect(parsed.id, _validManifest().id);
      expect(parsed.capabilities, _validManifest().capabilities);
      expect(parsed.validate(), isEmpty);
    });
  });

  group('PluginCapability', () {
    test('parses known ids', () {
      expect(PluginCapabilityX.tryParse('search'), PluginCapability.search);
      expect(PluginCapabilityX.tryParse('settings.read'),
          PluginCapability.settingsRead);
    });

    test('returns null for unknown id', () {
      expect(PluginCapabilityX.tryParse('admin'), isNull);
    });
  });

  group('PluginResult', () {
    test('success has no error', () {
      const result = PluginResult<String>.success('ok');
      expect(result.isSuccess, isTrue);
      expect(result.value, 'ok');
    });

    test('failure carries error', () {
      const failure = PluginFailure(
        pluginId: 'p',
        code: 'x',
        message: 'boom',
      );
      const result = PluginResult<String>.failure(failure);
      expect(result.isFailure, isTrue);
      expect(result.error, failure);
    });
  });

  group('PluginCapabilityDenied', () {
    test('toString includes plugin and capability', () {
      const denied = PluginCapabilityDenied('p', PluginCapability.search);
      expect(denied.toString(), contains('p'));
      expect(denied.toString(), contains('search'));
    });
  });
}

extension _ManifestCopy on PluginManifest {
  PluginManifest copyWithId(String id) => PluginManifest(
        id: id,
        name: name,
        version: version,
        description: description,
        provider: provider,
        platforms: platforms,
        capabilities: capabilities,
        minAppVersion: minAppVersion,
        configSchema: configSchema,
        homepage: homepage,
      );

  PluginManifest copyWithName(String name) => PluginManifest(
        id: id,
        name: name,
        version: version,
        description: description,
        provider: provider,
        platforms: platforms,
        capabilities: capabilities,
        minAppVersion: minAppVersion,
        configSchema: configSchema,
        homepage: homepage,
      );

  PluginManifest copyWithVersion(String version) => PluginManifest(
        id: id,
        name: name,
        version: version,
        description: description,
        provider: provider,
        platforms: platforms,
        capabilities: capabilities,
        minAppVersion: minAppVersion,
        configSchema: configSchema,
        homepage: homepage,
      );

  PluginManifest copyWithPlatforms(List<String> platforms) => PluginManifest(
        id: id,
        name: name,
        version: version,
        description: description,
        provider: provider,
        platforms: platforms,
        capabilities: capabilities,
        minAppVersion: minAppVersion,
        configSchema: configSchema,
        homepage: homepage,
      );
}