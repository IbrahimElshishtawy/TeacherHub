import 'package:flutter/material.dart';

import 'manual_input_theme.dart';

class ManualInputSubmitButton extends StatelessWidget {
  final bool hasText;
  final Animation<double> scaleAnimation;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;
  final VoidCallback onTapCancel;

  const ManualInputSubmitButton({
    super.key,
    required this.hasText,
    required this.scaleAnimation,
    required this.onTapDown,
    required this.onTapUp,
    required this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onTapDown(),
      onTapUp: (_) => onTapUp(),
      onTapCancel: onTapCancel,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: hasText
                  ? [ManualInputTheme.primary, ManualInputTheme.primary2]
                  : [const Color(0xFFF1F5F9), const Color(0xFFF1F5F9)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(16),
            border: hasText ? null : Border.all(color: ManualInputTheme.fieldBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.send_rounded,
                color: hasText ? Colors.white : ManualInputTheme.hint,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                'تأكيد الإدخال',
                style: TextStyle(
                  color: hasText ? Colors.white : ManualInputTheme.hint,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
