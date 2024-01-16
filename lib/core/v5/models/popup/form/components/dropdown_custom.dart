import 'package:flutter/material.dart';

import 'hinttext.dart';

class DropDownCustom extends StatefulWidget {
  final String sInput;
  final String sInputSeperator;
  final void Function(String) onChanged;
  const DropDownCustom(
      {required this.sInput, required this.sInputSeperator, required this.onChanged});

  @override
  _DropDownCustomState createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  // Initial Selected Value
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [''];
  @override
  Widget build(BuildContext context) {
    loadvaliurofItems();
    return Expanded(
        //color: Colors.red,
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
                // alignedDropdown: true,
                child: DropdownButton(
                    //isExpanded: true,
                    hint: HintText(
                      sLabel: 'Select',
                    ),
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF1e293b),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      widget.onChanged(newValue!); // not worked
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }
                    // onChanged: widget.onChanged,
                    ))));
  }

  void loadvaliurofItems() {
    switch (widget.sInputSeperator) {
      case 'NEWLINE':
        items = widget.sInput.split('\n');
        break;
      case 'COMMA':
        items = widget.sInput.split(',');
        break;
    }
  }
}
