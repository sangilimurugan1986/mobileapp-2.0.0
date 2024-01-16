import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/helper/safe_area.dart';
import 'ConnectItem.dart';
import '../config/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BatchWork extends StatefulWidget {
  final String sFolderName;

  const BatchWork({required this.sFolderName});

  @override
  _BatchWorkState createState() => _BatchWorkState(sFolderName: sFolderName);
}

class _BatchWorkState extends State<BatchWork> {
  @override
  void initState() {
    super.initState();
  }

  final String sFolderName;

  _BatchWorkState({
    Key? key,
    required this.sFolderName,
  });

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
                        onPageChanged: (index, reason) {
                          _currentIndex = index;
                          setState(() {
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
