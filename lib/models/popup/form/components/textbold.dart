import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textbold extends StatefulWidget {
  final String sLabel;

  const Textbold({required this.sLabel});

  @override
  _TextboldState createState() => _TextboldState();
}

class _TextboldState extends State<Textbold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black));
  }
}
