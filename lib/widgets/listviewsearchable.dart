import 'dart:convert';
import 'dart:math';

//import 'package:ez/controllers/taskmaincontroller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/auth_repo.dart';
import '../controllers/dashmaincontroller.dart';
import '../controllers/session_controller.dart';
import '../controllers/treeboxlistviewcontroller.dart';
import '../layouts/search/controller/searchlayout_controller.dart';
import '../models/MenuInbox.dart';
import '../models/popup/controllers/popupfullpagecontroller.dart';
import '../models/popup/form/controllers/panel_controller.dart';
import '../routes.dart';
import '../utils/InboxDetails.dart';
import '../utils/format_date_time.dart';
import '../utils/helper/aes_encryption.dart';

import 'CustomWidget.dart';
//Creating a class user to store the data;

class ListViewSearch extends StatefulWidget {
  String sWorkflowId;
  String sType = '';
  String sProcessId = '';
  MenuInbox miSelectedData;
  ListViewSearch({required this.sWorkflowId, required this.sType, required this.miSelectedData});
  ListViewSearchState createState() => ListViewSearchState();
}

class ListViewSearchState extends State<ListViewSearch> {
  //TextEditingController controller = new TextEditingController();

  List<InboxDetails> _searchResult = [];
  List<InboxDetails> _inboxDetailss = [];
  List<InboxDetails> _inboxDetailss_temp = [];

  final controllerpopup = Get.put(PopupFullPageController());
  final dbcontroller = Get.put(DashMainController());
  final controllers = Get.put(SearchlayoutController());
  final controllerSession = Get.find<SessionController>();
  final controller = Get.put(TreeInboxListviewController());
  final controllerPanel = Get.put(PanelController());
  final store = GetStorage();

  final isLoading = true.obs;
  String sUserId = '';

  var arr = [
    'assets/images/logo/user/user.png',
    'assets/images/logo/user/usertwo.png',
    'assets/images/logo/user/userthree.png',
    'assets/images/logo/user/userfour.png'
  ];

