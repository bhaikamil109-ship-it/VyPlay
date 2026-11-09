import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';

/// Whether [title]/[channelName]/[channelId]/[url] should be hidden by the
/// user's advanced content filter. Safe to call from any feed item builder.
bool isHiddenByContentFilter(
  BuildContext context, {
  required String title,
  required String channelId,
  String channelName = '',
  String url = '',
  bool? isShort,
  bool isPaidPromotion = false,
}) {
  final config = context.read<SettingsBloc>().state.contentFilterConfig;
  if (config == null || !config.isEnabled) return false;
  return config.shouldHide(
    title: title,
    channelId: channelId,
    channelName: channelName,
    url: url,
    isShort: isShort,
    isPaidPromotion: isPaidPromotion,
  );
}
