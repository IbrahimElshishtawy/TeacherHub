// quick_actions_section.dart
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets_home/quick_actions_section/widget/button_Width.dart';
import 'package:teacher/features/admin/home/widgets_home/quick_actions_section/widget/quick_action_button.dart';
import 'package:teacher/features/admin/home/widgets_home/quick_actions_section/widget/quick_action_model.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = <QuickActionModel>[
      QuickActionModel(
        title: 'الأمان و التحكم',
        icon: Icons.security_outlined,
        color: const Color(0xFFF59A23),
        routeName: AppRoutes.securityControl,
      ),
      QuickActionModel(
        title: 'متابعة المدفوعات',
        icon: Icons.payments_outlined,
        color: const Color(0xFF2E7D32),
        routeName: AppRoutes.paymentsFollowUp,
      ),
      QuickActionModel(
        title: 'معاينة التقارير',
        icon: Icons.settings_outlined,
        color: const Color(0xFF2F78FF),
        routeName: AppRoutes.reportsPreview,
      ),
      QuickActionModel(
        title: 'حسابات المدرسين',
        icon: Icons.school_outlined,
        color: const Color(0xFF6A1BB2),
        routeName: AppRoutes.teachersAccounts,
      ),
      QuickActionModel(
        title: 'إدارة المستخدمين',
        icon: Icons.group_outlined,
        color: const Color(0xFF7B3F12),
        routeName: AppRoutes.usersManagement,
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
                      child: QuickActionButton(
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
