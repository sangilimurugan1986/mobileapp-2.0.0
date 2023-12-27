import 'package:ez/widgets/tabmainscan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controllers/batchworkfolderbrowsecontroller.dart';
import '../layouts/auth/widgets/fab.dart';
import '../utils/helper/safe_area.dart';
import 'breadcrumbs.dart';
import 'buttonrounded.dart';
import 'nodule_list.dart';
import '../../config/theme.dart';

class BatchWorkBrowseFolder extends StatefulWidget {
  @override
  BatchWorkBrowseFolderState createState() => BatchWorkBrowseFolderState();
}

class BatchWorkBrowseFolderState extends State<BatchWorkBrowseFolder> {
//class BatchWorkBrowseFolder extends StatelessWidget {
/*
  BatchWorkBrowseFolder({
    Key? key,
  }) : super(key: key); //
*/

  final controller = Get.put(BatchWorkFolderBrowseController());
  double containerHeight = 0;
  RxString iCurrentSelect = 'main'.obs;
  double safeAreaHeight = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .8;
    // TODO: implement build
    return iCurrentSelect == 'main'
        ? ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, maxHeight: dheight), //470
            child: Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    // color: Colors.blue, // BrandColors.secondary.shade50,
                    child: Column(children: <Widget>[
/*                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Icon(
                            MdiIcons
                                .chevronLeftCircleOutline, //MdiIcons.arrowLeftThinCircleOutline  Icons.arrow_circle_left_outlined
                            color: Colors.deepPurple),
                      )),*/
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 5),
                        child: Obx(() => Row(children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.onBreadcrumbHome();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Center(
                                          child: Icon(
                                        Icons.home,
                                        size: 22,
                                        color:
                                            controller.breadcrumbs.length == 0
                                                ? Colors.grey.shade200
                                                : Colors.grey.shade800,
                                      )))),
                              const SizedBox(
                                width: 0,
                              ),
                              Expanded(
                                  child: Breadcrumbs(
                                breadcrumbs: controller.breadcrumbs,
                                onTap: controller.onBreadcrumbTap,
                              ))
                            ])),
                      ),
                      Expanded(
                        child: Obx(
                          () => controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    //6082
                                    color: BrandColors.secondaryAccent,
                                  ),
                                )
                              : NoduleList(),
                        ),
                      ),
                      Obx(() => controller.showbottomup.value
                          ? Container(
                              color: Colors.transparent,
                              child: Wrap(children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 115,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  //color: Colors.black.withOpacity(.1),
                                  child: Center(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        ButtonRounded(
                                          label: 'Upload',
                                          isSelected: false,
                                          onPressed: () {
                                            controller.onUpload();
                                            debugPrint('========== ' +
                                                iCurrentSelect.value);
                                            setState(() {
                                              iCurrentSelect = 'upload'.obs;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        ButtonRounded(
                                          label: '   Scan   ',
                                          isSelected: false,
                                          onPressed: () {
                                            controller.onScan();
                                            setState(() {
                                              iCurrentSelect = 'scan'.obs;
                                            });
                                          },
                                        )
                                      ])),
                                )
                              ]))
                          : Container()),
                      Container(
                          //alignment: Alignment.bottomRight,
                          //padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Fab(
                              icon: MdiIcons.plus,
                              onPressed: controller.onFabPlus,
                              color: BrandColors.primary.shade300))
                    ]))),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Stack(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(child: TabMianScan()),
/*              Align(
                  alignment: Alignment.centerRight,
                  child: Fab(
                      icon: MdiIcons.minus,
                      onPressed: controller.onFabPlus,
                      color: BrandColors.primary.shade300))*/
            ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
