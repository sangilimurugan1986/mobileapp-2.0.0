import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextInputSearchable extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? defaultValue;
  final Function(String)? onChange;
  final TextInputType? type;
  final bool? isFull;

  TextInputSearchable(
      {this.title,
      this.placeholder,
      this.onChange,
      this.defaultValue = "",
      this.isFull = false,
      this.type = TextInputType.text});

  TextInputSearchableState createState() => TextInputSearchableState();
}

class TextInputSearchableState extends State<TextInputSearchable> {
  var textController = TextEditingController();

  @override
  void initState() {
    textController.text = "${widget.defaultValue}";
    super.initState();
  }

  @override
  Widget build(BuildContext build) {
    return Center(
        child: Container(
            width: 245,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: TextField(
              controller: textController,
              onChanged: widget.onChange,
              keyboardType: widget.type,
              cursorColor: Colors.black26,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20, 8),
                suffixIconColor: Colors.purple,
                suffixIcon: Icon(
                  MdiIcons.tune,
                  color: Colors.purple,
                ),
                focusColor: Colors.white,
                hintStyle: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            )));
  }
}
