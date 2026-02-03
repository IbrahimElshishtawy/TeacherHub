import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Onboarding Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/user_type': (context) => UserTypeScreen(),
        '/admin_login': (context) => AdminLoginScreen(),
        '/teacher_login': (context) => TeacherLoginScreen(),
        '/student_login': (context) => StudentLoginScreen(),
        '/parent_login': (context) => ParentLoginScreen(),
        '/forget_password_admin': (context) => ForgotPasswordadminScreen(),
        '/forget_password_teacher': (context) => ForgetPasswordTeacher(),
        '/forget_password_student': (context) => ForgetPasswordStudent(),
        '/error_403': (context) => Error403Page(),
        '/error_401': (context) => Error401Page(),
        '/home_admin': (context) => HomePage(),
      },
      home: OnboardingScreen(),
    );
  }
}
