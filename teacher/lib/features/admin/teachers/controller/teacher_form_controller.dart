import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_account_controller.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeacherFormController extends GetxController {
  final TeachersController _teachers = Get.find<TeachersController>();

  final editingId = RxnString();
  final teacher = Rxn<TeacherAccountState>();

  void startCreate({required String newId, required String createdAt}) {
    editingId.value = newId;
    teacher.value = TeacherAccountState(
      id: newId,
      fullName: '',
      email: '',
      createdAt: createdAt,
      isActive: true,
    );
  }

  /// افتح فورم تعديل
  void startEdit(String id) {
    final existing = _teachers.byId(id);
    if (existing == null) return;
    editingId.value = id;
    teacher.value = existing;
  }

  /// تحديث جزء من البيانات أثناء الكتابة
  void patch({
    String? fullName,
    String? email,
    bool? isActive,
    String? avatarPath,
    String? password,
    List<String>? stages,
    List<String>? grades,
    List<String>? subjects,
    Map<String, bool>? permissions,
  }) {
    final current = teacher.value;
    if (current == null) return;

    teacher.value = current.copyWith(
      fullName: fullName,
      email: email,
      isActive: isActive,
      avatarPath: avatarPath,
      password: password,
      stages: stages,
      grades: grades,
      subjects: subjects,
      permissions: permissions,
    );
  }

  void save() {
    final current = teacher.value;
    if (current == null) return;

    _teachers.upsertTeacher(current);
    Get.back(result: true);
  }

  void reset() {
    editingId.value = null;
    teacher.value = null;
  }
}
