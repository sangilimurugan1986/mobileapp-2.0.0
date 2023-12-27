import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controllers/taskmaincontroller.dart';

import '../layouts/auth/widgets/fab.dart';
import 'ConnectItem.dart';
import '../config/theme.dart';
import 'buttonrounded.dart';
import 'buttonroundednoaction.dart';
import 'connectItemtaskcomplete.dart';

class BatchWorkTaskCompleted extends StatefulWidget {
  final String sFolderName;

  const BatchWorkTaskCompleted({required this.sFolderName});

  @override
  _BatchWorkTaskCompletedState createState() => _BatchWorkTaskCompletedState();
}

class _BatchWorkTaskCompletedState extends State<BatchWorkTaskCompleted> {
  @override
  void initState() {
    super.initState();
  }

//class BatchWorkTaskCompleted extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .7;
    final controller = new TaskMainController();
    // TODO: implement build
    return Container(
        height: dheight,
        //margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //maxCrossAxisExtent: 540,
              mainAxisExtent: 240, //40,150,42,15,55,10,10,10,40 7
              mainAxisSpacing: 0,
              crossAxisCount: 1),
          itemCount: controller.folderDatas.length,
          itemBuilder: (BuildContext context, int index) {
            return ConnectSingleItemtaskComplete(
              cMenu: controller.folderDatas[index],
              iPosition: index,
            );
          },
        ));
    Column(children: [
/*          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.all(4),
                  child: ButtonRoundedNoAction(
                      color: Colors.purple, label: sFolderName))),*/

      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //maxCrossAxisExtent: 540,
            mainAxisExtent: 240, //40,150,42,15,55,10,10,10,40 7
            mainAxisSpacing: 0,
            crossAxisCount: 1),
        itemCount: controller.folderDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return ConnectSingleItemtaskComplete(
            cMenu: controller.folderDatas[index],
            iPosition: index,
          );
        },
      )
    ]);
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
