enum SleepTimerStatus {
  notSet,
  running,
  paused,
  finished,
}

class SleepTimerConfig {
  final Duration duration;
  final bool stopPlayback;
  final bool fadeOut;

  const SleepTimerConfig({
    required this.duration,
    this.stopPlayback = true,
    this.fadeOut = false,
  });

  SleepTimerConfig copyWith({
    Duration? duration,
    bool? stopPlayback,
    bool? fadeOut,
  }) {
    return SleepTimerConfig(
      duration: duration ?? this.duration,
      stopPlayback: stopPlayback ?? this.stopPlayback,
      fadeOut: fadeOut ?? this.fadeOut,
    );
  }

  Duration get totalDuration => duration;
}
