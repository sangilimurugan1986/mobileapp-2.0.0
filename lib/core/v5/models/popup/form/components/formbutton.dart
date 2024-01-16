import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    this.color = const Color(0xFF6c2d92),
    this.isRounded = false,
    this.isFullWidth = false,
    this.isLoading = false,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final bool isRounded;
  final bool isFullWidth;
  final bool isLoading;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(color), //6c2d92   font 643094
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isLoading ? 4 : 10,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isRounded ? 48 : 2),
          ),
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(backgroundColor: Colors.white)
          : Text(
              label,
              style: const TextStyle(
                  //color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
