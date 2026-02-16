import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/device_activity_table.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/permission_toggle_row.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/security_actions_widget.dart';

class TeacherPermissionsScreen extends StatelessWidget {
  const TeacherPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصلاحيات و الأذونات'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              title: 'الصلاحيات و الكورسات',
              children: [
                PermissionToggleRow(title: 'إنشاء الكورسات'),
                PermissionToggleRow(title: 'تعديل الكورسات'),
                PermissionToggleRow(title: 'حذف الكورسات'),
                PermissionToggleRow(title: 'نشر/إخفاء الكورسات'),
              ],
            ),
            _buildSection(
              title: 'محتوى التعلم',
              children: [
                PermissionToggleRow(title: 'رفع ملفات جديدة'),
                PermissionToggleRow(title: 'تعديل الملفات الموجودة'),
                PermissionToggleRow(title: 'حذف الملفات'),
                PermissionToggleRow(title: 'مشاركة الملفات مع كل الطلاب'),
                PermissionToggleRow(title: 'إضافات كورسات خارجية “مدفوعة”'),
              ],
            ),
            _buildSection(
              title: 'الواجبات',
              children: [
                PermissionToggleRow(title: 'إنشاء الواجبات'),
                PermissionToggleRow(title: 'تعديل الواجبات الحالية'),
                PermissionToggleRow(title: 'حذف الواجبات'),
                PermissionToggleRow(title: 'تعيين الواجبات لطلاب معينين'),
                PermissionToggleRow(title: 'مراجعة الإجابات وإضافة درجات'),
              ],
            ),
            _buildSection(
              title: 'الاختبارات',
              children: [
                PermissionToggleRow(title: 'إنشاء اختبارات جديدة'),
                PermissionToggleRow(title: 'تعديل الاختبارات'),
                PermissionToggleRow(title: 'حذف الاختبارات'),
                PermissionToggleRow(title: 'نشر الاختبارات للطلاب'),
                PermissionToggleRow(title: 'الأطلاع علي درجات الطلاب'),
              ],
            ),
            const SizedBox(height: 10),

            // Other sections...
            _buildDeviceActivityCard(),
            const SizedBox(height: 20),

            // Security Actions
            SecurityActionsWidget(),
          ],
        ),
      ),
    );
  }

  // Section builder for reusability
  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2A3B),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }

  // Device activity card section
  Widget _buildDeviceActivityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'الأجهزة والنشاط',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2A3B),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [DeviceActivityTable()],
          ),
          const SizedBox(height: 10),
          Text(
            'محاولة تسجيل الدخول من جهاز غير معروف مدرسياً.\n'
            'نوع المستخدم: طالب / غير معروف\n'
            'نوع الجهاز: iPhone\n'
            'وقت محاولة التسجيل: 3:10AM 2/1/2026\n'
            'ID: 123456',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
