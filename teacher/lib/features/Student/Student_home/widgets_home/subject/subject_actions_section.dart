// quick_actions_section.dart
import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/widget/subject_action_button.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/quick_actions_section/widget/button_Width.dart';
import 'widget/subject_action_model.dart';

class SubjectActionsSection extends StatelessWidget {
  const SubjectActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = <SubjectActionModel>[
      SubjectActionModel(
        title: 'إدارة المستخدمين',
        icon: Icons.group_outlined,
        color: const Color(0xFF7B3F12),
        routeName: AppRoutes.usersManagement,
      ),

      SubjectActionModel(
        title: 'حسابات المدرسين',
        icon: Icons.school_outlined,
        color: const Color(0xFF6A1BB2),
        routeName: AppRoutes.teachersAccounts,
      ),

      SubjectActionModel(
        title: 'الأمان و التحكم',
        icon: Icons.security_outlined,
        color: const Color(0xFFF59A23),
        routeName: AppRoutes.securityControl,
      ),
      SubjectActionModel(
        title: 'متابعة المدفوعات',
        icon: Icons.payments_outlined,
        color: const Color(0xFF2E7D32),
        routeName: AppRoutes.paymentsFollowUp,
      ),
      SubjectActionModel(
        title: 'معاينة التقارير',
        icon: Icons.settings_outlined,
        color: const Color(0xFF2F78FF),
        routeName: AppRoutes.reportsPreview,
      ),
    ];

    final btnW = buttonWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "إجراءات سريعة",
              textAlign: TextAlign.right,
              style: const TextStyle(
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
                    (a) => SizedBox(
                      width: btnW,
                      child: SubjectActionButton(
                        model: a,
                        onTap: () =>
                            Navigator.of(context).pushNamed(a.routeName),
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
