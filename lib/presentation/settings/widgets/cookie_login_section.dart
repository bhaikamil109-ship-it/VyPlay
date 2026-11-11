import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyplay/application/settings/settings_bloc.dart';
import 'package:vyplay/core/constants.dart';

/// Cookie login for age-restricted / members-only YouTube content.
///
/// The cookie is pasted by the user, stored in the local settings database and
/// pushed to the native NewPipe downloader, which attaches it to every
/// extractor request.
class CookieLoginSection extends StatefulWidget {
  const CookieLoginSection({super.key});

  @override
  State<CookieLoginSection> createState() => _CookieLoginSectionState();
}

class _CookieLoginSectionState extends State<CookieLoginSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final existing = context.read<SettingsBloc>().state.youtubeCookie ?? '';
    _controller = TextEditingController(text: existing);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.youtubeCookie != current.youtubeCookie,
      builder: (context, state) {
        final hasCookie = (state.youtubeCookie ?? '').isNotEmpty;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.cookie_outlined, size: 24),
                const SizedBox(width: kPadding12),
                Expanded(
                  child: Text(
                    'Cookie login',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            kHeightBox4,
            Text(
              'Paste your YouTube cookie to access age-restricted or '
              'members-only videos. Only the stream extraction request uses it.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            kHeightBox12,
            TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 6,
              style: theme.textTheme.bodySmall,
              decoration: InputDecoration(
                hintText: 'SID=...; HSID=...; SSID=...; APISID=...; SAPISID=...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: () {
                    final cookie = _controller.text.trim();
                    if (cookie.isEmpty) return;
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.setYoutubeCookie(cookie: cookie));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cookie saved'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  icon: const Icon(Icons.save_outlined, size: 18),
                  label: const Text('Save cookie'),
                ),
                const SizedBox(width: 8),
                if (hasCookie)
                  OutlinedButton.icon(
                    onPressed: () {
                      _controller.clear();
                      context
                          .read<SettingsBloc>()
                          .add(const SettingsEvent.clearYoutubeCookie());
                    },
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: const Text('Clear'),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
