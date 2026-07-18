import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../state/attendance_state.dart';

class AttendanceController extends GetxController {
  final AttendanceState state = Get.find<AttendanceState>();

  // Function to toggle the attendance method (QR or manual input)
  void toggleMode() {
    state.isScanning.toggle();
    update();
  }

  // Function to handle manual ID entry
  void setManualId(String id) {
    state.studentId.value = id.trim();
    state.isSubmitted.value = false;
    update();
  }

  // Function to handle QR scan result
  void setQRCode(String qrCode) {
    final code = qrCode.trim();
    if (code.isEmpty) return;
    if (state.studentId.value == code) return;
    state.studentId.value = code;
    state.isSubmitted.value = false;
    state.submittedAt.value = '';
    update();
  }

  void clearStudentId() {
    state.studentId.value = '';
    state.isSubmitted.value = false;
    state.submittedAt.value = '';
    update();
  }

  // Handle attendance submission (QR or manual)
  void submitAttendance() {
    final id = state.studentId.value.trim();
    if (id.isNotEmpty) {
      state.studentId.value = id;
      state.isSubmitted.value = true;
      state.submittedAt.value = _formattedTime();
      // You can integrate a backend service here
      if (kDebugMode) {
        print('Attendance marked successfully for $id');
      }
    } else {
      state.isSubmitted.value = false;
      state.submittedAt.value = '';
      if (kDebugMode) {
        print('Please enter a valid ID.');
      }
    }
    update();
  }

  String _formattedTime() {
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    return 'تم التسجيل الساعة $h:$m';
  }
}
