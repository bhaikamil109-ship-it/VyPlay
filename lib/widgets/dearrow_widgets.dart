import 'package:flutter/material.dart';
import 'package:vyplay/core/services/dearrow_service.dart';

/// Resolves the DeArrow branding for [videoId] once and rebuilds when it
/// arrives. Returns nothing while loading/failure, so callers fall back to the
/// original metadata.
mixin _DeArrowLoader<T extends StatefulWidget> on State<T> {
  String get videoId;
  DeArrowResult? _branding;
  String? _requestedId;

  DeArrowResult? get branding => _branding;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    _load();
  }

  void _load() {
    final id = videoId;
    if (id.isEmpty || _requestedId == id) return;

    final service = DeArrowService();
    if (!service.enabled) return;

    _requestedId = id;
    service.getBranding(id).then((result) {
      if (!mounted || videoId != id) return;
      setState(() => _branding = result);
    });
  }
}

/// Shows the DeArrow community title when the feature is enabled and one
/// exists, otherwise the original [text].
class DeArrowText extends StatefulWidget {
  const DeArrowText(
    this.videoId,
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  });

  final String videoId;
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;

  @override
  State<DeArrowText> createState() => _DeArrowTextState();
}

class _DeArrowTextState extends State<DeArrowText>
    with _DeArrowLoader<DeArrowText> {
  @override
  String get videoId => widget.videoId;

  @override
  Widget build(BuildContext context) {
    final title = branding?.title;
    return Text(
      title != null && title != widget.text ? title : widget.text,
      style: widget.style,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
    );
  }
}

/// Builds a thumbnail with [builder], using the DeArrow frame when available.
class DeArrowThumbnail extends StatefulWidget {
  const DeArrowThumbnail({
    super.key,
    required this.videoId,
    required this.originalUrl,
    required this.builder,
  });

  final String videoId;
  final String? originalUrl;
  final Widget Function(BuildContext context, String url) builder;

  @override
  State<DeArrowThumbnail> createState() => _DeArrowThumbnailState();
}

class _DeArrowThumbnailState extends State<DeArrowThumbnail>
    with _DeArrowLoader<DeArrowThumbnail> {
  @override
  String get videoId => widget.videoId;

  @override
  Widget build(BuildContext context) {
    final url = branding?.thumbnailUrl ?? widget.originalUrl;
    if (url == null || url.isEmpty) return const SizedBox.shrink();
    return widget.builder(context, url);
  }
}
