import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/foldermaincontroller.dart';
import 'ConnectItem.dart';
import '../config/theme.dart';
import 'buttonwithicon.dart';
import 'connectItemfolder.dart';

class BatchWorkFolder extends StatelessWidget {
  final String sFolderName;

  BatchWorkFolder({
    Key? key,
    required this.sFolderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .7;
    final controller = new FolderMainController();
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            //
            color: Colors.white12,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: [
          //csr
          //
          Container(
            height: dheight, //235 orginal  9585090090
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
                child: GridView.builder(
              //physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //maxCrossAxisExtent: 540,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 0,
                  crossAxisCount: 1),
              itemCount: controller.folderDatas.length,
              itemBuilder: (BuildContext context, int index) {
                return ConnectSingleItemFolder(
                  //tiiprod
                  cMenu: controller.folderDatas[index],
                  iPosition: index,
                );
              }, //E:\TII_PROD_EZOFIS\new  //10.0.24 22
            )),
          )
        ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
