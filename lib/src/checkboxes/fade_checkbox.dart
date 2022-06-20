import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'checkbox_base.dart';

class FadeCheckbox extends CheckboxBase {
  const FadeCheckbox({
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
      CurveTween(
        curve: Curves.ease,
      ),
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size + strokeWidth,
                width: size + strokeWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDisabled ? disabledColor : checkedColor,
                ),
              ),
              Check(
                color: Colors.white,
                fillPercentage: 1,
                size: size * 0.4,
                strokeWidth: strokeWidth,
              ),
            ],
          ),
        );
      },
    );
  }
}
