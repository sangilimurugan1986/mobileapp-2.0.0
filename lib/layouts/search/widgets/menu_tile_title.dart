import 'package:flutter/material.dart';

class MenuTileTitle extends StatelessWidget {
  const MenuTileTitle({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // ...
            //const SizedBox(width: 30),
            // label
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ...
          ],
        ),
      ),

      //
    );
  }
}
