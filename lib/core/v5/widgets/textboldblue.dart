import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextboldBlue extends StatefulWidget {
  final String sLabel;

  const TextboldBlue({required this.sLabel});

  @override
  _TextboldBlueState createState() => _TextboldBlueState();
}

class _TextboldBlueState extends State<TextboldBlue> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold));
  }
}
