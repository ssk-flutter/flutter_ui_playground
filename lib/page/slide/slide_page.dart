import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/using_screen_util/using_screen_util_page.dart';
import 'package:flutter_ui_playground/type/screen_type.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(
      controller: _pageController,
      children: ScreenType.values
          // .where((option) => option != ScreenType.pure)
          .map((option) => Builder(builder: (context) => UsingScreenUtilPage(screenType: option)))
          .toList(),
    ),
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
