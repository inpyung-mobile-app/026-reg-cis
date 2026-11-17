import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/util.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}


// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당

class _NamePageState extends State<NamePage> {

bool showDailyTarot = false;
bool showgraphic = false;
bool showtext1 = false;
int pageIndex = 0;

// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if (!mounted) return;
    setState(() {});
//데일리 타로 로고
    await Future.delayed(Duration(milliseconds: 100));
    showDailyTarot = true;
    setState(() {});
//작은 문양
    await Future.delayed(Duration(milliseconds: 150));
    showgraphic = true;
    setState(() {});
//텍스트
    await Future.delayed(Duration(milliseconds: 200));
    showtext1 = true;
    setState(() {});
//시작하기 버튼
  });
}


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 250,
          child: AnimatedSlide(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            offset: showtext1 ? Offset.zero: Offset(0,1),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500,),
              opacity: showtext1 ? 1 : 0,
              child: Text(
                titles[1],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NanumMyeongjo',
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 62,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white.withValues(alpha: 0.1),
              ),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 1),
              width: 100,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/arrow.svg', width: 25),
                      SizedBox(width: 4),
                      Text(
                        '이전',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ),
        Positioned(
          left: 55,
          right: 55,
          top: 325,
          child: Container(
            height: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 26),
            child: Text(
              '이름을 입력해주세요.',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
