import 'dart:math';

import 'package:flutter/material.dart';

import '../painting/arc.dart';
import '../painting/check.dart';
import 'msh_checkbox_base.dart';

class StrokeCheckbox extends StatelessWidget {
  final MSHCheckboxBase parent;

  const StrokeCheckbox({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: parent.animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Arc(
              color: parent.tintColor(),
              startAngle: pi / 4,
              sweepAngle: parent.animation
                  .drive(CurveTween(curve: Curves.easeInOutCubic))
                  .drive(Tween(begin: 0.0, end: 2 * pi))
                  .value,
              strokeWidth: parent.strokeWidth,
              size: parent.size,
            ),
            Check(
              color: parent.checkColor(),
              size: parent.size * 0.4,
              strokeWidth: parent.strokeWidth,
              fillPercentage: parent.animation
                  .drive(CurveTween(curve: Curves.easeInOutCubic))
                  .value,
            ),
          ],
        );
      },
    );
  }
}
