import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tags/screens/category_screen.dart';
import 'package:tags/screens/sources_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCategory = true;
  static final Color? enabledBtn = Colors.blue[700];
  static final Color? disabledBtn = Colors.black;

  ButtonStyle btnStyle() =>
      TextButton.styleFrom(backgroundColor: Colors.pinkAccent);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {setState(() {
                    isCategory =true;
                  });},
                  child: TextForBtn(text:"Categories", color: isCategory? enabledBtn:disabledBtn),
                  style: btnStyle(),
                ),
                TextButton(
                  onPressed: () {setState(() {
                    isCategory =false;
                  });},
                  child: TextForBtn(text:"Sources", color: !isCategory? enabledBtn:disabledBtn),
                  style: btnStyle(),
                ),
              ],
            ),
            isCategory ? CategoryScreen() : SourceScreen(),
          ],
        ),
      )),
    );
  }
}

class TextForBtn extends StatelessWidget {
  final String? text;
  final Color? color;

  const TextForBtn({
    Key? key,
    this.text = 'default',
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: TextStyle(color: color));
  }
}
