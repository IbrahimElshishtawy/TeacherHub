import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/user_management/controller/user_management_controller.dart';
import 'package:teacher/features/admin/user_management/state/user_management_state.dart';
import 'package:teacher/features/admin/user_management/widgets/Status_Chip.dart';
import 'package:teacher/features/admin/user_management/widgets/Student_Avatar.dart';
import 'package:teacher/features/admin/user_management/widgets/table_cell_divider.dart';

class StudentsTable extends GetView<UserManagementController> {
  final List<StudentRowModel> rows;
  const StudentsTable({super.key, required this.rows});

  static const Color primaryBlue = Color(0xFF2F6BFF);
  static const Color headerBg = Color(0xFFF6F7FB);
  static const Color borderColor = Color(0xFFE6E8F0);
  static const Color evenRowBg = Color(0xFFFBFCFF);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: DataTable(
              headingRowHeight: 50,
              dataRowMinHeight: 50,
              dataRowMaxHeight: 58,
              horizontalMargin: 12,
              columnSpacing: 1,
              dividerThickness: 0,
              headingRowColor: const WidgetStatePropertyAll(headerBg),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 2),
                ),
              ),
              columns: _buildColumns(),
              rows: _buildRows(),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildColumn("Actions", 145),
      _buildColumn("المرحلة / الصف", 190),
      _buildColumn("رقم ولي الأمر", 170),
      _buildColumn("الهاتف", 160),
      _buildColumn("الحالة", 130),
      _buildColumn("البريد الإلكتروني", 240),
      _buildColumn("ID", 95),
      _buildColumn("الاسم", 210),
      _buildColumn("الصورة", 90, showBorder: false),
    ];
  }

  DataColumn _buildColumn(String text, double width, {bool showBorder = true}) {
    return DataColumn(
      label: TableCellBox(
        width: width,
        showVerticalBorder: showBorder,
        child: _HeaderText(text),
      ),
    );
  }

  List<DataRow> _buildRows() {
    return rows.asMap().entries.map((entry) {
      final index = entry.key;
      final student = entry.value;
      final isEven = index.isEven;

      return DataRow(
        color: WidgetStatePropertyAll(isEven ? Colors.white : evenRowBg),
        cells: [
          _buildActionCell(student),
          _buildTextCell(student.grade, 190, bold: true),
          _buildLinkCell(student.parentPhone, 170),
          _buildLinkCell(student.phone, 160),
          _buildStatusCell(student.isActive, 130),
          _buildLinkCell(student.email, 240),
          _buildTextCell(student.id, 95, extraBold: true),
          _buildTextCell(student.fullName, 210, extraBold: true),
          _buildAvatarCell(student),
        ],
      );
    }).toList();
  }

  DataCell _buildActionCell(StudentRowModel student) {
    return DataCell(
      TableCellBox(
        width: 145,
        child: _ActionsButton(
          onPressed: () => controller.onStudentActions(student),
        ),
      ),
    );
  }

  DataCell _buildTextCell(
    String text,
    double width, {
    bool bold = false,
    bool extraBold = false,
  }) {
    return DataCell(
      TableCellBox(
        width: width,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: extraBold
                ? FontWeight.w800
                : bold
                ? FontWeight.w700
                : FontWeight.w600,
            fontSize: 13.5,
            color: const Color(0xFF1E2A3B),
          ),
        ),
      ),
    );
  }

  DataCell _buildLinkCell(String text, double width) {
    return DataCell(
      TableCellBox(
        width: width,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: primaryBlue,
            decoration: TextDecoration.underline,
            decorationColor: primaryBlue,
            fontWeight: FontWeight.w700,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }

  DataCell _buildStatusCell(bool isActive, double width) {
    return DataCell(
      TableCellBox(
        width: width,
        child: StatusChip(isActive: isActive),
      ),
    );
  }

  DataCell _buildAvatarCell(StudentRowModel student) {
    return DataCell(
      TableCellBox(
        width: 90,
        showVerticalBorder: false,
        child: StudentAvatar(
          fullName: student.fullName,
          avatarUrl: student.avatarUrl,
        ),
      ),
    );
  }
}

// ===============================================
// Header Text Widget
// ===============================================
class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w900,
        color: Color(0xFF1E2A3B),
        letterSpacing: 0.2,
      ),
    );
  }
}

// ===============================================
// Actions Button Widget
// ===============================================
class _ActionsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _ActionsButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.more_horiz_rounded, size: 20),
        label: const Text(
          "الإجراءات",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            letterSpacing: 0.2,
          ),
        ),
        style:
            OutlinedButton.styleFrom(
              foregroundColor: StudentsTable.primaryBlue,
              side: BorderSide(color: StudentsTable.borderColor, width: 1.5),
              backgroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                StudentsTable.primaryBlue.withValues(alpha: 0.08),
              ),
            ),
      ),
    );
  }
}

// ===============================================
// Status Chip Widget
// ===============================================
