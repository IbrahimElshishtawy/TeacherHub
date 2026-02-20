import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/payments_controller.dart';
import '../state/payments_state.dart';
import 'status_chip.dart';
import 'table_cell_box.dart';
import 'user_avatar.dart';

class PaymentsTable extends GetView<PaymentsController> {
  final List<PaymentRowModel> rows;
  const PaymentsTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE6E8F0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 44,
              dataRowMinHeight: 58,
              dataRowMaxHeight: 64,
              horizontalMargin: 0,
              columnSpacing: 0,
              dividerThickness: 1,
              headingRowColor: const WidgetStatePropertyAll(Color(0xFFF6F7FB)),
              columns: const [
                DataColumn(label: _Header("الصورة")),
                DataColumn(label: _Header("الاسم الكامل")),
                DataColumn(label: _Header("الرقم التعريفي")),
                DataColumn(label: _Header("الحالة")),
                DataColumn(label: _Header("طريقة الدفع")),
                DataColumn(label: _Header("تاريخ الدفع")),
                DataColumn(label: _Header("المبلغ المدفوع")),
                DataColumn(label: _Header("سبب الدفع")),
                DataColumn(label: _Header("Actions")),
              ],
              rows: rows.asMap().entries.map((entry) {
                final i = entry.key;
                final r = entry.value;

                return DataRow(
                  color: WidgetStatePropertyAll(
                    i.isEven ? Colors.white : const Color(0xFFFBFCFF),
                  ),
                  cells: [
                    DataCell(
                      TableCellBox(
                        width: 90,
                        child: UserAvatar(
                          fullName: r.fullName,
                          avatarUrl: r.avatarUrl,
                        ),
                      ),
                    ),
                    DataCell(
                      TableCellBox(
                        width: 200,
                        child: Text(
                          r.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    DataCell(
                      TableCellBox(
                        width: 110,
                        child: Text(
                          r.id,
                          style: const TextStyle(
                            color: Color(0xFF2F6BFF),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      TableCellBox(
                        width: 120,
                        child: StatusChip(status: r.status),
                      ),
                    ),
                    DataCell(TableCellBox(width: 150, child: Text(r.method))),
                    DataCell(TableCellBox(width: 130, child: Text(r.date))),
                    DataCell(
                      TableCellBox(
                        width: 140,
                        child: Text(
                          r.amount,
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    DataCell(
                      TableCellBox(
                        width: 160,
                        child: Text(
                          r.reason,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(
                      TableCellBox(
                        width: 130,
                        showVerticalBorder: false,
                        child: SizedBox(
                          height: 34,
                          child: OutlinedButton.icon(
                            onPressed: () => controller.onRowActions(r),
                            icon: const Icon(Icons.more_horiz, size: 18),
                            label: const Text(
                              "الإجراءات",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF2F6BFF),
                              side: const BorderSide(color: Color(0xFFE6E8F0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  const _Header(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w900,
          color: Color(0xFF1E2A3B),
        ),
      ),
    );
  }
}
