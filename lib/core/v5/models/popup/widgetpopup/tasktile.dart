import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../../controllers/session_controller.dart';
import 'buttonroundednoaction.dart';

class TaskTile extends StatelessWidget {
  TaskTile(this.Detials);
  Map<String, dynamic> Detials;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainhead(Detials);
  }

  Widget mainhead(final nodes) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 115, // constrain height
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: Detials.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "formview");
                  },
                  child: Detials.keys.elementAt(index) != 'Buttons'
                      ? Container(
                          child: Row(children: [
                          Expanded(
                              flex: 25,
                              child: Text(
                                StringUtils.toPascalCase(Detials.keys.elementAt(index)),
                                style: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 5,
                              child: Text(' : ',
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                          Expanded(
                              flex: 70,
                              child: Text(Detials.values.elementAt(index).toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                        ]))
                      : Container(
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  //  margin: EdgeInsets.all(2),
                                  child: ButtonRoundedNoAction(
                                      color: findColors(
                                          Detials.values.elementAt(index).split(',').elementAt(0)),
                                      label:
                                          Detials.values.elementAt(index).split(',').elementAt(0))),
                              Container(
                                  // margin: EdgeInsets.all(2),
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: ButtonRoundedNoAction(
                                      color: findColors(Detials.values //
                                          .elementAt(index)
                                          .split(',')
                                          .elementAt(1)),
                                      label:
                                          Detials.values.elementAt(index).split(',').elementAt(1)))
                            ])));
            },
          ),
        )
      ],
    );
  }

  bool randomgrn() {
    Random r = new Random();
    return r.nextDouble() <= 0.5;
  }

  Color findColors(String sData) {
    switch (sData.trim().toLowerCase()) {
      case 'open':
        return Colors.blue;
      case 'reopen':
        return Colors.blueAccent;
      case 'medium':
        return Colors.amberAccent;
      case 'high':
        return Colors.redAccent;
      case 'low':
        return Colors.blueGrey;
      case 'close':
        return Colors.green;
      case 'completed':
        return Colors.greenAccent;
      case 'forward':
        return Colors.deepOrangeAccent;
      case 'reply':
        return Colors.lightGreenAccent;
    }
    return Colors.purple;
  }
}
