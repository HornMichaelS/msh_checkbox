import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_fade_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_check_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/fill_scale_color_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/stroke_checkbox.dart';
import 'package:msh_checkbox/src/msh_checkbox_state.dart';

class MSHCheckboxBase extends StatelessWidget {
  final Animation<double> animation;
  final BuildContext context;
  final MSHCheckboxStyle style;
  final MSHColorConfig colorConfig;
  final bool isDisabled;
  final double size;
  final double strokeWidth;

  MSHCheckboxState get state => MSHCheckboxState(
        context: context,
        isDisabled: isDisabled,
        style: style,
      );

  const MSHCheckboxBase({
    Key? key,
    required this.animation,
    required this.colorConfig,
    required this.context,
    required this.isDisabled,
    required this.size,
    required this.strokeWidth,
    required this.style,
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

  Color fillColor() => colorConfig.fillColor(state);

  Color checkColor() => colorConfig.checkColor(state);

  Color tintColor() => colorConfig.tintColor(state);
}
