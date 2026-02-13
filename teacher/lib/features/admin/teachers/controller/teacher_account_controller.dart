import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeacherAccountController extends GetxController {
  var teachers = <TeacherAccountState>[].obs;
  var message = ''.obs;
  void addTeacher({
    required String fullName,
    required String email,
    required String stageLabel,
    required String createdAtLabel,
    String avatarUrl = '',
    bool isActive = false,
    bool? isOptionSelected,
    String? selectedOption,
  }) {
    try {
      TeacherAccountState newTeacher = TeacherAccountState(
        fullName: fullName,
        email: email,
        stageLabel: stageLabel,
        createdAtLabel: createdAtLabel,
        avatarUrl: avatarUrl,
        isActive: isActive,
        isOptionSelected: isOptionSelected,
        selectedOption: selectedOption,
      );
      teachers.add(newTeacher);
      message.value = "Teacher added successfully!";
    } catch (e) {
      message.value = "Failed to add teacher: $e";
    }
  }

  void toggleActive(bool isActive) {
    message.value = isActive ? "Teacher activated." : "Teacher deactivated.";
  }

  void onEditData() {
    message.value = "Teacher data updated.";
  }

  void onPermissions() {
    message.value = "Permissions updated.";
  }

  void onAnalytics() {
    message.value = "Viewing teacher analytics.";
  }

  void onCreateTeacher() {
    message.value = "Creating a new teacher account.";
  }
}
