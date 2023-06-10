import 'package:flutter/material.dart';

extension CheckBoxShapeExt on CheckBoxShape {
  BoxShape get getShape {
    switch (this) {
      case CheckBoxShape.circle:
        return BoxShape.circle;
      case CheckBoxShape.rectangle:
        return BoxShape.rectangle;
    }
  }
}

enum CheckBoxShape { circle, rectangle }
