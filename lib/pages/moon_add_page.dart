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
            back(context),
            title(),
            have(),
            list(),
          ],
        ),
      ),
    );
  }

  Widget back(BuildContext context) =>
      Positioned(
        left: 20,
        top: 20,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Padding(padding: EdgeInsets.all(10), child: SvgPicture.asset('assets/icons/arrow.svg', width: 28)),
        ),
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
                Container(decoration: glow,width: 40,height: 40, child: Image.asset('assets/moon.png')),
                SizedBox(width: 5),
                ValueListenableBuilder<int>(
                    valueListenable: moon,
                    builder: (_, v, _) => Text('$v',style: TextStyle(fontFamily: 'NanumMyeongjo',
                    color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
                )
              ],
            )
          ],
        ),
      );


 Widget moons(int n) => SizedBox(
   width: 50,
   height: 50,
   child: Stack(
     clipBehavior: Clip.none,
     children: [
       if (n >= 2) Positioned(left: 15, top:  5, child: Container(decoration: glow,width: 35,height: 35,
           child: Image.asset('assets/moon.png'))),
       if (n >= 3) Positioned(left: 30, top: 30,child: Container(decoration:glow,width: 15,height: 15,
           child: Image.asset('assets/moon.png',width: 15))),
       Positioned(left: n == 1 ? 6 : 1, top: n == 1 ? 6 : 10, child: Container(decoration: glow,width: 40,height: 40,
           child: Image.asset('assets/moon.png'))),
     ],
   ),
 );

 void buy(BuildContext c,int amout,String price) async {
   final ok = await showDialog<bool>(
     context: c,
     builder: (d) => AlertDialog(
       title: Text('상품을 구매하시겠습니까?'
       ),
       content: Text('달 $amout개\n$price'),
       actions: [
         TextButton(onPressed: () => Navigator.pop(d,false),child:Text('아니요')),
         TextButton(onPressed: () => Navigator.pop(d,true),child: Text('네'),)
       ]
     )
   );
   if (ok != true) return;
   saveMoon(moon.value + amout);
   toast('달 $amout개 구매가 완료되었습니다.');
 }

 Widget item (int n,int amount,String sale,String price,{bool last = false}) =>
Builder(builder: (c) => GestureDetector(behavior: HitTestBehavior.opaque,
onTap: () => buy(c, amount, price),
  child: Container(
    height: 63,
    padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      border: last ? null : Border(bottom: BorderSide(color: Colors.white24)),
    ),
    child: Row(
      children: [
        moons(n),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('달 $amount개',style: TextStyle(fontFamily: 'NanumMyeongjo',color: Colors.white,fontSize: 18,
            fontWeight: FontWeight.bold),),
            Text(sale,style: TextStyle(fontFamily: 'NanumMyeongjo',color: Color(0xffFFD700),fontSize: 12,
            fontWeight: FontWeight.bold),)
          ],
        ),
        Spacer(),
        Text(price,style: TextStyle(fontFamily: 'NanumMyeongjo',color: Colors.white,fontSize: 18,
        fontWeight: FontWeight.bold),)
      ],
    ),
  ),
  )
);

  Widget list() =>
      Positioned(
        left: 17,
        right: 17,
        top: 270,
        child: Column(
          children: [
            item(1,25, '약 750원 할인', '5,500원'),
            item(1,50, '약 2,600원 할인', '9,900원'),
            item(2,75, '약 4,750원 할인', '14,000원'),
            item(2,100, '약 8,000원 할인', '17,000원'),
            item(3,200, '약 17,000원 할인', '33,000원'),
            item(3,350, '약 32,500원 할인', '55,000원',last: true),
          ],
        ),
      );
}