import 'package:flutter/material.dart';

/// https://developer.android.com/develop/ui/views/layout/use-window-size-classes?hl=ko
enum ScreenSize {
  compact, // 600
  medium, // 900
  expanded,
}

class SizeResolver {
  factory SizeResolver.of(BuildContext context) {
    return SizeResolver._(MediaQuery.sizeOf(context));
  }

  SizeResolver._(this.size) {
    if (size.width <= 600) {
      _size = ScreenSize.compact;
    } else if (size.width <= 900) {
      _size = ScreenSize.medium;
    } else {
      _size = ScreenSize.expanded;
    }
  }

  final Size size;

  late final ScreenSize _size;

  bool get isCompact => _size == ScreenSize.compact;

  bool get isMedium => _size == ScreenSize.medium;

  bool get isExpanded => _size == ScreenSize.expanded;
}
