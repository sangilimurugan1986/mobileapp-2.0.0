import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextInputsPassword extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? defaultValue;
  final String? errortext;
  final Function(String)? onChange;
  final TextInputType? type;
  final bool? isFull;
  // final erroroccur = false;
  final bool hasError;

  TextInputsPassword(
      {this.title,
      this.placeholder,
      this.onChange,
      this.defaultValue = "",
      this.errortext,
      this.hasError = false,
      this.isFull = false,
      this.type = TextInputType.text});

  TextInputsPasswordState createState() => TextInputsPasswordState();
}

class TextInputsPasswordState extends State<TextInputsPassword> {
  var textController = TextEditingController();
  bool _obscureText = true;
  String _password = '';

  @override
  void initState() {
    textController.text = "${widget.defaultValue}";
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext build) {
    return new Column(children: <Widget>[
      new TextFormField(
        obscureText: _obscureText,
        controller: textController,
        onChanged: widget.onChange,
        keyboardType: widget.type,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          helperText: widget.errortext,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.hasError ? Colors.red : Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          helperStyle: TextStyle(color: Colors.black26, fontSize: 16),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? MdiIcons.eyeOffOutline : MdiIcons.eyeOutline,
              )),
          //suffixIcon: Icon(Icons.lock),
          focusColor: Colors.white,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelText: widget.title,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ]);
  }
}
