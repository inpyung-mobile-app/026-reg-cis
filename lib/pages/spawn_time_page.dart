import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class SpawnTimePage extends StatefulWidget {
  final VoidCallback onBack;
  final Function(String) onNext;
  const SpawnTimePage({super.key, required this.onBack, required this.onNext});

  @override
  State<SpawnTimePage> createState() => _SpawnTimePageState();
}


// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당

class _SpawnTimePageState extends State<SpawnTimePage> {

  bool showDailyTarot = false;
  bool showgraphic = false;
  bool showone = false;
  int hour = 9;
  int minute = 0;
  bool isPm = false;
  bool pickMinute = false;
  final nameContontroller = TextEditingController();
  String ? errorText;
  int pageIndex = 0;

// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//입력칸 (텍스트가 다 올라간 뒤)
      await Future.delayed(Duration(milliseconds: 400));
      if (!mounted) return;
      showone = true;
      setState(() {
      });
    });
  }

 Widget timeBox(int valud, bool active) {
    return Container(
      width: 60,
      height: 53,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: active ? Colors.white54 : Colors.transparent),
      ),
      child: Text(
        valud.toString().padLeft(2, '0'),
        style: TextStyle(
          fontFamily: 'NanumMyeongjo',
          fontSize: 32,
          color: active ? Colors.white: Colors.white54,
        ),
      ),
    );
 }

  Widget clock() {
    const size = 186.0;
    const r = 75.0;
    final sel = pickMinute ? (minute ~/ 5 == 0 ? 12 : minute ~/ 5) : hour;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white70),
              ),
            ),
          ),

          Positioned(  //  바늘
            left: size / 2 - 0.5,
            top: size / 2 - (r - 17),
            child: Transform.rotate(
              angle: sel * pi / 6,
              alignment: Alignment.bottomCenter,
              child: Container(width: 1, height: r - 17, color: Colors.white),
            ),
          ),
          Positioned(     // 점
            left: size / 2 - 3,
            top: size / 2 - 3,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),

          for (int n = 1; n <= 12; n++)
            Positioned(
              left:size / 2 + r * sin(n * pi / 6) - 15,
              top: size / 2 - r * cos(n * pi / 6) -15,
              child: GestureDetector(
                onTap: () {
                  if (!pickMinute) {
                    hour = n;
                    pickMinute = true;
                  }
                  else {
                    minute = n * 5 % 60;
                    final h24 = hour % 12 + (isPm ? 12 : 0);
                    final hh = h24.toString().padLeft(2, '0');
                    final mm = minute.toString().padLeft(2, '0');
                    widget.onNext('$hh:$mm');
                  }
                  setState(() {
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: n == sel ? Colors.white70 : Colors.transparent),
                  ),
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text('$n',
                    style: TextStyle(fontFamily: 'NanumMyeongjo',color: Colors.white,fontSize: 18),),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 395,
          child:AnimatedOpacity(duration: Duration(milliseconds: 400),
          opacity: showone ? 1 : 0,
          child: Center(child: clock(),),),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 305,
          child: AnimatedOpacity(duration: Duration(milliseconds: 400),
          opacity: showone ? 1 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector( // 시 칸을 누르면 다시 시 고르기
                onTap: () => setState(() => pickMinute = false),
                child: timeBox(hour, !pickMinute),
              ),
              SizedBox(
                width: 24,
                child: Text(':', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              GestureDetector( // 분 칸을 누르면 분 고르기
                onTap: () => setState(() => pickMinute = true),
                child: timeBox(minute, pickMinute),
              ),
              SizedBox(width: 3,),
              GestureDetector(
                onTap: () {
                  isPm = !isPm;
                  setState(() {
                  });
                },
                child:Container(
                  width: 42,
                  height: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white54),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('AM',style: TextStyle(fontFamily: 'NanumMyeongjo', fontSize: 15,color: isPm ? Colors.white38 : Colors.white)),
                      Container(height: 1, color: Colors.white54),   // 가운데 구분선
                      Text('PM',style: TextStyle(fontFamily: 'NanumMyeongjo', fontSize: 15,color: isPm ? Colors.white : Colors.white38)),
                    ],
                  ),
                ),
              )
            ],
          ),),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               GestureDetector(
                 onTap: widget.onBack,
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
               SizedBox(width: 14,),
               GestureDetector(
                 onTap: () => widget.onNext('모름'),
                   child: Container(
                     width: 172,
                     padding: EdgeInsets.symmetric(vertical: 14),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(32),
                       color: Colors.white.withValues(alpha: 0.1),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('잘 모르겠어요',style: TextStyle(color: Colors.white,
                             fontSize: 18,
                             fontWeight: FontWeight.w600),),
                         SizedBox(width: 4,),
                         Transform.flip(
                           flipX: true,
                           child: SvgPicture.asset('assets/icons/arrow.svg',width: 25,),
                         )
                       ],
                     ),
                   ),
               )
             ]
          ),
        ),
      ],
    );
  }
}
