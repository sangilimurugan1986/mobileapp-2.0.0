import 'package:ez/widgets/textnormal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/webmaincontroller.dart';
import '../layouts/search/SearchLayout.dart';

import '../widgets/batchwork.dart';
import '../widgets/batchworkblue.dart';
import '../widgets/batchworkbrowse.dart';
import '../widgets/batchworkpurple.dart';
import '../widgets/batchworkweb.dart';
import '../widgets/batchworkwebservice.dart';
import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

import '../widgets/connectItembrowse.dart';

class WebMainScreen extends StatefulWidget {
  @override
  _WebMainScreenState createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  final controller = Get.put(WebMainController());
  RxString iCurrentSelect = ''.obs;

  @override
  void initState() {
    iCurrentSelect = 'Browse'.obs;
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final cont = Get.put(BrowseViewController());
/*    if (iCurrentSelect != 'Browse') {
      setState(() {
        iCurrentSelect = 'Browse'.obs;
      });
    } else*/
    cont.tabFunction(1);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: SearchLayout(wpersistentFooterButtons: [
          Container(
//              color: Colors.red,
              // height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: Obx(() => Row(children: [
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Connect',
                      isSelected: iCurrentSelect == 'Connect',
                      onPressed: tabFunctionCommect,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Browse',
                      isSelected: iCurrentSelect == 'Browse',
                      onPressed: tabFunctionBrowse,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Explore',
                      isSelected: iCurrentSelect == 'Explore',
                      onPressed: tabFunctionExplorer,
                    ))),
                  ]))),
        ], children: [
          Container(
              color: Colors.white,
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    //////////////////////////////////////
                    iCurrentSelect == 'Connect'
                        ? Column(
                            children: [],
                          )
                        : Container(),

                    iCurrentSelect == 'Browse'
                        ? Column(
                            children: [
                              BatchWorkWebService(sFolderName: 'Service Portal', iSelected: 0),
                              SizedBox(height: 10),
                              BatchWorkPurple(sFolderName: 'Legal', iSelected: 0),
                              /*       SizedBox(height: 20),
                              BatchWorkWeb(
                                sFolderName: 'Legal',
                              ),*/
                            ],
                          )
                        : Container(),

                    //////////////////////////////////////
                    iCurrentSelect == 'Explore' ? Column(children: []) : Container()
                    ///////////////////////////////////////////
                  ])),
          SizedBox(height: 20),
        ]));
  }

  tabFunctionCommect() {
    setState(() {
      iCurrentSelect = 'Connect'.obs;
    });
  }

  tabFunctionBrowse() {
    setState(() {
      iCurrentSelect = 'Browse'.obs;
    });
  }

  tabFunctionExplorer() {
    setState(() {
      iCurrentSelect = 'Explore'.obs;
    });
  }
}
