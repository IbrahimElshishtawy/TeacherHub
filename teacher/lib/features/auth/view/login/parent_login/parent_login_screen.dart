import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';
import 'package:teacher/features/auth/view/login/widget.login/Text_body_login.dart';
import 'package:teacher/features/auth/view/login/widget.login/action_forget_bassword.dart';
import 'package:teacher/features/auth/view/login/widget.login/header_login_screan.dart';
import 'package:teacher/features/auth/view/login/widget.login/input_login.dart';
import 'package:teacher/features/auth/view/login/widget.login/login_btn.dart';

class ParentLoginScreen extends StatelessWidget {
  const ParentLoginScreen({super.key});

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
              lottiePath: 'assets/lottie/Book loading.json',
              title: 'parent',
              subtitle: 'تابع تعلم أبنك ومتابعة دروسه بسهولة',
            ),

            /// ===== BODY =====
            TextBodyLogin(
              firstText:
                  'استخدم معرّف الطالب (ID) وكلمة المرور \nالتي أنشأتها عند التسجيل',
              secondText: 'يرجى ملء البيانات لتسجيل الدخول : ',
            ),

            // ===== login input ====
            InputLogin(
              emailTitle: 'معرف الطالب ID',
              emailLabel: 'أدخل معرّف الطالب (ID)',
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
