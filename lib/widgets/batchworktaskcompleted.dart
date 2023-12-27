import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../controllers/foldermaincontroller.dart';

import 'connectItemfolder.dart';

class BatchWorkFolder extends StatelessWidget {
  final String sFolderName;

  BatchWorkFolder({
    Key? key,
    required this.sFolderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = new FolderMainController();
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: [
          Container(
            height: 500, //235 orginal
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //maxCrossAxisExtent: 540,
                  mainAxisExtent: 250, //40,150,42,15,55,10,10,10,40 7
                  mainAxisSpacing: 0,
                  crossAxisCount: 1),
              itemCount: controller.folderDatas.length,
              itemBuilder: (BuildContext context, int index) {
                return ConnectSingleItemFolder(
                  cMenu: controller.folderDatas[index],
                  iPosition: index,
                );
              },
            )),
          )
        ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
