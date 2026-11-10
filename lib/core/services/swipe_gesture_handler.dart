import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vyplay/core/player/global_player_controller.dart';

enum SwipeDirection { left, right, up, down }

enum SwipeAction { seek, brightness, volume, none }

class SwipeGestureHandler {
  static SwipeGestureHandler? _instance;
  factory SwipeGestureHandler() => _instance ??= SwipeGestureHandler._();

  SwipeGestureHandler._();

  // Configuration
  Duration seekDuration = const Duration(seconds: 10);
  bool enableBrightnessSwipe = true;
  bool enableVolumeSwipe = true;
  bool enableSeekSwipe = true;

  // State
  bool _isHorizontalSwipe = false;
  bool _isVerticalSwipe = false;
  Offset? _startPosition;
  Timer? _debounceTimer;
  final Duration _debounceDuration = const Duration(milliseconds: 100);

  // Callbacks
  void Function(Duration)? onSeek;
  void Function(double)? onBrightnessChanged;
  void Function(double)? onVolumeChanged;
  void Function(SwipeAction, Offset)? onSwipeAction;

  void setCallbacks({
    void Function(Duration)? seek,
    void Function(double)? brightness,
    void Function(double)? volume,
    void Function(SwipeAction, Offset)? action,
  }) {
    onSeek = seek;
    onBrightnessChanged = brightness;
    onVolumeChanged = volume;
    onSwipeAction = action;
  }

  void clearCallbacks() {
    onSeek = null;
    onBrightnessChanged = null;
    onVolumeChanged = null;
    onSwipeAction = null;
  }

  void handleTapUp(TapUpDetails details) {
    // Double-tap is handled separately, single tap does nothing here
  }

  void handleVerticalDragStart(DragStartDetails details) {
    _startPosition = details.localPosition;
    _isVerticalSwipe = false;
    _isHorizontalSwipe = false;
  }

  void handleVerticalDragUpdate(DragUpdateDetails details) {
    if (_startPosition == null) return;
    final delta = details.localPosition - _startPosition!;

    // Determine if this is vertical or horizontal swipe
    if (!_isVerticalSwipe && !_isHorizontalSwipe) {
      if (delta.dy.abs() > delta.dx.abs()) {
        _isVerticalSwipe = true;
      } else {
        _isHorizontalSwipe = true;
      }
    }

    if (_isVerticalSwipe && enableBrightnessSwipe) {
      // Brightness control (vertical swipe)
      final brightnessDelta = -delta.dy / 500;
      log('[SwipeGesture] Brightness delta: ${brightnessDelta.toStringAsFixed(2)}');
    }

    if (_isVerticalSwipe && enableVolumeSwipe && !_isHorizontalSwipe) {
      // Volume control (vertical swipe on left side or with modifier)
      final volumeDelta = -delta.dy / 500;
      log('[SwipeGesture] Volume delta: ${volumeDelta.toStringAsFixed(2)}');
    }
  }

  void handleVerticalDragEnd(DragEndDetails details) {
    if (_startPosition == null) return;

    final delta = details.localPosition - _startPosition!;

    if (_isVerticalSwipe) {
      // Vertical swipe - brightness or volume
      final brightnessDelta = -delta.dy / 500;
      if (brightnessDelta.abs() > 0.05) {
        log('[SwipeGesture] Brightness change: ${brightnessDelta.toStringAsFixed(2)}');
        _dispatchAction(SwipeAction.brightness, Offset(0, brightnessDelta));
      }
      _isVerticalSwipe = false;
    }

    _startPosition = null;
  }

  void handleHorizontalDragStart(DragStartDetails details) {
    _startPosition = details.localPosition;
    _isHorizontalSwipe = false;
    _isVerticalSwipe = false;
  }

  void handleHorizontalDragUpdate(DragUpdateDetails details) {
    if (_startPosition == null) return;
    final delta = details.localPosition - _startPosition!;

    if (!_isHorizontalSwipe && !_isVerticalSwipe) {
      if (delta.dx.abs() > delta.dy.abs()) {
        _isHorizontalSwipe = true;
      } else {
        _isVerticalSwipe = true;
      }
    }

    if (_isHorizontalSwipe && enableSeekSwipe) {
      // Seek control (horizontal swipe)
      final seekDelta = delta.dx / 500;
      log('[SwipeGesture] Seek delta: ${seekDelta.toStringAsFixed(2)}');
    }
  }

  void handleHorizontalDragEnd(DragEndDetails details) {
    if (_startPosition == null) return;

    final delta = details.localPosition - _startPosition!;

    if (_isHorizontalSwipe) {
      // Horizontal swipe - seek forward/backward
      final seekDelta = delta.dx / 500;
      if (seekDelta.abs() > 0.05) {
        final direction = seekDelta > 0 ? SwipeDirection.right : SwipeDirection.left;
        _handleSeekSwipe(direction, seekDelta.abs());
      }
      _isHorizontalSwipe = false;
    }

    _startPosition = null;
  }

  void _handleSeekSwipe(SwipeDirection direction, double intensity) {
    final baseSeek = seekDuration.inSeconds;
    final adjustedSeek = (baseSeek * intensity).clamp(1, baseSeek * 2).toInt();

    Duration newPosition;

    if (direction == SwipeDirection.right) {
      // Forward
      final currentPlayer = GlobalPlayerController().player;
      final currentPosition = currentPlayer.state.position;
      final duration = currentPlayer.state.duration;
      newPosition = currentPosition + Duration(seconds: adjustedSeek);
      if (newPosition > duration) {
        newPosition = duration;
      }
      log('[SwipeGesture] Seek forward: +${adjustedSeek}s');
    } else {
      // Backward
      final currentPlayer = GlobalPlayerController().player;
      final currentPosition = currentPlayer.state.position;
      newPosition = currentPosition - Duration(seconds: adjustedSeek);
      if (newPosition < Duration.zero) {
        newPosition = Duration.zero;
      }
      log('[SwipeGesture] Seek backward: -${adjustedSeek}s');
    }

    _dispatchAction(SwipeAction.seek, Offset.zero);
  }

  void _dispatchAction(SwipeAction action, Offset value) {
    // Debounce rapid swipes
    if (_debounceTimer?.isActive ?? false) return;

    _debounceTimer = Timer(_debounceDuration, () {});

    switch (action) {
      case SwipeAction.seek:
        break;
      case SwipeAction.brightness:
        break;
      case SwipeAction.volume:
        break;
      case SwipeAction.none:
        break;
    }
  }

  void dispose() {
    _debounceTimer?.cancel();
  }
}

