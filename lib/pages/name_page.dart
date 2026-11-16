import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_1/util.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0, right: 0, top: 262,
          child: Text(
            titles[1],
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'NanumMyeongjo', color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 62,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white.withValues(alpha: 0.1),
              ),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/arrow.svg', width: 25),
                  SizedBox(width: 4,),
                  Text(
                    '이전',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


