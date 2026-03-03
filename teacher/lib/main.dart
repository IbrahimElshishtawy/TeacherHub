import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:teacher/features/Student/Student_home/bindings/Student_home_binding.dart';
import 'package:teacher/features/Student/Student_home/view/home_page/home_page.dart';
import 'package:teacher/features/Student/role_teacher/bindings/subject_teacher_binding.dart';
import 'package:teacher/features/Student/role_teacher/view/subject_select_screen.dart';
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
  await initializeDateFormatting('ar_SA', '')
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

      title: 'Flutter Onboarding Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
      getPages: [
        // Define your routes here with bindings
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

        // Teachers Screens
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
          name: '/not-found',
          page: () =>
              const Scaffold(body: Center(child: Text('Route Not Found'))),
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
      ],
    );
  }
}
