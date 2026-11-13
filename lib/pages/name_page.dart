import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

  bool moon = false;
  bool clouds = false;
  bool DailyTarot = false;
  bool graphic = false;
  bool text1 = false;
  bool better = false;
  int pageIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('이름 입력', style: TextStyle(color: Colors.white)),
    );
  }
}
