import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 13,
        ),
      ),
    );
  }
}
