import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  bool isDisabled = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.fillFade;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSHCheckbox Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('MSHCheckbox Example')),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: MSHCheckbox(
                  size: 100,
                  value: isChecked,
                  isDisabled: isDisabled,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Colors.blue,
                  ),
                  style: style,
                  shape: CheckBoxShape.rectangle,
                  radius: 15,
                  onChanged: (selected) {
                    setState(() {
                      isChecked = selected;
                    });
                  },
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.blue,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    control(
                      "Disabled",
                      Switch(
                        value: isDisabled,
                        activeColor: Colors.white,
                        onChanged: (value) => setState(() {
                          isDisabled = value;
                        }),
                      ),
                    ),
                    control(
                      "Style",
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<MSHCheckboxStyle>(
                              isDense: true,
                              iconEnabledColor: Colors.grey,
                              dropdownColor: Colors.white,
                              underline: Container(),
                              items: MSHCheckboxStyle.values
                                  .map(
                                    (style) => DropdownMenuItem(
                                      value: style,
                                      child: Text(
                                        style.name(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: style,
                              onChanged: (style) => setState(() {
                                if (style != null) {
                                  this.style = style;
                                }
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget control(String title, Widget control) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        control,
      ],
    );
  }
}

extension _StyleName on MSHCheckboxStyle {
  String name() {
    switch (this) {
      case MSHCheckboxStyle.stroke:
        return "Stroke";
      case MSHCheckboxStyle.fillScaleColor:
        return "Scale Color";
      case MSHCheckboxStyle.fillScaleCheck:
        return "Scale Check";
      case MSHCheckboxStyle.fillFade:
        return "Fade";
    }
  }
}
