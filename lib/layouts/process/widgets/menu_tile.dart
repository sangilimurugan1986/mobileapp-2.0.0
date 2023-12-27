import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Row(
          children: [
            // icon
            Icon(
              icon,
              color: color,
            ),

            // ...
            const SizedBox(width: 15),
            // label
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
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
