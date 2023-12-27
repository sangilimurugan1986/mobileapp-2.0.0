import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSmallPop extends StatefulWidget {
  final String sLabel;

  const TextSmallPop({required this.sLabel});

  @override
  _TextSmallPopState createState() => _TextSmallPopState();
}

class _TextSmallPopState extends State<TextSmallPop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.purple.shade400, fontWeight: FontWeight.w400));
  }
}
