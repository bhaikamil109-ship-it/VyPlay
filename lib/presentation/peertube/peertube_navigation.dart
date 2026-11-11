import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/peertube/peertube_bloc.dart';
import 'package:vyplay/application/peertube/peertube_channel_bloc.dart';
import 'package:vyplay/application/peertube/peertube_watch_bloc.dart';
import 'package:vyplay/core/di/injectable.dart';
import 'package:vyplay/domain/peertube/models/peertube_models.dart';
import 'package:vyplay/presentation/peertube/screen_peertube.dart';
import 'package:vyplay/presentation/peertube/screen_peertube_channel.dart';
import 'package:vyplay/presentation/peertube/screen_peertube_watch.dart';

/// Opens the independent PeerTube browsing section.
Future<void> openPeerTubeBrowse(BuildContext context) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => getIt<PeerTubeBloc>()..add(const PeerTubeStarted()),
        child: const ScreenPeerTube(),
      ),
    ),
  );
}

/// Opens a PeerTube video with its instance origin.
Future<void> openPeerTubeWatch(
  BuildContext context, {
  required String instanceUrl,
  required String uuid,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => getIt<PeerTubeWatchBloc>()
          ..add(PeerTubeWatchStarted(
            instanceUrl: instanceUrl,
            uuid: uuid,
          )),
        child: ScreenPeerTubeWatch(
          instanceUrl: instanceUrl,
          uuid: uuid,
        ),
      ),
    ),
  );
}

/// Opens a PeerTube channel.
Future<void> openPeerTubeChannel(
  BuildContext context, {
  required String instanceUrl,
  required String handle,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => getIt<PeerTubeChannelBloc>()
          ..add(PeerTubeChannelStarted(
            instanceUrl: instanceUrl,
            handle: handle,
          )),
        child: ScreenPeerTubeChannel(
          instanceUrl: instanceUrl,
          handle: handle,
        ),
      ),
    ),
  );
}

/// Convenience overload used by cards that already have the channel object.
Future<void> openPeerTubeChannelForVideo(
  BuildContext context, {
  required String instanceUrl,
  required PeerTubeVideo video,
}) {
  final handle = video.channel?.apiHandle;
  if (handle == null || handle.isEmpty) return Future.value();
  return openPeerTubeChannel(
    context,
    instanceUrl: instanceUrl,
    handle: handle,
  );
}
