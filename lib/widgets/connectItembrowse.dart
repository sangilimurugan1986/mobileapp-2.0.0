import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/theme.dart';

import 'connectiteminner.dart';

class ConnectSingleItemBrowse extends StatelessWidget {
  ConnectSingleItemBrowse(
      {Key? key,
      required this.color,
      this.isRounded = true,
      required this.discriptions,
      required this.label,
      required this.newprocess,
      required this.inprogress,
      required this.complete})
      : super(key: key);

  final Color color;
  final bool isRounded;
  final String label;
  final String discriptions;
  final String newprocess;
  final String inprogress;
  final String complete;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.fromLTRB(1, 1, 5, 1),
        child: Column(children: [
          Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.folder,
                      color: color,
                      size: 28,
                    ))),
            Expanded(
                flex: 6,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: Text(
                              label,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 18),
                            )),
                        //               SizedBox(height: 10),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                            child: Text(
                              discriptions,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            )),
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(
                      MdiIcons.dotsHorizontal,
                      size: 18,
                    ))),
          ]),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(children: [
                  Text(
                    newprocess,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'New',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  )
                ]),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                child: Row(children: [
                  Text(
                    inprogress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'In Progress',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  )
                ]),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                child: Row(children: [
                  Text(
                    complete,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Completed',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  )
                ]),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              decoration: BoxDecoration(
                  color: BrandColors.secondary.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '1' + newprocess,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Invoice to be Paid',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      newprocess,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Invoice to be paid',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      newprocess,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Invoice to be paid',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    )
                  ])
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(children: [
                  Text(
                    newprocess,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Workflow/s',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                child: Row(children: [
                  Text(inprogress + '1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Form/s',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                child: Row(children: [
                  Text(complete + '0',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'File System/s',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  )
                ]),
              )
            ],
          ),
          Container(
            child: Row(children: [
              SizedBox(
                width: 15,
              ),
              Text(complete + '0',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Portals Connected',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              )
            ]),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Divider(
                height: 10,
                thickness: 2,
              )),
          Container(
            child: Row(children: [
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 15, //radius is 50
                backgroundImage:
                    AssetImage('assets/images/background/a4.png'), //image url
              ),
              CircleAvatar(
                radius: 15, //radius is 50
                backgroundImage:
                    AssetImage('assets/images/background/a2.png'), //image url
              ),
              CircleAvatar(
                radius: 15, //radius is 50
                backgroundImage: AssetImage(
                    'assets/images/background/useravaathar.png'), //image url
              ),
              CircleAvatar(
                radius: 15, //radius is 50
                backgroundImage:
                    AssetImage('assets/images/background/a3.png'), //image url
              )
            ]),
          )
        ]));
  }
}
