// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../controller/attendance_controller.dart';
import 'attendance_ui_tokens.dart';

class AttendanceModeToggle extends StatelessWidget {
  final bool isScanning;
  final AttendanceController controller;

  const AttendanceModeToggle({
    super.key,
    required this.isScanning,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AttendanceUiTokens.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AttendanceUiTokens.border),
      ),
      child: Row(
        children: [
          _AttendanceTogglePill(
            icon: Icons.qr_code_scanner_rounded,
            label: 'مسح QR',
            active: isScanning,
            onTap: () {
              if (!isScanning) controller.toggleMode();
            },
          ),
          _AttendanceTogglePill(
            icon: Icons.keyboard_rounded,
            label: 'إدخال يدوي',
            active: !isScanning,
            onTap: () {
              if (isScanning) controller.toggleMode();
            },
          ),
        ],
      ),
    );
  }
}

class _AttendanceTogglePill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _AttendanceTogglePill({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: active
                ? const LinearGradient(
                    colors: [AttendanceUiTokens.accent, AttendanceUiTokens.accentGlow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AttendanceUiTokens.accent.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: active ? Colors.white : AttendanceUiTokens.textMuted,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: active ? Colors.white : AttendanceUiTokens.textMuted,
                  fontSize: 14,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
