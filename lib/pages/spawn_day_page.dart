import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpawnDayPage extends StatefulWidget {
  final VoidCallback onBack;
  final Function(String) onNext;
  const SpawnDayPage({super.key, required this.onBack, required this.onNext});


  @override
  State<SpawnDayPage> createState() => _SpawnDayPageState();
}


// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당

class _SpawnDayPageState extends State<SpawnDayPage> {

  bool showDailyTarot = false;
  bool showgraphic = false;
  bool showone = false;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
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

  Widget calender() {
    final first = DateTime(year,month, 1);
    final offest = first.weekday % 7;
    final days = DateTime(year,month + 1, 0).day;
    final count = ((offest + days) / 7).ceil() * 7;

    return GridView.count(
      crossAxisCount: 7,
      childAspectRatio: 0.875, // 칸 가로:세로 비율 (프로토타입 간격)
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(count, (i) {
      final date = DateTime(year,month, 1 - offest + i);
      final isThisMonth = date.month == month;

      return GestureDetector(
        onTap: () {
          if (date.isAfter(DateTime.now())) return; // 미래 날짜는 생일로 선택 불가
          final m = date.month.toString().padLeft(2, '0');
          final d = date.day.toString().padLeft(2, '0');
          widget.onNext('${date.year}.$m.$d');
        },
        child: Center(
          child:  Text(
            '${date.day}',
            style: TextStyle(
              fontFamily: 'NanumMyeongjo',
              color: isThisMonth ? Colors.white : Colors.white30,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
      }
      ),
    );
  }


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 310,
          child: AnimatedOpacity(duration: Duration(milliseconds: 400),
            opacity: showone ? 1 : 0,
            child: GestureDetector(
              onTap: () async {
                // 연도·월만 고르는 창 (일은 아래 달력에서 고름)
                int y = year;
                int m = month;
                final ok = await showDialog<bool>(
                  context: context,
                  builder: (c) => StatefulBuilder(
                    builder: (c, update) => AlertDialog(
                      title: Text('연도와 월을 선택해주세요'),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton<int>(
                            value: y,
                            items: [
                              for (int i = DateTime.now().year; i >= 1900; i--)
                                DropdownMenuItem(value: i, child: Text('$i년')),
                            ],
                            onChanged: (v) => update(() => y = v!),
                          ),
                          SizedBox(width: 20),
                          DropdownButton<int>(
                            value: m,
                            items: [
                              for (int i = 1; i <= 12; i++)
                                DropdownMenuItem(value: i, child: Text('$i월')),
                            ],
                            onChanged: (v) => update(() => m = v!),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(c), child: Text('취소')),
                        TextButton(onPressed: () => Navigator.pop(c, true), child: Text('선택')),
                      ],
                    ),
                  ),
                );
                if (ok != true) return;
                year = y;
                month = m;
                setState(() {
                });
              },
              child: Text(
                '$year.$month',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NanumMyeongjo',
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ),
        ),
        Positioned( //달력
          left: 38,
          right: 34,
          top: 351,
          child: AnimatedOpacity(duration: Duration(milliseconds: 400),
          opacity: showone ? 1 : 0,
          child: calender(),),
        ),
        Positioned( //이전 버튼
          left: 0,
          right: 0,
          bottom: 62,
          child: Center(
            child: GestureDetector(
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
          ),
        ),
      ],
    );
  }
}
