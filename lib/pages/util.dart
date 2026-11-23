// 공통적으로 쓰이는 변수 또는 함수 모음
// 자료형이 없을 시 유추를 통해 자료형을 할당
import 'package:flutter/material.dart';

Widget bCloud(double left, {double? top, double? bottom, bool flip = false, double width = 220}) {
  return Positioned(
    left: left,
    top: top,
    bottom: bottom,
    child: Transform.flip(
      flipX: flip,
      child: Image.asset('assets/cloud.png', width: width),
    ),
  );
}


const titles = [
  '운명을 엿볼 시간이에요.',
  '이름을 입력해주세요.',
  '나이를 입력해주세요.',
  '성별을 선택해주세요.',
  '태어난 날짜를 입력해주세요.',
  '태어난 시간을 입력해주세요.',
  '입력한 정보가 맞는지 확인해주세요.',
];
