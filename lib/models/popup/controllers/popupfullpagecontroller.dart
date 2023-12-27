import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../form/components/MultiSelectMain.dart';

class PopupFullPageController extends GetxController {
  final isLoading = false.obs;
  final error = ''.obs;
  //late RxList<InboxDetails> idSelected;
  int iSelectedIndex = 0;
  String sRaisedAt = '';
  String transaction_createdAt = '';
  String srequesno = '';
  String sFormId = '';
  String repositoryId = '';
  String sFormEntryId = '';
  String sProcessId = '';
  String sWorkFlowId = '';
  String sActivityId = '';
  String sFormJSon = '';
  String sSelectedFormID = '';
  String sTransactionId = '';
  Map<String, dynamic> mFormJSon = Map();
  List<Widget> wButtons = [];

  RxInt iFilecount = 0.obs;
  RxInt iMsgCount = 0.obs;
  RxInt iTaskCount = 0.obs;

  String sSelectedButtonOperation = '';

  bool bFab = false;
  List<Map<String, dynamic>> folderDatas = [];

  List<Map<String, dynamic>> InboxDataewew = [];

  List<Map<String, dynamic>> InboxDataNew = [];

  void roundbtngeneral() {
    debugPrint('roundbtngeneral ');
  }

  getButtonlist() {
    wButtons = [];
    for (int i = 0; i < mFormJSon['rules'].length; i++) {
      // print(mFormJSon['rules'][i]['fromBlockId'] + '  kkkk ' + sActivityId);
      if (mFormJSon['rules'][i]['fromBlockId'] == sActivityId) {
        wButtons.add(createIcons(mFormJSon['rules'][i]['proceedAction'].toString()));
      }
    }

    for (int i = 0; i < mFormJSon['blocks'].length; i++) {
      if (mFormJSon['blocks'][i]['id'] == sActivityId) {
        if (mFormJSon['blocks'][i]['settings']['internalForward']) {
          wButtons.add(MultiSelectMain());
        }
      }
    }
  }

  Widget createIcons(String sButtintext) {
    switch (sButtintext) {
      case 'Submit':
      case 'Forward':
      case 'Ignore':
        return buttonGenerate(
            sButtintext,
            Colors.orange,
            Icon(
              MdiIcons.arrowRight,
              color: Colors.orange,
            ));
      case 'Rightsize':
      case 'Complete':
        return buttonGenerate(
            sButtintext,
            Colors.green,
            Icon(
              MdiIcons.check,
              color: Colors.green,
            ));
      case 'Terminate':
      case 'Close':
        return buttonGenerate(
            sButtintext,
            Colors.redAccent,
            Icon(
              MdiIcons.close,
              color: Colors.redAccent,
            ));
      default:
        return buttonGenerate(
            sButtintext,
            Colors.purple,
            Icon(
              MdiIcons.arrowRight,
              color: Colors.purple,
            ));
    }
  }

  buttonGenerate(String sname, Color clr, Icon icn) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: clr),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0), side: BorderSide(width: 2, color: clr)),
          ),
          onPressed: () => {sSelectedButtonOperation = sname, buttonAction()},
          icon: icn,
          label: Text(
            sname,
            style: TextStyle(color: clr),
          ),
        ));
  }

  Future buttonAction() async {
    isLoading.value = true;
    if (sSelectedButtonOperation.toLowerCase() == 'forward') {
    } else {}
  }
}
