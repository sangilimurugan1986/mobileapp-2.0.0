import 'package:ez/models/popup/form/components/reset_increment_field.dart';
import 'package:flutter/material.dart';

import 'base_input_form.dart';
import 'clear_button.dart';

class NumberInput extends StatefulWidget {
  const NumberInput({
    Key? key,
    this.autoFocus = false,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFEEEEEE),
    this.hasError = false,
    this.icon,
    this.initialValue = '',
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.label,
    required this.placeholder,
    required this.bOptional,
    required this.onChanged,
  }) : super(key: key);

  final bool autoFocus;
  final Color backgroundColor;
  final Color borderColor;
  final bool hasError;
  final IconData? icon;
  final String initialValue;
  final bool isDisabled;
  final TextInputType keyboardType;
  final String label;
  final String placeholder;
  final bool bOptional;

  final int maxLines;
  final void Function(String) onChanged;

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  var modelValue = '';
  final textController = TextEditingController();

  @override
  void initState() {
    modelValue = widget.initialValue;
    textController.text = modelValue;
    super.initState();
  }

  void onChanged(String value) {
    setState(() => modelValue = value);
    widget.onChanged(modelValue);
  }

  void onClear() {
    textController.clear();
    onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return BaseInputForm(
      // background color

      backgroundColor: widget.backgroundColor,

      // border color

      borderColor: widget.borderColor,

      // has error

      hasError: widget.hasError,

      // icon

      icon: widget.icon,

      //labele
      sLable: widget.label,
      sOptional: widget.bOptional,

      // children

      children: [
        // text field
        Expanded(
          child: Column(children: [
            ResetIncrementField(
              placeholder: widget.placeholder,
              isDisabled: widget.isDisabled,
              keyboardType: widget.keyboardType,
              onChanged: onChanged,
              maxLines: widget.maxLines,
              textController: textController,
            )
          ]),
        ),

        // clear btn

        if (modelValue != '' && !widget.isDisabled) ClearButton(onClear),

        // ...
      ],
    );
  }
}
