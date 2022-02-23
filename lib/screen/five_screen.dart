
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;

class FiveScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  Image.asset("assets/images/polinc.png")
      ),
    );
  }
}