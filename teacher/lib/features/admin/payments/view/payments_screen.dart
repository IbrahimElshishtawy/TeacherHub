import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payments_controller.dart';
import '../state/payments_state.dart';
import '../widgets/payments_header.dart';
import '../widgets/payments_overview_section.dart';
import '../widgets/payments_table_section.dart';

class PaymentsScreen extends GetView<PaymentsController> {
  const PaymentsScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Obx(() {
            final st = controller.state.value;
            final rows = controller.filteredRows;

            return ListView(
              children: [
                const PaymentsHeader(),
                const SizedBox(height: 14),

                PaymentsOverviewSection(
                  st: st,
                  onOverview: controller.openOverview,
                  onTable: controller.openTable,
                ),

                const SizedBox(height: 14),

                // في نفس الصفحة: لو اختار Table يظهر هنا
                if (st.mode == PaymentsViewMode.table)
                  PaymentsTableSection(rows: rows),

                const SizedBox(height: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}
