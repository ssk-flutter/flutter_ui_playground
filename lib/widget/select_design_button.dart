import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/page/using_screen_util/using_screen_util_page.dart';
import 'package:flutter_ui_playground/type/screen_type.dart';

class SelectDesignButton extends StatelessWidget {
  const SelectDesignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ScreenType>(
      onSelected: (ScreenType type) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UsingScreenUtilPage(screenType: type)));
      },
      itemBuilder: (BuildContext context) =>
          ScreenType.values.map((e) => PopupMenuItem(value: e, child: Text(e.name))).toList(),
    );
  }
}
