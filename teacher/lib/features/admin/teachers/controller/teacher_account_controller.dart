import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';

class TeachersController extends GetxController {
  final teachers = <TeacherAccountState>[].obs;

  @override
  void onInit() {
    super.onInit();
    teachers.assignAll([
      TeacherAccountState(
        id: 't-001',
        fullName: 'أحمد محمد علي',
        email: 'ahmed@school.com',
        createdAt: '2026-02-15',
        isActive: true,
        avatarPath: 'assets/lottie/Teacher.json',
        password: 'Ahmed@123',
        stages: const ['ابتدائي'],
        grades: const ['الصف الثالث'],
        subjects: const ['رياضيات'],
        permissions: const {
          'courses_create': true,
          'courses_edit': true,
          'courses_delete': false,
          'courses_publish_hide': true,
          'content_upload': true,
          'content_edit': true,
          'content_delete': false,
          'content_share_all_students': true,
          'content_add_paid_courses': false,
          'assignments_create': true,
          'assignments_edit': true,
          'assignments_delete': false,
          'assignments_assign_specific': true,
          'assignments_review_grade': true,
          'exams_create': true,
          'exams_edit': true,
          'exams_delete': false,
          'exams_publish_students': true,
          'exams_view_students_grades': true,
        },
      ),
      TeacherAccountState(
        id: 't-002',
        fullName: 'سارة محمود حسن',
        email: 'sara@school.com',
        createdAt: '2026-02-14',
        isActive: false,
        avatarPath: 'assets/lottie/Teacher.json',
        password: 'Sara@123',
        stages: const ['إعدادي'],
        grades: const ['الصف الأول'],
        subjects: const ['علوم'],
        permissions: const {
          'courses_create': false,
          'courses_edit': true,
          'courses_delete': false,
          'courses_publish_hide': false,
          'content_upload': true,
          'content_edit': true,
          'content_delete': false,
          'content_share_all_students': false,
          'content_add_paid_courses': false,
          'assignments_create': true,
          'assignments_edit': true,
          'assignments_delete': false,
          'assignments_assign_specific': true,
          'assignments_review_grade': true,
          'exams_create': false,
          'exams_edit': true,
          'exams_delete': false,
          'exams_publish_students': false,
          'exams_view_students_grades': true,
        },
      ),
      TeacherAccountState(
        id: 't-003',
        fullName: 'محمد إبراهيم سعيد',
        email: 'mohamed@school.com',
        createdAt: '2026-02-10',
        isActive: true,
        avatarPath: 'assets/lottie/Teacher.json',
        password: 'Mohamed@123',
        stages: const ['ثانوي'],
        grades: const ['الصف الثاني'],
        subjects: const ['لغة عربية'],
        permissions: const {
          'courses_create': true,
          'courses_edit': false,
          'courses_delete': false,
          'courses_publish_hide': true,
          'content_upload': true,
          'content_edit': false,
          'content_delete': false,
          'content_share_all_students': true,
          'content_add_paid_courses': true,
          'assignments_create': true,
          'assignments_edit': false,
          'assignments_delete': false,
          'assignments_assign_specific': false,
          'assignments_review_grade': true,
          'exams_create': true,
          'exams_edit': false,
          'exams_delete': false,
          'exams_publish_students': true,
          'exams_view_students_grades': true,
        },
      ),
    ]);
  }

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
