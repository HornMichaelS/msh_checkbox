# msh_checkbox

[![pub package](https://img.shields.io/pub/v/msh_checkbox.svg)](https://pub.dev/packages/msh_checkbox) [![pub points](https://img.shields.io/pub/points/msh_checkbox?logo=dart)](https://pub.dev/packages/msh_checkbox/score) [![popularity](https://img.shields.io/pub/popularity/msh_checkbox?logo=dart)](https://pub.dev/packages/msh_checkbox/score) [![likes](https://img.shields.io/pub/likes/msh_checkbox?logo=dart)](https://pub.dev/packages/msh_checkbox/score)

A customizable circular checkbox which plays an animation when checked or unchecked. Inspired by [BEMCheckbox](https://github.com/Boris-Em/BEMCheckBox) for iOS.

![Checkbox Examples](https://i.giphy.com/media/ivackQaDWjMmfZPqwc/giphy.gif)

## Features

* Choose from 4 animation/visual styles (stroke, scale in checkmark, scale in background, fade in).

* Customize colors for active, inactive and disabled states.
  
* Customize the animation duration.

## Getting started

Install the package:

```
flutter pub add msh_checkbox
```

## Usage

```dart
class Example extends StatefulWidget {
  Example({Key? key}): super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MSHCheckbox(
        size: 60,
        value: isChecked,
        checkedColor: Colors.blue,
        style: MSHCheckboxStyle.stroke,
        onChanged: (selected) {
          setState(() {
            isChecked = selected;
          });
        },
      ),
    );
  }
}
```

## Support

I know it's a small and simple widget, but if you'd like to support it is certainly appreciated!

<a href="https://www.buymeacoffee.com/hornmichaels" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
