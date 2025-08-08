import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/design/design_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Playground'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              double? designedWidth;
              if (result != 'pure_size') {
                designedWidth = double.parse(result);
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DesignPage(designedWidth: designedWidth)),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(value: 'pure_size', child: Text('pure size')),
              const PopupMenuItem<String>(value: '375', child: Text('375')),
              const PopupMenuItem<String>(value: '393', child: Text('393')),
              const PopupMenuItem<String>(value: '440', child: Text('440')),
              const PopupMenuItem<String>(value: '480', child: Text('480')),
            ],
          ),
        ],
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}
