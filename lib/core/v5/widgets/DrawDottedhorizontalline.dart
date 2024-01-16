import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawDottedhorizontalline extends CustomPainter {
  Paint _paint = Paint();

  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Colors.black12; //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -30; i < 30; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
