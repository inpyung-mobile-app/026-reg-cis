import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 정보 확인 화면
class CheckPage extends StatelessWidget {
  final String name;
  final String age;
  final String sex;
  final String birth;
  final String time;
  final Function(int) go; // main.dart의 화면 이동 함수

  const CheckPage({
    super.key,
    required this.name,
    required this.age,
    required this.sex,
    required this.birth,
    required this.time,
    required this.go,
  });

  // 둥근 정보 칸 (누르면 page 번호 화면으로 이동)
  Widget infoBox(String text, int page, double top, {double right = 55}) {
    return Positioned(
      left: 55,
      right: right,
      top: top,
      child: GestureDetector(
        onTap: () => go(page),
        child: Container(
          height: 52,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 화면이 열릴 때 서서히 나타나기
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 600),
      builder: (context, v, child) => Opacity(opacity: v, child: child),
      child: Stack(
        children: [
          infoBox('이름 : $name', 1, 323),
          infoBox('나이 : $age세', 2, 388, right: 55 + 52 + 16),
          // 성별 동그라미
          Positioned(
            right: 55,
            top: 388,
            child: GestureDetector(
              onTap: () => go(3),
              child: Container(
                width: 52,
                height: 52,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  sex == '여성' ? 'assets/icons/female.svg' : 'assets/icons/male.svg',
                ),
              ),
            ),
          ),
          infoBox('생일 : $birth', 4, 454),
          infoBox('태어난 시간 : $time', 5, 519),

          // 시작하기 버튼 → 빈 홈 화면
          Positioned(
            left: 0,
            right: 0,
            top: 624,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Scaffold()), // 홈 화면 (빈 화면)
                  );
                },
                child: Container(
                  width: 196,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff84667A), Color(0xff3C1463)],
                      stops: [0.1, 0.8],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(color: Color(0x993E244F), blurRadius: 15, offset: Offset(0, 8)),
                    ],
                  ),
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
        ],
      ),
    );
  }
}
