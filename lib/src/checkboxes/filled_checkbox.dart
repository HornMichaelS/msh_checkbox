import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'checkbox_base.dart';

class FilledCheckbox extends CheckboxBase {
  const FilledCheckbox({
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
    final animation = animationController.drive(
      Tween(begin: 0.0, end: size + strokeWidth).chain(
        CurveTween(
          curve: Curves.easeOutCirc,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDisabled ? disabledColor : checkedColor,
              ),
            ),
            Opacity(
              opacity: animationController.value,
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
