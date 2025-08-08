import 'package:flutter/material.dart';

enum ScreenType {
  pure(width: 0, padding: 27 / 375.0),
  size375(width: 375, padding: 27.0),
  size393(width: 393, padding: 29.0),
  size440(width: 440, padding: 32.0),
  size480(width: 480, padding: 35.0);

  const ScreenType({required this.width, required double padding}) : _padding = padding;

  final int width;
  final double _padding;

  double getPadding(double width) {
    if (this == ScreenType.pure) {
      return width * _padding;
    }
    return _padding;
  }

  Size getDesignedSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (this == ScreenType.pure) return size;

    return Size(width.toDouble(), width * size.height / size.width);
  }

  double getSquareSize(BuildContext context) {
    final width = getDesignedSize(context).width;

    switch (width) {
      case 375:
        return 320;
      case 393:
        return 335;
      case 440:
        return 375;
      case 480:
        return 410;
      default:
        return width - getPadding(width) * 2;
    }
  }
}
