import 'package:ez/core/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:simple_chips_input/select_chips_input.dart';
import 'package:simple_chips_input/simple_chips_input.dart';

class CustomChip extends StatefulWidget {
  const CustomChip({Key? key}) : super(key: key);

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  String output = '';
  String? deletedChip, deletedChipIndex;
  final keySimpleChipsInput = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final TextFormFieldStyle style = const TextFormFieldStyle(
    keyboardType: TextInputType.text,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0.0),
      border: InputBorder.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
        ),
        // Text(
        //   deletedChip != null
        //       ? 'Deleted chip: $deletedChip at index $deletedChipIndex'
        //       : '',
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(fontSize: 16, color: Colors.blue),
        // ),
        // Text(
        //   'Output:\n$output',
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(fontSize: 16, color: Colors.blue),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleChipsInput(
            separatorCharacter: ",",
            focusNode: focusNode,
            validateInput: true,
            formKey: keySimpleChipsInput,
            textFormFieldStyle: style,
            onSubmitted: (p0) {
              setState(() {
                output = p0;
              });
            },
            onChipDeleted: (p0, p1) {
              setState(() {
                deletedChip = p0;
                deletedChipIndex = p1.toString();
              });
            },
            onSaved: ((p0) {
              setState(() {
                output = p0;
              });
            }),
            chipTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            deleteIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.highlight_remove,
                size: 16.0,
                color: CustomColors.darkblue,
              ),
            ),
            widgetContainerDecoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: CustomColors.black),
            ),
            chipContainerDecoration: BoxDecoration(
              color: CustomColors.lightblue,
              borderRadius: BorderRadius.circular(10),
            ),
            placeChipsSectionAbove: false,
          ),
        ),
      ],
    );
  }
}
