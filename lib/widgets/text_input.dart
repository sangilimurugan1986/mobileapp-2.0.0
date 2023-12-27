import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputs extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? defaultValue;
  final Function(String)? onChange;
  final TextInputType? type;
  final bool? isFull;

  final Color backgroundColor;
  final Color borderColor;
  final bool hasError;

  TextInputs(
      {this.title,
      this.placeholder,
      this.onChange,
      this.defaultValue = "",
      this.isFull = false,
      this.backgroundColor = Colors.white,
      this.borderColor = const Color(0xFFEEEEEE),
      this.hasError = false,
      this.type = TextInputType.text});

  TextInputsState createState() => TextInputsState();
}

class TextInputsState extends State<TextInputs> {
  var textController = TextEditingController();

  @override
  void initState() {
    textController.text = "${widget.defaultValue}";
    super.initState();
  }

  @override
  Widget build(BuildContext build) {
    return TextFormField(
      controller: textController,
      onChanged: widget.onChange,
      keyboardType: widget.type,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
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
    );
  }
}
