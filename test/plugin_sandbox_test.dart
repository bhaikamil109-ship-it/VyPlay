import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_context.dart';
import 'package:vyplay/infrastructure/plugin/plugin_sandbox_impl.dart';

void main() {
  group('PluginSandbox', () {
    test('run returns success', () async {
      final sandbox = PluginSandboxImpl();
      final result = await sandbox.run('p', () async => 42);
      expect(result.isSuccess, isTrue);
      expect(result.value, 42);
    });

    test('run captures thrown errors', () async {
      final sandbox = PluginSandboxImpl();
      final result = await sandbox.run('p', () async {
        throw StateError('boom');
      });
      expect(result.isFailure, isTrue);
      expect(result.error!.message, contains('boom'));
    });

    test('run times out', () async {
      final sandbox = PluginSandboxImpl();
      final result = await sandbox.run(
        'p',
        () async {
          await Future.delayed(const Duration(seconds: 1));
          return 1;
        },
        timeout: const Duration(milliseconds: 10),
      );
      expect(result.isFailure, isTrue);
      expect(result.error!.message, contains('timed out'));
    });

    test('network allowlist enforced', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://example.com'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'example.com'},
        ),
        isTrue,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://evil.com'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'example.com'},
        ),
        isFalse,
      );
    });

    test('network denied without capability', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://example.com'),
          capabilities: {},
        ),
        isFalse,
      );
    });

    test('network blocks localhost', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('http://localhost:8080'),
          capabilities: {PluginCapability.network},
        ),
        isFalse,
      );
    });

    test('setting readability denies sensitive keys', () {
      final sandbox = PluginSandboxImpl();
      expect(sandbox.isSettingReadable('theme'), isTrue);
      expect(sandbox.isSettingReadable('youtubeCookie'), isFalse);
      expect(sandbox.isSettingReadable(''), isFalse);
    });

    test('capability helpers', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.hasCapability('p', PluginCapability.search,
            granted: {PluginCapability.search}),
        isTrue,
      );
      expect(() => sandbox.requireCapability('p', PluginCapability.search,
          granted: {}), throwsA(isA<PluginCapabilityDenied>()));
    });

    test('rate limiting', () {
      final sandbox = PluginSandboxImpl(maxCallsPerWindow: 2);
      expect(sandbox.tryAcquire('p'), isTrue);
      expect(sandbox.tryAcquire('p'), isTrue);
      expect(sandbox.tryAcquire('p'), isFalse);
      sandbox.reset('p');
      expect(sandbox.tryAcquire('p'), isTrue);
    });
  });
}
