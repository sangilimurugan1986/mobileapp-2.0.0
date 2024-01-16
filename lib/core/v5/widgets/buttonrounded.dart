import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../config/theme.dart';
import '../controllers/browse_view_controller.dart';
import '../controllers/taskcontroller.dart';

class ButtonRounded extends StatelessWidget {
  ButtonRounded(
      {Key? key,
      this.color = Colors.deepPurpleAccent,
      this.isRounded = true,
      required this.label,
      required this.onPressed,
      required this.isSelected})
      : super(key: key);

  final Color color;
  final bool isRounded;
  final bool isSelected;
  final String label;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all(color)
            : MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            // 1400 ,2400,500,800
            horizontal: 24,
            vertical: 10,
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
        textAlign: TextAlign.center,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
