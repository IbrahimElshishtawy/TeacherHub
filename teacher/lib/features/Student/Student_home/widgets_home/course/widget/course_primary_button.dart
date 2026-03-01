import 'package:flutter/material.dart';

class CoursePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double radius;

  const CoursePrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 36,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F80ED),
          disabledBackgroundColor: const Color(0xFF2F80ED).withOpacity(.45),
          elevation: enabled ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}
