import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme.dart';
import 'Labels.dart';

class CheckBoxInput extends StatefulWidget {
  const CheckBoxInput({
    Key? key,
    required this.options,
    required this.onChanged,
    required this.bOptional,
    required this.slabel,
    this.isDisabled = false,
    this.initialValue = '',
  }) : super(key: key);

  final List<String> options;
  final void Function(List<String>) onChanged;
  final bool isDisabled;
  final String initialValue;
  final String slabel;
  final bool bOptional;

  @override
  _CheckBoxInputState createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  var selectedOptions = <String>[];

  bool isSelected(String option) {
    return selectedOptions.contains(option);
  }

  void onTap(String option) {
    if (isSelected(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }

    setState(() {
      selectedOptions = [...selectedOptions];
      widget.onChanged(selectedOptions);
    });
  }

  @override
  void initState() {
    setState(() {
      selectedOptions = [...widget.initialValue.split(',')];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        Labels(sLabel: widget.slabel, bRequired: widget.bOptional),
        Divider(color: Colors.grey.shade300),
        for (var option in widget.options)
          GestureDetector(
            onTap: widget.isDisabled ? null : () => onTap(option),
            child: Chip(
              shape: RoundedRectangleBorder(
                //side: BorderSide(color: Colors.grey.shade200, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              avatar: Icon(
                isSelected(option)
                    ? EvaIcons.checkmarkSquare2
                    : EvaIcons.square,
                color: isSelected(option)
                    ? BrandColors.secondary
                    : BrandColors.formtextColor.shade50,
                size: 20,
              ),
              label: Text(
                option,
                style: TextStyle(
                  color: isSelected(option)
                      ? BrandColors.formtextColor.shade100
                      : BrandColors.formtextColor.shade200,
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
