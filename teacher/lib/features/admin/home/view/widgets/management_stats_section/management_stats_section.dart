import 'dart:math';
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/domain/entities/stat_item.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/widget/management_action_button.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/widget/management_month_selector.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/widget/management_stat_row.dart';

class ManagementStatsSection extends StatefulWidget {
  const ManagementStatsSection({
    super.key,
    this.onMonthChanged,
    this.onRefresh,
    this.onDownload,
  });

  final void Function(String month)? onMonthChanged;
  final VoidCallback? onRefresh;
  final VoidCallback? onDownload;

  @override
  State<ManagementStatsSection> createState() => _ManagementStatsSectionState();
}

class _ManagementStatsSectionState extends State<ManagementStatsSection> {
  final List<String> months = const [
    'يونيو',
    'مايو',
    'أبريل',
    'مارس',
    'فبراير',
    'يناير',
  ];
  String selectedMonth = 'يناير';

  List<StatItem> _statsForMonth(String month) {
    switch (month) {
      case 'يناير':
        return const [
          StatItem(
            title: "عدد الطلاب",
            value: 1000,
            color: Color(0xFF0B197A),
            type: StatDisplayType.bar,
          ),
          StatItem(
            title: "عدد أولياء الأمور",
            value: 950,
            color: Color(0xFF7B3F12),
            type: StatDisplayType.bar,
          ),
          StatItem(
            title: "عدد الكورسات",
            value: 50,
            color: Color(0xFF6A1BB2),
            type: StatDisplayType.chip,
          ),
          StatItem(
            title: "متوسط الدفع",
            value: 300,
            color: Color(0xFF2F78FF),
            type: StatDisplayType.chip,
          ),
          StatItem(
            title: "الأجهزة المسجلة",
            value: 1953,
            color: Color(0xFF4B6F12),
            type: StatDisplayType.bar,
          ),
          StatItem(
            title: "الطلبات الجديدة",
            value: 22,
            color: Color(0xFFF59A23),
            type: StatDisplayType.chip,
          ),
          StatItem(
            title: "الأجهزة المجمدة",
            value: 0,
            color: Color(0xFFE53935),
            type: StatDisplayType.chip,
          ),
        ];
      default:
        final base = _statsForMonth('يناير');
        final factor = months.indexOf(month) + 1;
        return base
            .map(
              (s) => StatItem(
                title: s.title,
                value: max(0, (s.value * (0.85 + factor * 0.03)).round()),
                color: s.color,
                type: s.type,
              ),
            )
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stats = _statsForMonth(selectedMonth);
    final maxBarValue = stats
        .where((s) => s.type == StatDisplayType.bar)
        .map((s) => s.value)
        .fold<int>(1, (prev, v) => max(prev, v));

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "إحصائيات الإدارة",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE7E7E7)),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                    color: Color(0x1A000000),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Column(
                      children: [
                        ManagementActionButton(
                          label: "تحديث",
                          icon: Icons.refresh,
                          onTap: widget.onRefresh ?? () {},
                        ),
                        const SizedBox(height: 10),
                        ManagementActionButton(
                          label: "تحميل",
                          trailing: const Icon(
                            Icons.download_outlined,
                            size: 18,
                            color: Color(0xFF2F78FF),
                          ),
                          icon: Icons.keyboard_arrow_down_rounded,
                          onTap: widget.onDownload ?? () {},
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 52, 14, 14),
                    child: Column(
                      children: [
                        const SizedBox(height: 6),

                        ...stats.map(
                          (s) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ManagementStatRow(
                              stat: s,
                              maxBarValue: maxBarValue,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        ManagementMonthSelector(
                          months: months,
                          selectedMonth: selectedMonth,
                          onSelected: (m) {
                            setState(() => selectedMonth = m);
                            widget.onMonthChanged?.call(m);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
