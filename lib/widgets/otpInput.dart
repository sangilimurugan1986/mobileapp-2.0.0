//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool
      errorip; // sangili, errorip - to be use for error(password mismatch) - not completed
  const OtpInput(this.errorip, this.controller, this.autoFocus, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 40,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: errorip
            ? InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.redAccent), //<-- SEE HERE
                ),
                counterText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 18.0))
            : InputDecoration(
                border: OutlineInputBorder(),
                counterText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
