import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme.dart';
import 'Labels.dart';

class ResetTextField extends StatelessWidget {
  const ResetTextField({
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
      //https://stackoverflow.com/questions/70830888/how-to-restrict-flutter-textfield-or-textformfield-to-accept-only-english-langua
      inputFormatters: [sFormats('')], // for resctric input character
      autofocus: autoFocus,
      cursorColor: BrandColors.secondary,
      controller: textController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.normal, //43 12 55 26
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

  FilteringTextInputFormatter sFormats(String ipFormat) {
    //FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'));

    return FilteringTextInputFormatter.deny('');
  }
}
