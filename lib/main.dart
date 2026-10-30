import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  // 달 이미지를 만드는 함수
  Widget moon({double top = 0, double left = 0}) {
    return Positioned(
      top: top,
      left: left,
      child: Image.asset(
        'assets/moon.png',
        width: 150,
        height: 150,
      ),
    );
  }


  Widget cloud({
    double top = 0,
    double left = 0,
    double width = 100,
    double height = 100,
    double angle = 0,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 2),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        child: Transform.rotate(
          angle: angle, // 회전 각도
          child: Image.asset(
            'assets/cloud.png',
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    // 화면 가로 길이
    final screenWidth = screenSize.width;

    // 화면 세로 길이
    final screenHeight = screenSize.height;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff381361),
                Color(0xff2B0A42),
              ],
              stops: [0.1, 0.85],
            ),
          ),
          child: Stack(
            children: [
              moon(),
              cloud(height: 220, width: 270, top: 620, left: 150),
              cloud(height: 220,
                  width: 200,
                  top: 620,
                  left: -25,
                  angle: 0.2),
              cloud(height: 220, width: 260, top: 650, left: 210),
              cloud(height: 240,
                  width: 240,
                  top: 680,
                  left: -25,
                  angle: 0.2),
              cloud(height: 210, width: 250, top: 710, left: 130),

              Positioned(
                top: 240,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 로고: 기존 크기 유지
                    Image.asset(
                      'assets/Daily Tarot.png',
                      width: 200,
                      height: 100,
                    ),

                    // 장식을 위로 25만큼 이동
                    Transform.translate(
                      offset: Offset(0, -25),
                      child: Image.asset(
                        'assets/graphic.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(height: 10),

                    // 안내 문구를 위로 40만큼 이동
                    Transform.translate(
                      offset: Offset(0, -40),
                      child: Text(
                        '운명을 엿볼 시간이에요.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'NanumMyeongjo',
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
