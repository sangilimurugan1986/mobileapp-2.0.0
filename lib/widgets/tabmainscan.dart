import 'package:ez/widgets/tabscanindex.dart';
import 'package:ez/widgets/tabscanupload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../layouts/auth/widgets/fab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/helper/safe_area.dart';

class TabMianScan extends StatefulWidget {
  @override
  TabMianScanState createState() => TabMianScanState();
}

class TabMianScanState extends State<TabMianScan>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  double safeAreaHeight = 0;

  @override
  Widget build(BuildContext context) {
    final safeArea = calcSafeArea();
    safeAreaHeight = safeArea['height']!;
    TabController _controller = new TabController(length: 2, vsync: this);
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: TabBar(
            labelColor: Colors.purple, //<-- selected text color
            unselectedLabelColor: Colors.blueGrey,
            isScrollable: true,
            controller: _controller,
            indicatorColor: Colors.purple,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              new Tab(
                text: 'Upload',
              ),
              new Tab(
                text: 'Index',
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          color: Colors.white,
          height: safeAreaHeight == 716 ? 300 : 351, //351
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              TabScanUpload(),
              TabScanIndex(),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Fab(
                icon: MdiIcons.plus,
                onPressed: () {},
                color: BrandColors.primary.shade300))
      ],
    );
  }
}
