

//TODO merge with category_screen


import "package:flutter/material.dart";

class SourceScreen extends StatefulWidget {
  const SourceScreen({Key? key}) : super(key: key);

  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Sources'),));
  }
}
