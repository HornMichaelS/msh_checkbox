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
        body: Center(
          child: MSHCheckbox(
            size: 100,
            value: isChecked,
            checkedColor: Colors.blue,
            uncheckedColor: Colors.black12,
            onChanged: (selected) {
              setState(() {
                isChecked = selected;
              });
            },
          ),
        ),
      ),
    );
  }
}
