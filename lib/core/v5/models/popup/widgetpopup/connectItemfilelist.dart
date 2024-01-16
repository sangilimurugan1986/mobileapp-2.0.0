import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/file_fns.dart';
import '../../../widgets/CheckBoxRound.dart';
import '../controllers/attachfilecontroller.dart';
import 'CheckBoxRoundPopup.dart';

class ConnectItemFileList extends StatefulWidget {
  int iIndex = 0;
  @override //
  _ConnectItemFileListState createState() => _ConnectItemFileListState();
}

class _ConnectItemFileListState extends State<ConnectItemFileList> {
  final controller = Get.put(AttcaheFileController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var sTextdatadesc = sReturnStatus();
    return Container(
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(children: [
          Row(children: [
            Expanded(child: radiobtn(2, context) /*CheckBoxRoundPopup()*/),
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      fileIcon("label"),
                      height: 24,
                      width: 24,
                      color: sTextdatadesc.contains('MODIFIED')
                          ? Colors.blueAccent
                          : Colors.red,
                    ))),
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
                              "label",
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
                            )),
                      ],
                    ))),
          ]),
        ]));
  }

  String sReturnVal() {
    var arr = [
      "Inversments1 \u2022 DATE:12-Apr-2023 \u2022 sangilimurugan.nezofis.com \u2022 ",
      "Inversments2 \u2022 DATE:02-Jun-2023  \u2022 raja@ezofis.com \u2022 ",
      "Inversments3 \u2022 DATE:23-May-2023  \u2022 arun.ezofis.com \u2022 "
    ];
    return arr[randomgrn()];
  }

  String sReturnStatus() {
    var arrStatus = ["UPLOADED", "MODIFIED", "ESIGN_REQUIRED"];
    return arrStatus[randomgrn()];
  }

  Color sReturnColor(String sStutus) {
    switch (sStutus) {
      case 'UPLOADED':
        return Colors.grey;
      case 'MODIFIED':
        return Colors.green;
      case 'ESIGN_REQUIRED':
        return Colors.deepOrangeAccent;
    }
    return Colors.grey;
  }

  Widget radiobtn(int i, BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          disabledColor: Colors.yellow,
          unselectedWidgetColor: Colors.grey,
        ),
        child: Checkbox(
          value: true,
          checkColor: Colors.blue,
          activeColor: Colors.black12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onChanged: (value) {},
        ));
  }

  int randomgrn() {
    Random r = new Random();
    return r.nextInt(3);
  }
}
