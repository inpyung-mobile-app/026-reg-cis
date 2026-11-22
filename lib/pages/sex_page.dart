import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SexPage extends StatefulWidget {
  final VoidCallback onBack;
  final Function(String) onNext;
  const SexPage({super.key, required this.onBack, required this.onNext});

  @override
  State<SexPage> createState() => _SexPageState();
}


// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당

class _SexPageState extends State<SexPage> {

  bool showDailyTarot = false;
  bool showgraphic = false;
  bool showone = false;
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

  Widget sexButter(String icon , String vlaud) {
    return GestureDetector(
      onTap: () {
        widget.onNext(vlaud);
      },
      child:Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        child: SvgPicture.asset(icon),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 386,
          child: AnimatedOpacity(duration: Duration(milliseconds: 400),
          opacity: showone ? 1 : 0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sexButter('assets/icons/female.svg', '여성'),
            SizedBox(width: 27,),
            sexButter('assets/icons/male.svg', '남성'),
          ],
          ),
          ),
        ),
        Positioned(
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
