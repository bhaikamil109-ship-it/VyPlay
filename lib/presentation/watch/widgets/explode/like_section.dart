import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/application.dart';
import 'package:vyplay/core/strings.dart';
import 'package:vyplay/domain/saved/models/local_store.dart';
import 'package:vyplay/domain/watch/models/explode/explode_watch.dart';
import 'package:vyplay/domain/watch/playback/explode_stream_helper.dart';
import 'package:vyplay/presentation/download/widgets/download_options_sheet.dart';
import 'package:vyplay/presentation/settings/utils/launch_url.dart';
import 'package:vyplay/presentation/watch/widgets/redesigned/action_buttons_row.dart';
import 'package:vyplay/presentation/watch/widgets/redesigned/share_bottom_sheet.dart';

class ExplodeLikeSection extends StatelessWidget {
  const ExplodeLikeSection({
    super.key,
    required this.id,
    required this.watchInfo,
    required this.state,
    required this.pipClicked,
  });

  final String id;
  final ExplodeWatchResp watchInfo;
  final WatchState state;
  final VoidCallback pipClicked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      buildWhen: (previous, current) {
        // Only rebuild if the isSaved state for THIS video actually changed
        final prevIsSaved = previous.videoInfo?.id == id &&
            (previous.videoInfo?.isSaved ?? false);
        final currIsSaved = current.videoInfo?.id == id &&
            (current.videoInfo?.isSaved ?? false);
        return prevIsSaved != currIsSaved;
      },
      builder: (context, savedState) {
        bool isSaved = (savedState.videoInfo?.id == id &&
                savedState.videoInfo?.isSaved == true)
            ? true
            : false;
        return BlocBuilder<SettingsBloc, SettingsState>(
          buildWhen: (previous, current) =>
              previous.isDislikeVisible != current.isDislikeVisible ||
              previous.isPipDisabled != current.isPipDisabled,
          builder: (context, settingsState) {
            return ActionButtonsRow(
              likes: watchInfo.likeCount,
              dislikes: watchInfo.dislikeCount,
              videoId: id,
              showDislike: settingsState.isDislikeVisible,
              isCommentActive: state.isTapComments,
              showPip: !settingsState.isPipDisabled,
              isSaved: isSaved,
              isLive: watchInfo.isLive,
              onTapComment: () {
                if (state.isDescriptionTapped) {
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.tapDescription());
                }
                BlocProvider.of<WatchBloc>(context)
                    .add(WatchEvent.getCommentData(id: id));
              },
              onTapShare: () {
                ShareBottomSheet.show(
                  context,
                  videoId: id,
                  videoTitle: watchInfo.title,
                  thumbnailUrl: watchInfo.thumbnailUrl,
                );
              },
              onTapSave: () {
                BlocProvider.of<SavedBloc>(context).add(
                  SavedEvent.addVideoInfo(
                    videoInfo: LocalStoreVideoInfo(
                        id: id,
                        title: watchInfo.title,
                        views: watchInfo.viewCount,
                        thumbnail: watchInfo.thumbnailUrl,
                        uploadedDate: watchInfo.uploadDate.toString(),
                        uploaderAvatar: null,
                        uploaderName: watchInfo.author,
                        uploaderId: watchInfo.channelId,
                        uploaderSubscriberCount: null,
                        duration: watchInfo.duration.inSeconds,
                        playbackPosition:
                            savedState.videoInfo?.playbackPosition,
                        uploaderVerified: false,
                        isSaved: !isSaved,
                        isLive: watchInfo.isLive,
                        isHistory: savedState.videoInfo?.isHistory),
                  ),
                );
              },
              onTapDownload: () async {
                // Show loading indicator while fetching streams
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(child: CircularProgressIndicator()),
                );

                try {
                  // Fetch and convert Explode streams to NewPipe format
                  final streams = await ExplodeStreamHelper.getDownloadStreams(id);

                  if (!context.mounted) return;
                  Navigator.pop(context); // Close loading dialog

                  DownloadOptionsSheet.showWithStreams(
                    context,
                    videoId: id,
                    title: watchInfo.title,
                    channelName: watchInfo.author,
                    thumbnailUrl: watchInfo.thumbnailUrl,
                    duration: watchInfo.duration.inSeconds,
                    serviceType: settingsState.ytService,
                    videoStreams: streams.videoStreams,
                    videoOnlyStreams: streams.videoOnlyStreams,
                    audioStreams: streams.audioStreams,
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  Navigator.pop(context); // Close loading dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to fetch download options: $e')),
                  );
                }
              },
              onTapYoutube: () async => await urlLaunchWithSettings(context, '$kYTBaseUrl$id'),
              onTapPip: pipClicked,
            );
          },
        );
      },
    );
  }
}
