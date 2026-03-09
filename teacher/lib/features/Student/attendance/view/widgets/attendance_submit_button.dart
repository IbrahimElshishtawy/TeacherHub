import 'package:flutter/material.dart';

import '../../controller/attendance_controller.dart';
import 'attendance_ui_tokens.dart';

class AttendanceSubmitButton extends StatelessWidget {
  final bool hasId;
  final AttendanceController controller;

  const AttendanceSubmitButton({
    super.key,
    required this.hasId,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: hasId
              ? const LinearGradient(
                  colors: [AttendanceUiTokens.accent, AttendanceUiTokens.accentGlow],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )
              : null,
          color: hasId ? null : AttendanceUiTokens.surface,
          borderRadius: BorderRadius.circular(18),
          border: hasId ? null : Border.all(color: AttendanceUiTokens.border),
          boxShadow: hasId
              ? [
                  BoxShadow(
                    color: AttendanceUiTokens.accent.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: hasId ? controller.submitAttendance : null,
            splashColor: AttendanceUiTokens.accent.withOpacity(0.15),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.how_to_reg_rounded,
                    color: hasId ? Colors.white : AttendanceUiTokens.textMuted,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'تسجيل الحضور',
                    style: TextStyle(
                      color: hasId ? Colors.white : AttendanceUiTokens.textMuted,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
