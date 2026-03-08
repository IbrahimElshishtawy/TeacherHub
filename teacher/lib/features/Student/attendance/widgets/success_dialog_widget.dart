import 'package:flutter/material.dart';

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

  static const _success = Color(0xFF10B981);
  static const _successDim = Color(0xFF065F46);
  static const _bg = Color(0xFF071A12);
  static const _border = Color(0xFF134D35);
  static const _textPrimary = Color(0xFFECFDF5);
  static const _textMuted = Color(0xFF6EE7B7);

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
              color: _bg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: _border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: _success.withOpacity(0.12),
                  blurRadius: 32,
                  spreadRadius: -4,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Animated checkmark circle ──────────────────
                _buildCheckmark(),
                const SizedBox(height: 20),

                // ── Title ──────────────────────────────────────
                const Text(
                  'تم تسجيل الحضور بنجاح',
                  style: TextStyle(
                    color: _textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'تم تأكيد حضور الطالب وتسجيله في النظام',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _textMuted.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),

                // ── Student ID chip ────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: _success.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: _success.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.badge_outlined,
                        color: _success.withOpacity(0.8),
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'رقم الطالب: ',
                        style: TextStyle(
                          color: _textMuted.withOpacity(0.6),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.studentId,
                        style: const TextStyle(
                          color: _textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ── Timestamp ──────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: _textMuted.withOpacity(0.4),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _formattedTime(),
                      style: TextStyle(
                        color: _textMuted.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckmark() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer glow ring
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _success.withOpacity(0.06),
          ),
        ),
        // Inner ring
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _success.withOpacity(0.12),
            border: Border.all(color: _success.withOpacity(0.3), width: 1.5),
          ),
        ),
        // Icon
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [_success.withOpacity(0.9), _successDim],
            ),
            boxShadow: [
              BoxShadow(
                color: _success.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: -2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 26),
        ),
      ],
    );
  }

  String _formattedTime() {
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    return 'تم التسجيل الساعة $h:$m';
  }
}
