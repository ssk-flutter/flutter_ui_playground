DesignedScreen 위젯

device_preview나 flutter_screenutil과 유사하게, UI가 다양한 화면 크기에서도 디자인 시안의 비율을 유지하도록
도와주는 위젯입니다.

디자인 원본의 해상도를 기준으로 자식 위젯들의 크기와 위치를 자동으로 조절하여, 어떤 기기에서든 일관된
레이아웃을 보여줍니다. flutter_screenutil처럼 .w, .h 같은 확장 메서드를 사용하지 않고, 위젯 트리에 한 번만
선언하여 간편하게 적용할 수 있습니다.

주요 기능 및 사용법

DesignedScreen은 preferredWidth 또는 preferredHeight 값을 기준으로 화면 비율을 계산합니다.

* preferredWidth: 디자인 시안의 가로 너비를 기준으로 UI를 조절하고 싶을 때 사용합니다.
* preferredHeight: 디자인 시안의 세로 높이를 기준으로 UI를 조절하고 싶을 때 사용합니다.

동작 방식:

1. `preferredWidth` 또는 `preferredHeight` 중 하나만 지정한 경우:
    * 해당 값과 실제 기기 화면의 비율을 계산하여 전체 UI를 확대/축소합니다.

2. `preferredWidth`와 `preferredHeight`를 모두 지정한 경우:
    * 가로 비율과 세로 비율을 각각 계산한 후, 원본 디자인에 더 가까운 비율을 선택하여 적용합니다. 이를 통해
      화면 왜곡을 최소화합니다.

3. 둘 다 지정하지 않은 경우 (`null`):
    * 비율 계산의 기준이 없으므로 Exception이 발생합니다.

사용 예시

Figma나 Sketch에서 360x800 해상도로 디자인했다면 다음과 같이 사용할 수 있습니다.

1 DesignedScreen(
2 // 기준이 될 디자인 시안의 너비
3 preferredWidth: 360,
4 // 기준이 될 디자인 시안의 높이 (둘 중 하나는 생략 가능)
5 // preferredHeight: 800,
6 child: YourScreenWidget(),
7 );

이 위젯으로 감싸진 YourScreenWidget과 그 하위 위젯들은 실제 기기의 해상도에 맞춰 자동으로 크기가 조절되어,
360x800 환경에서 보던 것과 거의 동일한 비율로 보이게 됩니다.

---
DesignedScreen Widget

This is a widget that helps your UI maintain the proportions of the original design across various screen
sizes, similar to packages like device_preview or flutter_screenutil.

It automatically scales the size and position of its child widgets based on the resolution of your original
design, ensuring a consistent layout on any device. Unlike flutter_screenutil, you don't need to use
extension methods like .w or .h. You can simply apply it once in your widget tree.

Key Features and How to Use

DesignedScreen calculates the screen ratio based on the preferredWidth or preferredHeight values you
provide.

* preferredWidth: Use this if you want to scale the UI based on the width of your design canvas.
* preferredHeight: Use this if you want to scale the UI based on the height of your design canvas.

Behavior:

1. If only one of `preferredWidth` or `preferredHeight` is set:
    * The widget calculates the ratio between the actual device dimension and the provided dimension, then
      scales the entire UI up or down.

2. If both `preferredWidth` and `preferredHeight` are set:
    * It calculates both the width and height ratios separately. Then, it applies the ratio that is closer to
      the original design to minimize distortion.

3. If both are `null`:
    * An Exception is thrown because there is no base dimension to calculate the ratio from.

Example Usage

For instance, if you designed your screen on a 360x800 canvas in Figma or Sketch, you would use it as
follows:

1 DesignedScreen(
2 // The width of your design canvas.
3 preferredWidth: 360,
4 // The height of your design canvas (optional if width is set).
5 // preferredHeight: 800,
6 child: YourScreenWidget(),
7 );

The YourScreenWidget and all its descendants will be automatically scaled to fit the actual device's
resolution, making them appear in nearly the same proportion as they did on the 360x800 design canvas.