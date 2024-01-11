import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HintText extends StatefulWidget {
  final String sLabel;

  const HintText({required this.sLabel});

  @override
  _HintTextState createState() => _HintTextState();
}

class _HintTextState extends State<HintText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(decoration: TextDecoration.none),
        child: new RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: new TextSpan(
            style: new TextStyle(
                fontFamily: 'Outfit',
                fontSize: 16,
                color: Color(0xff94a3b8),
                //64748b
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(text: widget.sLabel),
            ],
          ),
        ));
  }
}
