import 'dart:convert';

import 'package:ez/core/CustomColors.dart';
import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import '../../../core/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  State<PageMain> createState() => _PageMainBuilderState();
}

class _PageMainBuilderState extends State<PageMain> {
  String dropdownValue = 'Yes';
  @override
  void initState() {
    print('Page Folder');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 200,
              width: 100,
              color: Colors.red,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              items: <String>['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 30),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  print('pppppppp ' + dropdownValue.toString());
                });
              },
            ),
          ])),
    );
  }
}
