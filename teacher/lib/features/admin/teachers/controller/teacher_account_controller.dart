import 'package:get/get.dart';
import '../state/teacher_account_state.dart';

class TeacherAccountController extends GetxController {
  final Rx<TeacherAccountState> state = const TeacherAccountState(
    isActive: true,
    fullName: 'أ / محمد أحمد',
    email: 'mohamed@gmail.com',
    stageLabel: 'الصف الثالث الثانوي - المرحلة الإعدادية',
    createdAtLabel: 'تم إنشاء الحساب: 2025 / 9 / 12',
    avatarUrl: '',
  ).obs;

  void toggleActive() {
    state.value = state.value.copyWith(isActive: !state.value.isActive);
  }

  // Hooks جاهزة للربط بعدين
  void onEditData() {
    // Get.toNamed(...)
  }

  void onPermissions() {
    // Get.toNamed(...)
  }

  void onAnalytics() {
    // Get.toNamed(...)
  }

  void onCreateTeacher() {
    // Get.toNamed(...)
  }
}
