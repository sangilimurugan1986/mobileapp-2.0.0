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

class ProcessLayout extends StatelessWidget {
  ProcessLayout({
    Key? key,
    this.children = const <Widget>[],
  }) : super(key: key);
  final List<Widget> children;
  final controllers = Get.put(ProcesslayoutController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopBarDesign(
        height: 150,
        child: Text('TopBars'),
      ),
      drawer: MainDrawer(),
      body: SafeContainer(
          child: Container(
        width: mediaQuery.size.width,
        height: (mediaQuery.size.height),
        decoration: BoxDecoration(
          //color: BrandColors.secondary.shade50,
          color: Colors.white,
        ),
        child: Container(
          //SingleChildScrollView
          child: Padding(
            //padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...children,
              ],
            ),
          ),
        ),
      )),
/*        bottomNavigationBar: Obx(
          () => BrowseViewBottomBar(),*/
      bottomNavigationBar: BrowseViewBottomBar(),
      floatingActionButton: Wrap(
          //will break to another line on overflow
          direction: Axis.horizontal, //use vertical to show  on vertical axis
          children: <Widget>[
/*            Container(
                margin: EdgeInsets.all(10),
                child: Fab(
                    icon: MdiIcons.comment,
                    onPressed: controllers.fabProcess,
                    color: BrandColors.secondary))*/
          ]),
    );
  }
}
