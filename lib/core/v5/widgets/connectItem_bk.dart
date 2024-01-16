import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/theme.dart';

import 'connectiteminner.dart';

class ConnectSingleItem extends StatelessWidget {
  ConnectSingleItem({
    Key? key,
    required this.color,
    this.isRounded = true,
    required this.discriptions,
    required this.label,
  }) : super(key: key);

  final Color color;
  final bool isRounded;
  final String label;
  final String discriptions;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: BrandColors.gray.shade50,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.folder,
                      color: color,
                      size: 12,
                    ))),
            Expanded(
                flex: 80,
                child: Container(
                    // color: Colors.purple,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                                  color: Colors.black54,
                                  fontSize: 14),
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: Text(
                              discriptions,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            )),
                        SizedBox(height: 5),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                )))
                      ],
                    ))),
            Expanded(
                flex: 10,
                child: Container(
                    //s     color: Colors.red,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Icon(
                      MdiIcons.dotsHorizontal,
                      size: 12,
                    ))),
          ],
        ));
  }
}
