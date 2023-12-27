import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ConnectItem.dart';
import '../config/theme.dart';

class BatchWorkAll extends StatelessWidget {
  final String sFolderName;
  BatchWorkAll({
    Key? key,
    required this.sFolderName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(sFolderName),
            GestureDetector(
                onTap: justDisplay('Back Pressed'),
                child: Container(
                    child: Row(children: [
                  Text('Back', style: TextStyle(color: Colors.blue)),
                  Icon(
                    MdiIcons.arrowLeft,
                    size: 20,
                    color: Colors.blue,
                  )
                ])))
          ]),
          Container(
              height: 340,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              color: Colors.white,
              child: Container(
                child: GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 211,
                      mainAxisExtent: 140,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 0),
                  children: <Widget>[
                    Container(
                        child: ConnectSingleItem(
                            label: 'Finance',
                            discriptions:
                                'Team Colobration for account payable and receivable ',
                            color: Colors.blue)),
                    Container(
                        child: ConnectSingleItem(
                            label: 'Customer Boarding', //1053 322
                            discriptions:
                                'On boarding workflow for retail and commercial',
                            color: Colors.orange)),
                    Container(
                        child: ConnectSingleItem(
                            label: 'Operation',
                            discriptions: 'Discrition of the file 3',
                            color: Colors.black54)),
                    Container(
                        child: ConnectSingleItem(
                            label: 'Human Resource',
                            discriptions: 'Discrition of the file 4',
                            color: Colors.cyanAccent)),
                  ],
/*          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
*/ /*            ConnectSingleItem(
                label: 'Files', color: Colors.blue, isRounded: true),
            ConnectSingleItem(
                label: 'Files', color: Colors.blue, isRounded: true),
            ConnectSingleItem(
                label: 'Files', color: Colors.blue, isRounded: true),
            ConnectSingleItem(
                label: 'Files', color: Colors.blue, isRounded: true)*/ /*
              ])*/
                ),
              ))
        ]));
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
