# msh_checkbox

A customizable circular checkbox which plays an animation when checked or unchecked.

![Untitled](https://user-images.githubusercontent.com/6050603/173438640-5990e369-2b13-48e4-aae9-4de6876cb484.gif)


## Features

As of this version of the package, MSHCheckbox only has one style and animation available,
however the size, colors, and animation duration are all customizable.

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
        uncheckedColor: Colors.black12,
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