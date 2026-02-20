// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Center_Dialog_Shell.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Edit_Login_Dialog_Password.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Input.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/Primary_Button.dart';

class EditLoginDialogNameEmail extends StatefulWidget {
  final TeacherFormController form;

  const EditLoginDialogNameEmail({super.key, required this.form});

  @override
  _EditLoginDialogNameEmailState createState() =>
      _EditLoginDialogNameEmailState();
}

class _EditLoginDialogNameEmailState extends State<EditLoginDialogNameEmail> {
  late final TextEditingController _name;
  late final TextEditingController _email;

  @override
  void initState() {
    super.initState();
    final t = widget.form.teacher.value;
    _name = TextEditingController(text: t?.fullName ?? '');
    _email = TextEditingController(text: t?.email ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CenterDialogShell(
      title: 'تعديل بيانات تسجيل الدخول',
      tabs: const ['الاسم والبريد', 'كلمة المرور'],
      activeIndex: 0,
      onTapTab0: () {},
      onTapTab1: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => EditLoginDialogPassword(form: widget.form),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Input(
            controller: _name,
            hint: 'أدخل الاسم الكامل',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 10),
          Input(
            controller: _email,
            hint: 'أدخل البريد الإلكتروني',
            icon: Icons.alternate_email,
          ),
          const SizedBox(height: 14),
          PrimaryButton(
            text: 'حفظ التغييرات',
            onTap: () {
              if (_name.text.trim().isNotEmpty &&
                  _email.text.trim().isNotEmpty) {
                widget.form.patch(
                  fullName: _name.text.trim(),
                  email: _email.text.trim(),
                );
                widget.form.save();
                Navigator.pop(context); // Close dialog after saving
              } else {
                // Show error if the fields are empty
                Get.snackbar('تنبيه', 'الرجاء إدخال جميع البيانات');
              }
            },
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
