import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_playground/type/screen_type.dart';

class DesignPage extends StatefulWidget {
  DesignPage({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  void initState() {
    super.initState();
  }

  ScreenType get screenType => widget.screenType;

  double width(BuildContext context) {
    if (widget.screenType == ScreenType.pure) {
      return MediaQuery.sizeOf(context).width;
    }

    return widget.screenType.width.toDouble();
  }

  double getSquareSize(BuildContext context) {
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
        return width(context) - getPadding(context) * 2;
    }
  }

  double getPadding(BuildContext context) => screenType.calculatePadding(width(context));

  @override
  Widget build(BuildContext context) {
    if (screenType == ScreenType.pure) {
      return buildScaffold(context);
    }

    return ScreenUtilInit(
      designSize: screenType.getDesignedSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      child: buildScaffold(context),
      builder: (context, child) => buildScaffold(context)!,
    );
  }

  Widget buildScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        '(${screenType.getDesignedSize(context).width.toStringAsFixed(2)}, ${screenType.getDesignedSize(context).height.toStringAsFixed(2)})',
      ),
      actions: [
        Text('padding: ${getPadding(context).toInt()}'),
        SizedBox(width: getPadding(context)),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          children: [
            Center(
              child: Container(
                width: getSquareSize(context),
                height: getSquareSize(context),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    '${getSquareSize(context).toInt()}x${getSquareSize(context).toInt()}',
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
                Text(
                  'font 40',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '이 구문이 유명해지자 요즘에는 언급한 오래된 컴퓨터 언어의 입문서에서도 볼 수 있다. 뿐만 아니라 특이한 프로그래밍 언어도 소개할 때에도 이것을 출력하는 코드를 보여주는 것이 암묵의 룰.',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            sizeText(context),
            // SizedBox(height: 20),
            // if (false) Text(longText),
          ],
        ),
      ),
    ),
  );

  String get longText {
    return '''헌법개정안이 제2항의 찬성을 얻은 때에는 헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다. 국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다.

제2항의 재판관중 3인은 국회에서 선출하는 자를, 3인은 대법원장이 지명하는 자를 임명한다. 제1항의 탄핵소추는 국회재적의원 3분의 1 이상의 발의가 있어야 하며, 그 의결은 국회재적의원 과반수의 찬성이 있어야 한다. 다만, 대통령에 대한 탄핵소추는 국회재적의원 과반수의 발의와 국회재적의원 3분의 2 이상의 찬성이 있어야 한다.

국회의원은 국가이익을 우선하여 양심에 따라 직무를 행한다. 탄핵결정은 공직으로부터 파면함에 그친다. 그러나, 이에 의하여 민사상이나 형사상의 책임이 면제되지는 아니한다.

예비비는 총액으로 국회의 의결을 얻어야 한다. 예비비의 지출은 차기국회의 승인을 얻어야 한다. 국회는 의장 1인과 부의장 2인을 선출한다. 국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다.

제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다. 위원은 정당에 가입하거나 정치에 관여할 수 없다. 대통령이 제1항의 기간내에 공포나 재의의 요구를 하지 아니한 때에도 그 법률안은 법률로서 확정된다.

교육의 자주성·전문성·정치적 중립성 및 대학의 자율성은 법률이 정하는 바에 의하여 보장된다. 정당의 설립은 자유이며, 복수정당제는 보장된다. 국회는 선전포고, 국군의 외국에의 파견 또는 외국군대의 대한민국 영역안에서의 주류에 대한 동의권을 가진다.''';
  }

  Widget sizeText(BuildContext context) => Text(
    'Size: ${MediaQuery.sizeOf(context).width.toInt()}x${MediaQuery.sizeOf(context).height.toInt()}',
    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
  );
}
