// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/create_teacher_screen.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_3/permissions_colors.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_3/permissions_page_title.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_3/permissions_section_card.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/Create_Teacher_Header.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

import 'models/perm_item.dart';

class StepPermissions extends StatefulWidget {
  final String selectedOption;
  const StepPermissions({super.key, required this.selectedOption});

  @override
  State<StepPermissions> createState() => _StepPermissionsState();
}

class _StepPermissionsState extends State<StepPermissions> {
  final Map<String, bool> permissions = {
    'courses_create': false,
    'courses_edit': false,
    'courses_delete': false,
    'courses_publish_hide': false,
    'content_upload': false,
    'content_edit': false,
    'content_delete': false,
    'content_share_all_students': false,
    'content_add_paid_courses': false,
    'assignments_create': false,
    'assignments_edit': false,
    'assignments_delete': false,
    'assignments_assign_specific': false,
    'assignments_review_grade': false,
    'exams_create': false,
    'exams_edit': false,
    'exams_delete': false,
    'exams_publish_students': false,
    'exams_view_students_grades': false,
  };

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: PermColors.bg,
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
                      const PermissionsPageTitle(),
                      const SizedBox(height: 12),

                      PermissionsSectionCard(
                        title: 'الكورسات',
                        icon: Icons.video_library_outlined,
                        items: const [
                          PermItem('إنشاء الكورسات', 'courses_create'),
                          PermItem('تعديل الكورسات', 'courses_edit'),
                          PermItem('حذف الكورسات', 'courses_delete'),
                          PermItem(
                            'نشر/إخفاء الكورسات',
                            'courses_publish_hide',
                          ),
                        ],
                        values: permissions,
                        onChanged: (key, value) {
                          setState(() => permissions[key] = value);
                        },
                      ),
                      const SizedBox(height: 12),

                      PermissionsSectionCard(
                        title: 'محتوى التعلم',
                        icon: Icons.description_outlined,
                        items: const [
                          PermItem('رفع ملفات جديدة', 'content_upload'),
                          PermItem('تعديل الملفات الموجودة', 'content_edit'),
                          PermItem('حذف الملفات', 'content_delete'),
                          PermItem(
                            'مشاركة الملفات مع كل الطلاب',
                            'content_share_all_students',
                          ),
                          PermItem(
                            'إضافة كورسات خارجية "مدفوعة"',
                            'content_add_paid_courses',
                          ),
                        ],
                        values: permissions,
                        onChanged: (key, value) {
                          setState(() => permissions[key] = value);
                        },
                      ),
                      const SizedBox(height: 12),

                      PermissionsSectionCard(
                        title: 'الواجبات',
                        icon: Icons.assignment_outlined,
                        items: const [
                          PermItem('إنشاء الواجبات', 'assignments_create'),
                          PermItem(
                            'تعديل الواجبات الحالية',
                            'assignments_edit',
                          ),
                          PermItem('حذف الواجبات', 'assignments_delete'),
                          PermItem(
                            'تعيين الواجبات لطلاب معينين',
                            'assignments_assign_specific',
                          ),
                          PermItem(
                            'مراجعة الإجابات وإضافة درجات',
                            'assignments_review_grade',
                          ),
                        ],
                        values: permissions,
                        onChanged: (key, value) {
                          setState(() => permissions[key] = value);
                        },
                      ),
                      const SizedBox(height: 12),

                      PermissionsSectionCard(
                        title: 'الاختبارات',
                        icon: Icons.quiz_outlined,
                        items: const [
                          PermItem('إنشاء اختبارات جديدة', 'exams_create'),
                          PermItem('تعديل الاختبارات', 'exams_edit'),
                          PermItem('حذف الاختبارات', 'exams_delete'),
                          PermItem(
                            'نشر الاختبارات للطلاب',
                            'exams_publish_students',
                          ),
                          PermItem(
                            'الإطلاع على درجات الطلاب',
                            'exams_view_students_grades',
                          ),
                        ],
                        values: permissions,
                        onChanged: (key, value) {
                          setState(() => permissions[key] = value);
                        },
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onCreateAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PermColors.primary,
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

  void _onCreateAccount() {
    final form = Get.find<TeacherFormController>();
    form.patch(permissions: permissions);

    form.save();

    Get.to(() => CreateTeacherScreen(selectedOption: widget.selectedOption));
  }
}
