import 'package:flutter/material.dart';
import 'package:msh_checkbox/src/checkboxes/fade_checkbox.dart';
import 'package:msh_checkbox/src/checkboxes/stroke_checkbox.dart';

import 'checkboxes/scale_check_checkbox.dart';
import 'checkboxes/scale_fill_checkbox.dart';
import 'msh_checkbox_style.dart';

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
    this.uncheckedColor = const Color(0xFFCCCCCC),
    this.disabledColor = const Color(0xFFCCCCCC),
    this.size = 40,
    this.duration = const Duration(
      milliseconds: 700,
    ),
    this.style = MSHCheckboxStyle.stroke,
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

  /// The style of the animation and the check.
  final MSHCheckboxStyle style;

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
            height: widget.size + _strokeWidth,
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
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: widget.size,
              minWidth: widget.size,
            ),
            // width: widget.size,
            // height: widget.size,
            child: _getCheckbox(),
          ),
        ],
      ),
    );
  }

  Widget _getCheckbox() {
    switch (widget.style) {
      case MSHCheckboxStyle.stroke:
        return StrokeCheckbox(
          isDisabled: widget.isDisabled,
          checkedColor: widget.checkedColor,
          disabledColor: widget.disabledColor,
          uncheckedColor: widget.uncheckedColor,
          animationController: animationController,
          strokeWidth: _strokeWidth,
          size: widget.size,
        );
      case MSHCheckboxStyle.fillScaleColor:
        return ScaleFillCheckbox(
          isDisabled: widget.isDisabled,
          checkedColor: widget.checkedColor,
          disabledColor: widget.disabledColor,
          uncheckedColor: widget.uncheckedColor,
          animationController: animationController,
          strokeWidth: _strokeWidth,
          size: widget.size,
        );
      case MSHCheckboxStyle.fillScaleCheck:
        return ScaleCheckCheckbox(
          isDisabled: widget.isDisabled,
          checkedColor: widget.checkedColor,
          disabledColor: widget.disabledColor,
          uncheckedColor: widget.uncheckedColor,
          animationController: animationController,
          strokeWidth: _strokeWidth,
          size: widget.size,
        );
      case MSHCheckboxStyle.fillFade:
        return FadeCheckbox(
          isDisabled: widget.isDisabled,
          checkedColor: widget.checkedColor,
          disabledColor: widget.disabledColor,
          uncheckedColor: widget.uncheckedColor,
          animationController: animationController,
          strokeWidth: _strokeWidth,
          size: widget.size,
        );
    }
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
