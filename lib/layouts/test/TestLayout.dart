import 'package:ez/layouts/test/widgets/text_input_searchable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controllers/topbar_controller.dart';

import '../test/widgets/browse_view_bottom_bar.dart';
import '../test/widgets/main_drawer.dart';
import '../test/widgets/topbar.dart';
import 'controller/searchlayout_controller.dart';

class TestLayout extends StatefulWidget {
  final List<Widget> children;
  final List<Widget> wpersistentFooterButtons;
  //final String sFolderName;

  const TestLayout({required this.wpersistentFooterButtons, required this.children});

  @override
  _TestLayoutState createState() => _TestLayoutState(
      children: this.children, wpersistentFooterButtons: this.wpersistentFooterButtons);
}

class _TestLayoutState extends State<TestLayout> {
  final List<Widget> children;
  final List<Widget> wpersistentFooterButtons;

  @override
  void initState() {
    super.initState();
  }

  _TestLayoutState({Key? key, required this.children, required this.wpersistentFooterButtons});

  var tabbarController = TopBarController();

  final controller = Get.put(TestlayoutController());
  String image = '';
  String title = 'sdsds';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .09;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BrowseViewBottomBar(),
        drawer: MainDrawer(),
        persistentFooterButtons: [
/*        Container(
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.all(0), //<-- this
          color: Colors.black12,
          child: OverflowBar(
            //overflowSpacing: 0,
            //spacing: 1,
            overflowAlignment: OverflowBarAlignment.end,
            children: [...wpersistentFooterButtons],
          ),
        ),*/
          Container(
              color: Colors.black12,
              child: Column(
                children: [...wpersistentFooterButtons],
              ))
        ],
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        sliver: SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.black12,
                          //backgroundColor: Colors.grey.withOpacity(.9),
                          pinned: true,
                          /*         floating: true,
                stretch: true,*/
                          expandedHeight: dheight,
                          flexibleSpace: !controller.innerBoxIsScrolled.value
                              ? TopBarDesign(
                                  //height: double.infinity,
                                  )
                              : Container(
                                  color: Colors.blueGrey,
                                  margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
                                  child: TextInputSearchableSearch(
                                      title: "",
                                      type: TextInputType.text,
                                      onChange: tabbarController.onSearchTextChanged,
                                      placeholder: "Search"),
                                ),
                        ),
                      ),
                    ];
                  },
                  body: Builder(builder: (BuildContext context) {
                    return Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(top: mediaQuery.size.height * .071),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...children,
                          ],
                        ));
                  }),
                ))));
  }
}
