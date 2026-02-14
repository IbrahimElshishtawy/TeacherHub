// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/Create_Teacher_Header.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class StepPermissions extends StatefulWidget {
  final String selectedOption;
  const StepPermissions({super.key, required this.selectedOption});

  @override
  State<StepPermissions> createState() => _StepPermissionsState();
}

class _StepPermissionsState extends State<StepPermissions> {
  // ====== UI colors (match your design) ======
  static const _bg = Color(0xFFF6F8FC);
  static const _cardBorder = Color(0xFFE6ECF5);
  static const _titleColor = Color(0xFF1E2A3B);
  static const _subColor = Color(0xFF6B7C93);
  static const _primary = Color(0xFF2F6FED);

  // ====== Permissions state ======
  // You can send this map to API later.
  final Map<String, bool> _permissions = {
    // Courses
    'courses_create': false,
    'courses_edit': false,
    'courses_delete': false,
    'courses_publish_hide': false,

    // Content
    'content_upload': false,
    'content_edit': false,
    'content_delete': false,
    'content_share_all_students': false,
    'content_add_paid_courses': false,

    // Assignments
    'assignments_create': false,
    'assignments_edit': false,
    'assignments_delete': false,
    'assignments_assign_specific': false,
    'assignments_review_grade': false,

    // Exams
    'exams_create': false,
    'exams_edit': false,
    'exams_delete': false,
    'exams_publish_students': false,
    'exams_view_students_grades': false,
  };

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppbarTap(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      const CreateTeacherHeaderWidget(
                        currentStep: 3,
                        completedSteps: [true, true, false],
                      ),
                      const SizedBox(height: 10),

                      _pageTitle(),
                      const SizedBox(height: 12),

                      _sectionCard(
                        title: 'الكورسات',
                        icon: Icons.video_library_outlined,
                        items: [
                          _PermItem('إنشاء الكورسات', 'courses_create'),
                          _PermItem('تعديل الكورسات', 'courses_edit'),
                          _PermItem('حذف الكورسات', 'courses_delete'),
                          _PermItem(
                            'نشر/إخفاء الكورسات',
                            'courses_publish_hide',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      _sectionCard(
                        title: 'محتوى التعلم',
                        icon: Icons.description_outlined,
                        items: [
                          _PermItem('رفع ملفات جديدة', 'content_upload'),
                          _PermItem('تعديل الملفات الموجودة', 'content_edit'),
                          _PermItem('حذف الملفات', 'content_delete'),
                          _PermItem(
                            'مشاركة الملفات مع كل الطلاب',
                            'content_share_all_students',
                          ),
                          _PermItem(
                            'إضافة كورسات خارجية "مدفوعة"',
                            'content_add_paid_courses',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      _sectionCard(
                        title: 'الواجبات',
                        icon: Icons.assignment_outlined,
                        items: [
                          _PermItem('إنشاء الواجبات', 'assignments_create'),
                          _PermItem(
                            'تعديل الواجبات الحالية',
                            'assignments_edit',
                          ),
                          _PermItem('حذف الواجبات', 'assignments_delete'),
                          _PermItem(
                            'تعيين الواجبات لطلاب معينين',
                            'assignments_assign_specific',
                          ),
                          _PermItem(
                            'مراجعة الإجابات وإضافة درجات',
                            'assignments_review_grade',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      _sectionCard(
                        title: 'الاختبارات',
                        icon: Icons.quiz_outlined,
                        items: [
                          _PermItem('إنشاء اختبارات جديدة', 'exams_create'),
                          _PermItem('تعديل الاختبارات', 'exams_edit'),
                          _PermItem('حذف الاختبارات', 'exams_delete'),
                          _PermItem(
                            'نشر الاختبارات للطلاب',
                            'exams_publish_students',
                          ),
                          _PermItem(
                            'الإطلاع على درجات الطلاب',
                            'exams_view_students_grades',
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              // Bottom button (fixed)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onCreateAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'إنشاء الحساب',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
        children: const [
          Text(
            'الصلاحيات والأذونات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: _titleColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'تحديد ما يمكن للمدرس فعله داخل النظام',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _subColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<_PermItem> items,
  }) {
    return Container(
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
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: _primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: _titleColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: _cardBorder),
          const SizedBox(height: 6),

          // items
          ...items.map((e) => _permRow(title: e.title, keyName: e.keyName)),
        ],
      ),
    );
  }

  Widget _permRow({required String title, required String keyName}) {
    final value = _permissions[keyName] ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // switch (left in RTL)
          Transform.scale(
            scale: 0.95,
            child: Switch(
              value: value,
              onChanged: (v) {
                setState(() => _permissions[keyName] = v);
              },
              activeColor: _primary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: _titleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCreateAccount() {
    // هنا تقدر تبعت _permissions للـ API
    // وكمان تستخدم widget.selectedOption لو محتاج

    // مثال سريع:
    // print(widget.selectedOption);
    // print(_permissions);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ الصلاحيات (تجريبيًا)'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}

class _PermItem {
  final String title;
  final String keyName;

  const _PermItem(this.title, this.keyName);
}
