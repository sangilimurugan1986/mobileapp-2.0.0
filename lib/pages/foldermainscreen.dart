import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/foldermaincontroller.dart';
import '../layouts/search/SearchLayout.dart';

import '../utils/helper/safe_area.dart';
import '../widgets/batchworkbrowsefolders.dart';
import '../widgets/batchworkfolders.dart';
import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

class FolderMainScreen extends StatefulWidget {
  @override
  _FolderMainScreenState createState() => _FolderMainScreenState();
}

class _FolderMainScreenState extends State<FolderMainScreen> {
  final controller = Get.put(FolderMainController());
  RxString iCurrentSelect = 'Folders'.obs;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final cont = Get.put(BrowseViewController());
    if (iCurrentSelect != 'Folders') {
      setState(() {
        iCurrentSelect = 'Folders'.obs;
      });
      return Future.value(null);
    } else
      cont.tabFunction(1);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final safeArea = calcSafeArea();

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
                            child: ButtonRounded(
                      label: 'Folders',
                      isSelected: iCurrentSelect == 'Folders',
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
                      label: 'Trash',
                      isSelected: iCurrentSelect == 'Trash',
                      onPressed: tabFunctionTrashr,
                    ))),
                  ]))),
        ], children: [
          Expanded(
            child: Container(
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                  //////////////////////////////////////
                  iCurrentSelect == 'Folders'
                      ? Column(
                          children: [
                            BatchWorkFolder(sFolderName: 'Invesments'),
                          ],
                        )
                      : Container(),

                  iCurrentSelect == 'Browse' ? BatchWorkBrowseFolder() : Container(),

                  //////////////////////////////////////
                  iCurrentSelect == 'Trash' ? Column(children: []) : Container()

                  ///////////////////////////////////////////
                ])),
          ),
          SizedBox(height: 10),
        ]));
  }

  tabFunctionCommect() {
    setState(() {
      iCurrentSelect = 'Folders'.obs;
    });
  }

  tabFunctionBrowse() {
    setState(() {
      iCurrentSelect = 'Browse'.obs;
    });
  }

  tabFunctionTrashr() {
    setState(() {
      iCurrentSelect = 'Trash'.obs;
    });
  }
}
