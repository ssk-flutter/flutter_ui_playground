import 'package:flutter/material.dart';

enum ScreenType {
  pure(width: 0, padding: 27 / 375.0),
  size375(width: 375, padding: 27.0),
  size393(width: 393, padding: 29.0),
  size440(width: 440, padding: 32.0),
  size480(width: 480, padding: 35.0);

  const ScreenType({required this.width, required this.padding});

  final int width;
  final double padding;

  double calculatePadding(double width) {
    if (this == ScreenType.pure) {
      return width * padding;
    }
    return padding;
  }

  Size getDesignedSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (this == ScreenType.pure) return size;

    return Size(width.toDouble(), width * size.height / size.width);
  }
}
