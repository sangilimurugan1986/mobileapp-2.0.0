import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez/models/popup/form/components/reset_text_field_date.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import '../../../../utils/format_date_time.dart';
//import 'base_input.dart';
import 'base_input_form.dart';
import 'clear_button.dart';
import 'reset_text_field.dart';

import '../../../../config/theme.dart';
import 'package:intl/intl.dart';

class DateTimeInput extends StatefulWidget {
  const DateTimeInput({
    Key? key,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFEEEEEE),
    this.hasError = false,
    this.icon,
    this.initialValue = '',
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.onChangedDate,
    required this.onChangedTime,
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
  final void Function(String) onChangedDate;
  final void Function(String) onChangedTime;

  @override
  _DateTimeInputState createState() => _DateTimeInputState();
}

class _DateTimeInputState extends State<DateTimeInput> {
  var modelValueDate = '';
  var modelValueTime = '';
  final textControllerDate = TextEditingController();
  final textControllerTime = TextEditingController();

  @override
  void initState() {
    modelValueDate = widget.initialValue;
    modelValueTime = widget.initialValue;
    textControllerDate.text = modelValueDate;
    textControllerTime.text = modelValueTime;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateTimeInput oldWidget) {
    if (widget.initialValue == '') {
      textControllerDate.clear();
      textControllerTime.clear();
    }
    super.didUpdateWidget(oldWidget);
  }
  //dateandtime_

  void onChangedDate(String value) {
    setState(() => modelValueDate = value);
    widget.onChangedDate(modelValueDate);
  }

  void onClearDate() {
    textControllerDate.clear();
    onChangedDate('');
  }

  void onChangedTime(String value) {
    setState(() => modelValueTime = value);
    widget.onChangedTime(modelValueTime);
  }

  void onClearTime() {
    textControllerTime.clear();
    onChangedTime('');
  }

  String formatPickerDateToString(String inputDate) {
    DateTime tempDate = new DateFormat("dd MMM yyyy").parse(inputDate);
    String formattedDate = DateFormat('yyyy-MM-dd').format(tempDate);
    return formattedDate;
  }

  TimeOfDay time12to24Format(String time) {
    String dateTimeSplit =
        (time.split(",").length > 1) ? time.split(",")[1] : time;
    int h = int.parse(dateTimeSplit.split(":").first);
    int m = int.parse(dateTimeSplit.split(":").last.split(" ").first);
    String meridium =
        dateTimeSplit.split(":").last.split(" ").last.toLowerCase();
    if (meridium == "pm") {
      if (h != 12) {
        h = h + 12;
      }
    }
    if (meridium == "am") {
      if (h == 12) {
        h = 00;
      }
    }

    return TimeOfDay(hour: h, minute: m);
  }

  Future _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: (modelValueDate == '')
          ? DateTime.now()
          : DateTime.parse(formatPickerDateToString(modelValueDate)),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      onChangedDate(formatDate(date));
      textControllerDate.text = modelValueDate;
    }
  }

  Future _showTimePicker(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: (modelValueTime == '')
          ? TimeOfDay.now()
          : time12to24Format(modelValueTime),
    );

    if (time != null) {
      onChangedTime(formatTime(time));
      textControllerTime.text = modelValueTime;
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
            onChanged: onChangedDate,
            textController: textControllerDate,
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
        ), //63  56
        if (modelValueDate != '' && !widget.isDisabled) ...[
          const SizedBox(width: 8),
          ClearButton(onClearDate),
        ],
        SizedBox(
          width: 20,
        ), // text field
        Expanded(
          child: ResetTextFieldDate(
            //label: widget.label,
            isDisabled: widget.isDisabled,
            onChanged: onChangedTime,
            textController: textControllerTime,
            placeholder:
                widget.placeholder.length > 0 ? widget.placeholder : 'HH:MM',
          ),
        ),
        // show date picker btn
        GestureDetector(
          onTap: () => _showTimePicker(context), // 53  3600
          child: const Icon(
            EvaIcons.clockOutline,
            color: Color(0xFF64748b), //64748b
          ),
        ),

        // clear btn
        if (modelValueTime != '' && !widget.isDisabled) ...[
          //
          const SizedBox(width: 8),
          ClearButton(onClearTime),
        ],
        // ...
      ],
    );
  }
}
