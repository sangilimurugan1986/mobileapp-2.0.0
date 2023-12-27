import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          helperText: widget.errortext,
          helperStyle: TextStyle(color: Colors.black26, fontSize: 16),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.remove_red_eye_outlined : Icons.lock_outlined,
              )),
          //suffixIcon: Icon(Icons.lock),
          focusColor: Colors.white,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          labelText: widget.title,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ]);
  }
}
