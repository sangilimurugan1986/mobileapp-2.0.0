import 'package:ez/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/tabindexcontroller.dart';
import '../models/MenuExpand.dart';
import 'SubCategory.dart';
import 'connectItemexpand.dart';
import 'dropdownbototm.dart';
import 'package:flutter/material.dart';

class TabScanIndex extends StatefulWidget {
  @override
  State<TabScanIndex> createState() => _TabScanIndexState();
}

class _TabScanIndexState extends State<TabScanIndex> {
  final controllers = Get.put(TabIndexController());
  List<MenuExpand> data = [];
  final GlobalKey expansionTileKey = GlobalKey();

  @override
  void initState() {
    dataList.forEach((element) {
      data.add(MenuExpand.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildList(data[index]),
      )),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: BrandColors.secondary.shade50,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                flex: 3,
                child: Obx(() => Text(
                      'Showing 1 to ' +
                          controllers.iCurrentSelect.toString() +
                          'out of ' +
                          controllers.iCurrentSelectSize.toString() +
                          ' entries',
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ))),
            //        SizedBox(width: 15),
            Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon:
                                Icon(MdiIcons.chevronLeft, color: Colors.grey),
                            onPressed: () {
                              //backfn();
                              setState(() {
                                controllers.ipageval > 1
                                    ? controllers.ipageval - 1
                                    : controllers.ipageval;
                              });
                            },
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  decoration: BoxDecoration(color: Colors.blue),
                                  child: Obx(() => Text(
                                      controllers.ipageval.string,
                                      style: TextStyle(color: Colors.white))))),
                          IconButton(
                            icon:
                                Icon(MdiIcons.chevronRight, color: Colors.grey),
                            onPressed: () {
                              //backfn();
                              setState(() {
                                controllers.ipageval.value =
                                    controllers.ipageval.value + 1;
                              });
                            },
                          )
                        ]))),
            // SizedBox(width: 15),
            Expanded(
                flex: 3,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Items Per \n Page',
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  DropDownBottom()
                ]))
          ]),
        ),
      )
    ]);
  }

  Widget _buildList(MenuExpand list) {
    if (list.subMenu.isEmpty) {
      debugPrint('pppppps ' + list.subMenu.length.toString());

      return Builder(builder: (context) {
        return ListTile(
          contentPadding: EdgeInsets.only(left: 30.0, right: 0.0),
          title: ConnectSingleItemExpand(
              color: Colors.blue,
              discriptions: list.name, //   discriptions: list.name + " f4 ",
              label: list.name,
              selected: 'false'),
        );
      });
    }
    return ExpansionTile(
      title: Text(
        list.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      onExpansionChanged: (val) => disval(
        val,
      ),
      children: list.subMenu.map(_buildList).toList(),
    );
  }

  disval(var sval) {
    debugPrint('ggggggggg1');
    debugPrint(sval.toString());
  }
}
