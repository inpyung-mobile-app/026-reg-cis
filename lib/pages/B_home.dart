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
          colors: [Color(0xff250B3E),Color(0xff270C41)],
          stops: [0.1, 0.8]
        ),
      ),
      child: Stack(
        children: [
          bCloud(180,  width: 220)
        ],
      ),
    ),
  );
}
}