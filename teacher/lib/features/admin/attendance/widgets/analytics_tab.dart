// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controller/attendance_controller.dart';

class AnalyticsTab extends StatelessWidget {
  final AttendanceController controller;
  const AnalyticsTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final st = controller.state.value;
    final total = st.totalStudents == 0 ? 1 : st.totalStudents;
    final presentPct = st.presentCount / total * 100;
    final absentPct = st.absentCount / total * 100;
    final latePct = st.lateCount / total * 100;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        // Donut Chart
        _SectionTitle(title: 'توزيع الحضور اليوم'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 3,
                        centerSpaceRadius: 60,
                        sections: [
                          PieChartSectionData(
                            value: presentPct.clamp(0.01, 100),
                            color: const Color(0xFF22C55E),
                            title: '',
                            radius: 40,
                          ),
                          PieChartSectionData(
                            value: absentPct.clamp(0.01, 100),
                            color: const Color(0xFFEF4444),
                            title: '',
                            radius: 40,
                          ),
                          PieChartSectionData(
                            value: latePct.clamp(0.01, 100),
                            color: const Color(0xFFF59E0B),
                            title: '',
                            radius: 40,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${st.attendanceRate.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const Text(
                          'نسبة الحضور',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Legend(
                      label: 'حاضر',
                      value: '${presentPct.toStringAsFixed(1)}%',
                      color: const Color(0xFF22C55E)),
                  _Legend(
                      label: 'غائب',
                      value: '${absentPct.toStringAsFixed(1)}%',
                      color: const Color(0xFFEF4444)),
                  _Legend(
                      label: 'متأخر',
                      value: '${latePct.toStringAsFixed(1)}%',
                      color: const Color(0xFFF59E0B)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // QR vs Manual bar
        _SectionTitle(title: 'طريقة التسجيل'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _MethodBar(
                label: 'QR Code',
                icon: Icons.qr_code_scanner_rounded,
                count: st.qrCount,
                total: st.records.isEmpty ? 1 : st.records.length,
                color: const Color(0xFF2563EB),
              ),
              const SizedBox(height: 12),
              _MethodBar(
                label: 'يدوي',
                icon: Icons.edit_note_rounded,
                count: st.manualCount,
                total: st.records.isEmpty ? 1 : st.records.length,
                color: const Color(0xFF7C3AED),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Most absent students
        _SectionTitle(title: 'أكثر الطلاب غياباً'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ...controller.mostAbsentStudents.asMap().entries.map((e) {
                final idx = e.key;
                final s = e.value;
                return Column(
                  children: [
                    if (idx > 0)
                      Divider(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _absenceColor(s.absenceCount)
                              .withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${idx + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: _absenceColor(s.absenceCount),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        s.name,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      subtitle: Text(
                        s.batch,
                        style: TextStyle(
                            fontSize: 11.5, color: Colors.grey.shade500),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _absenceColor(s.absenceCount)
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${s.absenceCount} غياب',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _absenceColor(s.absenceCount),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Best attendance
        _SectionTitle(title: 'أفضل الطلاب حضوراً'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ...controller.bestAttendanceStudents.asMap().entries.map((e) {
                final idx = e.key;
                final s = e.value;
                return Column(
                  children: [
                    if (idx > 0)
                      Divider(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF22C55E).withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: idx == 0
                              ? const Icon(Icons.emoji_events_rounded,
                                  color: Color(0xFFF59E0B), size: 18)
                              : Text(
                                  '${idx + 1}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF22C55E),
                                    fontSize: 14,
                                  ),
                                ),
                        ),
                      ),
                      title: Text(
                        s.name,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      subtitle: Text(
                        s.batch,
                        style: TextStyle(
                            fontSize: 11.5, color: Colors.grey.shade500),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF22C55E).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${s.attendanceRate.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF22C55E),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Color _absenceColor(int count) {
    if (count >= 10) return const Color(0xFFEF4444);
    if (count >= 5) return const Color(0xFFF59E0B);
    return const Color(0xFF6366F1);
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _Legend(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MethodBar extends StatelessWidget {
  final String label;
  final IconData icon;
  final int count;
  final int total;
  final Color color;
  const _MethodBar({
    required this.label,
    required this.icon,
    required this.count,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = (count / total).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
            const Spacer(),
            Text(
              '$count طالب',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: fraction,
            backgroundColor: color.withOpacity(0.12),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 10,
          ),
        ),
      ],
    );
  }
}
