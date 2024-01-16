import 'dart:convert';
import 'dart:math';

import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart'; //karthi

import '../../../api/auth_repo.dart';
import '../../../controllers/treeboxlistviewcontroller.dart';
import '../../../utils/file_fns.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../comments.dart';
import '../controllers/commentcontroller.dart';
import '../controllers/popupfullpagecontroller.dart';
import '../form/components/divider.dart';
import '../form/components/radio_button_input.dart';

class CommenttList extends StatefulWidget {
  @override //
  _CommenttListState createState() => _CommenttListState();
}

class _CommenttListState extends State<CommenttList> {
  double safeAreaHeight = 0;
  TextEditingController commentTextController = TextEditingController();
  //SharedPreferences pre=null;
  CommentController controllerComments = Get.put(CommentController());
  final controllerTree = Get.put(TreeInboxListviewController());
  final controllerpopup = Get.put(PopupFullPageController());
  ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;
  int iSelectedFileCount = 0;
  dynamic showto = 1;
  //dynamic showTO = 1;
  String sPostJsonComments = '';
  bool bResponse = false;

  @override
  void initState() {
    super.initState();
/*    setState(() {
      controllers.dataMessageList = [];
    });*/
    getCommentsDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrolldown());
  }

  void getCommentsDetails() async {
    SharedPreferences pre = await SharedPreferences.getInstance();

    final responses =
        await AuthRepo.getCommentsList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);

    String dec = AaaEncryption.decryptAESaaa(responses.toString());

    var tagObjsJson = jsonDecode(dec) as List;
    List<commentsdatas> tagObjs = tagObjsJson
        .map((tagJson) => commentsdatas.fromJson(tagJson, pre.getString('userid')))
        .toList();
    setState(() {
      controllerComments.dataMessageList = tagObjs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: safeAreaHeight == 716 ? 330 : 380,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: PageView(children: [
              Column(
                children: [
                  Flexible(
                      flex: 8,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: controllerComments.dataMessageList.length,
                        itemBuilder: (context, index) {
                          commentsdatas item = controllerComments.dataMessageList.elementAt(index);
                          return ListTile(
                              //contentPadding: EdgeInsets.only(left: 30.0, right: 0.0),
                              title: Container(
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Row(children: [
                              Expanded(
                                  child: Container(
                                      child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  item.bIsMe
                                      ? Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: double.infinity,
                                                )),
                                            Expanded(
                                                flex: 8,
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              color: Colors.teal,
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(10.0),
                                                                  topLeft: Radius.circular(10.0),
                                                                  bottomLeft:
                                                                      Radius.circular(10.0))),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                item.Comments,
                                                                // maxLines: 2,
                                                                overflow: TextOverflow.clip,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w400,
                                                                    color: Colors.white,
                                                                    fontSize: 18),
                                                              ),
                                                              Wrap(
                                                                  alignment: WrapAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      item.sCreatedAt,
//                                                                      '20-Jul-2023 03.35PM',ew
                                                                      maxLines: 1,
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color: Colors.white54,
                                                                          fontSize: 10),
                                                                    )
                                                                  ])
                                                            ],
                                                          ))),
                                                )),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Expanded(
                                                flex: 8,
                                                child: Wrap(
                                                  alignment: WrapAlignment.start,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.black87,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(10.0),
                                                                topLeft: Radius.circular(10.0),
                                                                bottomRight:
                                                                    Radius.circular(10.0))),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              item.Comments,
                                                              maxLines: 2,
                                                              overflow: TextOverflow.clip,
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.white,
                                                                  fontSize: 18),
                                                            ),
                                                            Text(
                                                              '19-Jul-2023 03.35PM',
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.white54,
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        ))
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: double.infinity,
                                                ))
                                          ],
                                        ),
                                  //               SizedBox(height: 10),
                                ],
                              ))),
                            ]),
                          ));
                        },
                      )),
                  Dividers(sType: 'SOLID'),
                  RadioButtonInput(
                    initialValue: 'Internal (Private)',
                    isDisabled: false,
                    options: controllerComments.radioFields.split(','),
                    onChanged: (value) =>
                        controllerComments.onFormFieldChanged(value, controllerComments.Initial),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: TextField(
                        enabled: controllerTree.iCurrentSelect.toString().contains('_0'),
                        scrollPadding: const EdgeInsets.only(bottom: 32.0),
                        controller: commentTextController,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        minLines: 4,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            suffixIcon: IconButton(
                              icon: Icon(
                                MdiIcons.send,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                if (commentTextController.text.trim().length > 0) {
                                  sPostJsonComments = '{"comments":"' +
                                      commentTextController.text +
                                      '","showTo":' +
                                      controllerComments.showTo.toString() +
                                      '}';

                                  postCommentApi(controllerpopup.sWorkFlowId,
                                      controllerpopup.sProcessId, controllerpopup.sTransactionId);
                                }
                              },
                            ),
                            hintText: "Enter Remarks",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.blue)))),
                  )
                ],
              )
            ])));
  }

  scrolldown() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1), curve: Curves.fastOutSlowIn);
    });
  }

  void postCommentApi(String sWorkflowId, String sProcessId, String sTransactionId) async {
    String payloadenc = sPostJsonComments;
    final responses = await AuthRepo.postComments(sWorkflowId, sProcessId, sTransactionId,
        json.encode(AaaEncryption.EncryptDatatest(payloadenc)));
    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    if (responses.statusCode == 200 || responses.statusCode == 201) {
      commentsdatas items = commentsdatas(
          Comments: commentTextController.text.trim(),
          sCreatedAt: 'justnow',
          sCreatedByEmail: '',
          sExternalCommentsby: '',
          sProcessId: '',
          sTransactionId: '',
          showTo: controllerComments.showTo,
          bIsMe: true,
          bIsDeletes: false);
      setState(() {
        scrolldown();
        FocusManager.instance.primaryFocus?.unfocus();
        controllerComments.dataMessageList.add(items);
        commentTextController.text = '';
        getCommentsDetailsCount();
        getCommentsDetails();
        //if (controllerComments.bResponse) getCommentsDetails();
      });
    } else {
      setState(() {
        scrolldown();
        FocusManager.instance.primaryFocus?.unfocus();
        commentTextController.text = '';
      });
    }
  }

  void getCommentsDetailsCount() async {
    final responses =
        await AuthRepo.getCommentsList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    List lComments = jsonDecode(AaaEncryption.decryptAESaaa(responses.toString())) as List;
    setState(() {
      controllerpopup.iMsgCount.value = lComments.length;
    });
  }
}
