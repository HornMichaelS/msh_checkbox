import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  final double size;
  final double fillPercentage;
  final double strokeWidth;
  final Color color;

  const Check({
    Key? key,
    required this.size,
    required this.fillPercentage,
    required this.strokeWidth,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CheckPainter(
        fillPercentage: fillPercentage,
        strokeWidth: strokeWidth,
        color: color,
      ),
      size: Size(size, size),
    );
  }
}

class _CheckPainter extends CustomPainter {
  final double fillPercentage;
  final double strokeWidth;
  final Color color;

  _CheckPainter({
    required this.fillPercentage,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    const corner = 0.3;

    final segment1Scale = fillPercentage < corner ? fillPercentage / corner : 1;
    final segment2Scale = (fillPercentage - corner) / (1 - corner);

    path.moveTo(0, (1 - corner) * size.height);

    if (fillPercentage > 0) {
      path.lineTo(
        corner * size.width * segment1Scale,
        (1 - corner) * size.height + corner * segment1Scale * size.height,
      );
    }

    if (fillPercentage > corner) {
      path.lineTo(
        corner * size.width + (1 - corner) * size.width * segment2Scale,
        size.height - (1 - corner) * size.height * segment2Scale,
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) {
    return fillPercentage != oldDelegate.fillPercentage;
  }
}
