import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vyplay/core/colors.dart';
import 'package:vyplay/core/player/global_player_controller.dart';
import 'package:vyplay/domain/watch/models/piped/video/watch_resp.dart';
import 'package:vyplay/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required double height,
    required this.watchInfo,
    required this.locals,
  }) : _height = height;

  final double _height;
  final WatchResp watchInfo;
  final S locals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final description = watchInfo.description ?? locals.noVideoDescription;

    final timestamps = _extractTimestamps(description);

    return SizedBox(
      height: _height * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SelectableText.rich(
                _buildDescriptionSpan(context, description, theme),
              ),
            ),
          ),
          if (timestamps.isNotEmpty) ...[
            const SizedBox(height: 6),
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: timestamps.length,
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (context, index) {
                  final entry = timestamps[index];
                  return ActionChip(
                    label: Text(entry.label),
                    visualDensity: VisualDensity.compact,
                    onPressed: () =>
                        GlobalPlayerController().seekTo(Duration(seconds: entry.seconds)),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Timestamps written in the description (`1:23`, `01:02:03`) as tappable
  /// chips. Duplicates collapse, and the list is capped so a description full
  /// of times cannot turn into a wall of chips.
  List<({String label, int seconds})> _extractTimestamps(String text) {
    final matches = RegExp(r'(?<!\d)(\d{1,2}):([0-5]\d)(?::([0-5]\d))?(?!\d)')
        .allMatches(text);
    final result = <({String label, int seconds})>[];
    final seen = <int>{};
    for (final match in matches) {
      final first = int.parse(match.group(1)!);
      final second = int.parse(match.group(2)!);
      final third = match.group(3);
      final seconds = third == null
          ? first * 60 + second
          : first * 3600 + second * 60 + int.parse(third);
      if (!seen.add(seconds)) continue;
      result.add((label: match.group(0)!, seconds: seconds));
    }
    return result.take(12).toList();
  }

  TextSpan _buildDescriptionSpan(BuildContext context, String text, ThemeData theme) {
    // Decode HTML entities
    String decoded = text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAll(RegExp(r'<br\s*/?>'), '\n')
        .replaceAll(RegExp(r'<[^>]*>'), '');

    final urlPattern = RegExp(r'https?://[^\s<>\[\]]+', caseSensitive: false);
    final List<InlineSpan> spans = [];
    int lastEnd = 0;

    for (final match in urlPattern.allMatches(decoded)) {
      // Add text before the URL
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: decoded.substring(lastEnd, match.start),
          style: theme.textTheme.bodyMedium,
        ));
      }

      // Add the URL as a clickable link (no underline)
      final url = match.group(0)!;
      spans.add(TextSpan(
        text: url,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.primary,
          decoration: TextDecoration.none,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () => _launchUrl(url),
      ));

      lastEnd = match.end;
    }

    // Add remaining text
    if (lastEnd < decoded.length) {
      spans.add(TextSpan(
        text: decoded.substring(lastEnd),
        style: theme.textTheme.bodyMedium,
      ));
    }

    return TextSpan(children: spans);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
