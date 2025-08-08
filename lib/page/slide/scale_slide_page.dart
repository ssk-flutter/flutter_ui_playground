import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/pure/pure_page.dart';
import 'package:flutter_ui_playground/type/screen_type.dart';
import 'package:flutter_ui_playground/widget/designed_screen.dart';

class ScaleSlidePage extends StatefulWidget {
  const ScaleSlidePage({super.key});

  @override
  State<ScaleSlidePage> createState() => _ScaleSlidePageState();
}

class _ScaleSlidePageState extends State<ScaleSlidePage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageView(
    controller: _pageController,
    children: ScreenType.values
        .map(
          (option) => DesignedScreen(
            preferredWidth: option.width.toDouble(),
            preferredHeight: null,
            child: PurePage(screenType: option), //
          ),
        )
        .toList(),
  );
}
