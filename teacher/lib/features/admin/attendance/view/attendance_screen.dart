// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/attendance_controller.dart';
import '../state/attendance_state.dart';
import '../widgets/attendance_stats_section.dart';
import '../widgets/attendance_student_card.dart';
import '../widgets/attendance_filters_bar.dart';
import '../widgets/manual_attendance_sheet.dart';
import '../widgets/student_details_sheet.dart';
import '../widgets/attendance_settings_sheet.dart';
import '../widgets/export_report_sheet.dart';
import '../widgets/analytics_tab.dart';
import 'qr_scanner_screen.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  static const Color _primaryBlue = Color(0xFF2563EB);
  static const Color _bgColor = Color(0xFFF8FAFF);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: _bgColor,
        body: Obx(() {
          final st = controller.state.value;
          return Column(
            children: [
              // ── App Bar ──────────────────────────────────────────────────────
              _buildAppBar(context, st),
              // ── Tab Bar ──────────────────────────────────────────────────────
              _buildTabBar(st),
              // ── Body ─────────────────────────────────────────────────────────
              Expanded(
                child: st.activeTab == 0
                    ? _buildListTab(context, st)
                    : AnalyticsTab(controller: controller),
              ),
            ],
          );
        }),
      ),
    );
  }

  // ─── App Bar ────────────────────────────────────────────────────────────────
  Widget _buildAppBar(BuildContext context, AttendanceState st) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        right: 16,
        left: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back + Title Row
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.offAllNamed('/home_admin'),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      size: 18, color: Color(0xFF374151)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'سجل الحضور والغياب',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'إدارة حضور الطلاب داخل السنتر باستخدام QR Code أو التسجيل اليدوي.',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Action Buttons
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            label: 'بدء مسح QR',
            icon: Icons.qr_code_scanner_rounded,
            color: _primaryBlue,
            onTap: () => Get.to(
              () => const QrScannerScreen(),
              transition: Transition.downToUp,
              duration: const Duration(milliseconds: 350),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ActionButton(
            label: 'تسجيل يدوي',
            icon: Icons.edit_note_rounded,
            color: const Color(0xFF7C3AED),
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) =>
                  ManualAttendanceSheet(controller: controller),
            ),
          ),
        ),
        const SizedBox(width: 8),
        _SmallActionButton(
          icon: Icons.upload_file_rounded,
          color: const Color(0xFF22C55E),
          tooltip: 'تصدير التقرير',
          onTap: () => showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => const ExportReportSheet(),
          ),
        ),
        const SizedBox(width: 8),
        _SmallActionButton(
          icon: Icons.settings_rounded,
          color: const Color(0xFF6366F1),
          tooltip: 'إعدادات الحضور',
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => AttendanceSettingsSheet(
              settings: controller.state.value.settings,
              onSave: controller.updateSettings,
            ),
          ),
        ),
      ],
    );
  }

  // ─── Tab Bar ─────────────────────────────────────────────────────────────────
  Widget _buildTabBar(AttendanceState st) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'قائمة التحضير',
              icon: Icons.list_alt_rounded,
              isActive: st.activeTab == 0,
              onTap: () => controller.setTab(0),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabButton(
              label: 'التحليلات',
              icon: Icons.analytics_rounded,
              isActive: st.activeTab == 1,
              onTap: () => controller.setTab(1),
            ),
          ),
        ],
      ),
    );
  }

  // ─── List Tab ────────────────────────────────────────────────────────────────
  Widget _buildListTab(BuildContext context, AttendanceState st) {
    final filtered = st.filteredRecords;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      children: [
        // Filters
        AttendanceFiltersBar(
          query: st.query,
          filterGrade: st.filterGrade,
          filterBatch: st.filterBatch,
          filterSubject: st.filterSubject,
          filterSession: st.filterSession,
          filterStatus: st.filterStatus,
          onQueryChanged: controller.setQuery,
          onGradeChanged: controller.setFilterGrade,
          onBatchChanged: controller.setFilterBatch,
          onSubjectChanged: controller.setFilterSubject,
          onSessionChanged: controller.setFilterSession,
          onStatusChanged: controller.setFilterStatus,
          onClearFilters: controller.clearFilters,
        ),
        const SizedBox(height: 18),

        // Stats
        AttendanceStatsSection(st: st),
        const SizedBox(height: 20),

        // List Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'قائمة الطلاب (${filtered.length})',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            if (filtered.isEmpty && st.records.isNotEmpty)
              Text(
                'لا توجد نتائج',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),

        // Student Cards
        if (filtered.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.search_off_rounded,
                      size: 48, color: Colors.grey.shade300),
                  const SizedBox(height: 10),
                  Text(
                    'لا يوجد طلاب مطابقون للبحث',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...filtered.map((record) {
            final student = st.students
                .where((s) => s.id == record.studentId)
                .firstOrNull;
            return AttendanceStudentCard(
              record: record,
              onViewDetails: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => StudentDetailsSheet(
                  record: record,
                  student: student,
                ),
              ),
              onEdit: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => _EditAttendanceSheet(
                  record: record,
                  controller: controller,
                ),
              ),
            );
          }),
      ],
    );
  }
}

// ─── Sub-Widgets ─────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const _SmallActionButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF2563EB)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? Colors.white : Colors.grey.shade500,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Quick edit attendance status sheet
class _EditAttendanceSheet extends StatefulWidget {
  final AttendanceRecord record;
  final AttendanceController controller;

  const _EditAttendanceSheet({
    required this.record,
    required this.controller,
  });

  @override
  State<_EditAttendanceSheet> createState() => _EditAttendanceSheetState();
}

class _EditAttendanceSheetState extends State<_EditAttendanceSheet> {
  late AttendanceStatus _status;
  String _notes = '';

  @override
  void initState() {
    super.initState();
    _status = widget.record.status;
    _notes = widget.record.notes ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'تعديل حضور: ${widget.record.studentName}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatusOption(
                    label: 'حاضر',
                    icon: Icons.check_circle_rounded,
                    color: const Color(0xFF22C55E),
                    isSelected: _status == AttendanceStatus.present,
                    onTap: () =>
                        setState(() => _status = AttendanceStatus.present),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _StatusOption(
                    label: 'غائب',
                    icon: Icons.cancel_rounded,
                    color: const Color(0xFFEF4444),
                    isSelected: _status == AttendanceStatus.absent,
                    onTap: () =>
                        setState(() => _status = AttendanceStatus.absent),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _StatusOption(
                    label: 'متأخر',
                    icon: Icons.access_time_rounded,
                    color: const Color(0xFFF59E0B),
                    isSelected: _status == AttendanceStatus.late,
                    onTap: () =>
                        setState(() => _status = AttendanceStatus.late),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: _notes),
              onChanged: (v) => _notes = v,
              decoration: InputDecoration(
                hintText: 'ملاحظات...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.controller.updateAttendanceRecord(
                    widget.record.copyWith(
                      status: _status,
                      notes: _notes.isEmpty ? null : _notes,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'حفظ التعديلات',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : color, size: 22),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
