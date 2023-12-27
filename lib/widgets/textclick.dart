import 'package:flutter/cupertino.dart';

class Textclick extends StatefulWidget {
  final String sLabel;

  const Textclick({required this.sLabel});

  @override
  _TextclickState createState() => _TextclickState();
}

class _TextclickState extends State<Textclick> {
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
