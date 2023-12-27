import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controllers/dashmaincontroller.dart';

import '../layouts/search/SearchLayout.dart';
import '../layouts/search/controller/searchlayout_controller.dart';
import '../utils/helper/safe_area.dart';
import '../widgets/TreInboxListview.dart';

import '../widgets/inboxtext.dart';
import '../widgets/listviewsearchable.dart';
import '../widgets/testinbox.dart';

class WorkFlowMain extends StatefulWidget {
  @override
  _WorkFlowMainState createState() => _WorkFlowMainState();
}

class _WorkFlowMainState extends State<WorkFlowMain> {
  DashMainController dbcontroller = new DashMainController();
  final controller = Get.put(SearchlayoutController());

  double safeAreaHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  checkDrawerOpens(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      debugPrint('toggle controller opn');
      Scaffold.of(context).closeDrawer();
    } else {
      debugPrint('toggle controller else');
    }
  }

  @override
  Widget build(BuildContext context) {
    dbcontroller.justPrint();
    final safeArea = calcSafeArea();
    safeAreaHeight = safeArea['height']!;
    // TODO: implement build
    //return SearchLayout(children: [const SizedBox(height: 400)]);
    return SearchLayout(wpersistentFooterButtons: List.empty(), children: [
      Expanded(
          child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        /* child: ListViewSearch(
                    sWorkflowId: '7',
                    sType: '0',
                  )*/
      ))
    ]);
  }
}
