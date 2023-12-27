import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../layouts/auth/widgets/textsub.dart';
import '../layouts/auth/widgets/textsubbold.dart';

class CheckBoxRemember extends StatefulWidget {
  _CheckBoxRememberState createState() => _CheckBoxRememberState();
}

class _CheckBoxRememberState extends State<CheckBoxRemember> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 18.0,
                  width: 20.0,
                  child: Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.transparent),
                    side: MaterialStateBorderSide.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return BorderSide(color: Colors.black45, width: 2);
                      } else {
                        return BorderSide(color: Colors.black26, width: 2);
                      }
                    }),
                    checkColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    value: _checkbox,
                    onChanged: (val) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ) /*Checkbox(
                    value: _checkbox,
                    side: const BorderSide(
                      // set border color here
                      color: Colors.red,
                    ),
                    checkColor: Colors.blue,
                    //activeColor: Colors.transparent,
                    */ /*      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),*/ /*
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  )*/
                  ),
              SizedBox(
                width: 5,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: TextsubBold(sLabel: 'Remember Me')),
            ],
          ),
        ],
      ),
    );
  }
}
