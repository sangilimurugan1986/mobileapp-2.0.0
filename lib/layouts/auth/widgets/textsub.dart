import 'package:flutter/cupertino.dart';

class Textsub extends StatefulWidget {
  final String sLabel;

  const Textsub({required this.sLabel});

  @override
  _TextsubState createState() => _TextsubState();
}

class _TextsubState extends State<Textsub> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        style: TextStyle(fontSize: 20, color: CupertinoColors.placeholderText));
  }
}
