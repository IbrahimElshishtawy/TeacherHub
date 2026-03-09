// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'success_dialog_theme.dart';

class SuccessDialogBody extends StatelessWidget {
  final String studentId;
  final String formattedTime;

  const SuccessDialogBody({
    super.key,
    required this.studentId,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'تم تسجيل الحضور بنجاح',
          style: TextStyle(
            color: SuccessDialogTheme.textPrimary,
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
            color: SuccessDialogTheme.textMuted.withOpacity(0.7),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        _StudentIdChip(studentId: studentId),
        const SizedBox(height: 20),
        _TimestampText(formattedTime: formattedTime),
      ],
    );
  }
}

class _StudentIdChip extends StatelessWidget {
  final String studentId;

  const _StudentIdChip({required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: SuccessDialogTheme.success.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: SuccessDialogTheme.success.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.badge_outlined,
            color: SuccessDialogTheme.success.withOpacity(0.8),
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            'رقم الطالب: ',
            style: TextStyle(
              color: SuccessDialogTheme.textMuted.withOpacity(0.6),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            studentId,
            style: const TextStyle(
              color: SuccessDialogTheme.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimestampText extends StatelessWidget {
  final String formattedTime;

  const _TimestampText({required this.formattedTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 13,
          color: SuccessDialogTheme.textMuted.withOpacity(0.4),
        ),
        const SizedBox(width: 5),
        Text(
          formattedTime,
          style: TextStyle(
            color: SuccessDialogTheme.textMuted.withOpacity(0.4),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
