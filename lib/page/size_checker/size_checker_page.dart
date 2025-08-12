import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/widget/screen_builder.dart';
import 'package:flutter_ui_playground/widget/size_widget.dart';

class SizeCheckerPage extends StatelessWidget {
  const SizeCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final length = getLengthByWidth(size);
    return Scaffold(
      body: ScreenBuilder(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                length,
                (index) => SizeWidget(width: indexToWidth(index), colorKey: indexToColorKey(index)),
              ),
            ],
          ),
        ),
        expanded: (context, child) => ScreenContent(title: 'Expanded', size: size, child: child),
        medium: (context, child) => ScreenContent(title: 'medium', size: size, child: child),
        compact: (context, child) => ScreenContent(title: 'compact', size: size, child: child),
      ),
    );
  }

  int indexToColorKey(int index) => (index * 100) % 900 + 100;

  final int step = 20;
  final int minStart = 2;

  int getLengthByWidth(Size size) => (size.width ~/ step);

  double indexToWidth(int index) => (index + minStart) * step.toDouble();
}

class ScreenContent extends StatelessWidget {
  const ScreenContent({super.key, required this.title, required this.size, this.child});

  final String title;
  final Size size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Text(
          'Screen Size: ${size.width.toStringAsFixed(2)} x ${size.height.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        if (child != null) ...[const SizedBox(height: 20), Expanded(child: child!)],
      ],
    );
  }
}
