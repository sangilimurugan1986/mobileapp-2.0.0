import 'dart:convert';

import 'package:ez/core/CustomColors.dart';
import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import '../../../core/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../view_model/viewmodelfolderlist.dart';
import 'connectItemfolder.dart';

class FolderList extends StatefulWidget {
  const FolderList({Key? key}) : super(key: key);

  @override
  State<FolderList> createState() => _DashBoardBuilderState();
}

class _DashBoardBuilderState extends State<FolderList> {
  Widget child = Container();
  var isExpanded = false;
  String sInboxCount = '0';
  late var viewModelListFolder = null;
  dynamic folderlist = {};

  @override
  void initState() {
    print('Page Folder');
    SVProgressHUD.show(status: "");
    viewModelListFolder = Provider.of<FolderListViewModel>(context, listen: false);
    viewModelListFolder.fetchFolderData();
    //sInboxCount = viewModelListFolder.Folderdata;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<FolderListViewModel>(context);
    folderlist = viewmodel.Folderdata;

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
          child: Column(children: [
            Expanded(
                child: viewModelListFolder.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : viewModelListFolder.errorMessage.isNotEmpty
                        ? Center(
                            child: Text(viewModelListFolder.errorMessage),
                          )
                        : ListView.builder(
                            itemCount: folderlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              // TODO: Display the list items and load more when needed
                              return Column(children: [
                                Container(
                                    height: 200,
                                    color: Colors.grey.shade200,
                                    padding: EdgeInsets.all(5),
                                    child: ConnectSingleItemFolder(
                                      //tiiprod
                                      cMenu: folderlist[index],
                                      iPosition: index,
                                    ))
                              ]);
                            },
                          ))
          ])),
      drawer: MainDrawer(),
    );
  }
}
