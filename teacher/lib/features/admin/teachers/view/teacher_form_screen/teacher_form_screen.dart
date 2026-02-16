import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Edit_Login_Dialog_Name_Email.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Edit_Login_Dialog_Password.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Header_Section.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Login_Card.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class TeacherFormScreen extends StatelessWidget {
  const TeacherFormScreen({super.key});

  static const _bg = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    final form = Get.find<TeacherFormController>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppbarTap(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderSection(),
                const SizedBox(height: 14),

                LoginCard(
                  form: form,
                  onTapEditNameEmail: () {
                    if (form.teacher.value == null) {
                      Get.snackbar(
                        'تنبيه',
                        'لا يوجد مدرس محدد للتعديل',
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(12),
                      );
                      return;
                    }
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => EditLoginDialogNameEmail(form: form),
                    );
                  },
                  onTapEditPassword: () {
                    if (form.teacher.value == null) {
                      Get.snackbar(
                        'تنبيه',
                        'لا يوجد مدرس محدد للتعديل',
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(12),
                      );
                      return;
                    }
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => EditLoginDialogPassword(form: form),
                    );
                  },
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
