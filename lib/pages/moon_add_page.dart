import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/pages/util.dart';

class MoonAddPage extends StatelessWidget {
  const MoonAddPage({super.key});


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
            bCloud(240, -10, flipY: true, width: 220),
            bCloud(0, -20, flipY: true, flip: true, width: 200),
            bCloud(170, -50, flipY: true, flip: true, width: 220),
            // 아랫쪽 구름
            bCloud(170, 700, width: 220),
            bCloud(-20, 720, flip: true, width: 220),
            bCloud(240, 740, width: 220),
            bCloud(0, 780, flip: true, width: 200),
            bCloud(170, 800, flip: true, width: 220),
            back(),
            title(),
            have(),
            list(),
          ],
        ),
      ),
    );
  }

  Widget back() =>
      Positioned(
        left: 20,
        top: 20,
        child: SvgPicture.asset('assets/icons/arrow.svg', width: 28),
      );


  Widget title() =>
      Positioned(
        left: 0,
        right: 0,
        top: 80,
        child: Column(
          children: [
            Align(
              heightFactor: 0.45,
              child: Image.asset('assets/graphic.png', width: 60,),
            ),
            SizedBox(height: 8),
            Text('달 충전', style: TextStyle(fontFamily: 'NanumMyeongjo',
                color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      );


  Widget have() =>
      Positioned(
        left: 0,
        right: 0,
        top: 180,
        child: Column(
          children: [
            Text('현재 보유중인 달', style: TextStyle(fontFamily: 'NanumMyeongjo',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/moon.png', width: 40),
                SizedBox(width: 5),
                Text('10', style: TextStyle(fontFamily: 'NanumMyeongjo',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      );


 Widget moons(int n) => SizedBox(
   width: 50,
   height: 50,
   child: Stack(
     children: [
       Positioned(left: n == 1 ? 6 : 1, top: n == 1 ? 6 : 10, child: Image.asset('assets/moon.png',width: 40)),
       if (n >= 2) Positioned(left: 15, top:  5, child: Image.asset('assets/moon.png',width: 35,)),
       if (n >= 3) Positioned(left: 30, top: 30,child: Image.asset('assets/moon.png',width: 15)),
     ],
   ),
 );

 Widget item (int n, String name, String sale, String price) =>
 Container(
   height: 63,
   padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
   decoration: BoxDecoration(
     border: Border(bottom: BorderSide(color: Colors.white24)),
   ),
   child: Row(
     children: [
       moons(n),
       SizedBox(width: 10),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(name , style: TextStyle(fontFamily:'NanumMyeongjo',color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
           Text(sale, style: TextStyle(fontFamily: 'NanumMyeongjo',color: Color(0xffFFD700),fontSize: 12,fontWeight: FontWeight.bold),)
         ],
       ),
       Spacer(),
       Text(price,style: TextStyle(fontFamily: 'NanumMyeongjo',color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
     ],
   ),
 );

  Widget list() =>
      Positioned(
        left: 17,
        right: 17,
        top: 270,
        child: Column(
          children: [
            item(1,'달 25개', '약 750원 할인', '5,500원'),
            item(1,'달 50개', '약 2,600원 할인', '9,900원'),
            item(2,'달 75개', '약 4,750원 할인', '14,000원'),
            item(2,'달 100개', '약 8,000원 할인', '17,000원'),
            item(3,'달 200개', '약 17,000원 할인', '33,000원'),
            item(3,'달 350개', '약 32,500원 할인', '55,000원'),
          ],
        ),
      );
}