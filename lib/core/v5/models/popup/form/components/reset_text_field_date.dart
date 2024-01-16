import 'package:flutter/material.dart';

import '../../../../config/theme.dart';
import 'Labels.dart';

class ResetTextFieldDate extends StatelessWidget {
  const ResetTextFieldDate({
    Key? key,
    this.autoFocus = false,
    required this.placeholder,
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    this.maxLines = 1,
    required this.textController,
  }) : super(key: key);

  final bool autoFocus;
  final String placeholder;

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
        hintText: placeholder,
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
        fontFamily: 'Outfit',
        color: Color(0xFF1e293b),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
