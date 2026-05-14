import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/app/routes/app_routes.dart';
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
import 'package:teacher/features/Student/quiz/view/quiz_entry_screen.dart';
import 'package:teacher/features/Student/quiz/view/quiz_exam_screen.dart';
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
import 'package:teacher/features/admin/admin_home/bindings/home_binding.dart';
import 'package:teacher/features/admin/admin_home/view/home_page/home_page.dart';
import 'package:teacher/features/admin/attendance/binding/attendance_binding.dart';
import 'package:teacher/features/admin/attendance/view/attendance_screen.dart';
import 'package:teacher/features/admin/courses/binding/courses_binding.dart';
import 'package:teacher/features/admin/courses/view/course_details_screen.dart';
import 'package:teacher/features/admin/courses/view/courses_screen.dart';
import 'package:teacher/features/admin/exams_reviews_results/bindings/exams_rr_binding.dart';
import 'package:teacher/features/admin/exams_reviews_results/view/exams_rr_screen.dart';
import 'package:teacher/features/admin/payments/binding/payments_binding.dart';
import 'package:teacher/features/admin/payments/view/payments_screen.dart';
import 'package:teacher/features/admin/reports/binding/reports_binding.dart';
import 'package:teacher/features/admin/reports/view/reports_screen.dart';
import 'package:teacher/features/admin/setting/binding/setting_binding.dart';
import 'package:teacher/features/admin/setting/view/setting_screen.dart';
import 'package:teacher/features/admin/teachers/bindings/teachers_binding.dart';
import 'package:teacher/features/admin/teachers/view/teacher_account_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/teacher_analytics_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/teacher_form_screen.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/teacher_permissions_screen.dart';
import 'package:teacher/features/admin/user_management/bindings/user_management_binding.dart';
import 'package:teacher/features/admin/user_management/view/parents.dart';
import 'package:teacher/features/admin/user_management/view/students.dart';
import 'package:teacher/features/admin/user_management/view/user_management_screen.dart';
import 'package:teacher/features/auth/binding/student_register_binding.dart';
import 'package:teacher/features/auth/view/Onboarding/Onboarding_Screen.dart';
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
import 'package:teacher/features/auth/view/user_type_login/User_Type_login_Screen.dart';
import 'package:teacher/features/teacher/home_teacher/bindings/teacher_home_binding.dart';
import 'package:teacher/features/teacher/home_teacher/view/home_page/home_page.dart';

class AppPages {
  const AppPages._();

  static final unknownRoute = GetPage(
    name: AppRoutes.notFound,
    page: () => const AppRouteNotFoundScreen(),
  );

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.userType, page: () => UserTypeScreen()),
    GetPage(
      name: AppRoutes.adminLogin,
      page: () => AdminLoginScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.teacherLogin,
      page: () => TeacherLoginScreen(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: AppRoutes.studentLogin,
      page: () => StudentLoginScreen(),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.parentLogin,
      page: () => ParentLoginScreen(),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPasswordAdmin,
      page: () => ForgotPasswordadminScreen(),
    ),
    GetPage(
      name: AppRoutes.forgetPasswordTeacher,
      page: () => ForgetPasswordTeacher(),
    ),
    GetPage(
      name: AppRoutes.forgetPasswordStudent,
      page: () => ForgetPasswordStudent(),
    ),
    GetPage(name: AppRoutes.error403, page: () => Error403Page()),
    GetPage(name: AppRoutes.error401, page: () => Error401Page()),
    GetPage(
      name: AppRoutes.homeAdmin,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminUserManagement,
      page: () => UserManagementScreen(),
    ),
    GetPage(
      name: AppRoutes.homeAdminTeachers,
      page: () => TeacherAccountScreen(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: AppRoutes.teachersForm,
      page: () => const TeacherFormScreen(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: AppRoutes.teachersPermissions,
      page: () => const TeacherPermissionsScreen(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: AppRoutes.teachersAnalytics,
      page: () => const TeacherAnalyticsScreen(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: AppRoutes.userManagementStudents,
      page: () => const StudentsScreen(),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.userManagementParents,
      page: () => const ParentsScreen(),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminExamsRR,
      page: () => const ExamsRRScreen(),
      binding: ExamsRRBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminAttendance,
      page: () => const AttendanceScreen(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminCourses,
      page: () => const CoursesScreen(),
      binding: CoursesBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminCourseDetails,
      page: () => const CourseDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.homeAdminPayments,
      page: () => const PaymentsScreen(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAdminReports,
      page: () => const ReportsScreen(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.homeStudent,
      page: () => const StudentHomePage(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeTeacher,
      page: () => const teacherHomePage(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.studentRegister,
      page: () => StudentRegisterScreen(),
      binding: StudentRegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.subjects,
      page: () => const SubjectSelectScreen(),
      binding: SubjectTeacherBinding(),
    ),
    GetPage(
      name: AppRoutes.profileStudent,
      page: () => const ProfileStudentScreen(),
      binding: ProfileStudentBinding(),
    ),
    GetPage(
      name: AppRoutes.settingsStudent,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.attendanceStudent,
      page: () => const AttendanceScreenStudent(),
      binding: AttendanceBindingtStudent(),
    ),
    GetPage(
      name: AppRoutes.quizEntry,
      page: () => const QuizEntryScreen(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.quizExam,
      page: () => const QuizExamScreen(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.quizResult,
      page: () => const QuizResultScreen(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: AppRoutes.importantEvents,
      page: () => const ImportantEventsScreen(),
      binding: ImportantEventsBinding(),
    ),
    GetPage(
      name: AppRoutes.courses,
      page: () => const SubjectScreen(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: AppRoutes.coursesDetails,
      page: () => const SubjectDetailsScreen(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: AppRoutes.coursesLesson,
      page: () => const SubjectLessonScreen(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: AppRoutes.coursesTests,
      page: () => const SubjectTestsScreen(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: AppRoutes.myCourses,
      page: () => const MyCoursesScreen(),
      binding: MyCoursesBinding(),
    ),
    GetPage(
      name: AppRoutes.myCoursesDetails,
      page: () => const MyCourseDetailsScreen(),
      binding: MyCoursesBinding(),
    ),
    GetPage(
      name: AppRoutes.communicationChannel,
      page: () => const CommunicationChannelScreen(),
      binding: CommunicationChannelBinding(),
    ),
    GetPage(
      name: AppRoutes.savedItems,
      page: () => const SavedItemsScreen(),
      binding: SavedItemsBinding(),
    ),
    GetPage(
      name: AppRoutes.notificationsStudent,
      page: () => const NotificationStudentScreen(),
      binding: NotificationStudentBinding(),
    ),
  ];
}

class AppRouteNotFoundScreen extends StatelessWidget {
  const AppRouteNotFoundScreen({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(child: Text('الصفحة غير موجودة')),
    );
  }
}
