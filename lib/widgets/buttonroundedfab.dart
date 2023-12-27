import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../config/theme.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/taskcontroller.dart';

class ButtonRoundedFab extends StatelessWidget {
  ButtonRoundedFab({
    Key? key,
    this.color = Colors.deepPurpleAccent,
    this.isRounded = true,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final bool isRounded;
  final String label;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isRounded ? 48 : 1),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
      ),
    );
  }
}
