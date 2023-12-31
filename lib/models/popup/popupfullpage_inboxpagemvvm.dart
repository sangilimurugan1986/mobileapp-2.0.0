import 'dart:convert';
//import 'dart:ffi';

import 'package:ez/models/popup/tabmainscreen.dart';
import 'package:ez/models/popup/textnormal.dart';
import 'package:ez/models/popup/textsmalll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../api/auth_repo.dart';
import '../../../layouts/process/ProcessLayout.dart';
import '../../../layouts/process/ProcessLayoutTab.dart';
import '../../../utils/format_date_time.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../widgets/buttonroundednoaction.dart';

import 'package:dio/dio.dart';

import '../../core/CustomAppBar.dart';
import '../../core/CustomColors.dart';
import '../../layouts/process/widgets/main_drawer.dart';
import '../../routes.dart';
import 'controllers/gridviewhomecontroller.dart';
import 'controllers/popupfullpagecontroller.dart';

class PopupFullpageInboxPageMvvm extends StatefulWidget {
  @override
  _PopupFullpageInboxPageMvvmState createState() => _PopupFullpageInboxPageMvvmState();
}

class _PopupFullpageInboxPageMvvmState extends State<PopupFullpageInboxPageMvvm> {
  final controllerpopup = Get.put(PopupFullPageController());
  final controller = Get.put(GridViewHomeController());
  final isLoading = false.obs;
  final error = ''.obs;

  // workflowjson->blocks ->internalforward  21-11-23 continue
  //sdsd

  @override
  void initState() {
    super.initState();
    getInboxDetails().then((value) => {controllerpopup.getButtonlist()});
  }

  Future<Null> getInboxDetails() async {
    String payloadenc = '{"currentPage": 1, "itemsPerPage": 20}';

    final responses = await AuthRepo.getInboxListForFolder(
        controllerpopup.sWorkFlowId,
        jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)),
        ''); //       timeFormate(_inboxDetailss[index].raisedAt.trim()),

    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    Map<String, dynamic> valueMap = json.decode(dec);
    setState(() {
      controller.filedsnew = {};
    });
    print('controllerpopup.iSelectedIndex = ' + controllerpopup.iSelectedIndex.toString());
    getInboxSingleDetails(
        valueMap['data'][0]['value'][controllerpopup.iSelectedIndex]['formData']['formId']
            .toString(),
        valueMap['data'][0]['value'][controllerpopup.iSelectedIndex]['formData']['fields']);
  }

  Future getInboxSingleDetails(String formId, Map<String, dynamic> mdata) async {
    isLoading.value = true;
    Map mdataGenerate = Map<String, dynamic>();
    error.value = '';
    try {
      final response = await AuthRepo.getInboxSingleDetails(formId); //23 formid
      Map<String, dynamic> data = jsonDecode(AaaEncryption.decryptAESaaa(response.data));
      isLoading.value = false;
      Map<String, dynamic> datas = json.decode(data['formJson']);

      datas['panels'].forEach((item) {
        for (var entry in mdata.entries) {
          item['fields'].forEach((field) {
            if (entry.key.toString() == field['id']) {
              mdataGenerate.putIfAbsent(field['label'].toString(), () => checkIsArray(entry.value));
            }
          });
        }
      });

      setState(() {
        isLoading.value = false;
        controller.filedsnew = mdataGenerate;
      });

      if (response.statusCode == 200) {
      } else {
        throw 'invalid status code';
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        error.value = 'Unauthorized Login';
      }
      if (statusCode == 402) {
        error.value = 'license expired';
      } else if (statusCode == 404) {
        error.value = 'email not found';
      } else if (statusCode == 409) {
        error.value = 'incorrect password';
      } else {
        rethrow;
      }
    } catch (e) {
      print(e);
      error.value = 'error logging in';
    } finally {
      isLoading.value = false;
    }
  }

  String checkIsArray(dynamic dVal) {
    String stemp = dVal.toString().replaceAll('\n', '').replaceAll('\r', '');
    return stemp.trim().length > 0 ? stemp : '-';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [
          AppBarAction(icon: Icon(Icons.search), onPressed: () => {}),
          AppBarAction(icon: Icon(Icons.person_sharp), onPressed: () => {})
        ],
        backgroundColor: CustomColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
            //margin: EdgeInsets.all(2),
            width: mediaQuery.size.width,
            // height: mediaQuery.size.height * .99,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                //  color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: CustomColors.greyblue)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    flex: 10,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomColors.greyblue,
                        ),
                        width: double.infinity,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  flex: 7,
                                  child: DefaultTextStyle(
                                      maxLines: 2,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                      ),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextNormalPop(
                                              sLabel: controllerpopup
                                                  .srequesno /*'+ They are not necessarily opaque, however; for example, a pop-up menu uses a ModalRoute'*/)))),
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: TextSmallPop(
                                          sLabel: timeFormate(controllerpopup.sRaisedAt)
                                              .replaceAll(' ', '\n')))),
                            ])
                        // color: Colors.blue, /*child: TextNormal(sLabel: 'dsd')*/
                        )),
                Expanded(
                    flex: 90,
                    child: Material(
                        child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
                      /*margin: EdgeInsets.fromLTRB(10, 0, 10, 0),*/
                      child: TabMianScreen(),
                    ))),
              ],
            )),
      ),
      drawer: MainDrawer(),
    );
  }

  buttonGenerate(String sname, Color clr, Icon icn) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: clr),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0), side: BorderSide(width: 2, color: clr)),
          ),
          onPressed: () => {},
          icon: icn,
          label: Text(
            sname,
            style: TextStyle(color: clr),
          ),
        ));
  }
}
