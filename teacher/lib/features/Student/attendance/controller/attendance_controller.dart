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
    state.studentId.value = id;
    update();
  }

  // Function to handle QR scan result
  void setQRCode(String qrCode) {
    state.studentId.value = qrCode;
    update();
  }

  // Handle attendance submission (QR or manual)
  void submitAttendance() {
    if (state.studentId.isNotEmpty) {
      // You can integrate a backend service here
      if (kDebugMode) {
        print('Attendance marked successfully for ${state.studentId}');
      }
    } else {
      if (kDebugMode) {
        print('Please enter a valid ID.');
      }
    }
  }
}
