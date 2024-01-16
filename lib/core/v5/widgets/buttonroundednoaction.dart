import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../config/theme.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/taskcontroller.dart';

class ButtonRoundedNoAction extends StatelessWidget {
  ButtonRoundedNoAction({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),
      ),
    );
  }
}
