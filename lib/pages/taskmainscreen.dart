import 'package:ez/widgets/textnormal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/browse_view_controller.dart';
import '../controllers/taskmaincontroller.dart';

import '../layouts/search/SearchLayout.dart';

import '../utils/helper/safe_area.dart';

import '../widgets/batchworktaslcompleted.dart';

import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

class TaskMainScreen extends StatefulWidget {
  @override
  _TaskMainScreenState createState() => _TaskMainScreenState();
}

class _TaskMainScreenState extends State<TaskMainScreen> {
  final controller = Get.put(TaskMainController());
  RxString iCurrentSelect = 'Open'.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Future<bool> _onWillPop() async {
    final cont = Get.put(BrowseViewController());

    cont.tabFunction(1);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final safeArea = calcSafeArea();
    double safeAreaHeight = safeArea['height']!;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: SearchLayout(wpersistentFooterButtons: [
          Container(
              // height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: Obx(() => Row(children: [
                    Expanded(
                        child: Center(
                            // widthFactor: double.infinity,
                            child: ButtonRounded(
                      label: 'Overall',
                      isSelected: iCurrentSelect == 'Overall',
                      onPressed: tabFunctionCommect,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Open',
                      isSelected: iCurrentSelect == 'Open',
                      onPressed: tabFunctionExplorer,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Close',
                      isSelected: iCurrentSelect == 'Close',
                      onPressed: tabFunctionBrowse,
                    )))
                  ]))),
        ], children: [
          Container(
              height: safeAreaHeight * 0.72,
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    //////////////////////////////////////
                    iCurrentSelect == 'Overall' ? Container() : Container(),

                    iCurrentSelect == 'Close' ? Container() : Container(),

                    //////////////////////////////////////
                    iCurrentSelect == 'Open'
                        ? Column(children: [
                            BatchWorkTaskCompleted(
                              sFolderName: '(2)',
                            ),
                            /*     BatchWorkTaskCompleted(
                              sFolderName: '(2)',
                            )*/
                          ])
                        //70000 750
                        : Container(),

                    ///////////////////////////////////////////
                  ])),
          SizedBox(height: 15),
        ]));
  }

  tabFunctionCommect() {
    setState(() {
      iCurrentSelect = 'Overall'.obs;
    });
  }

  tabFunctionBrowse() {
    setState(() {
      iCurrentSelect = 'Close'.obs;
    });
  } //7.5  55

  tabFunctionExplorer() {
    setState(() {
      iCurrentSelect = 'Open'.obs;
    });
  }
}
