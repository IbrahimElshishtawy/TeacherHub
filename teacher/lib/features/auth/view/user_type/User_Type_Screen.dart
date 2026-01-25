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
            Spacer(flex: 3),
            Text(
              "من سيستخدم التطبيق؟",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'يساعدنا هذا في تخصيص تجربتك داخل التطبيق',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Use UserChoseaTypelogin widget for each user type
            UserChoseaTypelogin(
              title: 'Admin',
              lottieAsset: 'assets/lottie/admin.json',
              onTap: () => Navigator.pushNamed(context, '/admin_dashboard'),
              subtitle: 'إدارة النظام والمستخدمين',
            ),
            UserChoseaTypelogin(
              title: 'Teacher',
              lottieAsset: 'assets/lottie/Teacher.json',
              onTap: () => Navigator.pushNamed(context, '/teacher_dashboard'),
              subtitle: 'إنشاء وإدارة الدروس',
            ),
            UserChoseaTypelogin(
              title: 'Student',
              lottieAsset: 'assets/lottie/Student transparent.json',
              onTap: () => Navigator.pushNamed(context, '/student_dashboard'),
              subtitle: 'التعلّم ومتابعة الدروس',
            ),
            UserChoseaTypelogin(
              title: 'Parent',
              lottieAsset: 'assets/lottie/present.json',
              onTap: () => Navigator.pushNamed(context, '/parent_dashboard'),
              subtitle: 'تابع تعلم أبنك ومتابعة دروسه بسهولة',
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
