import 'package:flutter/material.dart';

class ButtonRoundedNoAction extends StatelessWidget {
  ButtonRoundedNoAction({
    Key? key,
    required this.color,
    required this.label,
  }) : super(key: key);

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
/*        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 1,
          ),
        ),*/
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }
}
