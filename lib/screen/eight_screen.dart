
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;

class EightScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return EightScreenState();
  }

}

class EightScreenState  extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return Scaffold(
     body:  Container(color: Colors.red,width: size.width,height: size.height,
          child: CustomPaint(painter: PathPainter())
     ),
   );
  }
}


class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Color paintColor = Colors.orange.withOpacity(0.75);
    FragmentProgram fraProg=  FragmentProgram.compile(spirv: spirv);
    Paint paint = Paint();
    paint.color = paintColor;
    canvas.drawPaint(paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}