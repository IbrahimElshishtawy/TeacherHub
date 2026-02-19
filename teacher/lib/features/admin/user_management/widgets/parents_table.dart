import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teacher/features/admin/user_management/controller/user_management_controller.dart';
import 'package:teacher/features/admin/user_management/state/user_management_state.dart';
import 'package:teacher/features/admin/user_management/widgets/Header_Text.dart';
import 'package:teacher/features/admin/user_management/widgets/Status_Chip.dart';

import 'package:teacher/features/admin/user_management/widgets/Student_Avatar.dart';
import 'package:teacher/features/admin/user_management/widgets/table_cell_divider.dart';

class ParentsTable extends GetView<UserManagementController> {
  final List<ParentRowModel> rows;
  const ParentsTable({super.key, required this.rows});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE6E8F0)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 44,
              dataRowMinHeight: 56,
              dataRowMaxHeight: 64,
              horizontalMargin: 8,
              columnSpacing: 0,
              dividerThickness: 1,
              headingRowColor: const WidgetStatePropertyAll(Color(0xFFF6F7FB)),

              // ✅ Header with vertical dividers (same widths as cells)
              columns: [
                DataColumn(
                  label: TableCellBox(
                    width: 140,
                    child: const HeaderText("Actions"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 90,
                    child: const HeaderText("الصورة"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 220,
                    child: const HeaderText("الاسم"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 150,
                    child: const HeaderText("الهاتف"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 150,
                    child: const HeaderText("واتساب"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 140,
                    child: const HeaderText("طالب مرتبط"),
                  ),
                ),
                DataColumn(
                  label: TableCellBox(
                    width: 120,
                    showVerticalBorder: false,
                    child: const HeaderText("الحالة"),
                  ),
                ),
              ],

              rows: rows.asMap().entries.map((entry) {
                final i = entry.key;
                final p = entry.value;

                return DataRow(
                  color: WidgetStatePropertyAll(
                    i.isEven ? Colors.white : const Color(0xFFFBFCFF),
                  ),
                  cells: [
                    // Actions
                    DataCell(
                      TableCellBox(
                        width: 140,
                        child: SizedBox(
                          height: 34,
                          child: OutlinedButton.icon(
                            onPressed: () => controller.onParentActions(p),
                            icon: const Icon(Icons.more_horiz, size: 18),
                            label: const Text(
                              "الإجراءات",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primaryBlue,
                              side: const BorderSide(color: Color(0xFFE6E8F0)),
                              backgroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Avatar
                    DataCell(
                      TableCellBox(
                        width: 90,
                        child: StudentAvatar(
                          fullName: p.fullName,
                          avatarUrl: p.avatarUrl,
                        ),
                      ),
                    ),

                    // Name
                    DataCell(
                      TableCellBox(
                        width: 220,
                        child: Text(
                          p.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),

                    // Phone
                    DataCell(
                      TableCellBox(
                        width: 150,
                        child: Text(
                          p.phone,
                          style: const TextStyle(
                            color: primaryBlue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    // WhatsApp
                    DataCell(
                      TableCellBox(
                        width: 150,
                        child: Text(
                          p.whatsapp,
                          style: const TextStyle(
                            color: primaryBlue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    // Linked Student ID
                    DataCell(
                      TableCellBox(
                        width: 140,
                        child: Text(
                          p.linkedStudentId,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),

                    // Status
                    DataCell(
                      TableCellBox(
                        width: 120,
                        showVerticalBorder: false,
                        child: StatusChip(isActive: p.isActive),
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
