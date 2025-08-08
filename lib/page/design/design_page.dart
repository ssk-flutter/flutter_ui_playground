import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignPage extends StatelessWidget {
  final double? designedWidth;

  const DesignPage({super.key, this.designedWidth});

  @override
  Widget build(BuildContext context) {
    double getSquareSize() {
      if (designedWidth == null) {
        return MediaQuery.of(context).size.width - 40;
      }
      switch (designedWidth) {
        case 375:
          return 320;
        case 393:
          return 335;
        case 440:
          return 375;
        case 480:
          return 410;
        default:
          return designedWidth! - 40;
      }
    }

    if (designedWidth != null) {
      ScreenUtil.init(context, designSize: Size(designedWidth!, 812));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: getSquareSize(),
                height: getSquareSize(),
                color: Colors.red,
                child: Center(
                  child: Text(
                    '${getSquareSize().toInt()}x${getSquareSize().toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  color: Colors.blue,
                ),
                Container(
                  width: 96,
                  height: 96,
                  color: Colors.green,
                ),
                Container(
                  width: 96,
                  height: 96,
                  color: Colors.yellow,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Hello World',
                  style: TextStyle(fontSize: 40.sp),
                ),
                const SizedBox(width: 20),
                Text(
                  'font 40',
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '이 구문이 유명해지자 요즘에는 언급한 오래된 컴퓨터 언어의 입문서에서도 볼 수 있다. 뿐만 아니라 특이한 프로그래밍 언어도 소개할 때에도 이것을 출력하는 코드를 보여주는 것이 암묵의 룰.',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
