import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    Key? key,
    required this.logo,
    required this.label,
  }) : super(key: key);

  final String logo;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),

          // logo

          Image.asset(
            logo,
            height: 24,
          ),

          // ...

          const SizedBox(width: 16),

          // label

          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),

          // ...
        ],
      ),
    );
  }
}
