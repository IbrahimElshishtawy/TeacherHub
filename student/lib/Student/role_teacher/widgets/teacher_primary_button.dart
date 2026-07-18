// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TeacherPrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  // اختياري
  final bool isLoading;
  final IconData? icon;
  final double height;

  const TeacherPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.height = 52,
  });

  @override
  State<TeacherPrimaryButton> createState() => _TeacherPrimaryButtonState();
}

class _TeacherPrimaryButtonState extends State<TeacherPrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null && !widget.isLoading;
    const base = Color(0xFF2F80ED);
    final bg = enabled ? base : base.withOpacity(.45);

    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed && enabled ? 0.985 : 1.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: enabled
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2F80ED), Color(0xFF1F6FE0)],
                  )
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [bg, bg],
                  ),
            boxShadow: enabled
                ? const [
                    BoxShadow(
                      color: Color(0x332F80ED),
                      blurRadius: 18,
                      offset: Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                : const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: enabled ? widget.onPressed : null,
              onTapDown: (_) {
                if (!enabled) return;
                setState(() => _pressed = true);
              },
              onTapCancel: () {
                if (!enabled) return;
                setState(() => _pressed = false);
              },
              onTapUp: (_) {
                if (!enabled) return;
                setState(() => _pressed = false);
              },
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 180),
                  child: widget.isLoading
                      ? const SizedBox(
                          key: ValueKey("loading"),
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : Row(
                          key: const ValueKey("content"),
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.icon != null) ...[
                              Icon(widget.icon, size: 18, color: Colors.white),
                              const SizedBox(width: 10),
                            ],
                            Text(
                              widget.text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
