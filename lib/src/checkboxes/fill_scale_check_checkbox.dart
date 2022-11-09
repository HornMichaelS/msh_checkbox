import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'msh_checkbox_base.dart';

class FillScaleCheckCheckbox extends StatelessWidget {
  final MSHCheckboxBase parent;

  const FillScaleCheckCheckbox({Key? key, required this.parent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fadeAnimation = parent.animation.drive(CurveTween(
      curve: Curves.easeOutCubic,
    ));

    final checkAnimation = parent.animation.drive(CurveTween(
      curve: Curves.easeOutBack,
    ));

    return AnimatedBuilder(
      animation: parent.animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: fadeAnimation.value,
              child: Container(
                height: parent.size + parent.strokeWidth,
                width: parent.size + parent.strokeWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: parent.isDisabled
                      ? parent.disabledColor
                      : parent.checkedColor,
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
                size: parent.size * 0.4,
                strokeWidth: parent.strokeWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
