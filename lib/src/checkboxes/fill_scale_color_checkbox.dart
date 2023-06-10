import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/painting/check.dart';

import 'msh_checkbox_base.dart';

class FillScaleColorCheckbox extends StatelessWidget {
  final MSHCheckboxBase parent;

  const FillScaleColorCheckbox({Key? key, required this.parent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("FillScaleColorCheckbox");
    final animation = parent.animation.drive(
      Tween(begin: 0.0, end: parent.size + parent.strokeWidth).chain(
        CurveTween(
          curve: Curves.easeOutCirc,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                shape: parent.shape,
                borderRadius: parent.shape == BoxShape.rectangle
                    ? BorderRadius.circular(parent.radius)
                    : null,
                color: parent.fillColor(),
              ),
            ),
            Opacity(
              opacity: parent.animation.value,
              child: Check(
                color: parent.checkColor(),
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
