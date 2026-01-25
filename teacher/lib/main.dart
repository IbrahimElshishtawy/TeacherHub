import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/admin_login/admin_login_screen.dart';
import 'package:teacher/features/auth/view/login/parent_login/parent_login_screen.dart';
import 'package:teacher/features/auth/view/login/student_login/student_login_screen.dart';
import 'package:teacher/features/auth/view/login/teacher_login/teacher_login_screen.dart';
import 'features/auth/view/Onboarding/Onboarding_Screen.dart';
import 'features/auth/view/user_type/User_Type_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/user_type': (context) => UserTypeScreen(),
        '/admin_login': (context) => AdminLoginScreen(),
        '/teacher_login': (context) => TeacherLoginScreen(),
        '/student_login': (context) => StudentLoginScreen(),
        '/parent_login': (context) => ParentLoginScreen(),
      },
      home: OnboardingScreen(),
    );
  }
}
