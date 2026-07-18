import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/app/routes/app_routes.dart';
import 'package:student/Student/Student_home/bindings/Student_home_binding.dart';
import 'package:student/Student/Student_home/view/home_page/home_page.dart';
import 'package:student/Student/attendance/bindings/attendance_binding.dart';
import 'package:student/Student/attendance/view/attendance_screen.dart';
import 'package:student/Student/communication_channel/bindings/communication_channel_binding.dart';
import 'package:student/Student/communication_channel/view/communication_channel_screen.dart';
import 'package:student/Student/important_events_student/bindings/important_events_binding.dart';
import 'package:student/Student/important_events_student/view/important_events_screen.dart';
import 'package:student/Student/my_courses/bindings/my_courses_binding.dart';
import 'package:student/Student/my_courses/view/my_course_details_screen.dart';
import 'package:student/Student/my_courses/view/my_courses_screen.dart';
import 'package:student/Student/notification_student/bindings/notification_student_binding.dart';
import 'package:student/Student/notification_student/view/notification_student_screen.dart';
import 'package:student/Student/profile_student/bindings/profile_student_binding.dart';
import 'package:student/Student/profile_student/view/profile_student_screen.dart';
import 'package:student/Student/quiz/bindings/quiz_binding.dart';
import 'package:student/Student/quiz/view/quiz_entry_screen.dart';
import 'package:student/Student/quiz/view/quiz_exam_screen.dart';
import 'package:student/Student/quiz/view/quiz_result_screen.dart';
import 'package:student/Student/role_teacher/bindings/subject_teacher_binding.dart';
import 'package:student/Student/role_teacher/view/subject_select_screen.dart';
import 'package:student/Student/saved_items/bindings/saved_items_binding.dart';
import 'package:student/Student/saved_items/view/saved_items_screen.dart';
import 'package:student/Student/settings/bindings/settings_binding.dart';
import 'package:student/Student/settings/view/settings_screen.dart';
import 'package:student/Student/subject/bindings/subject_binding.dart';
import 'package:student/Student/subject/view/subject_details_screen.dart';
import 'package:student/Student/subject/view/subject_lesson_screen.dart';
import 'package:student/Student/subject/view/subject_screen.dart';
import 'package:student/Student/subject/view/subject_tests_screen.dart';
import 'package:student/auth/binding/student_register_binding.dart';
import 'package:student/auth/view/login/student_login/student_login_screen.dart';
import 'package:student/auth/view/register/view/student_register_screen.dart';
import 'package:student/auth/view/user_type_login/User_Type_login_Screen.dart';

class AppPages {
  const AppPages._();

  static final unknownRoute = GetPage(
    name: AppRoutes.notFound,
    page: () => const AppRouteNotFoundScreen(),
  );

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppRoutes.userType, page: () => UserTypeScreen()),
    GetPage(
      name: AppRoutes.studentLogin,
      page: () => StudentLoginScreen(),
    ),
    GetPage(
      name: AppRoutes.homeStudent,
      page: () => const StudentHomePage(),
      binding: StudentHomeBinding(),
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
