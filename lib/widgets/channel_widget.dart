import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/subscribe/subscribe_bloc.dart';
import 'package:vyplay/core/colors.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/domain/subscribes/models/subscribe.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:vyplay/widgets/common_video_description_widget.dart';
import 'package:go_router/go_router.dart';

class ChannelWidget extends StatelessWidget {
  const ChannelWidget({
    super.key,
    required String? channelName,
    required bool? isVerified,
    required int? subscriberCount,
    required String? thumbnail,
    required bool isSubscribed,
    required String channelId,
    required this.locals,
    this.isTapEnabled = true,
  })  : _channelName = channelName,
        _isVerified = isVerified,
        _subscriberCount = subscriberCount,
        _thumbnail = thumbnail,
        _isSubscribed = isSubscribed,
        _channelId = channelId;

  final String? _channelName;
  final bool? _isVerified;
  final int? _subscriberCount;
  final String? _thumbnail;
  final bool _isSubscribed;
  final String _channelId;
  final S locals;
  final bool isTapEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => !isTapEnabled
          ? null
          : context.goNamed('channel', pathParameters: {
              'channelId': _channelId,
            }, queryParameters: {
              'avatarUrl': _thumbnail,
            }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SubscribeRowWidget(
          uploader: _channelName,
          isVerified: _isVerified,
          subcount: _subscriberCount.toString(),
          subscribed: _isSubscribed,
          uploaderUrl: _thumbnail,
          radius: 35,
          spacing: kWidthBox15,
          subTextStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          subCountTextStyle: TextStyle(
              color: kGreyColor, fontSize: 13, overflow: TextOverflow.ellipsis),
          onSubscribeTap: () {
            if (_isSubscribed) {
              BlocProvider.of<SubscribeBloc>(context)
                  .add(SubscribeEvent.deleteSubscribeInfo(id: _channelId));
            } else {
              BlocProvider.of<SubscribeBloc>(context).add(
                  SubscribeEvent.addSubscribe(
                      channelInfo: Subscribe(
                          id: _channelId,
                          channelName: _channelName ?? locals.noUploaderName,
                          isVerified: _isVerified ?? false,
                          avatarUrl: _thumbnail)));
            }
          },
        ),
      ),
    );
  }
}
