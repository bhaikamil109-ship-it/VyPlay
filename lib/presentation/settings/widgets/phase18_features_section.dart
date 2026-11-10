import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

class Phase18FeaturesSection extends StatelessWidget {
  const Phase18FeaturesSection({super.key});

  Widget _toggle(BuildContext context, String label, String? desc, bool value,
      void Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: (v) => onChanged(v ?? false)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodyMedium),
                if (desc != null)
                  Text(desc,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (p, c) =>
          p.isLongPressSpeedUpEnabled != c.isLongPressSpeedUpEnabled ||
          p.isOriginalTitlesEnabled != c.isOriginalTitlesEnabled ||
          p.isCommentFilterEnabled != c.isCommentFilterEnabled ||
          p.isScreenLockEnabled != c.isScreenLockEnabled ||
          p.isPinchToZoomEnabled != c.isPinchToZoomEnabled ||
          p.isSeekbarThumbnailsEnabled != c.isSeekbarThumbnailsEnabled ||
          p.isPopupPlayerEnabled != c.isPopupPlayerEnabled ||
          p.isLiveChatDanmakuEnabled != c.isLiveChatDanmakuEnabled ||
          p.isBluetoothSeekEnabled != c.isBluetoothSeekEnabled ||
          p.isMultiSelectListsEnabled != c.isMultiSelectListsEnabled ||
          p.isSbExclusiveMarkerEnabled != c.isSbExclusiveMarkerEnabled ||
          p.isSbForDownloadsEnabled != c.isSbForDownloadsEnabled,
      builder: (context, state) {
        final bloc = context.read<SettingsBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.extension),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.phase18Features,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.phase18FeaturesDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            _toggle(
              context,
              locals.longPressSpeedUp,
              locals.longPressSpeedUpDescription,
              state.isLongPressSpeedUpEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleLongPressSpeedUp(enabled: v)),
            ),
            _toggle(
              context,
              locals.originalTitles,
              locals.originalTitlesDescription,
              state.isOriginalTitlesEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleOriginalTitles(enabled: v)),
            ),
            _toggle(
              context,
              locals.commentFilter,
              locals.commentFilterDescription,
              state.isCommentFilterEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleCommentFilter(enabled: v)),
            ),
            _toggle(
              context,
              locals.screenLock,
              locals.screenLockDescription,
              state.isScreenLockEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleScreenLock(enabled: v)),
            ),
            _toggle(
              context,
              locals.pinchToZoom,
              locals.pinchToZoomDescription,
              state.isPinchToZoomEnabled ?? false,
              (v) => bloc.add(SettingsEvent.togglePinchToZoom(enabled: v)),
            ),
            _toggle(
              context,
              locals.seekbarThumbnails,
              locals.seekbarThumbnailsDescription,
              state.isSeekbarThumbnailsEnabled ?? true,
              (v) => bloc.add(SettingsEvent.toggleSeekbarThumbnails(enabled: v)),
            ),
            _toggle(
              context,
              locals.popupPlayer,
              locals.popupPlayerDescription,
              state.isPopupPlayerEnabled ?? false,
              (v) => bloc.add(SettingsEvent.togglePopupPlayer(enabled: v)),
            ),
            _toggle(
              context,
              locals.liveChatDanmaku,
              locals.liveChatDanmakuDescription,
              state.isLiveChatDanmakuEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleLiveChatDanmaku(enabled: v)),
            ),
            _toggle(
              context,
              locals.bluetoothSeek,
              locals.bluetoothSeekDescription,
              state.isBluetoothSeekEnabled ?? true,
              (v) => bloc.add(SettingsEvent.toggleBluetoothSeek(enabled: v)),
            ),
            _toggle(
              context,
              locals.multiSelectLists,
              locals.multiSelectListsDescription,
              state.isMultiSelectListsEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleMultiSelectLists(enabled: v)),
            ),
            _toggle(
              context,
              locals.sbExclusiveMarker,
              locals.sbExclusiveMarkerDescription,
              state.isSbExclusiveMarkerEnabled ?? false,
              (v) =>
                  bloc.add(SettingsEvent.toggleSbExclusiveMarker(enabled: v)),
            ),
            _toggle(
              context,
              locals.sbForDownloads,
              locals.sbForDownloadsDescription,
              state.isSbForDownloadsEnabled ?? false,
              (v) => bloc.add(SettingsEvent.toggleSbForDownloads(enabled: v)),
            ),
            kHeightBox12,
          ],
        );
      },
    );
  }
}