import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/slide/slide_page.dart';
import 'package:flutter_ui_playground/widget/select_design_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Flutter UI Playground'), actions: [const SelectDesignButton()]),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SlidePage()));
        },
        child: const Text('Go to Slide Page'),
      ),
    ),
  );
}
