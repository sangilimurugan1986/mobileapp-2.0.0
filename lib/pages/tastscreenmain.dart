import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/taskcontroller.dart';
import '../layouts/search/SearchLayout.dart';

import '../utils/helper/safe_area.dart';
import '../widgets/batchwork.dart';
import '../widgets/batchworkblue.dart';
import '../widgets/batchworkbrowse.dart';
import '../widgets/batchworkpurple.dart';
import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

import '../widgets/connectItembrowse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TaskScreenMain extends StatefulWidget {
  @override
  _TaskScreenMainState createState() => _TaskScreenMainState();
}

class _TaskScreenMainState extends State<TaskScreenMain> {
  final controller = Get.put(TaskController());
  final cont = Get.put(BrowseViewController());
  RxString iCurrentSelect = 'Connect'.obs;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (iCurrentSelect != 'Connect') {
      setState(() {
        iCurrentSelect = 'Connect'.obs;
      });
      return Future.value(null);
    } else
      cont.tabFunction(1);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: SearchLayout(wpersistentFooterButtons: [
          Container(
              // height: double.infinity,
              // width: double.infinity,
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
          Expanded(
            child: Container(
                child: ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                  //////////////////////////////////////
                  iCurrentSelect == 'Connect'
                      ? Column(
                          children: [
                            BatchWorkBlue(sFolderName: 'From Templetes', iSelected: 0),
                            SizedBox(height: 20),
                            BatchWorkPurple(sFolderName: 'Workspace', iSelected: 0),
                            SizedBox(height: 20),
                            BatchWorkBlue(sFolderName: 'From Templetes', iSelected: 0),
                            SizedBox(height: 20),
                            BatchWorkPurple(sFolderName: 'Workspace', iSelected: 0),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),
////////
                  iCurrentSelect == 'Browse'
                      ? Column(
                          children: [
                            BatchWorkBrowse(sFolderName: 'Workspaces'),
                            BatchWorkBrowse(sFolderName: 'Workspaces')
                          ],
                        )
                      : Container(),
                  //////////////////////////////////////
                  iCurrentSelect == 'Explore'
                      ? Column(children: [
                          BatchWorkBlue(sFolderName: 'Manufacturings', iSelected: 0),
                          // /BatchWork(sFolderName: 'Manufacturing'),
                          SizedBox(height: 20),
                          BatchWorkPurple(
                            sFolderName: 'Legal',
                            iSelected: 0,
                          ), //headset
                          BatchWorkBlue(sFolderName: 'Manufacturing', iSelected: 0),
                          SizedBox(height: 20),
                          BatchWorkPurple(sFolderName: 'Legal', iSelected: 0)
                        ])
                      : Container()
                  ///////////////////////////////////////////
                ])),
          ),
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
