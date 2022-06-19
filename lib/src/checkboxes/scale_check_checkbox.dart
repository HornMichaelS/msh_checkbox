import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'checkbox_base.dart';

class ScaleCheckCheckbox extends CheckboxBase {
  const ScaleCheckCheckbox({
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
    final fadeAnimation = animationController.drive(CurveTween(
      curve: Curves.easeOutCubic,
    ));

    final checkAnimation = animationController.drive(CurveTween(
      curve: Curves.easeOutBack,
    ));

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: fadeAnimation.value,
              child: Container(
                height: size + strokeWidth,
                width: size + strokeWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDisabled ? disabledColor : checkedColor,
                ),
              ),
            ),
            Container(
              transform: Matrix4.identity().scaled(
                checkAnimation.value,
                checkAnimation.value,
              ),
              transformAlignment: Alignment.center,
              child: Check(
                color: Colors.white,
                fillPercentage: 1,
                size: size * 0.4,
                strokeWidth: strokeWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
