import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/theme.dart';

import 'connectiteminner.dart';

class ConnectSingleItemWebService extends StatelessWidget {
  ConnectSingleItemWebService(
      {Key? key,
      required this.color,
      this.isSelected = true,
      required this.discriptions,
      required this.label,
      required this.iIndexPosition})
      : super(key: key);

  final Color color;
  final bool isSelected;
  final String label;
  final String discriptions;
  final int iIndexPosition;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color:
                isSelected ? BrandColors.primary : BrandColors.primary.shade200,
            //color: BrandColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.fromLTRB(1, 1, 5, 1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
/*            Expanded(
                flex: 1,
                child:
                    Container(padding: EdgeInsets.all(8), child: Container())),*/
            Expanded(
                flex: 8,
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 2, 5, 5),
                            child: Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        //               SizedBox(height: 10),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: Text(
                              discriptions + ' ' + discriptions,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),

                        /* Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                            child: Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: ConnectItemInner(
                                      label: '66',
                                      iIcondata: MdiIcons.sitemapOutline,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: ConnectItemInner(
                                      label: '23',
                                      iIcondata: MdiIcons.file,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: ConnectItemInner(
                                      label: '11',
                                      iIcondata: MdiIcons.folderAccount,
                                    ))
                              ],
                            )))*/
                      ],
                    ))),
/*            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container())),*/
          ],
        ));
  }
}
