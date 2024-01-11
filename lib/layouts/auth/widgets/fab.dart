import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    required this.icon,
    required this.onPressed,
    //this.color = BrandColors.primary,
    required this.color,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: color,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
