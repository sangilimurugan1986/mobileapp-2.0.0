import 'package:ez/widgets/textnormal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/theme.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/taskmaincontroller.dart';
import '../layouts/auth/widgets/fab.dart';
import '../layouts/search/SearchLayout.dart';

import '../utils/helper/safe_area.dart';
import '../widgets/batchwork.dart';
import '../widgets/batchworkbrowse.dart';
import '../widgets/batchworktaslcompleted.dart';
import '../widgets/batchworkweb.dart';
import '../widgets/batchworkwebservice.dart';
import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

class TaskMainScreen extends StatefulWidget {
  @override
  _TaskMainScreenState createState() => _TaskMainScreenState();
}

class _TaskMainScreenState extends State<TaskMainScreen> {
  final controller = Get.put(TaskMainController());
  RxString iCurrentSelect = 'Completed'.obs;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final cont = Get.put(BrowseViewController());
/*    if (iCurrentSelect != 'Completed') {
      setState(() {
        iCurrentSelect = 'Completed'.obs;
      });
    } else*/
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
                      label: 'Task List',
                      isSelected: iCurrentSelect == 'List',
                      onPressed: tabFunctionCommect,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'High',
                      isSelected: iCurrentSelect == 'High Priority',
                      onPressed: tabFunctionBrowse,
                    ))),
                    Expanded(
                        child: Center(
                            child: ButtonRounded(
                      label: 'Complete',
                      isSelected: iCurrentSelect == 'Completed',
                      onPressed: tabFunctionExplorer,
                    ))),
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
                    iCurrentSelect == 'List' ? Container() : Container(),

                    iCurrentSelect == 'High Priority' ? Container() : Container(),

                    //////////////////////////////////////
                    iCurrentSelect == 'Completed'
                        ? Column(children: [
                            BatchWorkTaskCompleted(
                              sFolderName: '(2)',
                            ),
                            BatchWorkTaskCompleted(
                              sFolderName: '(2)',
                            )
                          ])
                        //70000 750
                        : Container(),

                    ///////////////////////////////////////////
                  ])),
          SizedBox(height: 20),
        ]));
  }

  tabFunctionCommect() {
    setState(() {
      iCurrentSelect = 'List'.obs;
    });
  }

  tabFunctionBrowse() {
    setState(() {
      iCurrentSelect = 'High Priority'.obs;
    });
  } //7.5  55

  tabFunctionExplorer() {
    setState(() {
      iCurrentSelect = 'Completed'.obs;
    });
  }
}
