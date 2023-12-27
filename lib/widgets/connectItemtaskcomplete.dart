import 'package:ez/widgets/singleitemfolder.dart';
import 'package:ez/widgets/singleitemtaskcompleted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controllers/foldermaincontroller.dart';
import 'buttonwithicon.dart';

class ConnectSingleItemtaskComplete extends StatelessWidget {
  final controller = new FolderMainController();
  ConnectSingleItemtaskComplete(
      {Key? key,
      this.isRounded = true,
      required this.cMenu,
      required this.iPosition})
      : super(key: key);

  final bool isRounded;
  final cMenu;
  final iPosition;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        //padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        child: Column(children: [
          Row(children: [
            Expanded(
                flex: 7,
                child: Container(
                  // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  //601 = 113, 236 =90, 214 =10,160= 207
                  child: Text(
                    cMenu['Foldername'],
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 18),
                  ),
                  //               SizedBox(height: 10),
                )),
          ]),
          Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          SingleItemTaskCompleted(cMenu['details']),
        ]));
  }
}
