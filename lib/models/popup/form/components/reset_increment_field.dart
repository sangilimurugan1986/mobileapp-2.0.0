import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../../../config/theme.dart';
import 'Labels.dart';

class ResetIncrementField extends StatelessWidget {
  const ResetIncrementField({
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
    return NumberInputWithIncrementDecrement(
      controller: textController,
      textAlign: TextAlign.left,
      numberFieldDecoration: InputDecoration(
        border: InputBorder.none,
      ),
      incDecBgColor: Colors.white,
      decIconColor: Color(0xFF64748b),
      incIconColor: Color(0xFF64748b),
      incIcon: Icons.keyboard_arrow_up_rounded,
      decIcon: Icons.keyboard_arrow_down_rounded,
      separateIcons: true,
      style: TextStyle(
        fontFamily: 'Outfit',
        color: Color(0xFF1e293b),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      widgetContainerDecoration: BoxDecoration(),
      enabled: true,
    );
    /*return TextField(
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
    );*/
  }
}
