import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_fade_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_check_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_color_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/stroke_checkbox.dart';

class MSHCheckboxBase extends StatelessWidget {
  final MSHCheckboxStyle style;
  final bool isDisabled;
  final Color checkedColor;
  final Color disabledColor;
  final Color uncheckedColor;
  final Animation<double> animation;
  final double strokeWidth;
  final double size;

  const MSHCheckboxBase({
    Key? key,
    required this.style,
    required this.isDisabled,
    required this.checkedColor,
    required this.disabledColor,
    required this.uncheckedColor,
    required this.animation,
    required this.strokeWidth,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case MSHCheckboxStyle.stroke:
        return StrokeCheckbox(parent: this);
      case MSHCheckboxStyle.fillScaleColor:
        return FillScaleColorCheckbox(parent: this);
      case MSHCheckboxStyle.fillScaleCheck:
        return FillScaleCheckCheckbox(parent: this);
      case MSHCheckboxStyle.fillFade:
        return FillFadeCheckbox(parent: this);
    }
  }
}
