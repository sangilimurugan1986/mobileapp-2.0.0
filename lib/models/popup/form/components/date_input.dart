import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez/models/popup/form/components/reset_text_field_date.dart';

import 'package:flutter/material.dart';
import '../../../../utils/format_date_time.dart';
//import 'base_input.dart';
import 'base_input_form.dart';
import 'clear_button.dart';
import 'reset_text_field.dart';

import '../../../../config/theme.dart';

class DateInput extends StatefulWidget {
  const DateInput({
    Key? key,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFEEEEEE),
    this.hasError = false,
    this.icon,
    this.initialValue = '',
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.onChanged,
    required this.placeholder,
  }) : super(key: key);

  final Color backgroundColor;
  final Color borderColor;
  final bool hasError;
  final IconData? icon;
  final String initialValue;
  final bool isDisabled;
  final TextInputType keyboardType;
  final String label;
  final String placeholder;
  final void Function(String) onChanged;

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  var modelValue = '';
  final textController = TextEditingController();

  @override
  void initState() {
    modelValue = widget.initialValue;
    textController.text = modelValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateInput oldWidget) {
    if (widget.initialValue == '') {
      textController.clear();
    }
    super.didUpdateWidget(oldWidget);
  }

  void onChanged(String value) {
    setState(() => modelValue = value);
    widget.onChanged(modelValue);
  }

  void onClear() {
    textController.clear();
    onChanged('');
  }

  Future _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      onChanged(formatDate(date));
      textController.text = modelValue;
    }
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

      // children

      sLable: widget.label,
      sOptional: true,
      children: [
        // text field

        Expanded(
          child: ResetTextFieldDate(
            //label: widget.label,
            isDisabled: widget.isDisabled,
            onChanged: onChanged,
            textController: textController,
            placeholder: widget.placeholder.length > 0
                ? widget.placeholder
                : 'YYYY-MM-DD',
          ),
        ),

        // show date picker btn

        GestureDetector(
          onTap: () => _showDatePicker(context),
          child: const Icon(
            EvaIcons.calendarOutline,
            color: Color(0xFF64748b), //64748b
          ),
        ),

        // clear btn
        if (modelValue != '' && !widget.isDisabled) ...[
          const SizedBox(width: 8),
          ClearButton(onClear),
        ],

        // ...
      ],
    );
  }
}
