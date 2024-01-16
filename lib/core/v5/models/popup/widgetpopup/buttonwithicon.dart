import 'package:flutter/material.dart';

class ButtonWithIconRound extends StatelessWidget {
  const ButtonWithIconRound(
      {Key? key,
      this.color = Colors.white,
      this.isRounded = false,
      this.isFullWidth = false,
      required this.labelval,
      required this.iIcon})
      : super(key: key);

  final Color color;
  final bool isRounded;
  final bool isFullWidth;

  final String labelval;
  final Icon iIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: ElevatedButton.icon(
      icon: iIcon,
      onPressed: null,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white),
      label: Text(
        labelval,
        style: const TextStyle(
            color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ));
  }
}
