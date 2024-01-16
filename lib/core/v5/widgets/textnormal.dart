import 'package:flutter/cupertino.dart';

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
        //style: TextStyle(fontSize: 20, color: CupertinoColors.white));
        style: TextStyle(fontSize: 20, color: CupertinoColors.white));
  }
}
