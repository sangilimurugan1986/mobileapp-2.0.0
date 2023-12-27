import 'package:flutter/material.dart';

import '../config/theme.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon(
      {Key? key,
      this.color = Colors.white,
      this.isRounded = false,
      this.isFullWidth = false,
      this.isLoading = false,
      required this.labelval,
      required this.onPressed,
      required this.iIcon})
      : super(key: key);

  final Color color;
  final bool isRounded;
  final bool isFullWidth;
  final bool isLoading;
  final String labelval;
  final Icon iIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: ElevatedButton.icon(
      icon: iIcon,
      onPressed: onPressed,
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
