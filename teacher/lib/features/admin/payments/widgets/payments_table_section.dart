import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/payments_controller.dart';
import '../state/payments_state.dart';
import 'card_shell.dart';
import 'payments_table.dart';

class PaymentsTableSection extends GetView<PaymentsController> {
  final List<PaymentRowModel> rows;
  const PaymentsTableSection({super.key, required this.rows});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CardShell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "آخر العمليات",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 4),
            const Text(
              "لمحة عن آخر المدفوعات التي تمت داخل النظام",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: controller.setQuery,
                    decoration: InputDecoration(
                      hintText: "ابحث بالاسم أو الرقم التعريفي...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: const Color(0xFFF6F7FB),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            PaymentsTable(rows: rows),
          ],
        ),
      ),
    );
  }
}
