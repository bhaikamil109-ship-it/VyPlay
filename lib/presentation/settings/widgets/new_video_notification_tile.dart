import 'package:flutter/material.dart';
import 'package:vyplay/core/services/subscription_notifier.dart';
import 'package:vyplay/generated/l10n.dart';

/// Switch for new-upload notifications from subscribed channels.
///
/// This tile owns its state rather than going through `SettingsBloc`: the bloc's
/// state and event unions are freezed-generated, and adding a field there needs
/// a `build_runner` pass. The preference is persisted in the same settings table
/// the bloc uses, so it can be folded into the bloc later without a migration.
class NewVideoNotificationTile extends StatefulWidget {
  const NewVideoNotificationTile({super.key});

  @override
  State<NewVideoNotificationTile> createState() =>
      _NewVideoNotificationTileState();
}

class _NewVideoNotificationTileState extends State<NewVideoNotificationTile> {
  final _notifier = SubscriptionNotifier();
  bool _busy = false;
  ({DateTime? at, int count, String? error})? _lastRun;

  @override
  void initState() {
    super.initState();
    _notifier.addListener(_onChanged);
    _notifier.loadEnabled();
    _loadLastRun();
  }

  /// Shows whether the scheduled background check has actually run.
  Future<void> _loadLastRun() async {
    final run = await _notifier.loadBackgroundRun();
    if (mounted) setState(() => _lastRun = run);
  }

  /// Human-readable summary of the last background poll.
  String _lastRunLabel() {
    final run = _lastRun;
    if (run == null || run.at == null) {
      return 'Background check has not run yet';
    }
    final age = DateTime.now().difference(run.at!);
    final when = age.inMinutes < 60
        ? '${age.inMinutes} min ago'
        : age.inHours < 24
            ? '${age.inHours} h ago'
            : '${age.inDays} d ago';
    if (run.error != null) return 'Last background check failed ($when)';
    return 'Last background check $when \u00b7 ${run.count} new';
  }

  @override
  void dispose() {
    _notifier.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _toggle(bool value) async {
    if (_busy) return;
    setState(() => _busy = true);
    final applied = await _notifier.setEnabled(value);
    if (!mounted) return;
    setState(() => _busy = false);

    // setEnabled returns false when the notification permission was refused,
    // so tell the user why the switch stayed off.
    if (value && !applied) {
      final locals = S.of(context);
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(locals.notificationsDenied)));
      return;
    }
    if (applied) {
      // Establishes the per-channel baseline right away so the first real check
      // has something to compare against.
      _notifier.checkForNewVideos(force: true);
      // setEnabled already registered the periodic job; refresh the line that
      // reports on it.
      _loadLastRun();
    }
  }

  /// Runs a check immediately instead of waiting for the next app resume.
  ///
  /// The notifier throttles automatic checks; `force` is what makes this a
  /// manual action rather than a no-op.
  Future<void> _checkNow() async {
    if (_busy) return;
    setState(() => _busy = true);
    await _notifier.checkForNewVideos(force: true);
    if (!mounted) return;
    setState(() => _busy = false);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(S.of(context).checkNowDone)));
  }

  @override
  Widget build(BuildContext context) {
    if (!SubscriptionNotifier.isSupported) return const SizedBox.shrink();
    final locals = S.of(context);

    return Column(
      children: [
        ListTile(
          title: Text(locals.newVideoNotifications,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(locals.newVideoNotificationsDescription),
          leading: const Icon(Icons.notifications_active_outlined),
          trailing: Switch(
            value: _notifier.isEnabled,
            onChanged: _busy ? null : _toggle,
          ),
        ),
        if (_notifier.isEnabled) ...[
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 56, right: 16),
            leading: const Icon(Icons.refresh, size: 20),
            title: Text(locals.checkNow),
            trailing: _busy
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
            onTap: _busy ? null : _checkNow,
          ),
          // Evidence that the scheduled job is alive: a toggle alone would not
          // prove background polling actually runs.
          Padding(
            padding: const EdgeInsets.only(left: 56, right: 16, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _lastRunLabel(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
