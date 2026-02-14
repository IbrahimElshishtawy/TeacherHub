// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_2/check_row.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_2/dropdown_header.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_2/inline_check.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_2/section_card.dart';

import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget view/Create_Teacher_Header.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

// IMPORTANT: Change this import to your real path
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/step_permissions.dart';

class StepAcademicInfo extends StatefulWidget {
  final String selectedOption;
  const StepAcademicInfo({super.key, required this.selectedOption});

  @override
  State<StepAcademicInfo> createState() => _StepAcademicInfoState();
}

class _StepAcademicInfoState extends State<StepAcademicInfo>
    with TickerProviderStateMixin {
  bool stagePrep = false;
  bool stageSec = false;

  final Map<String, bool> grades = {
    'الصف الثالث الإعدادي': false,
    'الصف الأول الثانوي': false,
    'الصف الثاني الثانوي': false,
    'الصف الثالث الثانوي': false,
  };

  final Map<String, bool> subjects = {
    'اللغة العربية': false,
    'اللغة الإنجليزية': false,
    'الكيمياء': false,
    'الفيزياء': false,
    'الرياضيات': false,
  };

  bool stageExpanded = false;
  bool subjectsExpanded = false;

  bool get hasStage => stagePrep || stageSec;
  bool get hasGrade => grades.values.any((v) => v);
  bool get hasSubject => subjects.values.any((v) => v);
  bool get canContinue => hasStage && hasGrade && hasSubject;

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF6F8FC);
    const borderColor = Color(0xFFE6ECF5);
    const shadow = Color(0x14000000);
    const primary = Color(0xFF2F6FED);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppbarTap(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const CreateTeacherHeaderWidget(
                        currentStep: 2,
                        completedSteps: [true, false, false],
                      ),

                      SectionCard(
                        borderColor: borderColor,
                        shadowColor: shadow,
                        title: 'المرحلة التعليمية',
                        child: Column(
                          children: [
                            DropdownHeader(
                              title: 'اختر المرحلة التعليمية للمدرس',
                              isExpanded: stageExpanded,
                              onTap: () => setState(() {
                                stageExpanded = !stageExpanded;
                              }),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, anim) =>
                                  SizeTransition(
                                    sizeFactor: anim,
                                    child: child,
                                  ),
                              child: !stageExpanded
                                  ? const SizedBox(
                                      key: ValueKey('stage-closed'),
                                    )
                                  : Padding(
                                      key: const ValueKey('stage-open'),
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InlineCheck(
                                              label: 'المرحلة الإعدادية',
                                              value: stagePrep,
                                              onChanged: (v) => setState(() {
                                                stagePrep = v ?? false;
                                              }),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: InlineCheck(
                                              label: 'المرحلة الثانوية',
                                              value: stageSec,
                                              onChanged: (v) => setState(() {
                                                stageSec = v ?? false;
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 260),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SizeTransition(sizeFactor: anim, child: child),
                        ),
                        child: !hasStage
                            ? const SizedBox(key: ValueKey('grades-hidden'))
                            : SectionCard(
                                key: const ValueKey('grades-card'),
                                borderColor: borderColor,
                                shadowColor: shadow,
                                title: 'الصف الدراسي',
                                subtitle: 'اختر الصفوف التي يدرسها المدرس',
                                child: Column(
                                  children: grades.entries.map((e) {
                                    return CheckRow(
                                      label: e.key,
                                      value: e.value,
                                      onChanged: (v) => setState(() {
                                        grades[e.key] = v ?? false;
                                      }),
                                    );
                                  }).toList(),
                                ),
                              ),
                      ),

                      const SizedBox(height: 5),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 260),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SizeTransition(sizeFactor: anim, child: child),
                        ),
                        child: !hasGrade
                            ? const SizedBox(key: ValueKey('subjects-hidden'))
                            : SectionCard(
                                key: const ValueKey('subjects-card'),
                                borderColor: borderColor,
                                shadowColor: shadow,
                                title: 'المواد الدراسية',
                                child: Column(
                                  children: [
                                    DropdownHeader(
                                      title: 'اختر المواد التي يدرسها المدرس',
                                      isExpanded: subjectsExpanded,
                                      onTap: () => setState(() {
                                        subjectsExpanded = !subjectsExpanded;
                                      }),
                                    ),
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 220,
                                      ),
                                      transitionBuilder: (child, anim) =>
                                          SizeTransition(
                                            sizeFactor: anim,
                                            child: child,
                                          ),
                                      child: !subjectsExpanded
                                          ? const SizedBox(
                                              key: ValueKey('sub-closed'),
                                            )
                                          : Column(
                                              key: const ValueKey('sub-open'),
                                              children: subjects.entries.map((
                                                e,
                                              ) {
                                                return CheckRow(
                                                  label: e.key,
                                                  value: e.value,
                                                  onChanged: (v) =>
                                                      setState(() {
                                                        subjects[e.key] =
                                                            v ?? false;
                                                      }),
                                                );
                                              }).toList(),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: canContinue
                        ? () {
                            grades.entries
                                .where((e) => e.value)
                                .map((e) => e.key)
                                .toList();

                            subjects.entries
                                .where((e) => e.value)
                                .map((e) => e.key)
                                .toList();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => StepPermissions(
                                  selectedOption: widget.selectedOption,
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      disabledBackgroundColor: primary.withOpacity(0.45),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'التالي',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
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
}
