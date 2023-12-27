import 'package:flutter/cupertino.dart';

class TextNormalFont extends StatefulWidget {
  final String sLabel;
  final Color cColor;

  const TextNormalFont({required this.sLabel, required this.cColor});

  @override
  _TextNormalFontState createState() => _TextNormalFontState();
}

class _TextNormalFontState extends State<TextNormalFont> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        //style: TextStyle(fontSize: 20, color: CupertinoColors.white));
        style: TextStyle(
            fontSize: 24, color: widget.cColor, fontWeight: FontWeight.w700));
  }
}
