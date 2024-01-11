import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class SingleItemSearchInbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainhead(); //tomorrow
  }

  late final String sName;

  Widget mainhead() {
    return Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                child: Text('',
                    style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              )),
              Expanded(
                  child: Container(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('',
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w500))),
              )),
            ]));
  }
}
