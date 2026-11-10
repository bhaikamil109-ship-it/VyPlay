import 'dart:async';
import 'dart:developer';

import 'package:vyplay/domain/sleep_timer/sleep_timer_config.dart';

class SleepTimer {
  static SleepTimer? _instance;
  factory SleepTimer() => _instance ??= SleepTimer._();

  SleepTimer._();

  Timer? _timer;
  Duration _remaining = Duration.zero;
  SleepTimerConfig _config = const SleepTimerConfig(duration: Duration.zero);
  SleepTimerStatus _status = SleepTimerStatus.notSet;

  Duration get remaining => _remaining;
  SleepTimerStatus get status => _status;
  SleepTimerConfig get config => _config;
  bool get isRunning => _status == SleepTimerStatus.running;
  bool get isPaused => _status == SleepTimerStatus.paused;
  bool get isFinished => _status == SleepTimerStatus.finished;

  static final _controller = StreamController<SleepTimerStatus>.broadcast();
  static Stream<SleepTimerStatus> get statusStream => _controller.stream;

  void _updateStatus(SleepTimerStatus newStatus) {
    _status = newStatus;
    _controller.add(newStatus);
  }

  void setTimer(SleepTimerConfig config) {
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
    }

    _config = config;
    _remaining = config.duration;
    _status = SleepTimerStatus.running;
    _updateStatus(SleepTimerStatus.running);
    _startTimer();
    log('[SleepTimer] Set for ${config.duration.inMinutes}:${config.duration.inSeconds % 60}');
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.isNegative) {
        _onTimerComplete();
        return;
      }

      _remaining -= const Duration(seconds: 1);

      log('[SleepTimer] Remaining: ${_remaining.inMinutes}:${_remaining.inSeconds % 60}');
    });
  }

  void _onTimerComplete() {
    _timer?.cancel();
    _updateStatus(SleepTimerStatus.finished);
    log('[SleepTimer] Timer completed - stopping playback');
    _notifyCompletion();
  }

  void pause() {
    if (_status != SleepTimerStatus.running) return;
    _timer?.cancel();
    _updateStatus(SleepTimerStatus.paused);
    log('[SleepTimer] Paused at ${_remaining.inMinutes}:${_remaining.inSeconds % 60}');
  }

  void resume() {
    if (_status != SleepTimerStatus.paused) return;
    if (_remaining.isNegative) {
      _onTimerComplete();
      return;
    }
    _updateStatus(SleepTimerStatus.running);
    _startTimer();
    log('[SleepTimer] Resumed');
  }

  void cancel() {
    _timer?.cancel();
    _remaining = const Duration(seconds: 0);
    _updateStatus(SleepTimerStatus.notSet);
    log('[SleepTimer] Cancelled');
  }

  void skipToEnd() {
    _timer?.cancel();
    _remaining = Duration.zero;
    _onTimerComplete();
  }

  void _notifyCompletion() {
    // Completion handled by listeners
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

extension SleepTimerExtension on SleepTimer {
  static Future<void> pausePlaybackAfterTimer() async {
    // Playback pause will be triggered via listener
  }
}
