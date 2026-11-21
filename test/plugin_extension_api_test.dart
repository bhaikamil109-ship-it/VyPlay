import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/infrastructure/plugin/plugin_extension_api_impl.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';

void main() {
  group('PluginExtensionApi', () {
    test('denies capability when not granted', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {},
      );
      final result = await api.search('hello');
      expect(result.isFailure, isTrue);
      expect(result.error!.code, PluginErrorCodes.capabilityDenied);
    });

    test('search requires non-empty query', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.search},
      );
      final result = await api.search('   ');
      expect(result.isFailure, isTrue);
    });

    test('search succeeds with capability', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.search},
      );
      final result = await api.search('hello');
      expect(result.isSuccess, isTrue);
      expect(result.value, 'hello');
    });

    test('network capability without declared hosts is denied', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.network},
        sandbox: PluginSandboxImpl(),
      );
      final result = await api.networkRequest(
        url: 'https://api.example.com/data',
      );
      expect(result.isFailure, isTrue);
      expect(result.error!.code, PluginErrorCodes.capabilityDenied);
    });

    test('network host allowlist', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.network},
        allowedNetworkHosts: const {'api.example.com'},
        sandbox: PluginSandboxImpl(),
      );
      final ok = await api.networkRequest(url: 'https://api.example.com/x');
      expect(ok.isFailure, isTrue);
      expect(ok.error!.code, PluginErrorCodes.networkUnavailable);
      final denied = await api.networkRequest(url: 'https://evil.com/x');
      expect(denied.isFailure, isTrue);
      expect(denied.error!.code, PluginErrorCodes.capabilityDenied);
    });

    test('network fails closed when a plugin has no manifest allowlist', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.network},
        sandbox: PluginSandboxImpl(),
      );

      final result = await api.networkRequest(
        url: 'https://api.example.com/status',
      );

      expect(result.isFailure, isTrue);
      expect(result.error!.code, PluginErrorCodes.capabilityDenied);
    });

    test('readSetting denies sensitive keys', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.settingsRead},
        sandbox: PluginSandboxImpl(),
      );
      final denied = await api.readSetting('youtubeCookie');
      expect(denied.isFailure, isTrue);
      final ok = await api.readSetting('theme');
      expect(ok.isSuccess, isTrue);
    });

    test('playback requires capability', () async {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {PluginCapability.playback},
      );
      final result = await api.resolvePlayback('vid1');
      expect(result.isSuccess, isTrue);
      expect(result.value, 'vid1');
    });

    test('log requires diagnostics', () {
      final api = PluginExtensionApiImpl(
        pluginId: 'p',
        grantedCapabilities: const {},
      );
      expect(() => api.log('hi'), throwsA(isA<PluginCapabilityDenied>()));
    });
  });
}
