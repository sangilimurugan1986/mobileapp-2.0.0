import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/helper/safe_area.dart';
import 'ConnectItem.dart';
import '../config/theme.dart';

class BatchWorkWeb extends StatelessWidget {
  final String sFolderName;
  BatchWorkWeb({
    Key? key,
    required this.sFolderName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final safeArea = calcSafeArea();
    double safeAreaHeight = safeArea['height']!;
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
          SizedBox(
            height: 10,
          ),
          Container(
              height: safeAreaHeight * .22,
              child: Container(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CarouselSlider(
                      items: [
                        ConnectSingleItem(
                            label: 'Finance',
                            discriptions:
                                'Team Colobration for account payable and receivable ',
                            color: Colors.yellow),
                        ConnectSingleItem(
                            label: 'Customer Boarding.', //1053 322
                            discriptions:
                                'On boarding workflow for retail and commercial',
                            color: Colors.orange),
                        ConnectSingleItem(
                            label: 'Operation',
                            discriptions: 'Discrition of the file 3\n',
                            color: Colors.lightBlueAccent),
                        ConnectSingleItem(
                            label: 'Human Resource',
                            discriptions: 'Discrition of the file 4\n',
                            color: Colors.cyanAccent),
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
