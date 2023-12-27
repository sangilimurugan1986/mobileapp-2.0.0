import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/dashmaincontroller.dart';
import '../controllers/session_controller.dart';
import '../controllers/treeboxlistviewcontroller.dart';
import '../layouts/search/controller/searchlayout_controller.dart';
import '../models/MenuInbox.dart';
import 'CustomWidget.dart';
import 'listviewsearchable.dart';

class TreeInboxListview extends StatefulWidget {
  @override
  State<TreeInboxListview> createState() => _TreeInboxListviewState();
}

class _TreeInboxListviewState extends State<TreeInboxListview> {
  var isExpanded = false;
  final controller = Get.put(TreeInboxListviewController());
  final controllersearch = Get.put(SearchlayoutController());
  final dbcontroller = Get.put(DashMainController());
  final sessionCtrl = Get.put(SessionController());

  final isLoading = true.obs;
  //late MenuInbox miList;

  @override
  void initState() {
    controller.getWorkFlowList().then((value) => {
          setState(() {
            dbcontroller.iCurrentSelect = 'treeinbox'.obs;
            controller.data = value;
            isLoading.value = false;
          })
        });
    sessionCtrl.getSession();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      // aprox
      //listview   dbcontroller.iCurrentSelect
/*          if(true)
            { Obx(() => isLoading.value
                ? ListView.builder(
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ListTile(
                      // leading: CustomWidget.circular(height: 64, width: 64),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomWidget.rectangular(
                          height: 14,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                      //subtitle: CustomWidget.rectangular(height: 14),
                    ));
              },
            ) */ /*Center(child: Container(child: Text('Loading...')))*/ /*
                : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  _buildList(controller.data[index]),
              //separatorBuilder: (BuildContext context, int index) => Divider(),
            ));}
      else*/
      if (controller.iCurrentSelect.contains('_') &&
          !controller.iCurrentSelect.contains('_2') &&
          dbcontroller.iCurrentSelect != 'treeinbox') //-2
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListViewSearch(
              miSelectedData: controller.miList,
              sType: controller.iCurrentSelect.toString().split('_')[1],
              sWorkflowId: controller.iCurrentSelect.toString().split('_')[0],
            ))
      else if (controller.iCurrentSelect.contains('_') && controller.iCurrentSelect.contains('_2'))
        Container()
      else
        Obx(() => isLoading.value
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ListTile(
                        // leading: CustomWidget.circular(height: 64, width: 64),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomWidget.rectangular(
                            height: 14,
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                        ),
                        //subtitle: CustomWidget.rectangular(height: 14),
                      ));
                },
              ) /*Center(child: Container(child: Text('Loading...')))*/
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildList(controller.data[index]),
                //separatorBuilder: (BuildContext context, int index) => Divider(),
              ))
    ]));
  }

  Widget _buildList(MenuInbox list) {
    if (list.subMenu.isEmpty)
      return Builder(builder: (context) {
        return Container(
            // mobile
            color: Colors.purple,
            margin: EdgeInsets.only(top: 1.0, bottom: 1.0),
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 5),
                child: ListTileTheme(
                    contentPadding: const EdgeInsets.all(15),
                    tileColor: Colors.white,
                    style: ListTileStyle.list,
                    dense: true,
                    child: ListTile(
                      onTap: () {
                        if (!list.name.contains('(0)')) {
                          setState(() {
                            dbcontroller.iCurrentSelect = 'listview'.obs;

                            sessionCtrl.getSession();
                            controller.miList = list;

                            sessionCtrl.userid.value.toString();
                            controllersearch.bFabVisible = true.obs;

                            controller.iCurrentSelect = list.id.toString().obs;
                          });
                        }
                      },
                      contentPadding: EdgeInsets.only(left: 20.0, right: 0.0),
                      title: Row(
                        children: [
                          list.name.contains('(0)')
                              ? Text(list.name, style: TextStyle(color: Colors.blue))
                              : Text(list.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                    ))));
      });

    return Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(0),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          childrenPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Container(
            color: Colors.purple,
            width: 4,
            height: double.infinity,
          ),
          title: Transform(
              transform: Matrix4.translationValues(-30, 0.0, 0.0),
              child: Text(
                list.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
              )),
          onExpansionChanged: (bool expanded) {
            setState(() => {isExpanded = expanded});
          },
          children: list.subMenu.map(_buildList).toList(),
        ));
    return Container();
  }
}
