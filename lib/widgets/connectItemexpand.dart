import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/theme.dart';

import '../radiobuttonselect.dart';
import '../utils/file_fns.dart';
import 'CheckBoxRound.dart';
import 'connectiteminner.dart';

class ConnectSingleItemExpand extends StatelessWidget {
  ConnectSingleItemExpand(
      {Key? key,
      required this.color,
      this.isRounded = true,
      required this.discriptions,
      required this.label,
      required this.selected})
      : super(key: key);

  final Color color;
  final bool isRounded;
  final String label;
  final String discriptions;
  final String selected;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var sTextdatadesc = sReturnStatus();
    return Container(
//        height: double.infinity,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.fromLTRB(1, 1, 5, 1),
        child: Column(children: [
          Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      fileIcon(label),
                      height: 24,
                      width: 24,
                      color: sTextdatadesc.contains('INDEXED')
                          ? Colors.blueAccent
                          : Colors.red,
                    ) /*Icon(
                      Icons.folder,
                      color: color,
                      size: 28,
                    )*/
                    )),
            Expanded(
                flex: 6,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: Text(
                              label,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  fontSize: 18),
                            )),
                        //               SizedBox(height: 10),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                            child: RichText(
                              maxLines: 3,
                              text: TextSpan(
                                text: sReturnVal(),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: sTextdatadesc,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: sReturnColor(sTextdatadesc))),
                                ],
                              ),
                            ) /*Text(
                              sReturnVal(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            )*/
                            ),
                      ],
                    ))),
            //Expanded(child: Radio(value: '', groupValue: '', onChanged: null)),
            //Expanded(child: Obx(() => RadioButtonSelect())),
            Expanded(child: CheckBoxRound()),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(
                      MdiIcons.dotsVertical,
                      size: 18,
                    ))),
          ]),
        ]));
  }

  String sReturnVal() {
    var arr = [
      "Inversments1 \u2022 DATE \u2022 sangilimurugan.nezofis.com \u2022 ",
      "Inversments2 \u2022 DATE \u2022 raja@ezofis.com \u2022 ",
      "Inversments3 \u2022 DATE \u2022 arun.ezofis.com \u2022 "
    ];
    return arr[randomgrn()];
  }

  String sReturnStatus() {
    var arrStatus = ["FAILED", "INDEXED", "PARTIALLY_INDEXED"];
    return arrStatus[randomgrn()];
  }

  Color sReturnColor(String sStutus) {
    switch (sStutus) {
      case 'FAILED':
        return Colors.grey;
      case 'INDEXED':
        return Colors.green;
      case 'PARTIALLY_INDEXED':
        return Colors.deepOrangeAccent;
    }
    return Colors.grey;
  }

  int randomgrn() {
    Random r = new Random();
    return r.nextInt(3);
  }
}
