// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppRoutes {
  static const String securityControl = '/admin/security-control';
  static const String paymentsFollowUp = '/admin/payments-followup';
  static const String reportsPreview = '/admin/reports-preview';
  static const String teachersAccounts = '/admin/teachers-accounts';
  static const String usersManagement = '/admin/users-management';
}

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = <_QuickActionModel>[
      _QuickActionModel(
        title: 'الأمان و التحكم',
        icon: Icons.security_outlined,
        color: const Color(0xFFF59A23),
        routeName: AppRoutes.securityControl,
      ),
      _QuickActionModel(
        title: 'متابعة المدفوعات',
        icon: Icons.payments_outlined,
        color: const Color(0xFF2E7D32),
        routeName: AppRoutes.paymentsFollowUp,
      ),
      _QuickActionModel(
        title: 'معاينة التقارير',
        icon: Icons.settings_outlined,
        color: const Color(0xFF2F78FF),
        routeName: AppRoutes.reportsPreview,
      ),
      _QuickActionModel(
        title: 'حسابات المدرسين',
        icon: Icons.school_outlined,
        color: const Color(0xFF6A1BB2),
        routeName: AppRoutes.teachersAccounts,
      ),
      _QuickActionModel(
        title: 'إدارة المستخدمين',
        icon: Icons.group_outlined,
        color: const Color(0xFF7B3F12),
        routeName: AppRoutes.usersManagement,
      ),
    ];

    final btnW = _buttonWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'إجراءات سريعة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // ✅ Wrap مباشرة بدون Row (علشان ميبقاش overflow)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: actions
                .map(
                  (a) => SizedBox(
                    width: btnW,
                    child: _QuickActionButton(
                      model: a,
                      onTap: () => Navigator.of(context).pushNamed(a.routeName),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  double _buttonWidth(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    // ✅ موبايل: عمودين / شاشات أوسع: 3 أعمدة
    final cols = w < 420 ? 2 : 3;
    const spacing = 10.0;
    final totalSpacing = spacing * (cols - 1);

    final raw = (w - totalSpacing) / cols;
    return raw.clamp(140.0, 260.0);
  }
}

class _QuickActionModel {
  final String title;
  final IconData icon;
  final Color color;
  final String routeName;

  _QuickActionModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.routeName,
  });
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({required this.model, required this.onTap});

  final _QuickActionModel model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2.5,
      shadowColor: const Color(0x14000000),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE6E6E6)),
          ),
          child: Row(
            children: [
              // ✅ النص يتحرك/يتسحب من اليمين لليسار (Scroll أفقي)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true, // ✅ يبدأ من اليمين
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    model.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                    softWrap: false,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: model.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(model.icon, size: 18, color: model.color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
