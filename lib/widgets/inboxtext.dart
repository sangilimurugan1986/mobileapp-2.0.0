import 'package:ez/widgets/textnormal.dart';
import 'package:ez/widgets/textsmall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageMultitext extends StatefulWidget {
  final String? title;
  final String? subtext;
  final Icon? iIcon;
  ImageMultitext({this.title, this.subtext, this.iIcon});
  ImageMultitextState createState() => ImageMultitextState();
}

class ImageMultitextState extends State<ImageMultitext> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext build) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Center(child: widget.iIcon),
          style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              shadowColor: Colors.white,
              padding: EdgeInsets.all(4),
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.white, width: 2)),
        ),
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextNormal(sLabel: widget.title.toString()),
            TextSmall(sLabel: widget.subtext.toString()),
          ],
        ))
      ],
    );
  }
}
