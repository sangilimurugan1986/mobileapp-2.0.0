import 'package:ez/core/v5/widgets/textsmallthin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownBottom extends StatefulWidget {
  const DropDownBottom({Key? key}) : super(key: key);

  @override
  _DropDownBottomState createState() => _DropDownBottomState();
}

class _DropDownBottomState extends State<DropDownBottom> {
  // Initial Selected Value
  String dropdownvalue = '10';

  // List of items in our dropdown menu
  var items = ['10', '25', '50', '100'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: TextSmallThin(sLabel: items, cColor: Colors.black),
              );
            }).toList(),
            onChanged: (String? newValue) {
              print('cccccc');
              setState(() {
                dropdownvalue = newValue!;
                print('pppppppp ' + dropdownvalue.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}
