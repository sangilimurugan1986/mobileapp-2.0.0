import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConnectItemInnerBlue extends StatelessWidget {
  ConnectItemInnerBlue({
    Key? key,
    required this.iIcondata,
    required this.label,
  }) : super(key: key);

  final String label;
  final IconData iIcondata;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 32,
            width: 32,
            padding: EdgeInsets.all(0),
            child: RawMaterialButton(
                constraints: BoxConstraints(
                    minWidth: 20.0,
                    minHeight: 20.0,
                    maxWidth: 20,
                    maxHeight: 20),
                padding: EdgeInsets.all(0),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.blue,
                onPressed: () {},
                child: Icon(
                  iIcondata,
                  size: 18,
                  color: Colors.white,
                ))),
        Container(
            margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ))
      ],
    ));
  }
}
