import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextNormalPop extends StatefulWidget {
  final String sLabel;

  const TextNormalPop({required this.sLabel});

  @override
  _TextNormalPopState createState() => _TextNormalPopState();
}

class _TextNormalPopState extends State<TextNormalPop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 28,
            color: Colors.purple,
            // color: CupertinoColors.white,
            fontWeight: FontWeight.w500));
  }
}
