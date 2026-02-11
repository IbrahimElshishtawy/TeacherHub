import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/bindings/home_binding.dart';
import 'package:teacher/features/admin/home/view/home_page.dart';
import 'package:teacher/features/auth/view/login/admin_login/Error_401_Page.dart';
import 'package:teacher/features/auth/view/login/admin_login/Error_403_Page.dart';
import 'package:teacher/features/auth/view/login/admin_login/admin_login_screen.dart';
import 'package:teacher/features/auth/view/login/admin_login/forget_password_admin.dart';
import 'package:teacher/features/auth/view/login/parent_login/parent_login_screen.dart';
import 'package:teacher/features/auth/view/login/student_login/forget_password_student.dart';
import 'package:teacher/features/auth/view/login/student_login/student_login_screen.dart';
import 'package:teacher/features/auth/view/login/teacher_login/forget_password_teacher.dart';
import 'package:teacher/features/auth/view/login/teacher_login/teacher_login_screen.dart';
import 'features/auth/view/Onboarding/Onboarding_Screen.dart';
import 'features/auth/view/user_type_login/User_Type_login_Screen.dart';
// Import GetX

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Onboarding Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnboardingScreen(),
      getPages: [
        // Define your routes here with bindings
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/user_type', page: () => UserTypeScreen()),
        GetPage(name: '/admin_login', page: () => AdminLoginScreen()),
        GetPage(name: '/teacher_login', page: () => TeacherLoginScreen()),
        GetPage(name: '/student_login', page: () => StudentLoginScreen()),
        GetPage(name: '/parent_login', page: () => ParentLoginScreen()),
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
          binding:
              HomeBinding(), // Use HomeBinding here to register dependencies
        ),
      ],
    );
  }
}
