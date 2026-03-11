// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:teacher/features/Student/Student_home/bindings/Student_home_binding.dart';
import 'package:teacher/features/Student/Student_home/view/home_page/home_page.dart';
import 'package:teacher/features/Student/attendance/bindings/attendance_binding.dart';
import 'package:teacher/features/Student/attendance/view/attendance_screen.dart';
import 'package:teacher/features/Student/communication_channel/bindings/communication_channel_binding.dart';
import 'package:teacher/features/Student/communication_channel/view/communication_channel_screen.dart';
import 'package:teacher/features/Student/important_events_student/bindings/important_events_binding.dart';
import 'package:teacher/features/Student/important_events_student/view/important_events_screen.dart';
import 'package:teacher/features/Student/my_courses/bindings/my_courses_binding.dart';
import 'package:teacher/features/Student/my_courses/view/my_course_details_screen.dart';
import 'package:teacher/features/Student/my_courses/view/my_courses_screen.dart';
import 'package:teacher/features/Student/notification_student/bindings/notification_student_binding.dart';
import 'package:teacher/features/Student/notification_student/view/notification_student_screen.dart';
import 'package:teacher/features/Student/profile_student/bindings/profile_student_binding.dart';
import 'package:teacher/features/Student/profile_student/view/profile_student_screen.dart';
import 'package:teacher/features/Student/quiz/bindings/quiz_binding.dart';
import 'package:teacher/features/Student/quiz/view/quiz_exam_screen.dart';
import 'package:teacher/features/Student/quiz/view/quiz_entry_screen.dart';
import 'package:teacher/features/Student/quiz/view/quiz_result_screen.dart';
import 'package:teacher/features/Student/role_teacher/bindings/subject_teacher_binding.dart';
import 'package:teacher/features/Student/role_teacher/view/subject_select_screen.dart';
import 'package:teacher/features/Student/saved_items/bindings/saved_items_binding.dart';
import 'package:teacher/features/Student/saved_items/view/saved_items_screen.dart';
import 'package:teacher/features/Student/settings/bindings/settings_binding.dart';
import 'package:teacher/features/Student/settings/view/settings_screen.dart';
import 'package:teacher/features/Student/subject/bindings/subject_binding.dart';
import 'package:teacher/features/Student/subject/view/subject_details_screen.dart';
import 'package:teacher/features/Student/subject/view/subject_lesson_screen.dart';
import 'package:teacher/features/Student/subject/view/subject_screen.dart';
import 'package:teacher/features/Student/subject/view/subject_tests_screen.dart';
import 'package:teacher/features/admin/attendance/binding/attendance_binding.dart';
import 'package:teacher/features/admin/attendance/view/attendance_screen.dart';
import 'package:teacher/features/admin/courses/binding/courses_binding.dart';
import 'package:teacher/features/admin/courses/view/course_details_screen.dart';
import 'package:teacher/features/admin/courses/view/courses_screen.dart';
import 'package:teacher/features/admin/exams_reviews_results/bindings/exams_rr_binding.dart';
import 'package:teacher/features/admin/exams_reviews_results/view/exams_rr_screen.dart';
import 'package:teacher/features/admin/admin_home/bindings/home_binding.dart';
import 'package:teacher/features/admin/admin_home/view/home_page/home_page.dart';
import 'package:teacher/features/admin/payments/binding/payments_binding.dart';
import 'package:teacher/features/admin/payments/view/payments_screen.dart';
import 'package:teacher/features/admin/reports/binding/reports_binding.dart';
import 'package:teacher/features/admin/reports/view/reports_screen.dart';
import 'package:teacher/features/admin/setting/binding/setting_binding.dart';
import 'package:teacher/features/admin/setting/view/setting_screen.dart';
import 'package:teacher/features/admin/user_management/bindings/user_management_binding.dart';
import 'package:teacher/features/admin/user_management/view/parents.dart';
import 'package:teacher/features/admin/user_management/view/students.dart';
import 'package:teacher/features/admin/user_management/view/user_management_screen.dart';
import 'package:teacher/features/admin/teachers/bindings/teachers_binding.dart';
import 'package:teacher/features/admin/teachers/view/teacher_account_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/teacher_analytics_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/teacher_form_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/teacher_permissions_screen.dart';
import 'package:teacher/features/auth/binding/student_register_binding.dart';
import 'package:teacher/features/auth/view/login/admin_login/Error_401_Page.dart';
import 'package:teacher/features/auth/view/login/admin_login/Error_403_Page.dart';
import 'package:teacher/features/auth/view/login/admin_login/admin_login_screen.dart';
import 'package:teacher/features/auth/view/login/admin_login/forget_password_admin.dart';
import 'package:teacher/features/auth/view/login/parent_login/parent_login_screen.dart';
import 'package:teacher/features/auth/view/login/student_login/forget_password_student.dart';
import 'package:teacher/features/auth/view/login/student_login/student_login_screen.dart';
import 'package:teacher/features/auth/view/login/teacher_login/forget_password_teacher.dart';
import 'package:teacher/features/auth/view/login/teacher_login/teacher_login_screen.dart';
import 'package:teacher/features/auth/view/register/view/student_register_screen.dart';
import 'features/auth/view/Onboarding/Onboarding_Screen.dart';
import 'features/auth/view/user_type_login/User_Type_login_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar_SA')
      .then((_) {
        if (kDebugMode) {
          print('Date formatting initialized for ar_SA');
        }
      })
      .catchError((error) {
        if (kDebugMode) {
          print('Error initializing date formatting for ar_SA: $error');
        }
      });
  if (kDebugMode) {
    print('Date formatting initialized for ar_SA');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: '/not_found',
        page: () => const _RouteNotFoundScreen(),
      ),

      title: 'Flutter Onboarding Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/user_type', page: () => UserTypeScreen()),
        GetPage(
          name: '/admin_login',
          page: () => AdminLoginScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/teacher_login',
          page: () => TeacherLoginScreen(),
          binding: TeachersBinding(),
        ),
        GetPage(
          name: '/student_login',
          page: () => StudentLoginScreen(),
          binding: UserManagementBinding(),
        ),
        GetPage(
          name: '/parent_login',
          page: () => ParentLoginScreen(),
          binding: UserManagementBinding(),
        ),
        GetPage(
          name: '/forget_password_admin',
          page: () => ForgotPasswordadminScreen(),
        ),
        GetPage(
          name: '/forget_password_teacher',
          page: () => ForgetPasswordTeacher(),
        ),
        GetPage(
          name: '/forget_password_student',
          page: () => ForgetPasswordStudent(),
        ),
        GetPage(name: '/error_403', page: () => Error403Page()),
        GetPage(name: '/error_401', page: () => Error401Page()),
        GetPage(
          name: '/home_admin',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/home_admin/user_management',
          page: () => UserManagementScreen(),
        ),
        GetPage(
          name: '/home_admin/teachers',
          page: () {
            return TeacherAccountScreen();
          },
          binding: TeachersBinding(),
        ),
        GetPage(
          name: '/teachers/teacher-form',
          page: () => const TeacherFormScreen(),
          binding: TeachersBinding(),
        ),
        GetPage(
          name: '/teachers/teacher-permissions',
          page: () => const TeacherPermissionsScreen(),
          binding: TeachersBinding(),
        ),
        GetPage(
          name: '/teachers/teacher-analytics',
          page: () => const TeacherAnalyticsScreen(),
          binding: TeachersBinding(),
        ),
        GetPage(
          name: '/user_management/students',
          page: () => const StudentsScreen(),
          binding: UserManagementBinding(),
        ),
        GetPage(
          name: '/user_management/parents',
          page: () => const ParentsScreen(),
          binding: UserManagementBinding(),
        ),
        GetPage(
          name: '/home_admin/exams_rr',
          page: () => const ExamsRRScreen(),
          binding: ExamsRRBinding(),
        ),
        GetPage(
          name: '/home_admin/attendance',
          page: () => const AttendanceScreen(),
          binding: AttendanceBinding(),
        ),
        GetPage(
          name: '/home_admin/courses',
          page: () => const CoursesScreen(),
          binding: CoursesBinding(),
        ),
        GetPage(
          name: '/home_admin/courses/details',
          page: () => const CourseDetailsScreen(),
        ),
        GetPage(
          name: '/home_admin/payments',
          page: () => const PaymentsScreen(),
          binding: PaymentsBinding(),
        ),
        GetPage(
          name: '/home_admin/reports',
          page: () => const ReportsScreen(),
          binding: ReportsBinding(),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingScreen(),
          binding: SettingBinding(),
        ),
        GetPage(
          name: '/home_student',
          page: () => const StudentHomePage(),
          binding: StudentHomeBinding(),
        ),
        GetPage(
          name: '/student-register',
          page: () => StudentRegisterScreen(),
          binding: StudentRegisterBinding(),
        ),
        GetPage(
          name: '/subjects',
          page: () => const SubjectSelectScreen(),
          binding: SubjectTeacherBinding(),
        ),
        GetPage(
          name: '/profile_student',
          page: () => const ProfileStudentScreen(),
          binding: ProfileStudentBinding(),
        ),
        GetPage(
          name: '/settings_student',
          page: () => const SettingsScreen(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: '/attendance_student',
          page: () => const AttendanceScreenStudent(),
          binding: AttendanceBindingtStudent(),
        ),
        GetPage(
          name: '/quiz-entry',
          page: () => const QuizEntryScreen(),
          binding: QuizBinding(),
        ),
        GetPage(
          name: '/quiz-exam',
          page: () => const QuizExamScreen(),
          binding: QuizBinding(),
        ),
        GetPage(
          name: '/quiz-result',
          page: () => const QuizResultScreen(),
          binding: QuizBinding(),
        ),
        GetPage(
          name: '/important_events',
          page: () => const ImportantEventsScreen(),
          binding: ImportantEventsBinding(),
        ),
        GetPage(
          name: '/courses',
          page: () => const SubjectScreen(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: '/courses/details',
          page: () => const SubjectDetailsScreen(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: '/courses/lesson',
          page: () => const SubjectLessonScreen(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: '/courses/tests',
          page: () => const SubjectTestsScreen(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: '/my_courses',
          page: () => const MyCoursesScreen(),
          binding: MyCoursesBinding(),
        ),
        GetPage(
          name: '/my_courses/details',
          page: () => const MyCourseDetailsScreen(),
          binding: MyCoursesBinding(),
        ),
        GetPage(
          name: '/communication_channel',
          page: () => const CommunicationChannelScreen(),
          binding: CommunicationChannelBinding(),
        ),
        GetPage(
          name: '/saved_items',
          page: () => const SavedItemsScreen(),
          binding: SavedItemsBinding(),
        ),
        GetPage(
          name: '/notifications_student',
          page: () => const NotificationStudentScreen(),
          binding: NotificationStudentBinding(),
        ),
      ],
    );
  }
}

class _RouteNotFoundScreen extends StatelessWidget {
  const _RouteNotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Ø§Ù„ØµÙØ­Ø© ØºÙŠØ± Ù…ÙˆØ¬ÙˆØ¯Ø©')),
    );
  }
}

class _StudentTempScreen extends StatelessWidget {
  final String title;

  const _StudentTempScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title - Ù‚Ø±ÙŠØ¨Ù‹Ø§')),
    );
  }
}
