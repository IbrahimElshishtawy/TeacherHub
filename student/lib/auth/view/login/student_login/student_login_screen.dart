import 'package:flutter/material.dart';
import 'package:student/auth/view/login/widget.login/AppBar_Tap.dart';
import 'package:student/auth/view/login/widget.login/Text_body_login.dart';
import 'package:student/auth/view/login/widget.login/action_forget_bassword.dart';
import 'package:student/auth/view/login/widget.login/header_login_screan.dart';
import 'package:student/auth/view/login/widget.login/input_login.dart';
import 'package:student/auth/view/login/widget.login/login_btn.dart';
import 'package:student/auth/view/login/widget.login/text_register_click.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            ActionForgetBassword(forget: 'student'),
            // ===== login btn =====
            LoginBtn(),

            Align(
              alignment: AlignmentGeometry.bottomEnd,
              child: TextRegisterClick(),
            ),
          ],
        ),
      ),
    );
  }
}
