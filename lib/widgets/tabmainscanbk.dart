import 'package:ez/widgets/tabscanindex.dart';
import 'package:ez/widgets/tabscanupload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabMianScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TabScanUpload(),
              TabScanIndex(),
            ],
          ),
        ),
      ),
    );
  }
}
