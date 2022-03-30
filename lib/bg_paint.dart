import 'dart:math';

import 'package:flutter/material.dart';

class BgPaint extends CustomPainter{

  double id;
  BgPaint({required this.id});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orange;
    var path = Path();

    canvas.drawCircle(Offset(size.width/2, size.height/2), id, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}