import 'package:get/get.dart';

class AttendanceState {
  RxBool isScanning = true.obs; // To switch between QR and manual input modes
  RxString studentId = ''.obs; // Store student ID
  RxBool isSubmitted = false.obs; // True after successful submit
  RxString submittedAt = ''.obs; // Submission timestamp label

  // Initialize with default values
  AttendanceState();
}
