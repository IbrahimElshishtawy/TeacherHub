import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeachersController extends GetxController {
  final teachers = <TeacherAccountState>[].obs;

  TeacherAccountState? byId(String id) {
    try {
      return teachers.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  void upsertTeacher(TeacherAccountState teacher) {
    final index = teachers.indexWhere((t) => t.id == teacher.id);
    if (index == -1) {
      teachers.add(teacher);
    } else {
      teachers[index] = teacher;
      teachers.refresh();
    }
  }

  void removeTeacher(String id) {
    teachers.removeWhere((t) => t.id == id);
  }

  void toggleActive(String id) {
    final index = teachers.indexWhere((t) => t.id == id);
    if (index == -1) return;
    final current = teachers[index];
    teachers[index] = current.copyWith(isActive: !current.isActive);
    teachers.refresh();
  }
}
