import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class RadioButtonSelect extends StatefulWidget {
  _RadioButtonSelectState createState() => _RadioButtonSelectState();
}

class _RadioButtonSelectState extends State<RadioButtonSelect> {
  var _checkbox = true.obs;

  @override
  Widget build(BuildContext context) {
    return Radio(
      groupValue: '_checkbox',
      value: _checkbox,

      //activeColor: CupertinoColors.placeholderText,
      onChanged: (value) {
        setState(() {
          debugPrint('radio ' + _checkbox.toString());
          //_checkbox = !_checkbox;
          if (_checkbox.isFalse)
            _checkbox.value = true;
          else
            _checkbox.value = false;
        });
      },
    );
  }
}
