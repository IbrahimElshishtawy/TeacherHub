// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class CreateTeacherScreen extends StatefulWidget {
  final String selectedOption;
  const CreateTeacherScreen({super.key, required this.selectedOption});

  @override
  State<CreateTeacherScreen> createState() => _CreateTeacherScreenState();
}

class _CreateTeacherScreenState extends State<CreateTeacherScreen> {
  final _usernameController = TextEditingController(text: "MohamedAli@53");
  final _passwordController = TextEditingController(text: "125I26Aa");

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  static const _bg = Color(0xFFF6F8FC);
  static const _cardBorder = Color(0xFFE6ECF5);
  static const _primary = Color(0xFF2F6FED);
  static const _titleColor = Color(0xFF1E2A3B);
  static const _subColor = Color(0xFF6B7C93);

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

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: _cardBorder),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 14,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _label('اسم الحساب'),
                      const SizedBox(height: 8),
                      _copyField(
                        controller: _usernameController,
                        onCopy: () =>
                            _copyToClipboard(_usernameController.text),
                      ),

                      const SizedBox(height: 12),

                      _label('كلمة المرور'),
                      const SizedBox(height: 8),
                      _copyField(
                        controller: _passwordController,
                        onCopy: () =>
                            _copyToClipboard(_passwordController.text),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'الرجوع للرئيسية',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget _copyField({
    required TextEditingController controller,
    required VoidCallback onCopy,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onCopy,
              icon: const Icon(
                Icons.copy_rounded,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'نسخ',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: true,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2B3A4F),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  void _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم النسخ'),
        duration: Duration(milliseconds: 900),
      ),
    );
  }
}
