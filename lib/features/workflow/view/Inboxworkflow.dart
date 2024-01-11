import 'dart:convert';

import 'package:ez/core/CustomColors.dart';

import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:ez/routes.dart';
import 'package:ez/widgets/button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../controllers/session_controller.dart';
import '../../../controllers/treeboxlistviewcontroller.dart';
import '../../../core/CustomAppBar.dart';
import '../../../layouts/search/controller/searchlayout_controller.dart';
import '../../../models/MenuInbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../view_model/viewmodeworkflowlist.dart';

class InboxWorkflow extends StatefulWidget {
  const InboxWorkflow({Key? key}) : super(key: key);

  @override
  State<InboxWorkflow> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<InboxWorkflow> {
  //dynamic datas = [];
  List<MenuInbox> datas = [];
  //final controller = Get.put(PanelController());
  final controller = Get.put(TreeInboxListviewController());
  final controllersearch = Get.put(SearchlayoutController());
  final sessionCtrl = Get.put(SessionController());
  Widget child = Container();
  var isExpanded = false;

  @override
  void initState() {
    print('Page Inbox');
    SVProgressHUD.show(status: "");
    final viewModelListWorkflow = Provider.of<WorkflowListViewModel>(context, listen: false);
    viewModelListWorkflow.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<WorkflowListViewModel>(context);
    datas = viewmodel.data;

    return Scaffold(
      appBar: CustomAppBar(
        title: AppRoutes.workflowlist,
        actions: [
          AppBarAction(icon: Icon(Icons.search), onPressed: () => {}),
          AppBarAction(icon: Icon(Icons.person_sharp), onPressed: () => {})
        ],
        backgroundColor: CustomColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: viewmodel.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : viewmodel.errorMessage.isNotEmpty
                      ? Center(
                          child: Text(viewmodel.errorMessage),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: datas.length,
                          itemBuilder: (BuildContext context, int index) =>
                              _buildList(datas[index]),
                          //separatorBuilder: (BuildContext context, int index) => Divider(),
                        ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }

  Widget _buildList(MenuInbox list) {
    if (list.subMenu.isEmpty)
      return Builder(builder: (context) {
        return Container(
            // mobile
            color: Colors.blue,
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
                        if (!list.name.contains('(0)') || list.name.contains('Inbox')) {
                          setState(() {
                            sessionCtrl.getSession();
                            controller.miList = list;
                            controllersearch.bFabVisible = true.obs;
                            controller.iCurrentSelect = list.id.toString().obs;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              AppRoutes.push(context, AppRoutes.workflowdetail);
                            });
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
  }
}
