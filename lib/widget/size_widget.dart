import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget({super.key, required this.width, required this.colorKey});

  final double width;
  final int colorKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.orange[colorKey],
      child: Row(
        children: [
          Spacer(),
          Text('${width.floor()}'),
          SizedBox(width: 8), //
        ],
      ),
    );
  }
}
