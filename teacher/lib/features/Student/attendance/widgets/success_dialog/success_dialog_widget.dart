import 'package:flutter/material.dart';

import 'success_dialog_body.dart';
import 'success_dialog_checkmark.dart';
import 'success_dialog_theme.dart';

class SuccessDialogWidget extends StatefulWidget {
  final String studentId;

  const SuccessDialogWidget({super.key, required this.studentId});

  @override
  State<SuccessDialogWidget> createState() => _SuccessDialogWidgetState();
}

class _SuccessDialogWidgetState extends State<SuccessDialogWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    _scaleAnim = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    if (widget.studentId.isNotEmpty) {
      _animController.forward();
    }
  }

  @override
  void didUpdateWidget(SuccessDialogWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.studentId.isNotEmpty && oldWidget.studentId.isEmpty) {
      _animController.forward(from: 0);
    } else if (widget.studentId.isEmpty) {
      _animController.reverse();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.studentId.isEmpty) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: ScaleTransition(
          scale: _scaleAnim,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: SuccessDialogTheme.bg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: SuccessDialogTheme.border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: SuccessDialogTheme.success.withOpacity(0.12),
                  blurRadius: 32,
                  spreadRadius: -4,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SuccessDialogCheckmark(),
                const SizedBox(height: 20),
                SuccessDialogBody(
                  studentId: widget.studentId,
                  formattedTime: _formattedTime(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formattedTime() {
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    return 'تم التسجيل الساعة $h:$m';
  }
}
