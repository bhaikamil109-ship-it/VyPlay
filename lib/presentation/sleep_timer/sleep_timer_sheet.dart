import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/core/services/sleep_timer.dart';
import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';
import 'package:vyplay/generated/l10n.dart';

class SleepTimerSheet extends StatefulWidget {
  const SleepTimerSheet({super.key});

  @override
  State<SleepTimerSheet> createState() => _SleepTimerSheetState();
}

class _SleepTimerSheetState extends State<SleepTimerSheet> {
  SleepTimerStatus _status = SleepTimerStatus.notSet;
  Duration _remaining = Duration.zero;
  StreamSubscription? _statusSubscription;

  @override
  void initState() {
    super.initState();
    _statusSubscription = SleepTimer.statusStream.listen((status) {
      setState(() {
        _status = status;
      });
    });
    _updateRemaining();
  }

  void _updateRemaining() {
    final timer = SleepTimer();
    if (timer.isRunning || timer.isPaused) {
      setState(() {
        _remaining = timer.remaining;
      });
    }
  }

  @override
  void dispose() {
    _statusSubscription?.cancel();
    super.dispose();
  }

  void _showTimerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kHeightBox20,
            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(S.of(context).sleepTimer),
              subtitle: Text(S.of(context).sleepTimerDescription),
            ),
            const Divider(),
            ...SleepTimerPresets.durations.map((duration) {
              return ListTile(
                leading: Icon(Icons.timer_outlined),
                title: Text(_formatDuration(duration)),
                trailing: duration == SleepTimerPresets.thirtyMinutes
                    ? const Icon(Icons.chevron_right)
                    : null,
                onTap: () {
                  Navigator.pop(context);
                  _setTimer(duration);
                },
              );
            }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.timer),
              title: Text(S.of(context).customTimer),
              onTap: () {
                Navigator.pop(context);
                _showCustomTimerDialog(context);
              },
            ),
            if (_status == SleepTimerStatus.running || _status == SleepTimerStatus.paused) ...[
              const Divider(),
              ListTile(
                leading: const Icon(Icons.pause),
                title: Text(_status == SleepTimerStatus.running
                    ? S.of(context).pauseTimer
                    : S.of(context).resumeTimer),
                onTap: () {
                  Navigator.pop(context);
                  _togglePause();
                },
              ),
            ],
            if (_status != SleepTimerStatus.notSet) ...[
              const Divider(),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: Text(S.of(context).cancelTimer),
                onTap: () {
                  Navigator.pop(context);
                  _cancelTimer();
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _setTimer(Duration duration) {
    final timer = SleepTimer();
    final config = SleepTimerConfig(duration: duration);
    timer.setTimer(config);
    context.read<SettingsBloc>().add(SettingsEvent.setSleepTimer(seconds: duration.inSeconds));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).sleepTimerSet)),
    );
  }

  void _showCustomTimerDialog(BuildContext context) {
    final controller = TextEditingController();
    int selectedMinutes = 60;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(S.of(context).customTimer),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).customTimerDescription),
              kHeightBox16,
              Slider(
                value: selectedMinutes.toDouble(),
                min: 1,
                max: 600,
                divisions: 599,
                label: '$selectedMinutes min',
                onChanged: (value) {
                  setState(() {
                    selectedMinutes = value.toInt();
                  });
                },
              ),
              Text(
                '${selectedMinutes} min (${(selectedMinutes * 60)} sec)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(S.of(context).cancel),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _setTimer(Duration(minutes: selectedMinutes));
              },
              child: Text(S.of(context).save),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePause() {
    final timer = SleepTimer();
    if (timer.isRunning) {
      timer.pause();
    } else if (timer.isPaused) {
      timer.resume();
    }
  }

  void _cancelTimer() {
    final timer = SleepTimer();
    timer.cancel();
    context.read<SettingsBloc>().add(const SettingsEvent.clearSleepTimer());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).sleepTimerCancelled)),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    if (duration.inHours > 0) {
      final hours = duration.inHours;
      final remMinutes = duration.inMinutes % 60;
      return '${hours}h ${remMinutes}m';
    }
    if (seconds > 0) {
      return '${minutes}m ${seconds}s';
    }
    return '${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    final timer = SleepTimer();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.sleepTimer),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          if (_status != SleepTimerStatus.notSet)
            Padding(
            padding: const EdgeInsets.all(kPadding16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(kPadding16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(kRadius12),
              ),
              child: Column(
                children: [
                  Icon(
                    timer.isRunning ? Icons.timer : Icons.timer_off,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  kHeightBox12,
                  Text(
                    _status == SleepTimerStatus.running
                        ? S.of(context).timerRunning
                        : _status == SleepTimerStatus.paused
                            ? S.of(context).timerPaused
                            : S.of(context).timerFinished,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  kHeightBox8,
                  Text(
                    '${_remaining.inMinutes}:${(_remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.timer_outlined),
                  title: Text(locals.quickOptions),
                  onTap: () => _showTimerOptions(context),
                ),
                if (timer.isRunning || timer.isPaused)
                  ListTile(
                    leading: const Icon(Icons.pause),
                    title: Text(_status == SleepTimerStatus.running
                        ? locals.pauseTimer
                        : locals.resumeTimer),
                    onTap: _togglePause,
                  ),
                if (timer.isRunning || timer.isPaused)
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: Text(locals.cancelTimer),
                    onTap: _cancelTimer,
                  ),
                if (timer.isFinished)
                  ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(locals.timerFinished),
                    subtitle: Text(locals.timerAlreadyFinished),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SleepTimerPresets {
  static const List<Duration> durations = [
    thirtyMinutes,
    oneHour,
    onePointFiftyHours,
    twoHours,
    threeHours,
    fiveHours,
    tenHours,
    fifteenHours,
    endOfVideo,
  ];

  static const thirtyMinutes = Duration(minutes: 30);
  static const oneHour = Duration(hours: 1);
  static const onePointFiftyHours = Duration(hours: 1, minutes: 30);
  static const twoHours = Duration(hours: 2);
  static const threeHours = Duration(hours: 3);
  static const fiveHours = Duration(hours: 5);
  static const tenHours = Duration(hours: 10);
  static const fifteenHours = Duration(hours: 15);
  static const endOfVideo = Duration(hours: 24);
}
