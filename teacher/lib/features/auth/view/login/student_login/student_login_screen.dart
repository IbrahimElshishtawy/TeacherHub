import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/widget/AppBar_Tap.dart';
import 'package:teacher/features/auth/view/login/widget/Text_body_login.dart';
import 'package:teacher/features/auth/view/login/widget/action_forget_bassword.dart';
import 'package:teacher/features/auth/view/login/widget/header_login_screan.dart';
import 'package:teacher/features/auth/view/login/widget/input_login.dart';
import 'package:teacher/features/auth/view/login/widget/login_btn.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTap(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== HEADER =====
            HeaderLoginScrean(
              lottiePath: 'assets/lottie/Student transparent.json',
              title: 'Student',
              subtitle: 'التعلّم ومتابعة الدروس',
            ),

            /// ===== BODY =====
            TextBodyLogin(
              firstText:
                  'استخدم البريد الإلكتروني وكلمة المرور \nالتي أنشأتها عند التسجيل',
              secondText: 'يرجى ملء البيانات لتسجيل الدخول : ',
            ),

            // ===== login input ====
            InputLogin(
              emailTitle: 'اسم المستخدم',
              emailLabel: 'أدخل اسم المستخدم',
              passwordTitle: 'كلمة المرور',
              passwordLabel: 'أدخل كلمة المرور الخاصه بك',
            ),
            // ===== login forget password ====
            ActionForgetBassword(),
            // ===== login btn =====
            LoginBtn(),
          ],
        ),
      ),
    );
  }
}
