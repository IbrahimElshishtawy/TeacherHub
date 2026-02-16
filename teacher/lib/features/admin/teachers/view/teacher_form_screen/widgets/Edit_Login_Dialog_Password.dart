import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Center_Dialog_Shell.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Edit_Login_Dialog_Name_Email.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Password_Input.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Password_Rules.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Primary_Button.dart';

class EditLoginDialogPassword extends StatefulWidget {
  final TeacherFormController form;
  const EditLoginDialogPassword({required this.form});

  @override
  State<EditLoginDialogPassword> createState() =>
      EditLoginDialogPasswordState();
}

class EditLoginDialogPasswordState extends State<EditLoginDialogPassword> {
  final _pass1 = TextEditingController();
  final _pass2 = TextEditingController();
  bool _show = false;

  @override
  void dispose() {
    _pass1.dispose();
    _pass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CenterDialogShell(
      title: 'تعديل بيانات تسجيل الدخول',
      tabs: const ['الاسم والبريد', 'كلمة المرور'],
      activeIndex: 1,
      onTapTab0: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => EditLoginDialogNameEmail(form: widget.form),
        );
      },
      onTapTab1: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          PasswordInput(
            controller: _pass1,
            hint: 'أدخل كلمة المرور الجديدة',
            show: _show,
            onToggle: () => setState(() => _show = !_show),
          ),
          const SizedBox(height: 10),
          PasswordInput(
            controller: _pass2,
            hint: 'أعد إدخال كلمة المرور',
            show: _show,
            onToggle: () => setState(() => _show = !_show),
          ),
          const SizedBox(height: 12),
          const PasswordRules(),
          const SizedBox(height: 14),
          PrimaryButton(
            text: 'حفظ التغييرات',
            onTap: () {
              final p1 = _pass1.text;
              final p2 = _pass2.text;

              if (p1.isEmpty || p2.isEmpty) {
                Get.snackbar('تنبيه', 'اكتب كلمة المرور مرتين');
                return;
              }
              if (p1 != p2) {
                Get.snackbar('تنبيه', 'كلمتا المرور غير متطابقتين');
                return;
              }

              widget.form.patch(password: p1);
              widget.form.save();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
