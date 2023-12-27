import 'package:ez/layouts/search/widgets/text_input_searchable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controllers/topbar_controller.dart';
import '../../widgets/text_input_searchable.dart';
import '../auth/widgets/safe_container.dart';
import '../search/widgets/browse_view_bottom_bar.dart';
import '../search/widgets/main_drawer.dart';
import '../search/widgets/topbar.dart';
import 'controller/searchlayout_controller.dart';

class SearchLayout extends StatelessWidget {
  var tabbarController = TopBarController();
  SearchLayout(
      {Key? key,
      this.children = const <Widget>[],
      this.wpersistentFooterButtons = const <Widget>[]})
      : super(key: key);
  final List<Widget> children;
  final controllers = Get.put(SearchlayoutController());
  String image = '';
  String title = 'ABC';
  bool innerBoxIsScrolled = true;
  final List<Widget> wpersistentFooterButtons;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .09;

    return Scaffold(
      backgroundColor: Colors.white,
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
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.black12,
                        //backgroundColor: Colors.grey.withOpacity(.9),
                        pinned: true,
                        /*         floating: true,
                stretch: true,*/
                        expandedHeight: dheight,
                        flexibleSpace: !innerBoxIsScrolled
                            ? TopBarDesign(
                                height: double.infinity,
                              )
                            : Container(
                                margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
                                child: TextInputSearchableSearch(
                                    title: "",
                                    type: TextInputType.text,
                                    onChange:
                                        tabbarController.onSearchTextChanged,
                                    placeholder: "Search"),
                                // Expanded(...)
                                /*Container(
                          height: double.infinity,
                          width: 20,
                          color: Colors.black.withOpacity(0.5),
                          */ /* child: TextInputSearchableSearch(
                                  title: "",
                                  type: TextInputType.text,
                                  onChange:
                                      tabbarController.onSearchTextChanged,
                                  placeholder: "Search")*/ /*
                        )*/
                              ),
                      ),
                    ),
                  ];
                },
                body: Builder(builder: (BuildContext context) {
                  return Container(
                      height: double.infinity,
                      //SingleChildScrollView
                      margin:
                          EdgeInsets.only(top: mediaQuery.size.height * .071),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...children,
                        ],
                      ));

                  /* SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 20, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  childCount: 20,
                ),
              )*/
                }),
              ))),
      /*     floatingActionButton: Obx(() => Visibility(
          visible: controllers.bFabVisible.value,
          child: FloatingActionButton(
            onPressed: () {
              print('fab ');
            },
            child: Icon(Icons.add),
          ))),*/
    );
  }

  justcal() {
    debugPrint('justcal');
  }
}
