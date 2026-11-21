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

    test('network access is denied without an explicit host allowlist', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/data'),
          capabilities: {PluginCapability.network},
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/data'),
          capabilities: {PluginCapability.network},
          declaredHosts: const {},
        ),
        isFalse,
      );
    });

    test('network allowlist matches only the exact declared DNS host', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/data'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'api.example.com'},
        ),
        isTrue,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://sub.api.example.com/data'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'api.example.com'},
        ),
        isFalse,
      );
    });

    test('network denies local/IP hosts, credentials and non-standard ports', () {
      final sandbox = PluginSandboxImpl();
      const capabilities = {PluginCapability.network};
      const allowedHosts = {
        'api.example.com',
        'localhost',
        'printer.local',
        '127.0.0.1',
        '192.168.1.10',
      };
      for (final url in [
        'http://127.0.0.1/',
        'http://192.168.1.10/',
        'http://[::1]/',
        'http://[fe80::1]/',
        'http://localhost/',
        'http://printer.local/',
        'https://user@api.example.com/',
        'https://api.example.com:8443/',
      ]) {
        expect(
          sandbox.isNetworkAllowed(
            'p',
            Uri.parse(url),
            capabilities: capabilities,
            declaredHosts: allowedHosts,
          ),
          isFalse,
          reason: url,
        );
      }
    });

    test('network is denied without an explicit host allowlist', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/path'),
          capabilities: {PluginCapability.network},
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/path'),
          capabilities: {PluginCapability.network},
          declaredHosts: {},
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com/path'),
          declaredHosts: {'api.example.com'},
        ),
        isFalse,
      );
    });

    test('network requires HTTPS, standard port and no user info', () {
      final sandbox = PluginSandboxImpl();
      const capabilities = {PluginCapability.network};
      const hosts = {'api.example.com'};

      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('http://api.example.com/path'),
          capabilities: capabilities,
          declaredHosts: hosts,
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com:8443/path'),
          capabilities: capabilities,
          declaredHosts: hosts,
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://user@api.example.com/path'),
          capabilities: capabilities,
          declaredHosts: hosts,
        ),
        isFalse,
      );
    });

    test('network denies IP literals and local or reserved hosts', () {
      final sandbox = PluginSandboxImpl();
      const capabilities = {PluginCapability.network};
      for (final url in [
        'https://127.0.0.1/',
        'https://10.0.0.2/',
        'https://192.168.1.10/',
        'https://172.16.0.1/',
        'https://[::1]/',
        'https://router.local/',
        'https://service.internal/',
        'https://host.test/',
      ]) {
        final uri = Uri.parse(url);
        expect(
          sandbox.isNetworkAllowed(
            'p',
            uri,
            capabilities: capabilities,
            declaredHosts: {uri.host},
          ),
          isFalse,
          reason: 'Expected $url to be rejected',
        );
      }
    });

    test('network allowlist uses exact host matching', () {
      final sandbox = PluginSandboxImpl();
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://sub.api.example.com/path'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'api.example.com'},
        ),
        isFalse,
      );
      expect(
        sandbox.isNetworkAllowed(
          'p',
          Uri.parse('https://api.example.com./path'),
          capabilities: {PluginCapability.network},
          declaredHosts: {'api.example.com'},
        ),
        isTrue,
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

    test('setting readability denies sensitive keys across separators', () {
      final sandbox = PluginSandboxImpl();
      expect(sandbox.isSettingReadable('theme'), isTrue);
      expect(sandbox.isSettingReadable('home.region'), isTrue);
      for (final key in [
        'youtubeCookie',
        'x-api-key',
        'refresh-token',
        'client-secret',
        'signing_key',
        'private-key',
        'oauth_access_token',
        'bearer-token',
        'jwt-secret',
        'session.id',
      ]) {
        expect(
          sandbox.isSettingReadable(key),
          isFalse,
          reason: 'Sensitive setting "$key" must not be readable',
        );
      }
      expect(sandbox.isSettingReadable(''), isFalse);
      expect(sandbox.isSettingReadable('---'), isFalse);
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
