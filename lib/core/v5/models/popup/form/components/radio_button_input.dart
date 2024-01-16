import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/theme.dart';
import '../../controllers/commentcontroller.dart';

class RadioButtonInput extends StatefulWidget {
  const RadioButtonInput({
    Key? key,
    required this.options,
    required this.onChanged,
    this.isDisabled = false,
    this.initialValue = '',
  }) : super(key: key);

  final List<String> options;
  final void Function(String) onChanged;
  final bool isDisabled;
  final String initialValue;

  @override
  _RadioButtonInputState createState() => _RadioButtonInputState();
}

class _RadioButtonInputState extends State<RadioButtonInput> {
  var selectedOption = '';
  CommentController controllerComments = Get.put(CommentController());

  bool isSelected(String option) {
    return selectedOption == option;
  }

  void onTap(String option) {
    setState(() {
      selectedOption = option;
      widget.onChanged(option);
      controllerComments.showTo = selectedOption.toString() == 'Internal (Private)' ? 0 : 1;
    });
  }

  @override
  void initState() {
    setState(() {
      selectedOption = widget.initialValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2, //00bcd4
      children: [
        for (var option in widget.options)
          GestureDetector(
            onTap: widget.isDisabled ? null : () => onTap(option),
            child: Chip(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                //side: BorderSide(color: Colors.grey.shade100, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              avatar: Icon(
                isSelected(option) ? EvaIcons.radioButtonOn : EvaIcons.radioButtonOff,
                color: isSelected(option) ? Color(0xFF00bcd4) : Colors.grey,
                size: 20,
              ),
              label: Text(
                option,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
