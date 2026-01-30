import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';
import 'package:teacher/features/auth/view/login/widget.login/Text_body_login.dart';
import 'package:teacher/features/auth/view/login/widget.login/action_forget_bassword.dart';
import 'package:teacher/features/auth/view/login/widget.login/header_login_screan.dart';
import 'package:teacher/features/auth/view/login/widget.login/input_login.dart';
import 'package:teacher/features/auth/view/login/widget.login/login_btn.dart';

class TeacherLoginScreen extends StatelessWidget {
  const TeacherLoginScreen({super.key});

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
              lottiePath: 'assets/lottie/Teacher.json',
              title: 'Teacher',
              subtitle: 'إنشاء وإدارة الدروس',
            ),

            /// ===== BODY =====
            TextBodyLogin(
              firstText:
                  'استخدم البريد الإلكتروني وكلمة المرور\nالمرسل إليك من Admin',
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
