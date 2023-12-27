import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton(this.onTap, {Key? key}) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 24,
          maxWidth: 24,
          minHeight: 46,
        ),
        child: Icon(
          Icons.close,
          color: Colors.grey.shade400,
          size: 20,
        ),
      ),
    );
  }
}
