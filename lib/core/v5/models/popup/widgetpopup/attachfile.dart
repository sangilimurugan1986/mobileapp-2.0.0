import 'dart:convert';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth_repo.dart';
import '../../../controllers/treeboxlistviewcontroller.dart';
import '../../../utils/file_fns.dart';
import '../../../utils/format_date_time.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../widgets/MotionToastWidget.dart';
import '../controllers/attachfilecontroller.dart';
import 'package:get/get.dart';

import '../controllers/popupfullpagecontroller.dart';
import '../models/selectedFileUpload.dart';
import '../models/selected_file.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
//import '../utils/format_date_time.dart';

class AttachFiles extends StatefulWidget {
  @override //
  _AttachFilesState createState() => _AttachFilesState();
}

class _AttachFilesState extends State<AttachFiles> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(AttcaheFileController());
  final controllerpopup = Get.put(PopupFullPageController());
  final controllerTree = Get.put(TreeInboxListviewController());
  int iSelectedFileCount = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getFileDetails();
  }

  getFileDetails() async {
    final responses =
        await AuthRepo.getFileList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    var tagObjsJson = jsonDecode(dec) as List;
    List<filedatas> tagObjs = tagObjsJson.map((tagJson) => filedatas.fromJson(tagJson)).toList();
    controller.dataFileListNew = tagObjs;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //var sTextdatadesc = sReturnStatus();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView.builder(
            itemCount: controller.dataFileListNew.length,
            itemBuilder: (context, index) {
              filedatas item = controller.dataFileListNew.elementAt(index);
              return ListTile(
                  title: GestureDetector(
                      onTap: () {
                        setState(() {
                          item.selected.value = !item.selected.value;
                          if (item.selected.value) controller.dataFileListNew[index] = item;

                          controller.iSelecteFileCount =
                              controller.getSelectedFileCount(controller.dataFileListNew);
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          //list[index].isSelected = true;
                          controller.iSelecteFileCount = 0;
                          item.selected.value = true;
                          controller.iSelecteFileCount =
                              controller.getSelectedFileCount(controller.dataFileListNew);
                        });
                      },
                      /*fnLongPress(item.selected, index)*/
                      child: Container(
                          key: UniqueKey(),
                          padding: EdgeInsets.all(5),
                          decoration: !item.selected.value
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)))
                              : BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: Column(children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 10,
                                    child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.all(2),
                                        child: Image.asset(
                                          fileIcon(item.name),
                                          height: 20,
                                          width: 20,
                                          /*  color:
                                              sTextdatadesc.contains('MODIFIED')
                                                  ? Colors.blueAccent
                                                  : Colors.red,*/
                                        ))),
                                Expanded(
                                    flex: 65,
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            // name
                                            Text(item.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500)),
                                            // ...
                                            SizedBox(height: 2),
                                            // email
                                            Text(item.description,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300)),
                                            RichText(
                                              text: TextSpan(
                                                text: item.createdByEmail + ' ',
                                                style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: item.Status,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: sReturnColor(item.Status))),
                                                ],
                                              ),
                                            ),
                                            // ...
                                          ],
                                        ))),
                                Expanded(
                                    flex: 15,
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                        child: Text(
                                            textAlign: TextAlign.end,
                                            timeFormate(item.createdAt.trim()),

                                            /*   timeFormate(
                                                _inboxDetailss[index]
                                                    .raisedat
                                                    .trim())*/
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300))))
                              ],
                            ),
                          ]))));
            },
          ),
          floatingActionButton: Visibility(
              visible: controllerTree.iCurrentSelect.toString().contains('_0'),
              child: Wrap(
                //will break to another line on overflow
                direction: Axis.vertical, //use vertical to show  on vertical axis
                children: <Widget>[
                  controller.iSelecteFileCount > 0
                      ? Container(
                          margin: EdgeInsets.all(5),
                          child: FloatingActionButton.small(
                            backgroundColor: Colors.blueAccent.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7.0))),
                            child: Icon(color: Colors.white, Icons.delete_outline),
                            onPressed: () => {deleteFiles()},
                          ))
                      : SizedBox(), //button first

                  // Merge file dont delete
                  /*       controller.iSelecteFileCount > 1
                  ? Container(
                      margin: EdgeInsets.all(5),
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.blueAccent.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0))),
                        child: Icon(color: Colors.white, Icons.merge),
                        onPressed: () => {},
                      ))
                  : SizedBox(), // button second*/

                  controller.iSelecteFileCount == 0
                      ? Container(
                          margin: EdgeInsets.all(5),
                          child: FloatingActionButton.small(
                            backgroundColor: Colors.blueAccent.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7.0))),
                            child: Icon(color: Colors.white, Icons.file_upload_outlined),
                            onPressed: () => {onUpload()},
                          ))
                      : SizedBox(), // button third
                  // Add more buttons here
                ],
              )),
        ));
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

  void onUpload() async {
    var res = await controller.selectedUploadedFiles();

    if (res) {
      MotionToastWidget().displaySuccessMotionToast('File Uploaded Sucessfully.', context);
      await Future.delayed(Duration(seconds: 4));
      await getFileDetails();
      await getFileDetailsCount();
    } else {
      MotionToastWidget().displayErrorMotionToast('File Not Uploaded.', context);
    }
  }

  Future<void> deleteFiles() async {
    bool res = await controller.DeleteMultipleFiles(context);
    if (res) {
      controller.iSelecteFileCount = 0;
      getFileDetails();
      getFileDetailsCount();
    }
  }

  getFileDetailsCount() async {
    final responses =
        await AuthRepo.getFileList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    List lFiles = jsonDecode(AaaEncryption.decryptAESaaa(responses.toString())) as List;
    setState(() {
      controllerpopup.iFilecount.value = lFiles.length;
    });
  }

  String formatFileSize(int size) {
    return filesize(size);
  }
}
