import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/taskcontroller.dart';
import '../utils/helper/safe_area.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'connectItemblue.dart';
import 'connectItempurple.dart';

class BatchWorkPurple extends StatefulWidget {
  final String sFolderName;
  final int iSelected; //hpgreenener

  const BatchWorkPurple({required this.sFolderName, required this.iSelected});

  @override
  _BatchWorkPurpleState createState() =>
      _BatchWorkPurpleState(sFolderName: sFolderName, iSelected: iSelected);
}

class _BatchWorkPurpleState extends State<BatchWorkPurple> {
  final controller = Get.put(TaskController());
  @override
  void initState() {
    super.initState();
    setState(() {
      controller.iSelected.value = 0;
    });
  }

  final String sFolderName;
  int iSelected;

  _BatchWorkPurpleState(
      {Key? key, required this.sFolderName, required this.iSelected});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    final safeArea = calcSafeArea();
    double safeAreaHeight = safeArea['height']!;
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        //margin: EdgeInsets.all(10),

        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //
            Container(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Text(sFolderName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
            GestureDetector(
                onTap: justDisplay('Clicked View All'),
                child: Container(
                    child: Row(children: [
                  Text('ViewAll', style: TextStyle(color: Colors.blue)),
                  Icon(
                    MdiIcons.arrowRight,
                    size: 20,
                    color: Colors.blue,
                  )
                ])))
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
              height: safeAreaHeight * .22,
              child: Container(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.all(5),
                  /*       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 214,
                      mainAxisExtent: 115,

                      mainAxisSpacing: 0),*/
                  children: [
                    CarouselSlider(
                      items: [
                        ConnectSingleItemPurple(
                            iIndexPosition: 0,
                            label: 'Finance',
                            discriptions:
                                'Team Colobration for account payable and receivable ',
                            color: Colors.yellow,
                            isSelected: controller.iSelected.value == 0),
                        ConnectSingleItemPurple(
                            iIndexPosition: 1,
                            label: 'Customer Boarding.', //1053 322
                            discriptions:
                                'On boarding workflow for retail and commercial',
                            color: Colors.orange,
                            isSelected: controller.iSelected.value == 1),
                        ConnectSingleItemPurple(
                            iIndexPosition: 2,
                            label: 'Operation',
                            discriptions: 'Discrition of the file 3\n',
                            color: Colors.red,
                            isSelected: controller.iSelected.value == 2),
                        ConnectSingleItemPurple(
                            iIndexPosition: 3,
                            label: 'Human Resource',
                            discriptions: 'Discrition of the file 4\n',
                            color: Colors.cyanAccent,
                            isSelected: controller.iSelected.value == 3),
                      ],
                      options: CarouselOptions(
                        height: safeAreaHeight * .22,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        //autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            /*        _currentIndex = index;
                            iSelected = index;*/
                            controller.iSelected.value = index;
                            debugPrint(
                                'Selected fff ' + _currentIndex.toString());
                          });
                        },
                      ),
                    )
                  ],
                ),
              ))
        ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
