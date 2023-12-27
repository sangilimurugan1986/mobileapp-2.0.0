import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/attachfilecontroller.dart';

class CheckBoxRoundPopup extends StatefulWidget {
  _CheckBoxRoundPopupState createState() => _CheckBoxRoundPopupState();
}

class _CheckBoxRoundPopupState extends State<CheckBoxRoundPopup> {
  final controller = Get.put(AttcaheFileController());
  bool _checkbox = false;

  @override
  Widget build(
    BuildContext context,
  ) {
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
            debugPrint('ccccccccccqc ' + _checkbox.toString());

            setState(() {
              _checkbox = !_checkbox;
            });
          },
        ));
  }
}
