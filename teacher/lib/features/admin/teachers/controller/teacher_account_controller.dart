import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeacherAccountController extends GetxController {
  // List of teachers (this will be dynamically updated)
  var teachers = <TeacherAccountState>[].obs;

  // Method to add a new teacher to the list
  void addTeacher(TeacherAccountState teacher) {
    teachers.add(teacher);
  }

  // Example method for toggling teacher status (active/inactive)
  void toggleActive(bool isActive) {
    // Implement your logic to toggle the teacher's active status
  }

  // Example method for editing a teacher's data
  void onEditData() {
    // Implement your logic to edit teacher data
  }

  // Example method for managing teacher's permissions
  void onPermissions() {
    // Implement your logic to manage permissions
  }

  // Example method for viewing teacher's analytics
  void onAnalytics() {
    // Implement your logic for analytics
  }

  // Example onCreateTeacher method
  void onCreateTeacher() {
    // Implement your logic to create a new teacher account
  }
}
