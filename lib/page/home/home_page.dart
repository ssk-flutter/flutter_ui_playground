import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/widget/select_design_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter UI Playground'), actions: [SelectDesignButton()]),
      body: const Center(child: Text('Home Page')),
    );
  }
}
