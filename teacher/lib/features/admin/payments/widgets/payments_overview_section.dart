import 'package:flutter/material.dart';
import '../state/payments_state.dart';
import 'card_shell.dart';
import 'payments_overview_card.dart';

class PaymentsOverviewSection extends StatelessWidget {
  final PaymentsState st;
  final VoidCallback onOverview;
  final VoidCallback onTable;

  const PaymentsOverviewSection({
    super.key,
    required this.st,
    required this.onOverview,
    required this.onTable,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  String _money(num v) => "${v.toStringAsFixed(0)} ج.م";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CardShell(
        child: Column(
          children: [
            const Text(
              "نظرة سريعة على المدفوعات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 4),
            const Text(
              "لمحة عن النشاط المالي وحالة المدفوعات داخل النظام",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
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
                PaymentsOverviewCard(
                  title: "المدفوعات المعلقة",
                  subtitle: "المدفوعات التي لم تتم معالجتها",
                  value: "${st.overview.pendingCount} عملية",
                  icon: Icons.hourglass_bottom_rounded,
                  iconColor: const Color(0xFFFF9800),
                  valueColor: const Color(0xFFFF9800),
                ),
                PaymentsOverviewCard(
                  title: "إجمالي المدفوعات",
                  subtitle: "إجمالي الدفعات داخل النظام",
                  value: _money(st.overview.totalAmount),
                  icon: Icons.payments_outlined,
                  iconColor: const Color(0xFF1E2A8A),
                  valueColor: const Color(0xFF1E2A8A),
                ),
                PaymentsOverviewCard(
                  title: "المدفوعات الأخيرة",
                  subtitle: "آخر عملية داخل النظام",
                  value: st.overview.latestPaymentText,
                  icon: Icons.schedule_rounded,
                  iconColor: const Color(0xFF2F6BFF),
                  valueColor: const Color(0xFF2F6BFF),
                ),
                PaymentsOverviewCard(
                  title: "المدفوعات الفاشلة",
                  subtitle: "عمليات لم تتم بنجاح",
                  value: "${st.overview.failedCount} عمليات",
                  icon: Icons.cancel_outlined,
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
                        color: st.mode == PaymentsViewMode.overview
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
                        color: st.mode == PaymentsViewMode.overview
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
                        color: st.mode == PaymentsViewMode.table
                            ? primaryBlue
                            : const Color(0xFFE6E8F0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "آخر العمليات",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: st.mode == PaymentsViewMode.table
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
      ),
    );
  }
}
