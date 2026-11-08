import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/application.dart';
import 'package:vyplay/core/enums.dart';
import 'package:vyplay/presentation/watch/explode_screen_watch.dart';
import 'package:vyplay/presentation/watch/invidious_screen_watch.dart';
import 'package:vyplay/presentation/watch/newpipe_screen_watch.dart';
import 'package:vyplay/presentation/watch/piped_screen_watch.dart';

class ScreenWatch extends StatelessWidget {
  const ScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
      final ytService = settingsState.ytService;

      // All services now use MediaKit player exclusively
      if (ytService == YouTubeServices.newpipe.name) {
        return NewPipeScreenWatch(
          id: id,
          channelId: channelId,
        );
      } else if (ytService == YouTubeServices.piped.name) {
        return PipedScreenWatch(
          id: id,
          channelId: channelId,
        );
      } else if (ytService == YouTubeServices.explode.name) {
        return ExplodeScreenWatch(
          id: id,
          channelId: channelId,
        );
      } else {
        // Invidious (default)
        return InvidiousScreenWatch(
          id: id,
          channelId: channelId,
        );
      }
    });
  }
}
