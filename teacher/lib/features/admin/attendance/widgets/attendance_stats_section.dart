import 'package:flutter/material.dart';
import '../state/attendance_state.dart';

class AttendanceStatsSection extends StatelessWidget {
  final AttendanceState st;
  const AttendanceStatsSection({super.key, required this.st});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإحصائيات السريعة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        // Top 4 cards
        Row(
          children: [
            Expanded(child: _GlassStatCard(
              label: 'إجمالي الطلاب',
              value: st.totalStudents.toString(),
              icon: Icons.groups_rounded,
              gradient: const [Color(0xFF6366F1), Color(0xFF818CF8)],
            )),
            const SizedBox(width: 10),
            Expanded(child: _GlassStatCard(
              label: 'الحاضرون',
              value: st.presentCount.toString(),
              icon: Icons.check_circle_rounded,
              gradient: const [Color(0xFF22C55E), Color(0xFF4ADE80)],
            )),
            const SizedBox(width: 10),
            Expanded(child: _GlassStatCard(
              label: 'الغائبون',
              value: st.absentCount.toString(),
              icon: Icons.cancel_rounded,
              gradient: const [Color(0xFFEF4444), Color(0xFFF87171)],
            )),
            const SizedBox(width: 10),
            Expanded(child: _GlassStatCard(
              label: 'المتأخرون',
              value: st.lateCount.toString(),
              icon: Icons.access_time_rounded,
              gradient: const [Color(0xFFF59E0B), Color(0xFFFBBF24)],
            )),
          ],
        ),
        const SizedBox(height: 10),
        // Bottom 3 cards
        Row(
          children: [
            Expanded(child: _GlassStatCard(
              label: 'بالـ QR',
              value: st.qrCount.toString(),
              icon: Icons.qr_code_scanner_rounded,
              gradient: const [Color(0xFF2563EB), Color(0xFF60A5FA)],
            )),
            const SizedBox(width: 10),
            Expanded(child: _GlassStatCard(
              label: 'يدوياً',
              value: st.manualCount.toString(),
              icon: Icons.edit_note_rounded,
              gradient: const [Color(0xFF7C3AED), Color(0xFFA78BFA)],
            )),
            const SizedBox(width: 10),
            Expanded(child: _AttendanceRateCard(rate: st.attendanceRate)),
          ],
        ),
      ],
    );
  }
}

class _GlassStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final List<Color> gradient;

  const _GlassStatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.9), size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AttendanceRateCard extends StatelessWidget {
  final double rate;
  const _AttendanceRateCard({required this.rate});

  @override
  Widget build(BuildContext context) {
    final pct = rate.clamp(0, 100).toDouble();
    final color = pct >= 80
        ? const Color(0xFF22C55E)
        : pct >= 60
            ? const Color(0xFFF59E0B)
            : const Color(0xFFEF4444);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.pie_chart_rounded, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${pct.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'نسبة الحضور',
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct / 100,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }
}
