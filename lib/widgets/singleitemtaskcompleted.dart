import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'buttonroundednoaction.dart';

class SingleItemTaskCompleted extends StatelessWidget {
  SingleItemTaskCompleted(this.Detials);
  Map<String, dynamic> Detials;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainhead(Detials);
  }

  Widget mainhead(final nodes) {
    return Expanded(
        child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      //physics: FixedExtentScrollPhysics(),
      itemCount: Detials.length,
      itemBuilder: (context, index) {
        return Detials.keys.elementAt(index) != 'Buttons'
            ? Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.fromLTRB(10, 1, 5, 1),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 25,
                          child: Text(
                            StringUtils.toPascalCase(
                                Detials.keys.elementAt(index)),
                            style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                      Expanded(
                          flex: 5,
                          child: Text(' : ',
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500))),
                      Expanded(
                          flex: 70,
                          child: Text(
                              Detials.values.elementAt(index).toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))),
                    ]))
            : Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.fromLTRB(10, 1, 5, 1),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(2),
                          child: ButtonRoundedNoAction(
                              color: randomgrn() ? Colors.indigo : Colors.blue,
                              label: Detials.values
                                  .elementAt(index)
                                  .split(',')
                                  .elementAt(0))),
                      Container(
                          margin: EdgeInsets.all(2),
                          child: ButtonRoundedNoAction(
                              color:
                                  randomgrn() ? Colors.amber : Colors.blueGrey,
                              label: Detials.values
                                  .elementAt(index)
                                  .split(',')
                                  .elementAt(1)))
                    ]));
      },
    ));
  }

  bool randomgrn() {
    Random r = new Random();
    return r.nextDouble() <= 0.5;
  }
}
