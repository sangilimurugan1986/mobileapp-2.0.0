import 'package:ez/models/popup/form/components/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/textbold.dart';
import '../../../../widgets/textsmall.dart';
import '../controllers/panel_controller.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Panel extends StatefulWidget {
  final String sHeading;
  final String sDescription;
  final bool sVisible;
  const Panel(
      {required this.sHeading,
      required this.sDescription,
      required this.sVisible});
  PanelState createState() => PanelState();
}

class PanelState extends State<Panel> {
  // var textController = TextEditingController();
  final controller = Get.put(PanelController());

  @override
  void initState() {
    // textController.text = "${widget.defaultValue}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        //height: 40,
        //color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Textbold(sLabel: 'Test task'),
              widget.sHeading.length > 0
                  ? DefaultTextStyle(
                      style: TextStyle(decoration: TextDecoration.none),
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          widget
                              .sHeading, //  '${myBooks[index]["name"]}',  print(item['settings']['title']); datas
                          style: TextStyle(
                              //fontSize: 14,
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))
                  : Container(),
              widget.sDescription.length > 0
                  ? DefaultTextStyle(
                      style: TextStyle(decoration: TextDecoration.none),
                      child: Text(widget.sDescription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              //fontSize: 14,
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400)))
                  : Container(),
            ]));
  }
}
