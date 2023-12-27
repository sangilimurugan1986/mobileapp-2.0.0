import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../layouts/auth/widgets/textsub.dart';

class CheckBoxRound extends StatefulWidget {
  _CheckBoxRoundState createState() => _CheckBoxRoundState();
}

class _CheckBoxRoundState extends State<CheckBoxRound> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          disabledColor: Colors.yellow,
          unselectedWidgetColor: Colors.grey,
        ),
        child: Checkbox(
          value: _checkbox,
          checkColor: Colors.blue,
          activeColor: Colors.black12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onChanged: (value) {
            setState(() {
              _checkbox = !_checkbox;
            });
          },
        ));
  }
}
