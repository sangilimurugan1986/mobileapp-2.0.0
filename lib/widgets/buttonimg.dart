import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../config/theme.dart';

class ButtonImg extends StatelessWidget {
  String sAssetImgPath = '';
  String sUrlLink = '';
  final Callback? onTap;

  ButtonImg({required this.sAssetImgPath, required this.sUrlLink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          //padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          margin: EdgeInsets.all(1),
          width: 120,
          height: 37,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: AssetImage(sAssetImgPath), fit: BoxFit.fill),
          ),
        ),
        onTap: onTap
        /*onTap: () {
          print(" clicked me");
        }*/
        );
  }
}
