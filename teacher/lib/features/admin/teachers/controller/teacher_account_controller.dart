import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';
import 'package:teacher/features/admin/teachers/data/teacher_local_storage.dart';

class TeacherAccountController extends GetxController {
  final TeacherLocalStorage _storage = TeacherLocalStorage();

  final teachers = <TeacherAccountState>[].obs;
  final message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadTeachers();
  }

  // ========= Storage =========
  Future<void> loadTeachers() async {
    try {
      final all = await _storage.readAll();
      teachers.assignAll(all);
      message.value = '';
    } catch (e) {
      message.value = 'فشل تحميل المدرسين: $e';
    }
  }

  Future<void> _persist() async {
    await _storage.writeAll(teachers.toList());
  }

  // ========= Create / Add =========
  Future<void> addTeacher({required TeacherAccountState teacher}) async {
    try {
      teachers.add(teacher);
      await _persist();
      message.value = 'تم إضافة المدرس وحفظه ✅';
    } catch (e) {
      message.value = 'فشل إضافة المدرس: $e';
    }
  }

  Future<void> addTeacherFromParams({
    required String id,
    required String createdAt, // ISO
    required String fullName,
    required String email,
    required String stageLabel,
    required String createdAtLabel,
    String avatarUrl = '',
    bool isActive = true,
    bool? isOptionSelected,
    String? selectedOption,
  }) async {
    try {
      final newTeacher = TeacherAccountState(
        id: id,
        createdAt: createdAt,
        isActive: isActive,
        selectedOption: selectedOption,
        isOptionSelected: isOptionSelected,

        fullName: fullName,
        email: email,

        // phone: ...,
        // stages: ...,
        // grades: ...,
        // subjects: ...,
        // permissions: ...,

        // لو لسه عندك حقول UI قديمة زي stageLabel/createdAtLabel/avatarUrl
        // خليهم داخل الـ state أو احذفهم لو انت حولت للنسخة الجديدة
      );

      teachers.add(newTeacher);
      await _persist();
      message.value = 'تم إضافة المدرس وحفظه ✅';
    } catch (e) {
      message.value = 'فشل إضافة المدرس: $e';
    }
  }

  // ========= Update =========
  Future<void> updateTeacher(TeacherAccountState updated) async {
    try {
      final idx = teachers.indexWhere((t) => t.id == updated.id);
      if (idx == -1) return;

      teachers[idx] = updated;
      await _persist();
      message.value = 'تم تحديث بيانات المدرس ✅';
    } catch (e) {
      message.value = 'فشل تحديث المدرس: $e';
    }
  }

  // ========= Toggle Active =========
  Future<void> toggleTeacherActive(String teacherId, bool isActive) async {
    try {
      final idx = teachers.indexWhere((t) => t.id == teacherId);
      if (idx == -1) return;

      final updated = teachers[idx].copyWith(isActive: isActive);
      teachers[idx] = updated;

      await _persist();
      message.value = isActive
          ? 'تم تفعيل الحساب ✅'
          : 'تم إيقاف الحساب مؤقتًا ✅';
    } catch (e) {
      message.value = 'فشل تغيير حالة الحساب: $e';
    }
  }

  // ========= Delete =========
  Future<void> deleteTeacher(String teacherId) async {
    try {
      teachers.removeWhere((t) => t.id == teacherId);
      await _persist();
      message.value = 'تم حذف المدرس ✅';
    } catch (e) {
      message.value = 'فشل حذف المدرس: $e';
    }
  }

  void onEditTeacherData(TeacherAccountState teacher) {
    message.value = "فتح تعديل بيانات: ${teacher.fullName}";
    // Navigate / open edit screen with teacher.id
  }

  void onTeacherPermissions(TeacherAccountState teacher) {
    message.value = "فتح صلاحيات: ${teacher.fullName}";
    // Navigate / open permissions screen with teacher.id
  }

  void onTeacherAnalytics(TeacherAccountState teacher) {
    message.value = "فتح تحليلات: ${teacher.fullName}";
    // Navigate / open analytics screen with teacher.id
  }

  // ========= Screens Actions (placeholders) =========
  void onEditData() => message.value = "فتح تعديل البيانات...";
  void onPermissions() => message.value = "فتح الصلاحيات...";
  void onAnalytics() => message.value = "فتح التحليلات...";
  void onCreateTeacher() => message.value = "بدء إنشاء حساب مدرس...";
}
