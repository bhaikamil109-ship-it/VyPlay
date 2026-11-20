import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/application.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/domain/subscribes/models/subscribe.dart';
import 'package:vyplay/domain/watch/models/piped/video/watch_resp.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/widgets/common_video_description_widget.dart';
import 'package:go_router/go_router.dart';

class ChannelInfoSection extends StatelessWidget {
  const ChannelInfoSection({
    super.key,
    required this.watchInfo,
    required this.locals,
    required this.state,
  });

  final WatchResp watchInfo;
  final S locals;
  final WatchState state;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !state.isTapComments,
      child: BlocBuilder<SubscribeBloc, SubscribeState>(
        builder: (context, subscribeState) {
          final String channelId = watchInfo.uploaderUrl!.split("/").last;
          final bool isSubscribed = subscribeState.channelInfo?.id == channelId;

          return GestureDetector(
            onTap: () {
              // Enable PiP mode when navigating away from watch screen
              final settingsState = context.read<SettingsBloc>().state;
              if (!settingsState.isPipDisabled) {
                GlobalPlayerController().enterPipMode();
                BlocProvider.of<WatchBloc>(context)
                    .add(WatchEvent.togglePip(value: true));
              }
              context.pushNamed('channel', pathParameters: {
                'channelId': channelId,
              }, queryParameters: {
                'avatarUrl': watchInfo.uploaderAvatar,
              });
            },
            child: SubscribeRowWidget(
              subscribed: isSubscribed,
              uploaderUrl: watchInfo.uploaderAvatar,
              subcount: watchInfo.uploaderSubscriberCount.toString(),
              uploader: watchInfo.uploader ?? locals.noUploaderName,
              isVerified: watchInfo.uploaderVerified ?? false,
              onSubscribeTap: () {
                if (isSubscribed) {
                  BlocProvider.of<SubscribeBloc>(context)
                      .add(SubscribeEvent.deleteSubscribeInfo(
                        id: channelId,
                        profileName: context.read<SettingsBloc>().state.currentProfile,
                      ));
                } else {
                  BlocProvider.of<SubscribeBloc>(context).add(
                      SubscribeEvent.addSubscribe(
                          profileName: context.read<SettingsBloc>().state.currentProfile,
                          channelInfo: Subscribe(
                              id: channelId,
                              channelName:
                                  watchInfo.uploader ?? locals.noUploaderName,
                              isVerified: watchInfo.uploaderVerified ?? false,
                              avatarUrl: watchInfo.uploaderAvatar)));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
