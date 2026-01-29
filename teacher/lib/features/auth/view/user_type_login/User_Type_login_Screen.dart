// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'widgets/user_chosea_typelogin.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(flex: 2),

            const Text(
              "من سيستخدم التطبيق؟",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              'يساعدنا هذا في تخصيص تجربتك داخل التطبيق',
              style: TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            /// ===== Admin =====
            UserChoseaTypelogin(
              title: 'Admin',
              subtitle: 'إدارة النظام والمستخدمين',
              lottieAsset: 'assets/lottie/admin.json',
              isSelected: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pushNamed(context, '/admin_login');
              },
            ),

            const SizedBox(height: 10),

            /// ===== Teacher =====
            UserChoseaTypelogin(
              title: 'Teacher',
              subtitle: 'إنشاء وإدارة الدروس',
              lottieAsset: 'assets/lottie/Teacher.json',
              isSelected: selectedIndex == 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pushNamed(context, '/teacher_login');
              },
            ),

            const SizedBox(height: 10),

            /// ===== Student =====
            UserChoseaTypelogin(
              title: 'Student',
              subtitle: 'التعلّم ومتابعة الدروس',
              lottieAsset: 'assets/lottie/Student transparent.json',
              isSelected: selectedIndex == 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pushNamed(context, '/student_login');
              },
            ),

            const SizedBox(height: 10),

            /// ===== Parent =====
            UserChoseaTypelogin(
              title: 'Parent',
              subtitle: 'تابع تعلم أبنك ومتابعة دروسه بسهولة',
              lottieAsset: 'assets/lottie/Book loading.json',
              isSelected: selectedIndex == 3,
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.pushNamed(context, '/parent_login');
              },
            ),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
