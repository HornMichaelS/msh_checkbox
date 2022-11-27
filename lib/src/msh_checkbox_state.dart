import 'package:flutter/widgets.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class MSHCheckboxState {
  final BuildContext context;
  final bool isDisabled;
  final MSHCheckboxStyle style;

  const MSHCheckboxState({
    required this.context,
    required this.isDisabled,
    required this.style,
  });
}
