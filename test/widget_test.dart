import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_1/main.dart';

void main() {
  testWidgets('온보딩 요소가 순서대로 나타나고 이름 입력 화면으로 이동한다', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(360, 780);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    Finder asset(String name) => find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == 'assets/$name',
    );

    double opacityOf(Finder child) => tester
        .widget<Opacity>(
          find.ancestor(of: child, matching: find.byType(Opacity)).first,
        )
        .opacity;

    final elements = [
      asset('moon.png'),
      asset('cloud.png').first,
      asset('Daily Tarot.png'),
      asset('graphic.png'),
      find.text('운명을 엿볼 시간이에요.'),
      find.byType(ElevatedButton),
    ];

    await tester.pumpWidget(const Myapp());
    await tester.pump();
    expect(elements.map(opacityOf), everyElement(0.0));

    await tester.tapAt(const Offset(180, 510));
    expect(find.byType(TextField), findsNothing);

    var elapsed = 0;
    Future<void> advanceTo(int time) async {
      await tester.pump(Duration(milliseconds: time - elapsed));
      elapsed = time;
    }

    // 각 요소가 움직이는 중간과 다음 요소를 기다리는 순간을 확인해요.
    const stages = [
      (180, 340),
      (525, 705),
      (875, 1040),
      (1140, 1240),
      (1385, 1570),
      (1795, 1950),
    ];
    for (var i = 0; i < stages.length; i++) {
      final (movingAt, settledAt) = stages[i];
      await advanceTo(movingAt);
      expect(elements.take(i).map(opacityOf), everyElement(1.0));
      expect(opacityOf(elements[i]), closeTo(0.5, 0.02));
      expect(elements.skip(i + 1).map(opacityOf), everyElement(0.0));

      await advanceTo(settledAt);
      expect(elements.take(i + 1).map(opacityOf), everyElement(1.0));
      expect(elements.skip(i + 1).map(opacityOf), everyElement(0.0));
    }

    final startButton = find.byType(ElevatedButton);
    expect(tester.getRect(startButton), const Rect.fromLTWH(90, 470, 180, 56));
    // Pixel 5의 실제 화면 크기에서도 배경이 화면 끝까지 채워져야 해요.
    tester.view.devicePixelRatio = 2.75;
    tester.view.physicalSize = const Size(1080, 2340);
    await tester.pump();
    final fittedScene = find.ancestor(
      of: startButton,
      matching: find.byWidgetPredicate(
        (widget) => widget is FittedBox && widget.fit == BoxFit.fitWidth,
      ),
    );
    expect(tester.getSize(fittedScene), const Size(1080 / 2.75, 2340 / 2.75));

    await tester.tap(startButton);
    await tester.pumpAndSettle();
    final nameField = find.byType(TextField);
    expect(nameField, findsOneWidget);
    expect(find.text('이름을 입력해주세요.'), findsNWidgets(2));
    await tester.enterText(nameField, '홍길동');
    expect(find.text('홍길동'), findsOneWidget);

    await tester.tap(find.text('이전'));
    await tester.pumpAndSettle();
    expect(nameField, findsNothing);
    expect(find.text('시작하기'), findsOneWidget);
  });
}
