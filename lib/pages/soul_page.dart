import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/pages/util.dart';

class SoulPage extends StatelessWidget {
  const SoulPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff351157), Color(0xff280D43)],
            stops: [0.1, 0.8],
          ),
        ),
        child: Stack(
          children: [
            //위쪽 구름
            bCloud(170, 30, flipY: true, flip: true, width: 220),
            bCloud(-20, 20, flipY: true, width: 220),
            bCloud(240, -10, flipY: true, width: 2),
            bCloud(0, -20, flipY: true, flip: true, width: 200),
            bCloud(170, -50, flipY: true, flip: true, width: 220),
            // 아랫쪽 구름
            bCloud(170, 650, width: 220),
            bCloud(-20, 670, flip: true, width: 220),
            bCloud(240, 690, width: 220),
            bCloud(0, 730, flip: true, width: 200),
            bCloud(170, 750, flip: true, width: 220),
            back(context),
            title(),
            boby(),
            bottom(),
          ],
        ),
      ),
    );
  }

  // 왼쪽 위 뒤로가기 버튼
  Widget back(BuildContext context) =>
      Positioned(
        left: 12,
        top: MediaQuery.of(context).padding.top,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(padding: EdgeInsets.fromLTRB(8, 4, 8, 14), child: SvgPicture.asset('assets/icons/arrow.svg', width: 22)),
        ),
      );

  // 로고 문양과 제목
  Widget title() =>
      Positioned(
        left: 0,
        right: 0,
        top: 80,
        child: Column(
          children: [
            Align(heightFactor: 0.45, child: Image.asset('assets/graphic.png', width: 60)),
            SizedBox(height: 8),
            Text('나의 생일로 알아보는 소울카드', style: TextStyle(fontFamily: 'NanumMyeongjo',
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      );
}

TextSpan yellow(String s) => TextSpan(text: s,style: TextStyle(color: Colors.yellow));

Widget boby() => Positioned(
  left: 0,
  right: 0,
  top: 190,
  child:Text.rich(
    textAlign: TextAlign.center,style: TextStyle(fontFamily: 'NotoSansKR',color: Colors.white,
  fontSize: 13,fontWeight: FontWeight.bold,height: 2.4),
    TextSpan(
      children :[
        yellow('소울 넘버'),
        TextSpan(text: '는 생년월일의 숫자를 모두 더해\n얻는 최종적인 한 자리 숫자로,\n당신의 핵심적인 에너지와 삶의 테마를 나타냅니다.'
            '\n이 소울 넘버에 해당하는\n메이저 아르카나 타로 카드가 바로 '),
        yellow('소울 카드'),
        TextSpan(text: '이며,\n이는 당신의 타고난 성격, 기질,\n그리고 삶의 목적을 상징합니다.\n즉, 소울 넘버는 당신의 '),
        yellow('영혼의 번호'),
        TextSpan(text: '이고,\n소울 카드는 그 번호가 의미하는\n'),
        yellow('영혼의 본질'),
        TextSpan(text: '을 보여주는 상징인 셈입니다.')
      ]
    )
  ),
);

Widget bottom() => Positioned(
  left: 0,
  right: 0,
  top: 540,
  child: Column(
    children: [
      Container(
        width: 250,
        height: 50,
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(32),border: Border.all(color: Colors.white54)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('생년월일을 선택해주세요',style: TextStyle(fontFamily: 'NotoSansKR',color: Colors.white60,fontSize: 15,
          fontWeight: FontWeight.bold)),
          Transform.flip(flipX: true,child: SvgPicture.asset('assets/icons/arrow.svg',width: 20,),)
        ],),
      ),
      SizedBox(height: 48),
      Container(
        width: 283,
        height: 62,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff84667A),Color(0xff3C1463)]),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.asset('assets/moon.png',width: 45,)),
            SizedBox(width: 8,),
            Text('달 10개로 소울카드 찾기',style: TextStyle(fontFamily: 'NotoSansKR',color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      SizedBox(height: 14),
      Text('소울카드에 사용되는 정보는\n카드 조합 용도 외에 사용되지 않습니다.',textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'NotoSansKR',color: Colors.white54,fontSize: 11.5,height: 1.6),)
    ],
  ),
);