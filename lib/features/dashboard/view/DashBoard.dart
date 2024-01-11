import 'dart:convert';

import 'package:ez/core/CustomColors.dart';

import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:ez/routes.dart';
import 'package:ez/widgets/button.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../controllers/session_controller.dart';
import '../../../controllers/treeboxlistviewcontroller.dart';
import '../../../core/CustomAppBar.dart';
import '../../../layouts/search/controller/searchlayout_controller.dart';
import '../../../models/MenuInbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../../widgets/inboxtext.dart';
import '../view_model/viewmodedashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashBoardBuilderState();
}

class _DashBoardBuilderState extends State<Dashboard> {
  Widget child = Container();
  var isExpanded = false;
  String sInboxCount = '0';

  @override
  void initState() {
    print('Page init Dashboard');
    SVProgressHUD.show(status: "");
    final viewModelListWorkflow = Provider.of<DashboardViewModel>(context, listen: false);
    viewModelListWorkflow.fetchCountData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<DashboardViewModel>(context);
    sInboxCount = viewmodel.data;

    return Scaffold(
      appBar: CustomAppBar(
        title: "",
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
                        : ListView(shrinkWrap: false, children: [
                            SizedBox(
                              height: 10,
                              width: 50,
                            ),
                            Container(
                                // width: double.infinity,
                                // color: Colors.yellow,
                                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                child: Center(
                                    child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: Colors.indigoAccent,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                      child: IntrinsicHeight(
                                          child: Row(
                                        children: [
                                          GestureDetector(
                                              // onTap: inboxfn,
                                              child: ImageMultitext(
                                                  title: 'My Task',
                                                  subtext: '0 New',
                                                  iIcon: Icon(
                                                    MdiIcons.cubeOutline, //cubeOutline
                                                    color: Colors.indigoAccent,
                                                  ))),
                                          VerticalDivider(
                                              color: Colors.white, thickness: 1, indent: 7),
                                          GestureDetector(
                                              onTap: () {
                                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                                  AppRoutes.push(context, AppRoutes.workflowlist);
                                                });
                                              },
                                              child: ImageMultitext(
                                                  title: 'My Inbox',
                                                  subtext: sInboxCount.toString() + ' Pending',
                                                  iIcon: Icon(
                                                    Icons.mail_outline_outlined,
                                                    color: Colors.indigoAccent,
                                                  )))
                                        ],
                                      )))
                                ])))
                          ])),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
