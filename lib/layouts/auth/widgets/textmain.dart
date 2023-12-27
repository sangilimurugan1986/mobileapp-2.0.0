import 'package:flutter/cupertino.dart';

class Textmain extends StatefulWidget {
  final String sLabel;

  const Textmain({required this.sLabel});

  @override
  _TextmainState createState() => _TextmainState();
}

class _TextmainState extends State<Textmain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.sLabel,
        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold));
  }
}
