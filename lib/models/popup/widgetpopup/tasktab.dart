import 'dart:convert';
import 'dart:math';

import 'package:ez/models/popup/widgetpopup/tasklist.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/auth_repo.dart';
import '../../../utils/file_fns.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../widgets/connectItemtaskcomplete.dart';
import '../controllers/popupfullpagecontroller.dart';
import '../controllers/tasktabcontroller.dart';
import 'package:dio/dio.dart';

class TaskTab extends StatefulWidget {
  @override //
  _TaskTabState createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  final controller = Get.put(TaskTabController());
  int iSelectedFileCount = 0;
  final controllerpopup = Get.put(PopupFullPageController());

  void getTaskList() async {
    String payloadenc = '{"filterBy":[]}';

    final responses = await AuthRepo.getTaskList(controllerpopup.sWorkFlowId,
        controllerpopup.sProcessId, jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)));

    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    List tagObjsJson = jsonDecode(dec) as List;
    Map<String, dynamic> valueMape = tagObjsJson.elementAt(0);
    List entryInfo = valueMape['entryInfo'] as List;

    controller.fieldkeys.toList().forEach((element) {
      Map<String, dynamic> tmap = new Map<String, dynamic>();

      entryInfo.forEach((elementEntry) {
        tmap["Assign to"] = elementEntry[element];
        tmap["start date"] = elementEntry[element];
        tmap["end date"] = elementEntry[element];
        tmap["Buttons"] = elementEntry[element];
      });
    });
    //var tagObjsJson = jsonDecode(dec) as List;
/*    List<filedatas> tagObjs =
    tagObjsJson.map((tagJson) => filedatas.fromJson(tagJson)).toList();
    setState(() {
      controller.dataFileListNew = tagObjs;
    });*/
    debugPrint('678ccccccccccccccccccccccccccc');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sTextdatadesc = sReturnStatus();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView.builder(
            itemCount: controller.folderDatas.length,
            itemBuilder: (context, index) {
              // filedatas item = controller.folderDatas.elementAt(index);
              return TaskList(
                  /* cMenu: controller.folderDatas[index],
                iPosition: index,*/
                  );
              // return Text(
              //     controller.folderDatas[index]['Foldername'].toString());
            },
          ),
          floatingActionButton: Wrap(
            //will break to another line on overflow
            direction: Axis.vertical, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5),
                  child: FloatingActionButton.small(
                    backgroundColor: Colors.blueAccent.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    child: Icon(color: Colors.white, Icons.add),
                    onPressed: () => {},
                  )), // button third

              // Add more buttons here
            ],
          ),
        ));
  }

  String sReturnVal() {
    var arr = [
      "Inversments1 \u2022 DATE:12-Apr-2023 \u2022 sangilimurugan.nezofis.com \u2022 ",
      "Inversments2 \u2022 DATE:02-Jun-2023  \u2022 raja@ezofis.com \u2022 ",
      "Inversments3 \u2022 DATE:23-May-2023  \u2022 arun.ezofis.com \u2022 "
    ];
    return arr[randomgrn()];
  }

  int randomgrn() {
    Random r = new Random();
    return r.nextInt(3);
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

  String fileIcon(String fileName) {
    final fileType = fileName.split('.').last.toLowerCase();
    final validTypes = validFileTypes();

    if (validTypes.contains(fileType)) {
      return '$path/$fileType.png';
    } else {
      return '$path/file.png';
    }
  }

  String formatFileSize(int size) {
    return filesize(size);
  }
}
