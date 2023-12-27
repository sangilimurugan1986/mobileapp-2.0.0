import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/taskcontroller.dart';
import '../controllers/webmaincontroller.dart';
import '../utils/helper/safe_area.dart';
import 'ConnectItem.dart';
import '../config/theme.dart';
import 'connectItemwebservice.dart';

class BatchWorkWebService extends StatefulWidget {
  final String sFolderName;
  final int iSelected; //hpgreenener

  const BatchWorkWebService({required this.sFolderName, required this.iSelected});

  @override
  _BatchWorkWebServiceState createState() =>
      _BatchWorkWebServiceState(sFolderName: sFolderName, iSelected: iSelected);
}

class _BatchWorkWebServiceState extends State<BatchWorkWebService> {
  final controller = Get.put(WebMainController());
  final String sFolderName;
  int iSelected;

  _BatchWorkWebServiceState({Key? key, required this.sFolderName, required this.iSelected});
  @override
  void initState() {
    super.initState();
    setState(() {
      controller.iSelected.value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final safeArea = calcSafeArea();
    double safeAreaHeight = safeArea['height']!;
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          Container(
              height: safeAreaHeight * .22,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              // color: Colors.red,
              child: Container(
                color: Colors.white,
                child: CarouselSlider(
                  items: [
                    Container(
                        child: ConnectSingleItemWebService(
                            iIndexPosition: 0,
                            label: 'Finance',
                            discriptions: 'Team Colobration for account payable and receivable ',
                            color: Colors.blue,
                            isSelected: controller.iSelected.value == 0)),
                    Container(
                        child: ConnectSingleItemWebService(
                            iIndexPosition: 1,
                            label: 'Customer Boarding.', //1053 322
                            discriptions: 'On boarding workflow for retail and commercial',
                            color: Colors.orange,
                            isSelected: controller.iSelected.value == 1)),
                    Container(
                        child: ConnectSingleItemWebService(
                            iIndexPosition: 2,
                            label: 'Operation',
                            discriptions: 'Discrition of the file 3',
                            color: Colors.black54,
                            isSelected: controller.iSelected.value == 2)),
                    Container(
                        child: ConnectSingleItemWebService(
                            iIndexPosition: 3,
                            label: 'Human Resource',
                            discriptions: 'Discrition of the file 4',
                            color: Colors.cyanAccent,
                            isSelected: controller.iSelected.value == 3)),
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
                        //
                        /*        _currentIndex = index;
                            iSelected = index;*/
                        controller.iSelected.value = index;
                      });
                    },
                  ),
                ),
              ))
        ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
