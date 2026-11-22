import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgePage extends StatefulWidget {
  final VoidCallback onBack;
  final Function(String) onNext;
  const AgePage({super.key, required this.onBack, required this.onNext});

  @override
  State<AgePage> createState() => _AgePageState();
}


// 시작할 때 한번 호출되는 함수
// 초기값, 시작 부분 담당

class _AgePageState extends State<AgePage> {

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


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 55,
          right: 55,
          top: 325,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            opacity: showone ? 1 : 0,
            child: Container(
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: TextField(
                controller: nameContontroller,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                onSubmitted: (valud) {
                  final age = int.tryParse(valud.trim());

                  if (valud.trim().isEmpty) {
                    errorText = '나이를 숫자로 입력해주세요.';
                  }
                  else if (age == null ) {
                    errorText = '나이를 숫자로 입력해주세요.';
                  }
                  else if (age < 1 || age > 122) {
                    errorText = '나이를 1~122세 이내로 입력해주세요.';
                  }
                  else {
                    errorText = null;
                    widget.onNext(valud.trim());
                  }
                  setState(() {
                  });
                },
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
                decoration: InputDecoration(
                    hintText: '나이를 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
        ),

        if (errorText != null)
          Positioned(
            left: 0,
            right: 0,
            top: 388,
            child: Text(
              errorText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 13
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
