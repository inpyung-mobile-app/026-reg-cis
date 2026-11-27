// 공통적으로 쓰이는 변수 또는 함수 모음
// 자료형이 없을 시 유추를 통해 자료형을 할당
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

Widget bCloud(double left,double top, {bool flipY = false,bool flip = false, double width = 220,double opacity = 1}) {
  return Positioned(
    left: left,
    top: top,
    child:Opacity(
      opacity: opacity,
      child: Transform.flip(
        flipX: flip,
        flipY: flipY,
        child: Image.asset('assets/cloud.png',width: width,),
      ),
    )
  );
}//코드 끝


const titles = [
  '운명을 엿볼 시간이에요.',
  '이름을 입력해주세요.',
  '나이를 입력해주세요.',
  '성별을 선택해주세요.',
  '태어난 날짜를 입력해주세요.',
  '태어난 시간을 입력해주세요.',
  '입력한 정보가 맞는지 확인해주세요.',
];

const glow = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: [BoxShadow(color: Color(0x66FFD54f),blurRadius: 5)]
);

//저장된 달 개수를 읽어 moon에 넣은 함수
Future<void> loadMoon() async {
  final p = await SharedPreferences.getInstance();
  moon.value = p.getInt('moon') ?? 10;
}

//moon를 바꾸로 저장하는 함수
Future<void> saveMoon(int v) async {
  moon.value = v;
  final p = await SharedPreferences.getInstance();
  await p.setInt('moon',v);
}

final moon = ValueNotifier<int> (10);

void toast(String msg) => MethodChannel('toast').invokeMethod('show',msg);
