import 'package:flutter/cupertino.dart';

class TextSmall extends StatefulWidget {
  final String sLabel;

  const TextSmall({required this.sLabel});

  @override
  _TextSmallState createState() => _TextSmallState();
}

class _TextSmallState extends State<TextSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        style: TextStyle(
            //fontSize: 14,
            fontSize: 14,
            color: CupertinoColors.systemGrey6,
            fontWeight: FontWeight.w200));
  }
}
