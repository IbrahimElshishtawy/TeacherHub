import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart'; // Add FluentIcons package for Fluent Icons
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/device_activity_table.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/permission_toggle_row.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/view/teacher_permissions_screen/widgets/security_actions_widget.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class TeacherPermissionsScreen extends StatelessWidget {
  const TeacherPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<TeacherFormController>();

    return Scaffold(
      appBar: AppbarTap(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              child: Text(
                ' الأمان والتحكم',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            Align(
              child: Text(
                'إدارة أمان الحساب وصلاحيات الدخول',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 110, 122, 128),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SectionWithPermissions(
              title: '  الكورسات',
              icon: FluentIcons.screenshot_record_16_filled,
              children: [
                PermissionToggleRow(
                  title: 'إنشاء الكورسات',
                  permissionKey: 'courses_create',
                ),
                PermissionToggleRow(
                  title: 'تعديل الكورسات',
                  permissionKey: 'courses_edit',
                ),
                PermissionToggleRow(
                  title: 'حذف الكورسات',
                  permissionKey: 'courses_delete',
                ),
                PermissionToggleRow(
                  title: 'نشر/إخفاء الكورسات',
                  permissionKey: 'courses_publish_hide',
                ),
              ],
            ),
            SectionWithPermissions(
              title: 'محتوى التعلم',
              icon: FluentIcons.document_16_filled,
              children: [
                PermissionToggleRow(
                  title: 'رفع ملفات جديدة',
                  permissionKey: 'content_upload',
                ),
                PermissionToggleRow(
                  title: 'تعديل الملفات الموجودة',
                  permissionKey: 'content_edit',
                ),
                PermissionToggleRow(
                  title: 'حذف الملفات',
                  permissionKey: 'content_delete',
                ),
                PermissionToggleRow(
                  title: 'مشاركة الملفات مع كل الطلاب',
                  permissionKey: 'content_share_all_students',
                ),
                PermissionToggleRow(
                  title: 'إضافات كورسات خارجية “مدفوعة”',
                  permissionKey: 'content_add_paid_courses',
                ),
              ],
            ),
            SectionWithPermissions(
              title: 'الواجبات',
              icon: FluentIcons.task_list_add_20_filled,
              children: [
                PermissionToggleRow(
                  title: 'إنشاء الواجبات',
                  permissionKey: 'assignments_create',
                ),
                PermissionToggleRow(
                  title: 'تعديل الواجبات الحالية',
                  permissionKey: 'assignments_edit',
                ),
                PermissionToggleRow(
                  title: 'حذف الواجبات',
                  permissionKey: 'assignments_delete',
                ),
                PermissionToggleRow(
                  title: 'تعيين الواجبات لطلاب معينين',
                  permissionKey: 'assignments_assign_specific',
                ),
                PermissionToggleRow(
                  title: 'مراجعة الإجابات وإضافة درجات',
                  permissionKey: 'assignments_review_grade',
                ),
              ],
            ),
            SectionWithPermissions(
              title: 'الاختبارات',
              icon: FluentIcons.question_48_filled,
              children: [
                PermissionToggleRow(
                  title: 'إنشاء اختبارات جديدة',
                  permissionKey: 'exams_create',
                ),
                PermissionToggleRow(
                  title: 'تعديل الاختبارات',
                  permissionKey: 'exams_edit',
                ),
                PermissionToggleRow(
                  title: 'حذف الاختبارات',
                  permissionKey: 'exams_delete',
                ),
                PermissionToggleRow(
                  title: 'نشر الاختبارات للطلاب',
                  permissionKey: 'exams_publish_students',
                ),
                PermissionToggleRow(
                  title: 'الأطلاع علي درجات الطلاب',
                  permissionKey: 'exams_view_students_grades',
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Other sections...
            DeviceActivityCard(),
            const SizedBox(height: 20),

            // Security Actions
            SecurityActionsWidget(),
          ],
        ),
      ),
    );
  }
}
