import 'package:flutter/material.dart';

class DesignedScreen extends StatelessWidget {
  const DesignedScreen({
    super.key,
    required this.child,
    this.preferredWidth,
    this.preferredHeight,
    //
  });

  final Widget child;
  final double? preferredWidth;
  final double? preferredHeight;

  @override
  Widget build(BuildContext context) => child;
}
