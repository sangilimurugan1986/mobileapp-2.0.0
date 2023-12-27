import 'package:ez/layouts/process/widgets/browse_view_bottom_bar.dart';
import 'package:ez/layouts/process/widgets/main_drawer.dart';
import 'package:ez/layouts/process/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../config/theme.dart';
import '../../widgets/inboxtext.dart';
import '../auth/widgets/fab.dart';
import 'package:get/get.dart';
import '../auth/widgets/safe_container.dart';
import 'controller/processlayout_controller.dart';
import 'package:flutter/services.dart';

class ProcessLayoutTab extends StatelessWidget {
  ProcessLayoutTab({
    Key? key,
    this.children = const <Widget>[],
  }) : super(key: key);
  final List<Widget> children;
  final controllers = Get.put(ProcesslayoutController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      //35 15 03
      drawer: MainDrawer(),
      body: SafeArea(
          child: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        decoration: BoxDecoration(color: Colors.white.withOpacity(.7)),
        child: SingleChildScrollView(
          //SingleChildScrollView
          child: Padding(
            //padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
            child: Column(
              //
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...children,
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: BrowseViewBottomBar(),
    );
  }
}
