import 'package:ez/core/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatefulWidget {
  bool showLabel1 = false;
  bool showLabel2 = false;
  String? placeholder1, placeholder2;
  final Function(bool)? placeholder1_onChanged;
  final Function(bool)? placeholder2_onChanged;
  CustomCheckbox(
      [this.placeholder1,
      this.placeholder2,
      this.placeholder1_onChanged,
      this.placeholder2_onChanged]);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildMulticheckbox()],
            ),
          )),
    );
  }

  Widget buildMulticheckbox() {
    return Row(
      children: [
        Spacer(),
        Checkbox(
          semanticLabel: widget.placeholder1 ?? "",
          activeColor: CustomColors.paleblue,
          value: widget.showLabel1,
          onChanged: (value) {
            setState(() {
              widget.showLabel1 = !widget.showLabel1;
            });
            widget.placeholder1_onChanged!(value!);
          },
        ),
        Text(widget.placeholder1 ?? ""),
        Spacer(),
        Checkbox(
          semanticLabel: widget.placeholder2 ?? "",
          activeColor: CustomColors.paleblue,
          value: widget.showLabel2,
          onChanged: (value) {
            setState(() {
              widget.showLabel2 = !widget.showLabel2;
            });
            widget.placeholder2_onChanged!(value!);
          },
        ),
        Text(widget.placeholder2 ?? ""),
        Spacer(),
      ],
    );
  }
}
