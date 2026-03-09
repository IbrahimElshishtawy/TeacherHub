import 'package:flutter/material.dart';

import '../../controller/attendance_controller.dart';
import '../../widgets/manual_input/manual_input_widget.dart';
import '../../widgets/qr_scanner/qr_scanner_widget.dart';
import 'attendance_ui_tokens.dart';

class AttendanceInputCard extends StatelessWidget {
  final bool isScanning;
  final AttendanceController controller;

  const AttendanceInputCard({
    super.key,
    required this.isScanning,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final studentId = controller.state.studentId.value;
    final canScan = studentId.trim().isEmpty;

    return Container(
      decoration: BoxDecoration(
        color: AttendanceUiTokens.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AttendanceUiTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: isScanning
            ? SizedBox(
                key: ValueKey('scanner_${canScan ? "active" : "locked"}'),
                height: 320,
                child: QRScannerWidget(
                  onQRScan: controller.setQRCode,
                  scanEnabled: canScan,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: ManualInputWidget(onInput: controller.setManualId),
              ),
      ),
    );
  }
}
