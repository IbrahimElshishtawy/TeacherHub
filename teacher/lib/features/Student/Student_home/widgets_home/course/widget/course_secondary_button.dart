import 'package:flutter/material.dart';

class CourseSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double radius;

  const CourseSecondaryButton({
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
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF2F80ED),
          side: BorderSide(
            color: enabled
                ? const Color(0xFF2F80ED)
                : const Color(0xFF2F80ED).withOpacity(.35),
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: enabled
                ? const Color(0xFF2F80ED)
                : const Color(0xFF2F80ED).withOpacity(.55),
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}
