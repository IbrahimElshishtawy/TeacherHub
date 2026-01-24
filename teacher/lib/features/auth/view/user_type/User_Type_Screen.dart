// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("من سيستخدم التطبيق؟")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ساعدنا في تخصيص تجربتك داخل التطبيق',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildUserTypeTile(
              context,
              title: 'Admin',
              lottieAsset: 'assets/lottie/admin.json',
              onTap: () => Navigator.pushNamed(context, '/admin_dashboard'),
            ),
            _buildUserTypeTile(
              context,
              title: 'Teacher',
              lottieAsset: 'assets/lottie/Teacher.json',
              onTap: () => Navigator.pushNamed(context, '/teacher_dashboard'),
            ),
            _buildUserTypeTile(
              context,
              title: 'Student',
              lottieAsset: 'assets/lottie/Student transparent.json',
              onTap: () => Navigator.pushNamed(context, '/student_dashboard'),
            ),
            _buildUserTypeTile(
              context,
              title: 'Parent',
              lottieAsset: 'assets/lottie/present.json',
              onTap: () => Navigator.pushNamed(context, '/parent_dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTypeTile(
    BuildContext context, {
    required String title,
    required String lottieAsset,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Lottie.asset(
            lottieAsset,
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('إدارة النظام داخل التطبيق'),
        ),
      ),
    );
  }
}
