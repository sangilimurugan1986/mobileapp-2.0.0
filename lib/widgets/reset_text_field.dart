import 'package:flutter/material.dart';

import '../config/theme.dart';

class ResetTextField extends StatelessWidget {
  const ResetTextField({
    Key? key,
    this.autoFocus = false,
    required this.label,
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    this.maxLines = 1,
    required this.textController,
  }) : super(key: key);

  final bool autoFocus;
  final String label;
  final bool isDisabled;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final void Function(String) onChanged;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      cursorColor: BrandColors.secondary,
      controller: textController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.normal,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        isCollapsed: true,
      ),
      enabled: !isDisabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxLines,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
