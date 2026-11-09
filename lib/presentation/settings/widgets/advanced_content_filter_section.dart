import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';
import 'package:vyplay/generated/l10n.dart';

/// Advanced content filter: keyword blocklist (with `/regex/` support) and
/// channel-ID blocklist plus toggles for Shorts and paid/promoted videos.
class AdvancedContentFilterSection extends StatefulWidget {
  const AdvancedContentFilterSection({super.key});

  @override
  State<AdvancedContentFilterSection> createState() =>
      _AdvancedContentFilterSectionState();
}

class _AdvancedContentFilterSectionState
    extends State<AdvancedContentFilterSection> {
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _channelController = TextEditingController();

  @override
  void dispose() {
    _keywordController.dispose();
    _channelController.dispose();
    super.dispose();
  }

  void _addKeyword(SettingsState state) {
    final value = _keywordController.text.trim();
    if (value.isEmpty) return;
    final current = state.contentFilterKeywords ?? const [];
    if (current.contains(value)) {
      _keywordController.clear();
      return;
    }
    context
        .read<SettingsBloc>()
        .add(SettingsEvent.contentFilterKeywordsChanged(
          keywords: [...current, value],
        ));
    _keywordController.clear();
  }

  void _addChannel(SettingsState state) {
    final value = _channelController.text.trim();
    if (value.isEmpty) return;
    final current = state.contentFilterBlockedChannels ?? const [];
    if (current.contains(value)) {
      _channelController.clear();
      return;
    }
    context
        .read<SettingsBloc>()
        .add(SettingsEvent.contentFilterChannelsChanged(
          channelIds: [...current, value],
        ));
    _channelController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.contentFilterConfig != current.contentFilterConfig,
      builder: (context, state) {
        final config = state.contentFilterConfig;
        final keywords = state.contentFilterKeywords ?? const <String>[];
        final channels =
            state.contentFilterBlockedChannels ?? const <String>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_alt_outlined),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    locals.contentFilterAdvanced,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              locals.contentFilterAdvancedDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            kHeightBox12,
            TextField(
              controller: _keywordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: locals.blockedKeywords,
                hintText: locals.blockedKeywordsHint,
                border: const OutlineInputBorder(),
                isDense: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: locals.add,
                  onPressed: () => _addKeyword(state),
                ),
              ),
              onSubmitted: (_) => _addKeyword(state),
            ),
            if (keywords.isNotEmpty) ...[
              kHeightBox8,
              Wrap(
                spacing: kPadding8,
                runSpacing: kPadding8,
                children: [
                  for (final keyword in keywords)
                    InputChip(
                      label: Text(keyword),
                      onDeleted: () {
                        context.read<SettingsBloc>().add(
                              SettingsEvent.contentFilterKeywordsChanged(
                                keywords:
                                    keywords.where((k) => k != keyword).toList(),
                              ),
                            );
                      },
                    ),
                ],
              ),
            ],
            kHeightBox12,
            TextField(
              controller: _channelController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: locals.blockedChannels,
                hintText: locals.blockedChannelsHint,
                border: const OutlineInputBorder(),
                isDense: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: locals.add,
                  onPressed: () => _addChannel(state),
                ),
              ),
              onSubmitted: (_) => _addChannel(state),
            ),
            if (channels.isNotEmpty) ...[
              kHeightBox8,
              Wrap(
                spacing: kPadding8,
                runSpacing: kPadding8,
                children: [
                  for (final channel in channels)
                    InputChip(
                      label: Text(channel),
                      onDeleted: () {
                        context.read<SettingsBloc>().add(
                              SettingsEvent.contentFilterChannelsChanged(
                                channelIds: channels
                                    .where((c) => c != channel)
                                    .toList(),
                              ),
                            );
                      },
                    ),
                ],
              ),
            ],
            kHeightBox12,
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.smart_display_outlined),
              title: Text(locals.hideShorts),
              subtitle: Text(locals.hideShortsDescription),
              value: config?.hideShorts ?? false,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.contentFilterHideShortsChanged(
                        enabled: value,
                      ),
                    );
              },
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.monetization_on_outlined),
              title: Text(locals.hidePaidPromotions),
              subtitle: Text(locals.hidePaidPromotionsDescription),
              value: config?.hidePaidPromotions ?? false,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      SettingsEvent.contentFilterHidePaidChanged(
                        enabled: value,
                      ),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
