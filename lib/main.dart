import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/pages/name_page.dart';
import 'package:test_1/pages/util.dart';
import 'package:test_1/pages/age_page.dart';
import 'package:test_1/pages/sex_page.dart';
import 'package:test_1/pages/spawn_day_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_1/pages/spawn_time_page.dart';
import 'package:test_1/pages/check_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadMoon();
  // 앱을 화면 끝까지(상태바·내비게이션 바 뒤까지) 그리기 → 프로토타입과 같은 화면 비율
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(Myapp());
}

// 상태바·내비게이션 바 투명 설정
const barStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarContrastEnforced: false,
);

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool moon = false;
  bool clouds = false;
  bool DailyTarot = false;
  bool graphic = false;
  bool text1 = false;
  bool better = false;
  String name = '';
  String age = '';
  String sex = '';
  String birth = '';
  String time = '';
  int pageIndex = 0;

  // 시작할 때 한번 호출되는 함수
  // 초기값, 시작 부분 담당
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //달
      await Future.delayed(Duration(milliseconds: 1000));
      moon = true;
      setState(() {});
      //구름
      await Future.delayed(const Duration(milliseconds: 600));
      clouds = true;
      if (!mounted) return;
      setState(() {});
      //데일리 타로 로고
      await Future.delayed(Duration(milliseconds: 700));
      DailyTarot = true;
      setState(() {});
      //작은 문양
      await Future.delayed(Duration(milliseconds: 300));
      graphic = true;
      setState(() {});
      //텍스트
      await Future.delayed(Duration(milliseconds: 500));
      text1 = true;
      setState(() {});
      //시작하기 버튼
      await Future.delayed(Duration(milliseconds: 500));
      better = true;
      setState(() {});
    });
  }

  Widget cloud(
    double left,
    double bottom, {
    bool flip = false,
    double width = 70,
  })
  {
    // 구름 함수
    return Positioned(
      left: left,
      bottom: bottom,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: clouds ? 1.0 : 0.0,
        child: Transform.flip(
          flipX: flip,
          child: Image.asset('assets/cloud.png', width: width),
        ),
      ),
    );
  }

  Widget progrssBar () {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children:
          List.generate(5, (i) {
            return Expanded(
              child: AnimatedContainer(duration: Duration(milliseconds: 400),
              margin: EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: i < pageIndex ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(4)
              ),
              ),
            );
          }
          ),
      ),
    );
  }

  // 화면 이동 함수
  void go(int index) {
    pageIndex = index;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ko'),
      supportedLocales: [Locale('ko')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: barStyle,
          child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff3F1464), Color(0xff260C38)],
              stops: [0.1, 0.8],
            ),
          ),

          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: -20,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: moon ? 1 : 0,
                  child: Image.asset('assets/moon.png', width: 150, height: 170),
                ),
              ),

              cloud(180, 90, width: 220, ),
              cloud(-40, 70, width: 230, flip: true),
              cloud(230, 40, width: 240),
              cloud(-40, -20, width: 270, flip: true),
              cloud(150, -20, width: 240),


              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve:  Curves.easeInOut,
                left: 0,
                right: 0,
                top: pageIndex == 0? 245: 150,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: DailyTarot ? 1 : 0,
                  child: Image.asset(
                    'assets/Daily Tarot.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                left: 0,
                right: 0,
                top: pageIndex == 0? 290: 195,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: graphic ? 1 : 0,
                  child: Image.asset(
                    'assets/graphic.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              //안내 텍스트 (로고처럼 pageIndex에 따라 위치 이동)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                left: 0,
                right: 0,
                top: pageIndex == 0 ? 345 : 250,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: text1 ? 1 : 0,
                  child: Text(
                    titles[pageIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'NanumMyeongjo', color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned.fill(left: 0, right: 0, child: page()),

              if (pageIndex >= 1 && pageIndex <= 5)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: progrssBar(),
                )
            ],
          ),
        ),
        ),
      ),
    );
  }

  Widget page() {
    final pages = [
      buttonPage(),
      NamePage(onBack: () => go(0), onNext: (v) { name = v; go(2); }),
      AgePage(onBack: () => go(1), onNext: (v) { age = v; go(3); }),
      SexPage(onBack: () => go(2), onNext: (v) { sex = v; go(4); }),
      SpawnDayPage(onBack: () => go(3), onNext: (v) { birth = v; go(5); }),
      SpawnTimePage(onBack: () => go(3), onNext: (v) { time = v; go(6);}),
      CheckPage(name: name, age: age, sex: sex, birth: birth, time: time, go: go),
    ];

    return pages[pageIndex];
  }

  Widget buttonPage() => Stack(
    children: [
      Positioned(
        left: 0,
        right: 0,
        bottom: 280,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: better ? 1 : 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                pageIndex++;
                setState(() {});
              },
              child: Container(
                width: 196,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: .topLeft,
                    end: .bottomCenter,
                    colors: [Color(0xff84667A), Color(0xff3C1463)],
                    stops: [0.1, 0.8],
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x993E244F),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '시작하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NanumMyeongjo',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Transform.flip(
                        flipX: true,
                        child: SvgPicture.asset('assets/icons/arrow.svg', width: 23),
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    ],
  );
}