  Future<Null> getInboxDetailsNew() async {
    _inboxDetailss = [];
    String payloadenc = '{"currentPage": 1, "itemsPerPage": 20}';

    print(widget.sWorkflowId);
    print(widget.sType);
    print(jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)));

    final responses = await AuthRepo.getInboxListForFolder(
        widget.sWorkflowId, jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)), widget.sType);

    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    Map<String, dynamic> valueMap = json.decode(dec);
    _inboxDetailss_temp = [];

    valueMap['data'].forEach((item) {
      item['value'].forEach((items) {
        _inboxDetailss_temp.add(InboxDetails.fromJson(items));
      });
    });

    if (this.mounted) {
      setState(() {
        isLoading.value = false;
        _inboxDetailss.addAll(_inboxDetailss_temp);
      });
    }

    SharedPreferences pre = await SharedPreferences.getInstance();
    sUserId = pre.getString('userid')!;
    // String UserData = pre.getString('Userdata').toString();
    findUserGroupsList(pre.getString('Userdata').toString());
    //fot to show  Fab Button
    if (controller.iCurrentSelect.toString().contains('_0')) CheckFabDisplay(sUserId);
  }

  @override
  void initState() {
    super.initState();
    _inboxDetailss = [];
    _inboxDetailss_temp = [];

    controllerpopup.sWorkFlowId = widget.sWorkflowId;
    dbcontroller.iCurrentSelect = 'listview'.obs;

    getInboxDetailsNew();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => isLoading.value
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ListTile(
                    leading: CustomWidget.circular(height: 64, width: 64),
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomWidget.rectangular(
                        height: 16,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    subtitle: CustomWidget.rectangular(height: 14),
                  ));
            },
          ) /*Center(child: Container(child: Text('Loading...')))*/
        : loadListview(context));
  }

  Widget loadListview(BuildContext context) {
    controllerPanel.sFormId = widget.miSelectedData.wFormId;
    controllerpopup.sFormId = widget.miSelectedData.wFormId;

    controllerPanel.repositoryId = widget.miSelectedData.repositoryId;
    controllerpopup.repositoryId = widget.miSelectedData.repositoryId;

    return Scaffold(
        body: Container(
            child: ListView.builder(
          //physics: NeverScrollableScrollPhysics(),
          //scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _inboxDetailss.length,
          itemBuilder: (context, index) {
            return Container(
                // color: Colors.yellow,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: ListTile(
                  onTap: () {
                    controllerpopup.iSelectedIndex = index;
                    //transaction_createdAt
                    controllerpopup.sRaisedAt = _inboxDetailss.elementAt(index).raisedAt;
                    controllerpopup.transaction_createdAt =
                        _inboxDetailss.elementAt(index).transaction_createdAt;
                    controllerpopup.srequesno = _inboxDetailss.elementAt(index).requestNo;
                    controllerpopup.sFormId =
                        _inboxDetailss.elementAt(index).formEntryId.toString();
                    controllerpopup.sFormEntryId =
                        _inboxDetailss.elementAt(index).formEntryId.toString();
                    controllerpopup.sProcessId =
                        _inboxDetailss.elementAt(index).processId.toString();
                    controllerpopup.sActivityId =
                        _inboxDetailss.elementAt(index).activityId.toString();
                    controllerpopup.sTransactionId =
                        _inboxDetailss.elementAt(index).transactionId.toString();

                    //final sTemp = jsonDecode(widget.miSelectedData.flowJson);
                    controllerpopup.mFormJSon =
                        jsonDecode(jsonDecode(widget.miSelectedData.flowJson));

                    openPopupForm();
                  },
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 12,
                          child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(2),
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(15), // Image radius
                                  child: Image.asset(arr[new Random().nextInt(4)],
//                                                'assets/images/logo/user/user.png',
                                      fit: BoxFit.fill),
                                ),
                              ))),
                      Expanded(
                          flex: 80,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //141  55,16,16
                                  // name
                                  Text(
                                      _inboxDetailss[index]
                                          .requestNo /*+
                                          ' - ' +
                                          _inboxDetailss[index].requestNo*/
                                      ,
                                      overflow: TextOverflow.ellipsis,
                                      style: _inboxDetailss[index].bread
                                          ? TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300)
                                          : TextStyle(
                                              color: Colors.black87,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600)),
                                  // ...
                                  //SizedBox(height: 2),
                                  // email
                                  Text(
                                      _inboxDetailss[index]
                                          .stage /*_inboxDetailss[index].raisedBy*/,
                                      overflow: TextOverflow.ellipsis,
                                      style: _inboxDetailss[index].bread
                                          ? TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300)
                                          : TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                  Text(
                                      _inboxDetailss[index].lastAction.toString() == 'null'
                                          ? '-'
                                          : 'Last Action : ' +
                                              _inboxDetailss[index].lastAction.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)),
                                  // ...
                                ],
                              ))),
                      Expanded(
                          flex: 20,
                          child: Container(
                              //color: Colors.green,
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                  textAlign: TextAlign.end,
                                  /*getCurrentDate(),*/
                                  timeFormate(_inboxDetailss[index].transaction_createdAt.trim()),
                                  overflow: TextOverflow.ellipsis,
                                  style: _inboxDetailss[index].bread
                                      ? TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)
                                      : TextStyle(
                                          color: Colors.black87,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600))))
                    ],
                  ),
                ));
          },
        )),
        //yyyyyyy
        floatingActionButton: Visibility(
            visible: controllerpopup.bFab,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.blueAccent.shade200,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              label: Text('Initiate'),
              icon: Icon(Icons.start),
              onPressed: () => {openForm()},
            )));
  }

  CheckFabDisplay(String sUserid) {
    String sTemp = jsonEncode(widget.miSelectedData.flowJson)
        .replaceAll('\\\\"', '"')
        .replaceAll('\\\"', '"')
        .replaceAll('\\"', '"');
    sTemp = sTemp.substring(1, sTemp.length - 1);

    Map<String, dynamic> mFJ = jsonDecode(sTemp.substring(1, sTemp.length - 1));

    for (int i = 0; i < mFJ['blocks'].length; i++) {
      findBlockId(mFJ['blocks'][i]['settings'], mFJ['blocks'][i]['id']);
      if (mFJ['blocks'][i]['type'] == 'START') {
        List<dynamic> slist = mFJ['blocks'][i]['settings']['users'];
        for (int j = 0; j < slist.length; j++) {
          if (slist[j].toString() == sUserid) {
            setState(() {
              controllerpopup.bFab = true;
            });
          }
        }
      }
    }
    print(controllerpopup.bFab.toString());
  }

  openForm() {
    controllerPanel.sFormId = widget.miSelectedData.wFormId;
    controllerPanel.repositoryId = widget.miSelectedData.repositoryId;
    controllerPanel.formbuttonList = ['Save', 'Submit'];
    //Navigator.pushNamed(context, "formviewinitiate");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRoutes.push(context, AppRoutes.workflowinitiate);
    });
  }

  openPopupForm() {
    //Navigator.pushNamed(context, "inboxpage");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRoutes.push(context, AppRoutes.fulldetails);
    });
  }

  findUserGroupsList(String dd) {
    final responseMap = jsonDecode(AaaEncryption.decryptAESaaa(dd));
    final infoList = responseMap['groups'];
    controllerPanel.userGroupList = infoList.map((info) => info['id']).toList();
  }

  findBlockId(var auserList, String sBlockId) {
    bool bpresent = false;
    bpresent = auserList['users'].contains(sUserId);
    if (!bpresent && auserList['groups'].length > 0 && controllerPanel.userGroupList.length > 0) {
      for (int i = 0; i < auserList['groups'].length; i++) {
/*        for (int j = 0; j < controllerPanel.userGroupList.length; j++) {
          if (auserList['groups'][i].toString() == controllerPanel.userGroupList[j].toString()) {
            bpresent = true;
            break;
          }*/
        bpresent = controllerPanel.userGroupList.contains(auserList['groups'][i].toString());
        if (bpresent) break;
      }
    }

    if (bpresent) {
      print(sBlockId);
    } else {}
  }
}
