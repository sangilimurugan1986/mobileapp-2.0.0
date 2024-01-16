import 'package:flutter/material.dart';

import 'hinttext.dart';

class DropDownAPI extends StatefulWidget {
  final void Function(String) onChanged;
  List<String> itemss = [];
  DropDownAPI(
      {required this.itemss,
      //required this.sInputSeperator,
      required this.onChanged});

  @override
  _DropDownAPIState createState() => _DropDownAPIState();
}

class _DropDownAPIState extends State<DropDownAPI> {
  // Initial Selected Value
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //color: Colors.red,
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
                // alignedDropdown: true,
                child: DropdownButton(
                    //itemHeight: null,
                    isExpanded: true,
                    hint: HintText(
                      sLabel: 'Select',
                    ),
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: widget.itemss.map((String items) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: items,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
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
}
