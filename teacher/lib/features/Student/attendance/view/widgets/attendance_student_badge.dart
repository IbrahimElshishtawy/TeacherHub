// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../controller/attendance_controller.dart';
import 'attendance_ui_tokens.dart';

class AttendanceStudentBadge extends StatelessWidget {
  final String studentId;
  final bool isSubmitted;
  final AttendanceController controller;

  const AttendanceStudentBadge({
    super.key,
    required this.studentId,
    required this.isSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(studentId),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AttendanceUiTokens.success.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AttendanceUiTokens.success.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AttendanceUiTokens.success.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AttendanceUiTokens.success,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تم التعرف على الطالب',
                style: TextStyle(
                  color: AttendanceUiTokens.success,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                studentId,
                style: const TextStyle(
                  color: AttendanceUiTokens.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: controller.clearStudentId,
            tooltip: isSubmitted ? 'مسح والبدء من جديد' : 'إعادة المسح',
            icon: Icon(
              isSubmitted ? Icons.refresh_rounded : Icons.qr_code_scanner_rounded,
              color: AttendanceUiTokens.success.withOpacity(0.8),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
