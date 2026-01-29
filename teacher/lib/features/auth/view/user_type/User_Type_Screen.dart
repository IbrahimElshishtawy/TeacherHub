// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'widgets/user_chosea_typelogin.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            Text(
              "من سيستخدم التطبيق؟",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'يساعدنا هذا في تخصيص تجربتك داخل التطبيق',
              style: TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Use UserChoseaTypelogin widget for each user type
            UserChoseaTypelogin(
              title: 'Admin',
              lottieAsset: 'assets/lottie/admin.json',
              onTap: () => Navigator.pushNamed(context, '/admin_login'),
              subtitle: 'إدارة النظام والمستخدمين',
            ),
            SizedBox(height: 10),
            UserChoseaTypelogin(
              title: 'Teacher',
              lottieAsset: 'assets/lottie/Teacher.json',
              onTap: () => Navigator.pushNamed(context, '/teacher_login'),
              subtitle: 'إنشاء وإدارة الدروس',
            ),
            SizedBox(height: 10),
            UserChoseaTypelogin(
              title: 'Student',
              lottieAsset: 'assets/lottie/Student transparent.json',
              onTap: () => Navigator.pushNamed(context, '/student_login'),
              subtitle: 'التعلّم ومتابعة الدروس',
            ),
            SizedBox(height: 10),
            UserChoseaTypelogin(
              title: 'Parent',
              lottieAsset: 'assets/lottie/Book loading.json',
              onTap: () => Navigator.pushNamed(context, '/parent_login'),
              subtitle: 'تابع تعلم أبنك ومتابعة دروسه بسهولة',
            ),

            // Spacer to push the content to the top and add a gap at the bottom
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
