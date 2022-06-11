import 'dart:math';

import 'package:flutter/material.dart';

import 'package:msh_checkbox/src/painting/check.dart';

import 'painting/arc.dart';

///
/// A circular checkbox which nicely animates changes to its value.
///
/// The checkbox itself does not maintain its [value] as state. Instead, when the state of the checkbox
/// should change, the widget calls the [onChange] callback. Most widgets that use this checkbox will
/// listen for the [onChanged] callback and rebuild the checkbox with a new [value] to update the
/// visual appearance of the checkbox.
///
class MSHCheckbox extends StatefulWidget {
  /// Creates an MSHChecbox.
  const MSHCheckbox({
    Key? key,
    required this.value,
    this.isDisabled = false,
    this.checkedColor = Colors.blue,
    this.uncheckedColor = const Color.fromARGB(255, 189, 189, 189),
    this.disabledColor = const Color(0x20000000),
    this.size = 40,
    this.duration = const Duration(
      milliseconds: 700,
    ),
    required this.onChanged,
  }) : super(key: key);

  /// Whether this checkbox is checked.
  final bool value;

  /// Whether the checkbox is disabled.
  final bool isDisabled;

  /// The color of the checkbox when [value] is `true`.
  final Color checkedColor;

  /// The color of the checkbox when [value] is `false`.
  final Color uncheckedColor;

  /// The color of the checkbox which [isDisabled] is `true`.
  final Color disabledColor;

  /// The height and width of the checkbox.
  final double size;

  /// The duration of the animation which plays when [value] changes.
  final Duration duration;

  /// Called when the value of the checkbox should change.
  final void Function(bool selected) onChanged;

  @override
  State<MSHCheckbox> createState() => _MSHCheckboxState();
}

class _MSHCheckboxState extends State<MSHCheckbox>
    with SingleTickerProviderStateMixin {
  double get _strokeWidth => 3.5 * (widget.size / 60);

  late final animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  @override
  void didUpdateWidget(covariant MSHCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    animationController.duration = widget.duration;

    if (widget.value != oldWidget.value) {
      if (widget.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isDisabled) {
          widget.onChanged(!widget.value);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: widget.size + _strokeWidth,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.isDisabled
                      ? widget.disabledColor
                      : widget.uncheckedColor,
                  width: _strokeWidth,
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Stack(
                alignment: const Alignment(0, -0.15),
                children: [
                  Arc(
                    color: widget.isDisabled
                        ? Colors.transparent
                        : widget.checkedColor,
                    startAngle: pi / 4,
                    sweepAngle: animationController
                        .drive(CurveTween(curve: Curves.easeInOutCubic))
                        .drive(Tween(begin: 0.0, end: 2 * pi))
                        .value,
                    strokeWidth: _strokeWidth,
                    size: widget.size,
                  ),
                  Check(
                    color: widget.isDisabled
                        ? widget.disabledColor
                        : widget.checkedColor,
                    size: widget.size * 0.4,
                    strokeWidth: _strokeWidth,
                    fillPercentage: animationController
                        .drive(CurveTween(curve: Curves.easeInOutCubic))
                        .value,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
