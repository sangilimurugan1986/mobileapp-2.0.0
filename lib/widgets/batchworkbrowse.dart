import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ConnectItem.dart';
import '../config/theme.dart';
import 'connectItembrowse.dart';

class BatchWorkBrowse extends StatelessWidget {
  final String sFolderName;
  BatchWorkBrowse({
    Key? key,
    required this.sFolderName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dheight = mediaQuery.size.height * .7;
    // TODO: implement build
    return Container(
      height: dheight,
      padding: EdgeInsets.all(2),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: dheight,
            mainAxisExtent: 360,
            mainAxisSpacing: 0),
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 13),
              child: ConnectSingleItemBrowse(
                  label: 'Customer Boarding', //1053 322
                  discriptions:
                      'On boarding workflow for retail and commercial\n',
                  complete: '41',
                  inprogress: '89',
                  newprocess: '8',
                  color: Colors.orange)),
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ConnectSingleItemBrowse(
                  label: 'Finance',
                  discriptions:
                      'Team Colobration for account payable and receivable ',
                  complete: '10',
                  inprogress: '12',
                  newprocess: '62',
                  color: Colors.yellow)),
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ConnectSingleItemBrowse(
                  label: 'Customer Boarding', //1053 322
                  discriptions:
                      'On boarding workflow for retail and commercial\n',
                  complete: '41',
                  inprogress: '89',
                  newprocess: '8',
                  color: Colors.orange)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  justDisplay(String sString) {
    debugPrint(sString);
  }
}
