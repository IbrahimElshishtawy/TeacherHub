import 'package:get/get.dart';

class AttendanceState {
  RxBool isScanning = true.obs; // To switch between QR and manual input modes
  RxString studentId = ''.obs; // Store student ID

  // Initialize with default values
  AttendanceState();
}
