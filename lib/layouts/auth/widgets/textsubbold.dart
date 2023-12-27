import 'package:flutter/cupertino.dart';

class TextsubBold extends StatefulWidget {
  final String sLabel;

  const TextsubBold({required this.sLabel});

  @override
  _TextsubBoldState createState() => _TextsubBoldState();
}

class _TextsubBoldState extends State<TextsubBold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        style: TextStyle(
            fontSize: 20,
            color: CupertinoColors.placeholderText,
            fontWeight: FontWeight.w600));
  }
}
