import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../routes.dart';
import '../../../controllers/treeboxlistviewcontroller.dart';

import '../../../utils/format_date_time.dart';
import '../../../widgets/CustomWidget.dart';
import '../controllers/gridviewhomecontroller.dart';
import 'package:flutter/material.dart';

import '../controllers/popupfullpagecontroller.dart';

class GridViewHome extends StatefulWidget {
  @override //
  _GridViewHomeState createState() => _GridViewHomeState();
}

class _GridViewHomeState extends State<GridViewHome> {
  final controller = Get.put(GridViewHomeController());
  final controllerpopup = Get.put(PopupFullPageController());
  final controllerTree = Get.put(TreeInboxListviewController());
  var i = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Container(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 70,
              child: controller.filedsnew.keys.length > 0
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.filedsnew.keys.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey
                                    .shade200), /*borderRadius: BorderRadius.all(Radius.circular(5.0))*/
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                controller.filedsnew.keys.elementAt(index),
                                style: TextStyle(
                                    color: Colors.indigoAccent,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14),
                                maxLines: 2,
                              )),
                              VerticalDivider(width: 10.0),
                              Expanded(
                                  child: Text(
                                controller.filedsnew.values.elementAt(index),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16),
                                maxLines: 2,
                              )),
                            ],
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: 10,
                      // / shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          //padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      child: ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomWidget.rectangular(
                                    height: 8,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                                // subtitle: CustomWidget.rectangular(height: 8),
                              ))),
                              Expanded(
                                  child: Container(
                                      //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: ListTile(
                                //leading: CustomWidget.circular(height: 64, width: 64),
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomWidget.rectangular(
                                    height: 8,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                                // subtitle: CustomWidget.rectangular(height: 8),
                              )))
                            ],
                          ),
                        );
                      },
                    )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 5,
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  width: double.infinity,
                  //padding: EdgeInsets.fromLTRB(30, 0, 30, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              child: DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Reminders',
                                    maxLines: 2,
                                  )))),
                      Flexible(
                          flex: 1,
                          child: Container(
                              color: Colors.grey.shade100,
                              padding: EdgeInsets.all(1),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                    child: Text(timeFormate(controllerpopup
                                        .transaction_createdAt)), //       timeFormate(_inboxDetailss[index].raisedAt.trim()),
                                    maxLines: 2,
                                  )))),
                    ],
                  ))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 7,
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controllerpopup.wButtons.length,
                          itemBuilder: (context, index) {
                            //filedatas item = controllerpopup.wButtons.elementAt(index);
                            return controllerpopup.wButtons.elementAt(index);
                          }) /*ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[controllerpopup.wButtons,
                    buttonGenerate(
                        'Initate',
                        Colors.green,
                        Icon(
                          MdiIcons.arrowRight,
                          color: Colors.green,
                        )),
                    buttonGenerate(
                        'Submit',
                        Colors.deepOrangeAccent,
                        Icon(
                          MdiIcons.gestureTap,
                          color: Colors.deepOrangeAccent,
                        )),
                    buttonGenerate(
                        'Forward',
                        Colors.orange,
                        Icon(
                          MdiIcons.share,
                          color: Colors.orange,
                        )),
                    buttonGenerate(
                        'Complete',
                        Colors.purple,
                        Icon(
                          MdiIcons.check,
                          color: Colors.purple,
                        )),
                    buttonGenerate(
                        'Close',
                        Colors.red,
                        Icon(
                          MdiIcons.close,
                          color: Colors.red,
                        )),
                  ],
                )*/
                      ))),
        ],
      )),
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[
          Visibility(
              visible: controllerTree.iCurrentSelect.toString().contains('_0'),
              child: Container(
                  margin: EdgeInsets.all(5),
                  child: FloatingActionButton.small(
                    backgroundColor: Colors.blueAccent.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    child: Icon(color: Colors.white, Icons.edit),
                    onPressed: () => {
                      /*printDetails()*/
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        AppRoutes.push(context, AppRoutes.workflow);
                      })
                    },
                  ))), // button third

          // Add more buttons here
        ],
      ),
    );
  }

  printDetails() {
    print('Details1');

    print(controllerpopup.sProcessId);
    print(controllerpopup.sFormId);
    print(controllerpopup.sFormEntryId);
    print(controllerpopup.sFormJSon.toString());
    Navigator.of(context, rootNavigator: true).pushNamed("/formview");
  }

  buttonGenerate(String sname, Color clr, Icon icn) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: clr),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0), side: BorderSide(width: 2, color: clr)),
          ),
          onPressed: () => {},
          icon: icn,
          label: Text(
            sname,
            style: TextStyle(color: clr),
          ),
        ));
  }
}
