import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextNormal extends StatefulWidget {
  final String sLabel;

  const TextNormal({required this.sLabel});

  @override
  _TextNormalState createState() => _TextNormalState();
}

class _TextNormalState extends State<TextNormal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w400));
  }
}
