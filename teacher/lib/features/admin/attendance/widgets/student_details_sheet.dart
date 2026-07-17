// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../state/attendance_state.dart';

class StudentDetailsSheet extends StatelessWidget {
  final AttendanceRecord record;
  final MockStudentEntry? student;

  const StudentDetailsSheet({
    super.key,
    required this.record,
    this.student,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(record.status);
    final statusLabel = _statusLabel(record.status);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Hero Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF2563EB),
                  const Color(0xFF60A5FA).withOpacity(0.8),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 3),
                  ),
                  child: Center(
                    child: Text(
                      record.studentName[0],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        record.studentName,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        record.studentCode,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _WhiteChip(record.batch),
                          const SizedBox(width: 6),
                          _WhiteChip(record.grade),
                        ],
                      ),
                    ],
                  ),
                ),
                // Status
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statusLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Cards Row
                  Row(
                    children: [
                      Expanded(
                          child: _InfoCard(
                        icon: Icons.phone_rounded,
                        label: 'هاتف الطالب',
                        value: record.phone.isEmpty ? 'غير متوفر' : record.phone,
                        color: const Color(0xFF2563EB),
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _InfoCard(
                        icon: Icons.supervisor_account_rounded,
                        label: 'هاتف ولي الأمر',
                        value: record.parentPhone.isEmpty
                            ? 'غير متوفر'
                            : record.parentPhone,
                        color: const Color(0xFF7C3AED),
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: _InfoCard(
                        icon: Icons.access_time_rounded,
                        label: 'وقت التسجيل',
                        value: _formatTime(record.time),
                        color: const Color(0xFFF59E0B),
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _InfoCard(
                        icon: record.method == AttendanceMethod.qr
                            ? Icons.qr_code_scanner_rounded
                            : Icons.edit_note_rounded,
                        label: 'طريقة التسجيل',
                        value: record.method == AttendanceMethod.qr
                            ? 'QR Code'
                            : 'يدوي',
                        color: record.method == AttendanceMethod.qr
                            ? const Color(0xFF2563EB)
                            : const Color(0xFF7C3AED),
                      )),
                    ],
                  ),
                  if (student != null) ...[
                    const SizedBox(height: 20),
                    const _SectionHeader(title: 'سجل الحضور والأداء'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            child: _StatsMini(
                          label: 'نسبة الحضور',
                          value:
                              '${student!.attendanceRate.toStringAsFixed(1)}%',
                          color: _rateColor(student!.attendanceRate),
                        )),
                        const SizedBox(width: 10),
                        Expanded(
                            child: _StatsMini(
                          label: 'مرات الغياب',
                          value: student!.absenceCount.toString(),
                          color: const Color(0xFFEF4444),
                        )),
                        const SizedBox(width: 10),
                        Expanded(
                            child: _StatsMini(
                          label: 'مرات التأخر',
                          value: student!.lateCount.toString(),
                          color: const Color(0xFFF59E0B),
                        )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Attendance rate bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'معدل الحضور الكلي',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF374151),
                                ),
                              ),
                              Text(
                                '${student!.attendanceRate.toStringAsFixed(1)}%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: _rateColor(student!.attendanceRate),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: student!.attendanceRate / 100,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  _rateColor(student!.attendanceRate)),
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (record.notes != null && record.notes!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const _SectionHeader(title: 'ملاحظات المعلم'),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBEB),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: const Color(0xFFF59E0B).withOpacity(0.3)),
                      ),
                      child: Text(
                        record.notes!,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF374151),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(AttendanceStatus s) {
    switch (s) {
      case AttendanceStatus.present:
        return const Color(0xFF22C55E);
      case AttendanceStatus.absent:
        return const Color(0xFFEF4444);
      case AttendanceStatus.late:
        return const Color(0xFFF59E0B);
    }
  }

  String _statusLabel(AttendanceStatus s) {
    switch (s) {
      case AttendanceStatus.present:
        return 'حاضر';
      case AttendanceStatus.absent:
        return 'غائب';
      case AttendanceStatus.late:
        return 'متأخر';
    }
  }

  Color _rateColor(double rate) {
    if (rate >= 80) return const Color(0xFF22C55E);
    if (rate >= 60) return const Color(0xFFF59E0B);
    return const Color(0xFFEF4444);
  }

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _WhiteChip extends StatelessWidget {
  final String text;
  const _WhiteChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsMini extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatsMini(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

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
