import 'package:ez/widgets/textnormal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/taskcontroller.dart';
import '../controllers/dashmaincontroller.dart';
import '../layouts/search/SearchLayout.dart';
import '../widgets/TreeViewWidget.dart';
import '../widgets/batchwork.dart';
import '../widgets/batchworkpurple.dart';
import '../widgets/buttonrounded.dart';
import 'package:get/get.dart';

class TaskScreen extends GetView<TaskController> {
  //TaskController controller = new TaskController();
  final controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SearchLayout(children: [
      Stack(children: <Widget>[
        Obx(() => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: Center(
                      child: ButtonRounded(
                label: 'Connect',
                isSelected: controller.iCurrentSelect == 'Connect',
                onPressed: controller.tabFunction('Connect'),
              ))),
              Expanded(
                  child: Center(
                      child: ButtonRounded(
                //509
                label: 'Browse',
                isSelected: controller.iCurrentSelect == 'Browse',
                onPressed: controller.tabFunction('Browse'),
              ))),
              Expanded(
                  child: Center(
                      child: ButtonRounded(
                label: 'Explore',
                isSelected: controller.iCurrentSelect == 'Explore',
                onPressed: controller.tabFunction('Explore'),
              ))),
            ]))
      ]),
      SizedBox(height: 20),
      BatchWork(sFolderName: 'Workspaces'),
      SizedBox(height: 20),
      BatchWork(
        sFolderName: 'From Templete',
      ),
/*      ListView(children: <Widget>[
        BatchWork(),
      ])*/
    ]);
    //return Container(child: TreeViewWidget());
/*    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dynamic Tree View')),
        body: TreeViewWidget(),
      ),
    );*/
  }
}
