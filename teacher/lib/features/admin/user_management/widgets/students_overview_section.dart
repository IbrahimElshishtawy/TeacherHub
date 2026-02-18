import 'package:flutter/material.dart';
import 'package:teacher/features/admin/user_management/state/user_management_state.dart';
import 'card_shell.dart';
import 'overview_card.dart';

class StudentsOverviewSection extends StatelessWidget {
  final UserManagementState st;
  final VoidCallback onOverview;
  final VoidCallback onTable;

  static const Color primaryBlue = Color(0xFF2F6BFF);

  const StudentsOverviewSection({
    super.key,
    required this.st,
    required this.onOverview,
    required this.onTable,
  });

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        children: [
          const Text(
            "نظرة سريعة على حسابات الطلاب",
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
                subtitle: "الطلاب المشغلين حالياً",
                value: "${st.studentsOverview.active} حساب",
                icon: Icons.check_circle_outline,
                iconColor: const Color(0xFF19B66A),
                valueColor: const Color(0xFF19B66A),
              ),
              OverviewCard(
                title: "إجمالي الطلاب",
                subtitle: "عدد الطلاب المسجلين",
                value: "${st.studentsOverview.total} طالب",
                icon: Icons.school_outlined,
                iconColor: primaryBlue,
                valueColor: primaryBlue,
              ),
              OverviewCard(
                title: "حسابات موقوفة",
                subtitle: "الطلاب الموقوفين مؤقتاً",
                value: "${st.studentsOverview.suspended} حسابات",
                icon: Icons.block_outlined,
                iconColor: const Color(0xFFFF9800),
                valueColor: const Color(0xFFFF9800),
              ),
              OverviewCard(
                title: "طلاب لديهم تحذيرات",
                subtitle: "الطلاب الذين لديهم تحذيرات",
                value: "${st.studentsOverview.warned} طالب",
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
                      color: st.studentsMode == StudentsViewMode.overview
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
                      color: st.studentsMode == StudentsViewMode.overview
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
                      color: st.studentsMode == StudentsViewMode.table
                          ? primaryBlue
                          : const Color(0xFFE6E8F0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "جدول الطلاب",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: st.studentsMode == StudentsViewMode.table
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
