import 'dart:math';

import 'package:flutter/material.dart';

import '../painting/arc.dart';
import '../painting/check.dart';
import 'checkbox_base.dart';

class StrokeCheckbox extends CheckboxBase {
  const StrokeCheckbox({
    Key? key,
    required bool isDisabled,
    required Color checkedColor,
    required Color disabledColor,
    required Color uncheckedColor,
    required AnimationController animationController,
    required double strokeWidth,
    required double size,
  }) : super(
          key: key,
          isDisabled: isDisabled,
          checkedColor: checkedColor,
          disabledColor: disabledColor,
          uncheckedColor: uncheckedColor,
          animationController: animationController,
          strokeWidth: strokeWidth,
          size: size,
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Arc(
              color: isDisabled ? Colors.transparent : checkedColor,
              startAngle: pi / 4,
              sweepAngle: animationController
                  .drive(CurveTween(curve: Curves.easeInOutCubic))
                  .drive(Tween(begin: 0.0, end: 2 * pi))
                  .value,
              strokeWidth: strokeWidth,
              size: size,
            ),
            Check(
              color: isDisabled ? disabledColor : checkedColor,
              size: size * 0.4,
              strokeWidth: strokeWidth,
              fillPercentage: animationController
                  .drive(CurveTween(curve: Curves.easeInOutCubic))
                  .value,
            ),
          ],
        );
      },
    );
  }
}
