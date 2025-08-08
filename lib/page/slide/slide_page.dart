import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/design/design_page.dart';
import 'package:flutter_ui_playground/type/screen_type.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // It's important to get the size from the parent of the PageView
    // to avoid issues with MediaQuery.of(context) inside the builder.
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: ScreenType.values.map((option) {
          // We use a Builder here to ensure that the context passed to _parseDesignedSize
          // is the one that contains the mediaQuery data from the Scaffold.
          return Builder(builder: (context) => DesignPage(screenType: option));
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
