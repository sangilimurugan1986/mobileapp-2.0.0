import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper/safe_area.dart';

class Dividers extends StatefulWidget {
  final String sType;

  const Dividers({required this.sType});

  @override
  _DividersState createState() => _DividersState();
}

class _DividersState extends State<Dividers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.sType) {
      case 'SOLID':
        return Container(
            margin: EdgeInsets.only(
              top: 35,
              bottom: 5,
            ),
            child: Divider(
              height: 1,
              color: Colors.grey.shade300,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ));
      case 'DOTTED':
        return Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: CustomPaint(painter: DrawDottedhorizontalline()));
      case 'DASHED':
        return Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: CustomPaint(painter: DrawDashhorizontalline()));
      case 'DOUBLE':
        return Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Column(
              children: [
                Divider(
                  height: 2,
                  color: Colors.grey.shade300,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Divider(
                  height: 2,
                  color: Colors.grey.shade300,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                )
              ],
            ));
      default:
        return Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ));
    }
  }
}

class DrawDottedhorizontalline extends CustomPainter {
  //double safeAreaWidth = 0;

  Paint _paint = Paint();
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Colors.black26; //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -164; i < 164; i = i + 4) {
      // 15 is space between dots
      if (i % 2 == 0) canvas.drawLine(Offset(i, 0.0), Offset(i, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawDashhorizontalline extends CustomPainter {
  //double safeAreaWidth = 0;

  Paint _paint = Paint();
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Colors.grey.shade300; //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -165; i < 165; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
