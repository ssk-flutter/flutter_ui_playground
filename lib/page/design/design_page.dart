import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignPage extends StatefulWidget {
  final Size designedSize;

  DesignPage({super.key, required this.designedSize});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  void initState() {
    super.initState();
  }

  int get width => widget.designedSize.width.toInt();

  double getSquareSize() {
    switch (width) {
      case 375:
        return 320;
      case 393:
        return 335;
      case 440:
        return 375;
      case 480:
        return 410;
      default:
        return width - 27 * 2;
    }
  }

  double getPadding() {
    switch (width) {
      case 375:
        return 27;
      case 393:
        return 29;
      case 440:
        return 32;
      case 480:
        return 35;
      default:
        return 25;
    }
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: widget.designedSize,
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => Scaffold(
      appBar: AppBar(
        title: Text(
          '(${widget.designedSize.width.toStringAsFixed(2)}, ${widget.designedSize.height.toStringAsFixed(2)})',
        ),
        actions: [
          Text('padding: ${getPadding().toInt()}'),
          SizedBox(width: getPadding()),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding()),
        child: Column(
          children: [
            Center(
              child: Container(
                width: getSquareSize(),
                height: getSquareSize(),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    '${getSquareSize().toInt()}x${getSquareSize().toInt()}',
                    style: TextStyle(color: Colors.white, fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      '96x96',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      '96x96',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      '96x96',
                      style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Hello World',
                  style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 20),
                Text('font 40', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '이 구문이 유명해지자 요즘에는 언급한 오래된 컴퓨터 언어의 입문서에서도 볼 수 있다. 뿐만 아니라 특이한 프로그래밍 언어도 소개할 때에도 이것을 출력하는 코드를 보여주는 것이 암묵의 룰.',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ),
  );
}
