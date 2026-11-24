import 'package:flutter/material.dart';
import 'package:test_1/pages/util.dart';

class BHome extends StatelessWidget {
  const BHome({super.key});

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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(left: 0, right: 0, top: 0,child: Transform.flip(flipX: true,child: clouds())),
              Positioned(
                left: 0,
                right: 0,
                bottom: -0,
                child: Transform.flip(flipY: true, child: clouds()),
              ),
              content(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Positioned(
                    right: 50,
                    top: 10,
                    child: Image.asset('assets/moon.png',width: 50,),// 달
                  ),
                  Text('10',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(width: 15,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget content() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 120),
      Center(child: Image.asset('assets/Daily Tarot.png', width: 250)),
      Center(child: Image.asset('assets/graphic.png', width: 60)),
      SizedBox(height: 7),
      Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: Text(
          'Daily Tarot Soul Card',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'NanumMyeongjo',
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 12),
      Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color(0x66B07CFF),
                blurRadius: 24,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Stack(
            children: [
              Image.asset('assets/daily_tarot_soul_card.png'),
              Positioned(
                right: 24,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Soul Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NanumMyeongjo',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '운명적인 나만의 데일리 카드!\n매일 하루를 카운셀링 받드세요.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 40),
      Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: Text(
          'Daily Tarot List',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'NanumMyeongjo',
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 12),
      SizedBox(
        height: 205,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          children: [
            tarotCard(
              'assets/love_tarot.png',
              '인연 타로',
              '지금은 힘들지만 그래도,\n그 사람과 인연이 될 수 있을까?',
            ),
            SizedBox(width: 12),
            tarotCard(
              'assets/fruit_tarot.png',
              '열매 타로',
              '지금은 생각하고있는 일은\n어떤 결과로 이어질까?',
            ),
          ],
        ),
      ),
      SizedBox(height: 30),
      Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: Text(
          'Daily Master',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'NanumMyeongjo',
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 12),
      Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Stack(children: [Image.asset('assets/daily_master.png',width: double.infinity,fit: BoxFit.fitWidth,),
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('당신만을 위한 상담',style: TextStyle(color: Colors.white,fontFamily: 'NanumMyeongjo',fontWeight: FontWeight.bold,fontSize: 18),),
                Text("당신만을 위해 모인 '데일리마스터'와\n직접 이야기를 나누어 보세요.",style: TextStyle(color: Colors.white,
                fontFamily: 'NanumMyeongjo',fontSize: 15),)
              ],
            ),
          )]),
        ),
      ),
      SizedBox(height: 80),
    ],
  );

  Widget clouds() => ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 300),
    child: Stack(
      children: [
        bCloud(170, 30, flipY: true, flip: true, width: 220),
        bCloud(-20, 20, flipY: true, width: 220),
        bCloud(240, -10, flipY: true, width: 220),
        bCloud(0, -20, flipY: true, flip: true, width: 200),
        bCloud(170, -20, flipY: true, flip: true, width: 220),
      ],
    ),
  );
}

Widget tarotCard(String img, String title, String desc) => Container(
  width: 205,
  height: 205,
  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
  child: Stack(
    children: [
      Image.asset(img, width: 205, height: 205, fit: BoxFit.cover),
      Positioned(
        left: 14,
        bottom: 14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NanumMyeongjo',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NanumMyeongjo',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
