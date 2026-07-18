import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/widget/subject_action_button.dart';
import 'package:teacher/features/Student/subject/state/subject_state.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/quick_actions_section/widget/button_Width.dart';

import 'widget/subject_action_model.dart';

class SubjectActionsSection extends StatelessWidget {
  const SubjectActionsSection({super.key});

  SubjectItem _toSubjectItem(SubjectActionModel action) {
    return SubjectItem(
      id: action.title,
      title: action.title.replaceFirst('مادة ', ''),
      teacherName: 'اسم المدرس',
      icon: action.icon,
      iconColor: action.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final actions = <SubjectActionModel>[
      SubjectActionModel(
        title: 'مادة الرياضيات',
        icon: Icons.calculate_outlined,
        color: const Color(0xFF7B3F12),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة الفيزياء',
        icon: Icons.science_outlined,
        color: const Color(0xFF6A1BB2),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة الكيمياء',
        icon: Icons.emoji_symbols_outlined,
        color: const Color(0xFFF59A23),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة البرمجة',
        icon: Icons.computer_outlined,
        color: const Color(0xFF2E7D32),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة التاريخ',
        icon: Icons.history_outlined,
        color: const Color(0xFF2F78FF),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة الجغرافيا',
        icon: Icons.public_outlined,
        color: const Color(0xFF9C27B0),
        routeName: '/courses/details',
      ),
      SubjectActionModel(
        title: 'مادة اللغة العربية',
        icon: Icons.language_outlined,
        color: const Color(0xFF00796B),
        routeName: '/courses/details',
      ),
    ];

    final btnW = buttonWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'المواد الدراسية',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: actions
                  .map(
                    (action) => SizedBox(
                      width: btnW,
                      child: SubjectActionButton(
                        model: action,
                        onTap: () => Get.toNamed(
                          action.routeName,
                          arguments: _toSubjectItem(action),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
