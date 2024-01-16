import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/v5/controllers/foldermaincontroller.dart';
import '../../../core/v5/widgets/buttonwithicon.dart';
import 'singleitemfolder.dart';

class ConnectSingleItemFolder extends StatelessWidget {
  final controller = new FolderMainController();
  ConnectSingleItemFolder(
      {Key? key,
      this.isRounded = true,
      required this.cMenu,
      required this.iPosition,
      required this.bIsEdit})
      : super(key: key);

  final bool isRounded;
  final cMenu;
  final iPosition;
  final bIsEdit;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        //height: 40,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        child: Column(children: [
          Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.folder,
                      color: Colors.blue,
                      size: 28,
                    ))),
            Expanded(
                flex: 7,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                10, 5, 5, 5), //601 = 113, 236 =90, 214 =10,160= 207
                            child: Text(
                              cMenu['name'],
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18),
                            )),
                        //               SizedBox(height: 10),
                        cMenu['description'] != null || cMenu['description'] != ''
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                                child: Text(
                                  cMenu['description'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54, fontSize: 14),
                                ))
                            : Text(
                                '-',
                                style: TextStyle(color: Colors.black54, fontSize: 14),
                              ),
                      ],
                    ))),
          ]),
          Divider(
            color: Colors.black12,
          ),
          //SingleItemTableFolder(cMenu['details']),
          SingleItemTableFolder(cMenu),
          Divider(
            color: Colors.black12,
          ),
          bIsEdit
              ? Container(
                  child: IntrinsicHeight(
                      child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Obx(() => Center(
                              child: ButtonWithIcon(
                            isFullWidth: true,
                            labelval: '',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.edit,
                            iIcon: Icon(
                              MdiIcons.pencilOutline,
                              color: Colors.black38,
                            ),
                          ))),
                    ),
                    SizedBox(
                      width: 5,
                      child: VerticalDivider(width: 2.0, color: Colors.black12),
                    ),
                    Expanded(
                      flex: 3,
                      child: Obx(() => Center(
                              child: ButtonWithIcon(
                            isFullWidth: true,
                            labelval: '',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.security,
                            iIcon: Icon(
                              MdiIcons.shieldAccount,
                              color: Colors.black38,
                            ),
                          ))),
                    ),
                    SizedBox(
                      width: 5,
                      child: VerticalDivider(width: 2.0, color: Colors.black12),
                    ),
                    Expanded(
                      flex: 3,
                      child: Obx(() => Center(
                              child: ButtonWithIcon(
                            isFullWidth: true,
                            labelval: '',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.delete,
                            iIcon: Icon(
                              MdiIcons.deleteOutline,
                              color: Colors.black38,
                            ),
                          ))),
                    ),
                    SizedBox(
                      width: 5,
                      child: VerticalDivider(width: 2.0, color: Colors.black12),
                    ),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                            onTap: controller.menudoticon,
                            child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Icon(
                                  MdiIcons.dotsVertical,
                                  size: 22,
                                  color: Colors.black38,
                                )))),
                  ])),
                )
              : Container(
                  child: IntrinsicHeight(
                      child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Obx(() => Center(
                              child: ButtonWithIcon(
                            isFullWidth: true,
                            labelval: 'View',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.edit,
                            iIcon: Icon(
                              MdiIcons.eyeOutline,
                              color: Colors.black38,
                            ),
                          ))),
                    ),
                  ])),
                ),
          SizedBox(
            height: 5,
          ),
        ]));
  }
}
