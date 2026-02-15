import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/state/teacher_account_state.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/button_pop_account_teacher.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/copy_field.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class CreateTeacherScreen extends StatefulWidget {
  final String selectedOption;
  const CreateTeacherScreen({super.key, required this.selectedOption});

  @override
  State<CreateTeacherScreen> createState() => _CreateTeacherScreenState();
}

class _CreateTeacherScreenState extends State<CreateTeacherScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late final TeacherFormController _form;
  Worker? _worker; // ✅ nullable

  static const _bg = Color(0xFFF6F8FC);
  static const _titleColor = Color(0xFF1E2A3B);
  static const _subColor = Color(0xFF6B7C93);

  @override
  void initState() {
    super.initState();
    _form = Get.find<TeacherFormController>();
    _syncFromTeacher(_form.teacher.value);
    _worker = ever<TeacherAccountState?>(_form.teacher, (t) {
      _syncFromTeacher(t);
    });
  }

  void _syncFromTeacher(TeacherAccountState? t) {
    if (t == null) return;
    _usernameController.text = t.email;
    _passwordController.text = t.password;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _worker?.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppbarTap(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'حساب المدرس الجديد',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: _titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                const Text(
                  'تم إنشاء الحساب بنجاح إليك بيانات تسجيل الدخول للمدرس:',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _subColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),

                CopyField(label: 'اسم الحساب', controller: _usernameController),
                const SizedBox(height: 12),
                CopyField(
                  label: 'كلمة المرور',
                  controller: _passwordController,
                ),

                const SizedBox(height: 10),
                ButtonWidget(
                  onPressed: _onCreateAccount,
                  email: _usernameController.text,
                  password: _passwordController.text,
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCreateAccount() {
    _form.patch(
      email: _usernameController.text.trim(),
      password: _passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إنشاء الحساب بنجاح'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
