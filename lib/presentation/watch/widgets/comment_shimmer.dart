import 'package:flutter/material.dart';
import 'package:vyplay/core/constants.dart';

/// Comment loading shimmer shared by every watch back end.
///
/// This used to exist three times (Piped, NewPipe, Invidious) as identical
/// private `_ModernCommentShimmer`/`_ShimmerCard` copies; the only difference
/// was line wrapping. One copy keeps the loading state identical everywhere.

class ModernCommentShimmer extends StatelessWidget {
  const ModernCommentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(
          4,
          (index) => _ShimmerCard(isDark: isDark, index: index),
        ),
      ),
    );
  }
}

class _ShimmerCard extends StatefulWidget {
  const _ShimmerCard({required this.isDark, required this.index});

  final bool isDark;
  final int index;

  @override
  State<_ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<_ShimmerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor =
        widget.isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant;
    final highlightColor = widget.isDark
        ? AppColors.surfaceVariantDark.withValues(alpha: 0.7)
        : Colors.white.withValues(alpha: 0.5);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: baseColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar shimmer
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment(_animation.value - 1, 0),
                    end: Alignment(_animation.value, 0),
                    colors: [baseColor, highlightColor, baseColor],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name shimmer
                    Container(
                      width: 120,
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment(_animation.value - 1, 0),
                          end: Alignment(_animation.value, 0),
                          colors: [baseColor, highlightColor, baseColor],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Text shimmer
                    Container(
                      width: double.infinity,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment(_animation.value - 1, 0),
                          end: Alignment(_animation.value, 0),
                          colors: [baseColor, highlightColor, baseColor],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 200,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment(_animation.value - 1, 0),
                          end: Alignment(_animation.value, 0),
                          colors: [baseColor, highlightColor, baseColor],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// =============================================================================
// HELPER CLASSES
// =============================================================================
