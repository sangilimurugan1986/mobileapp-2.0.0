import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/treeboxlistviewcontroller.dart';
import '../../../core/CustomAppBar.dart';
import '../../../core/CustomColors.dart';
import '../../../widgets/listviewsearchable.dart';

class WorkflowDetails extends StatelessWidget {
  //
  const WorkflowDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TreeInboxListviewController());
    return Scaffold(
      appBar: CustomAppBar(
        title: "Inbox",
        actions: [
          // AppBarAction(icon: Icon(Icons.add_a_photo), onPressed: () => {}),
        ],
        backgroundColor: CustomColors.white24,
      ),
      body: Container(
          child: ListViewSearch(
        miSelectedData: controller.miList,
        sType: controller.iCurrentSelect.toString().split('_')[1],
        sWorkflowId: controller.iCurrentSelect.toString().split('_')[0],
      )),
    );
  }
}
