// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/Create_Teacher_Header.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

// لو عندك صفحة الصلاحيات
// import 'package:teacher/features/admin/teachers/view/create_teacher/steps/step_permissions.dart';

class StepAcademicInfo extends StatefulWidget {
  final String selectedOption;
  const StepAcademicInfo({super.key, required this.selectedOption});

  @override
  State<StepAcademicInfo> createState() => _StepAcademicInfoState();
}

class _StepAcademicInfoState extends State<StepAcademicInfo> {
  // المرحلة
  bool _stagePrep = false; // الإعدادية
  bool _stageSec = false; // الثانوية

  // الصفوف (حسب الصورة)
  final Map<String, bool> _grades = {
    'الصف الثالث الإعدادي': true,
    'الصف الأول الثانوي': false,
    'الصف الثاني الثانوي': false,
    'الصف الثالث الثانوي': true,
  };

  // المواد (حسب الصورة)
  final Map<String, bool> _subjects = {
    'اللغة العربية': false,
    'اللغة الإنجليزية': false,
    'الكيمياء': false,
    'الفيزياء': false,
    'الرياضيات': false,
  };

  bool _stageExpanded = true; // كارت المرحلة مفتوح
  bool _subjectsExpanded = true; // كارت المواد مفتوح

  bool get _canContinue {
    final hasStage = _stagePrep || _stageSec;
    final hasGrade = _grades.values.any((v) => v);
    final hasSubject = _subjects.values.any((v) => v);
    return hasStage && hasGrade && hasSubject;
  }

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      const CreateTeacherHeaderWidget(
                        currentStep: 2,
                        completedSteps: [true, false, false],
                      ),

                      // كارت المرحلة التعليمية (Dropdown-like)
                      _SectionCard(
                        borderColor: borderColor,
                        shadowColor: shadow,
                        title: 'المرحلة التعليمية',
                        child: Column(
                          children: [
                            _DropdownHeader(
                              title: 'اختر المرحلة التعليمية للمدرس',
                              isExpanded: _stageExpanded,
                              onTap: () => setState(
                                () => _stageExpanded = !_stageExpanded,
                              ),
                            ),
                            AnimatedCrossFade(
                              firstChild: const SizedBox.shrink(),
                              secondChild: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _InlineCheck(
                                        label: 'المرحلة الإعدادية',
                                        value: _stagePrep,
                                        onChanged: (v) => setState(
                                          () => _stagePrep = v ?? false,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _InlineCheck(
                                        label: 'المرحلة الثانوية',
                                        value: _stageSec,
                                        onChanged: (v) => setState(
                                          () => _stageSec = v ?? false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              crossFadeState: _stageExpanded
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 180),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // كارت الصف الدراسي
                      _SectionCard(
                        borderColor: borderColor,
                        shadowColor: shadow,
                        title: 'الصف الدراسي',
                        subtitle: 'اختر الصفوف التي يدرسها المدرس',
                        child: Column(
                          children: _grades.entries.map((e) {
                            return _CheckRow(
                              label: e.key,
                              value: e.value,
                              onChanged: (v) =>
                                  setState(() => _grades[e.key] = v ?? false),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // كارت المواد الدراسية (Expand/Collapse)
                      _SectionCard(
                        borderColor: borderColor,
                        shadowColor: shadow,
                        title: 'المواد الدراسية',
                        child: Column(
                          children: [
                            _DropdownHeader(
                              title: 'اختر المواد التي يدرسها المدرس',
                              isExpanded: _subjectsExpanded,
                              onTap: () => setState(
                                () => _subjectsExpanded = !_subjectsExpanded,
                              ),
                            ),
                            AnimatedCrossFade(
                              firstChild: const SizedBox.shrink(),
                              secondChild: Column(
                                children: _subjects.entries.map((e) {
                                  return _CheckRow(
                                    label: e.key,
                                    value: e.value,
                                    onChanged: (v) => setState(
                                      () => _subjects[e.key] = v ?? false,
                                    ),
                                  );
                                }).toList(),
                              ),
                              crossFadeState: _subjectsExpanded
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 180),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),

              // زر التالي (ثابت تحت)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _canContinue
                        ? () {
                            // هنا تقدر تبعت الداتا للكنترولر أو تكمل للخطوة الثالثة
                            // مثال:
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => StepPermissions(selectedOption: widget.selectedOption),
                            //   ),
                            // );
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

class _SectionCard extends StatelessWidget {
  final Color borderColor;
  final Color shadowColor;
  final String title;
  final String? subtitle;
  final Widget child;

  const _SectionCard({
    required this.borderColor,
    required this.shadowColor,
    required this.title,
    required this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1E2A3B),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7C8CA5),
              ),
            ),
          ],
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _DropdownHeader extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;

  const _DropdownHeader({
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFE6ECF5);
    const fill = Color(0xFFF7F9FD);

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            AnimatedRotation(
              duration: const Duration(milliseconds: 180),
              turns: isExpanded ? 0.5 : 0.0,
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                size: 20,
                color: Color(0xFF2F6FED),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9AA8BC),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InlineCheck extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _InlineCheck({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6ECF5)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF2F6FED),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3B),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6ECF5)),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF2F6FED),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E2A3B),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
