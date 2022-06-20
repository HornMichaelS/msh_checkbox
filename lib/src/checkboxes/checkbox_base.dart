import 'package:flutter/material.dart';

abstract class CheckboxBase extends StatelessWidget {
  final bool isDisabled;
  final Color checkedColor;
  final Color disabledColor;
  final Color uncheckedColor;
  final AnimationController animationController;
  final double strokeWidth;
  final double size;

  const CheckboxBase({
    Key? key,
    required this.isDisabled,
    required this.checkedColor,
    required this.disabledColor,
    required this.uncheckedColor,
    required this.animationController,
    required this.strokeWidth,
    required this.size,
  }) : super(key: key);
}
