import 'dart:convert';
import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:ez/models/popup/widgetpopup/tasktile.dart';
import 'package:ez/widgets/singleitemtaskcompleted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth_repo.dart';
import '../../../utils/helper/aes_encryption.dart';
import 'package:get/get.dart';
import 'buttonroundednoaction.dart';

import '../controllers/popupfullpagecontroller.dart';

class TaskList extends StatefulWidget {
  @override //
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
/*  final bool isRounded;
  final cMenu;
  final iPosition; //29 38*/
  final controllerpopup = Get.put(PopupFullPageController());
  var tagObjsJson = [];

  @override
  void initState() {
    super.initState();

    getTasklIst();
/*    setState(() {
      tagObjsJson = [];
    });*/
  }

  void getTasklIst() async {
    String payloadenc = '{"filterBy":[]}';
    final responses = await AuthRepo.getTaskList(controllerpopup.sWorkFlowId,
        controllerpopup.sFormEntryId, jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)));
    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    tagObjsJson = jsonDecode(dec) as List;
    setState(() {
      tagObjsJson = jsonDecode(dec) as List;
      print('');
    });

/*    List<commentsdatas> tagObjs = tagObjsJson
        .map((tagJson) => commentsdatas.fromJson(tagJson, pre.getString('userid')))
        .toList();
    setState(() {
      controllers.dataMessageList = tagObjs;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return tagObjsJson != null
        ? Container(
            height: 400,
            child: ListView.builder(
              //  physics: NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: tagObjsJson.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      controllerpopup.sSelectedFormID =
                          tagObjsJson[index]['formEntryId'].toString();
                      /*       controllerpopup.sTransactionId=
                          tagObjsJson[index]['formEntryId'].toString();*/

                      //Navigator.pushNamed(context, "formview");
                      Navigator.of(context, rootNavigator: true).pushNamed("/formview");

                      //Get.offAllNamed('/formview');
                      //Get.offAllNamed('/formviewtab');
                    },
                    child: Container(
                        //height: double.infinity,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white,
                        ),
                        //padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Column(children: [
                          Row(children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.all(2),
                                  child: Text(
                                    tagObjsJson[index]['entryInfo'][0]['e_NFnW0JxrLpZxqPeJS7K'],
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                        fontSize: 15),
                                  ),
                                  //               SizedBox(height: 10),
                                )),
                          ]),
                          Row(children: [
                            Expanded(
                                flex: 25,
                                child: Text(
                                  StringUtils.toPascalCase('Assign to'),
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
                                child: Text(
                                    json
                                        .encode(tagObjsJson[index]['entryInfo'][0]
                                            ['pM6Vly-JRlfroRrziE1jr'])
                                        .replaceAll('\\n', '')
                                        .replaceAll('\\r', '')
                                        .replaceAll('\\', '')
                                        .replaceAll('"', '')
                                        .replaceAll(' ', ''),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ]),
                          Row(children: [
                            Expanded(
                                flex: 25,
                                child: Text(
                                  StringUtils.toPascalCase('Start Date'),
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
                                child: Text(
                                    json
                                        .encode(tagObjsJson[index]['entryInfo'][0]
                                            ['UXAsxouh5oubsW6_74Ldq'])
                                        .replaceAll('"', ''),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ]),
                          Row(children: [
                            Expanded(
                                flex: 25,
                                child: Text(
                                  StringUtils.toPascalCase('End Date'),
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
                                child: Text(
                                    json
                                        .encode(tagObjsJson[index]['entryInfo'][0]
                                            ['Vf5RKsW-vYZVf_hOsdb3I'])
                                        .replaceAll('"', ''),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ]),
                          Container(
                              //color: Colors.yellow,
                              //padding: EdgeInsets.all(1),
//                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    //  margin: EdgeInsets.all(2),
                                    child: ButtonRoundedNoAction(
                                        color: findColors(json
                                            .encode(tagObjsJson[index]['entryInfo'][0]
                                                ['OiEECeSQCDLtPaSuOiX0x'])
                                            .replaceAll('"', '')),
                                        label: jsonEncode(tagObjsJson[index]['entryInfo'][0]
                                                ['OiEECeSQCDLtPaSuOiX0x'])
                                            .replaceAll('"', ''))),
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: ButtonRoundedNoAction(
                                        color: findColors(json
                                            .encode(tagObjsJson[index]['entryInfo'][0]
                                                ['11m7YRT-7kdLx-g6iGojc'])
                                            .replaceAll('"', '')),
                                        label: jsonEncode(tagObjsJson[index]['entryInfo'][0]
                                                ['11m7YRT-7kdLx-g6iGojc'])
                                            .replaceAll('"', '')))
                              ])),
                          Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          /* TaskTile(cMenu['details']),*/
                        ])));
              },
            ))
        : Container(); /*Container(
        //height: double.infinity,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        //padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        child: Column(children: [
          Row(children: [
            Expanded(
                flex: 7,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(2),
                  child: Text(
                    cMenu['Foldername'],
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, color: Colors.black87, fontSize: 15),
                  ),
                  //               SizedBox(height: 10),
                )),
          ]),
          Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          TaskTile(cMenu['details']),
        ]))*/
  }

  Color findColors(String sData) {
    switch (sData.trim().toLowerCase()) {
      case 'open':
        return Colors.blue;
      case 'reopen':
        return Colors.blueAccent;
      case 'medium':
        return Colors.amberAccent.shade700;
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
