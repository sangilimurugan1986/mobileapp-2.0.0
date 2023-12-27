import 'dart:convert';
import 'package:badges/badges.dart' as badges;
import 'package:ez/models/popup/widgetpopup/attachfile.dart';
import 'package:ez/models/popup/widgetpopup/comments.dart';
import 'package:ez/models/popup/widgetpopup/gridviewhome.dart';
import 'package:ez/models/popup/widgetpopup/historytask.dart';
import 'package:ez/models/popup/widgetpopup/tasktab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../api/auth_repo.dart';
import '../../utils/helper/aes_encryption.dart';

import 'controllers/popupfullpagecontroller.dart';

class TabMianScreen extends StatefulWidget {
  @override
  TabMianScreenState createState() => TabMianScreenState();
}

class TabMianScreenState extends State<TabMianScreen> with TickerProviderStateMixin {
  late TabController _controller;
  final controllerpopup = Get.put(PopupFullPageController());
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(TabController(length: 5, vsync: this));
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });

    setState(() {
      controllerpopup.iFilecount.value = 0;
      controllerpopup.iTaskCount.value = 0;
      controllerpopup.iMsgCount.value = 0;
    });

    getCommentsDetailsCount();
    getFileDetailsCount();
    getTasklIstCount();
  }

  void getCommentsDetailsCount() async {
    final responses =
        await AuthRepo.getCommentsList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    List lComments = jsonDecode(AaaEncryption.decryptAESaaa(responses.toString())) as List;
    setState(() {
      controllerpopup.iMsgCount.value = lComments.length;
    });
  }

  void getFileDetailsCount() async {
    final responses =
        await AuthRepo.getFileList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    List lFiles = jsonDecode(AaaEncryption.decryptAESaaa(responses.toString())) as List;
    setState(() {
      controllerpopup.iFilecount.value = lFiles.length;
    });
  }

  void getTasklIstCount() async {
    String payloadenc = '{"filterBy":[]}';
    final responses = await AuthRepo.getTaskList(controllerpopup.sWorkFlowId,
        controllerpopup.sProcessId, jsonEncode(AaaEncryption.EncryptDatatest(payloadenc)));
    // String dec = AaaEncryption.decryptAESaaa(responses.toString());
    List lTask = jsonDecode(AaaEncryption.decryptAESaaa(responses.toString())) as List;

    setState(() {
      controllerpopup.iTaskCount.value = lTask.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // TODO: implement build
    // final controller = Get.put(AttcaheFileController());
    return ListView(
      //shrinkWrap: true,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Obx(() => TabBar(
                labelColor: Colors.purple,
                unselectedLabelColor: Colors.blueGrey,
                isScrollable: false,
                controller: _controller,
                indicatorColor: Colors.purple,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                      icon: badges.Badge(
                    showBadge: false,
                    badgeContent: Text('',
                        style: TextStyle(
                            //fontSize: 14,
                            fontSize: 10,
                            color: Colors.white, //#00bfd6
                            fontWeight: FontWeight.w500)),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: const Color(0xFF00bfd6),
                    ),
                    child: Icon(MdiIcons.listBoxOutline),
                  )),
                  Tab(
                      icon: badges.Badge(
                    badgeContent: Text(controllerpopup.iFilecount.toString(),
                        style: TextStyle(
                            //fontSize: 14,
                            fontSize: 10,
                            color: Colors.white, //#00bfd6
                            fontWeight:
                                FontWeight.w500)), //Text(controllerpopup.iFilecount.toString()),
                    showBadge: controllerpopup.iFilecount > 0,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: const Color(0xFF00bfd6),
                    ),
                    child: Icon(Icons.attachment),
                  )),
                  Tab(
                      icon: badges.Badge(
                    badgeContent: Text(controllerpopup.iMsgCount.toString(),
                        style: TextStyle(
                            //fontSize: 14,
                            fontSize: 10,
                            color: Colors.white, //#00bfd6
                            fontWeight: FontWeight.w500)),
                    showBadge: controllerpopup.iMsgCount > 0,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: const Color(0xFF00bfd6),
                    ),
                    child: Icon(MdiIcons.commentOutline),
                  )),
                  Tab(
                      icon: badges.Badge(
                    badgeContent: Text(controllerpopup.iTaskCount.toString(),
                        style: TextStyle(
                            //fontSize: 14,
                            fontSize: 10,
                            color: Colors.white, //#00bfd6
                            fontWeight: FontWeight.w500)),
                    showBadge: controllerpopup.iTaskCount > 0,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: const Color(0xFF00bfd6),
                    ),
                    child: Icon(MdiIcons.cubeOutline),
                  )),
                  Tab(
                      icon: badges.Badge(
                    badgeContent: Text('',
                        style: TextStyle(
                            //fontSize: 14,
                            fontSize: 10,
                            color: Colors.white, //#00bfd6
                            fontWeight: FontWeight.w500)),
                    showBadge: false,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: const Color(0xFF00bfd6),
                    ),
                    child: Icon(MdiIcons.history),
                  )),
                ], // 9443451033
                onTap: (index) {},
              )),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))),
          //height: safeAreaHeight == 716 ? 330 : 380, //351
          height: mediaQuery.size.height * .66,

          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              Container(child: GridViewHome()),
              Container(color: Colors.redAccent, child: AttachFiles()),
              Container(color: Colors.white, child: CommenttList()),
              Container(color: Colors.redAccent, child: TaskTab()),
              Container(color: Colors.white, child: HistoryTask()),

              /*             Container(),
              Container(),
              Container(),*/
            ],
          ),
        )
      ],
    );
  }
}
