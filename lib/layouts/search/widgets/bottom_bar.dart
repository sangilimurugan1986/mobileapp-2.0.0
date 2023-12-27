import 'package:flutter/material.dart';
import '../../../config/theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.action1,
    required this.action2,
    required this.action3,
    required this.action4,
    required this.action5,
  }) : super(key: key);

  final IconButton action1;
  final IconButton action2;
  final IconButton action3;
  final IconButton action4;
  final IconButton action5;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0)),
      child: BottomAppBar(
        //shape: const CircularNotchedRectangle(),
        color: Colors.grey.shade200,
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 8),
              action1,
              const Spacer(flex: 2),
              action2,
              const Spacer(flex: 2),
              action5,
              const Spacer(flex: 2),
              action3,
              const Spacer(flex: 2),
              action4,
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
