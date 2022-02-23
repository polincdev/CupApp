import 'package:cupapp/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/movable_cup.dart';
import 'dart:math' as math;

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final angle = -math.pi / 4;
    Color paintColor = Colors.orange.withOpacity(0.75);
    Paint circlePaint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    canvas.save();
    // canvas.translate(100, 100);
    canvas.rotate(angle);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 155, height: 170), circlePaint);
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}