import 'package:flutter/material.dart';
import '../state/user_management_state.dart';
import 'card_shell.dart';
import 'overview_card.dart';

class ParentsOverviewSection extends StatelessWidget {
  final UserManagementState st;
  final VoidCallback onOverview;
  final VoidCallback onTable;

  const ParentsOverviewSection({
    super.key,
    required this.st,
    required this.onOverview,
    required this.onTable,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    final ov = st.parentsOverview;

    return CardShell(
      child: Column(
        children: [
          const Text(
            "نظرة سريعة على حسابات أولياء الأمور",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          const Text(
            "لمحة عن النشاط وحالة الحسابات داخل النظام",
            style: TextStyle(fontSize: 12, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),

          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OverviewCard(
                title: "حسابات نشطة",
                subtitle: "أولياء الأمور المشغلين حالياً",
                value: "${ov.active} حساب",
                icon: Icons.check_circle_outline,
                iconColor: const Color(0xFF19B66A),
                valueColor: const Color(0xFF19B66A),
              ),
              OverviewCard(
                title: "إجمالي أولياء الأمور",
                subtitle: "عدد أولياء الأمور المسجلين",
                value: "${ov.total} ولي أمر",
                icon: Icons.groups_2_outlined,
                iconColor: primaryBlue,
                valueColor: primaryBlue,
              ),
              OverviewCard(
                title: "حسابات موقوفة",
                subtitle: "موقوفين مؤقتاً",
                value: "${ov.suspended} حسابات",
                icon: Icons.block_outlined,
                iconColor: const Color(0xFFFF9800),
                valueColor: const Color(0xFFFF9800),
              ),
              OverviewCard(
                title: "لديهم تحذيرات",
                subtitle: "أولياء الأمور لديهم تحذيرات",
                value: "${ov.warned} ولي أمر",
                icon: Icons.warning_amber_rounded,
                iconColor: const Color(0xFFE53935),
                valueColor: const Color(0xFFE53935),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onOverview,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: st.parentsMode == ParentsViewMode.overview
                          ? primaryBlue
                          : const Color(0xFFE6E8F0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "نظرة سريعة",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: st.parentsMode == ParentsViewMode.overview
                          ? primaryBlue
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: onTable,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: st.parentsMode == ParentsViewMode.table
                          ? primaryBlue
                          : const Color(0xFFE6E8F0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "جدول أولياء الأمور",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: st.parentsMode == ParentsViewMode.table
                          ? primaryBlue
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
