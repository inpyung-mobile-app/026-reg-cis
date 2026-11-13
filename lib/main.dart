import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/pages/name_page.dart';

void main() {
  runApp(Myapp());
}

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
  }) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: moon ? 1 : 0,
                child: Image.asset('assets/moon.png', width: 130, height: 130),
              ),

              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: clouds ? 1 : 0,
              ),

              cloud(180, 80, width: 220, flip: true),
              cloud(-20, 60, width: 220, flip: true),
              cloud(230, 40, width: 220),
              cloud(-10, 10, width: 220, flip: true),
              cloud(170, -10, width: 220),

              Positioned(
                left: 0,
                right: 0,
                top: 200,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: DailyTarot ? 1 : 0,
                  child: Image.asset(
                    'assets/Daily Tarot.png',
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 255,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: graphic ? 1 : 0,
                  child: Image.asset(
                    'assets/graphic.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 330,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: text1 ? 1 : 0,
                  child: Text(
                    '운명을 엿볼 시간이에요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'NanumMyeongjo',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(left: 0, right: 0, top: 510, child: page()),
            ],
          ),
        ),
      ),
    );
  }

  Widget page() {
    final pages = [buttonPage(), const NamePage()];

    return pages[pageIndex];
  }

  Widget buttonPage() => AnimatedOpacity(
    duration: Duration(milliseconds: 1000),
    opacity: better ? 1 : 0,
    child: Center(
      child: GestureDetector(
        onTap: () {
          pageIndex++;
          setState(() {});
        },
        child: Container(
          width: 180,
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
  );
}
