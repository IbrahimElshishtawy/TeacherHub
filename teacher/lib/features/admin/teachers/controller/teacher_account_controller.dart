import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeacherAccountController extends GetxController {
  var teachers = <TeacherAccountState>[].obs;
  var message = ''.obs;

  // Load teachers data from the JSON file
  Future<void> loadTeachersData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/teacher.json',
      );
      final List<dynamic> data = json.decode(response);

      // Assuming data contains a list of teacher objects
      List<TeacherAccountState> loadedTeachers = data.map((teacherJson) {
        return TeacherAccountState.fromJson(teacherJson);
      }).toList();

      // Updating the teachers list with loaded data
      teachers.assignAll(loadedTeachers);
      message.value = 'Teachers loaded successfully.';
    } catch (e) {
      message.value = 'Error loading teachers: $e';
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadTeachersData(); // Load data when the controller is initialized
  }

  // Function to handle when editing a teacher's data
  void onEditTeacherData(TeacherAccountState teacher) {
    message.value = "Editing data for: ${teacher.fullName}";
    // Navigate or open the edit screen with the teacher's data
  }

  void onTeacherPermissions(TeacherAccountState teacher) {
    message.value = "Managing permissions for: ${teacher.fullName}";
    // Navigate to permissions screen
  }

  void onTeacherAnalytics(TeacherAccountState teacher) {
    message.value = "Viewing analytics for: ${teacher.fullName}";
    // Navigate to analytics screen
  }
}
