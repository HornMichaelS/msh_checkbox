import 'dart:math';

import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;
  final double size;
  final Color color;

  const Arc({
    Key? key,
    required this.startAngle,
    required this.sweepAngle,
    required this.strokeWidth,
    required this.color,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcPainter(
        startAngle: startAngle,
        sweepAngle: sweepAngle,
        strokeWidth: strokeWidth,
        color: color,
      ),
      size: Size(size, size),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;
  final Color color;

  _ArcPainter({
    required this.startAngle,
    required this.sweepAngle,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.addArc(Offset.zero & size, startAngle - pi / 2, sweepAngle);

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
