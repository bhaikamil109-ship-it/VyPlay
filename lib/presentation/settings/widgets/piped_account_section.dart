import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/application/subscribe/subscribe_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/piped_account/piped_account_service.dart';
import 'package:vyplay/domain/subscribes/models/subscribe.dart';
import 'package:vyplay/domain/subscribes/subscribe_services.dart';

/// Piped account login/register/logout and subscription sync.
///
/// Uses the official Piped-Backend routes only:
/// `/register`, `/login`, `/logout`, `/subscriptions`, `/subscribe`,
/// `/unsubscribe`, `/user/playlists`.
class PipedAccountSection extends StatefulWidget {
  const PipedAccountSection({super.key});

  @override
  State<PipedAccountSection> createState() => _PipedAccountSectionState();
}

class _PipedAccountSectionState extends State<PipedAccountSection> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;
  String? _message;

  PipedAccountService get _account => getIt<PipedAccountService>();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      await action();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _loginOrRegister({required bool register}) async {
    final username = _username.text.trim();
    final password = _password.text;
    if (username.isEmpty || password.isEmpty) {
      setState(() => _message = 'Username and password are required');
      return;
    }
    await _run(() async {
      final result = register
          ? await _account.register(username: username, password: password)
          : await _account.login(username: username, password: password);
      result.fold(
        (failure) => setState(() => _message = 'Piped error: $failure'),
        (token) {
          context.read<SettingsBloc>().add(
                SettingsEvent.savePipedSession(
                  token: token,
                  username: username,
                ),
              );
          setState(() => _message = register
              ? 'Account created and signed in'
              : 'Signed in to Piped');
        },
      );
    });
  }

  Future<void> _logout() async {
    final token = context.read<SettingsBloc>().state.pipedAuthToken;
    if (token == null) return;
    await _run(() async {
      await _account.logout(token: token);
      if (!mounted) return;
      context.read<SettingsBloc>().add(const SettingsEvent.clearPipedSession());
      setState(() => _message = 'Signed out');
    });
  }

  Future<void> _pullSubscriptions() async {
    final token = context.read<SettingsBloc>().state.pipedAuthToken;
    final profile = context.read<SettingsBloc>().state.currentProfile;
    if (token == null) return;
    await _run(() async {
      final result = await _account.getSubscriptions(token: token);
      await result.fold(
        (failure) async => setState(() => _message = 'Piped error: $failure'),
        (subscriptions) async {
          final subscribeService = getIt<SubscribeServices>();
          for (final subscription in subscriptions) {
            await subscribeService.addSubscriberInfo(
              subscribeInfo: Subscribe(
                id: subscription.id,
                channelName: subscription.name,
                avatarUrl: subscription.avatarUrl,
                isVerified: subscription.verified,
              ),
              profileName: profile,
            );
          }
          if (!mounted) return;
          context.read<SubscribeBloc>().add(
                SubscribeEvent.getAllSubscribeList(profileName: profile),
              );
          setState(() => _message =
              'Pulled ${subscriptions.length} subscriptions from Piped');
        },
      );
    });
  }

  Future<void> _pushSubscriptions() async {
    final token = context.read<SettingsBloc>().state.pipedAuthToken;
    if (token == null) return;
    final local = context.read<SubscribeBloc>().state.subscribedChannels;
    await _run(() async {
      var pushed = 0;
      for (final channel in local) {
        final result = await _account.subscribe(
          token: token,
          channelId: channel.id,
        );
        if (result.isRight()) pushed++;
      }
      if (!mounted) return;
      setState(() => _message = 'Pushed $pushed subscriptions to Piped');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.pipedAuthToken != current.pipedAuthToken ||
          previous.pipedAuthUsername != current.pipedAuthUsername,
      builder: (context, state) {
        final signedIn = (state.pipedAuthToken ?? '').isNotEmpty;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle_outlined, size: 24),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    'Piped account',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                if (signedIn)
                  Chip(
                    label: Text(state.pipedAuthUsername ?? 'signed in'),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
            kHeightBox4,
            Text(
              signedIn
                  ? 'Session saved locally. Subscriptions can be pulled from or '
                      'pushed to this Piped account.'
                  : 'Register or sign in to your Piped account. Public instances '
                      'may disable registration.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            kHeightBox12,
            if (!signedIn) ...[
              TextField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  FilledButton(
                    onPressed: _busy ? null : () => _loginOrRegister(register: false),
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: _busy ? null : () => _loginOrRegister(register: true),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ] else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: _busy ? null : _pullSubscriptions,
                    icon: const Icon(Icons.cloud_download_outlined, size: 18),
                    label: const Text('Pull subscriptions'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _busy ? null : _pushSubscriptions,
                    icon: const Icon(Icons.cloud_upload_outlined, size: 18),
                    label: const Text('Push subscriptions'),
                  ),
                  TextButton.icon(
                    onPressed: _busy ? null : _logout,
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text('Logout'),
                  ),
                ],
              ),
            if (_busy) const Padding(
              padding: EdgeInsets.only(top: 8),
              child: LinearProgressIndicator(),
            ),
            if (_message != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _message!,
                  style: theme.textTheme.bodySmall,
                ),
              ),
          ],
        );
      },
    );
  }
}
