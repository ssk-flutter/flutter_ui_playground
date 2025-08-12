import 'package:flutter/material.dart';
import 'screen_size.dart';

class ScreenBuilder extends StatelessWidget {
  const ScreenBuilder({super.key, this.child, this.compact, this.medium, this.expanded, this.builder})
    : assert(
        builder != null || //
            (compact != null && medium != null && expanded != null),
        'If builder is not provided, compact, medium, and expanded must all be provided.',
      );

  final Widget? child;
  final Widget Function(BuildContext context, Widget? child)? compact;
  final Widget Function(BuildContext context, Widget? child)? medium;
  final Widget Function(BuildContext context, Widget? child)? expanded;
  final Widget Function(BuildContext context, Widget? child, Size size)? builder;

  @override
  Widget build(BuildContext context) {
    final size = SizeResolver.of(context);
    if (size.isCompact && compact != null) return compact!(context, child);
    if (size.isMedium && medium != null) return medium!(context, child);
    if (size.isExpanded && expanded != null) return expanded!(context, child);

    // Fallback if no size matches
    if (builder != null) return builder!(context, child, size.size);

    throw ArgumentError('No layout function provided for the current screen size: ${size.size}');
  }
}
