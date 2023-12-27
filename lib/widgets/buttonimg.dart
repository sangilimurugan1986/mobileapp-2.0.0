import 'package:flutter/material.dart';

import '../config/theme.dart';

class ButtonImg extends StatelessWidget {
  String sAssetImgPath = '';
  String sUrlLink = '';

  ButtonImg({required this.sAssetImgPath, required this.sUrlLink});

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
            image: DecorationImage(
                image: AssetImage(sAssetImgPath), fit: BoxFit.fill),
          ),
        ),
        onTap: () {
          print(" clicked me");
        });
  }
}
