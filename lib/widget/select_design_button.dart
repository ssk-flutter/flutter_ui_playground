import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/design/design_page.dart';

class SelectDesignButton extends StatelessWidget {
  const SelectDesignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {

        final size = MediaQuery.sizeOf(context);

        Size designedSize = size;
        if (result != 'pure_size') {
          final width = double.parse(result);
          designedSize = Size(width, size.height * width / size.width);
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => DesignPage(designedSize: designedSize)));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(value: 'pure_size', child: Text('pure size')),
        const PopupMenuItem<String>(value: '375', child: Text('375')),
        const PopupMenuItem<String>(value: '393', child: Text('393')),
        const PopupMenuItem<String>(value: '440', child: Text('440')),
        const PopupMenuItem<String>(value: '480', child: Text('480')),
      ],
    );
  }
}
