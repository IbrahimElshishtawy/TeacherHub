import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/domain/entities/stat_item.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/widget/management_bar_value.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/widget/management_chip_value.dart';

class ManagementStatRow extends StatelessWidget {
  const ManagementStatRow({
    super.key,
    required this.stat,
    required this.maxBarValue,
  });

  final StatItem stat;
  final int maxBarValue;

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF6B6B6B),
    );

    final safeMax = math.max(1, maxBarValue);

    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: stat.type == StatDisplayType.bar
                ? ManagementBarValue(
                    value: stat.value,
                    color: stat.color,
                    ratio: (stat.value / safeMax).clamp(0.0, 1.0),
                  )
                : ManagementChipValue(value: stat.value, color: stat.color),
          ),
        ),
        const SizedBox(width: 14),
        SizedBox(
          width: 150,
          child: Text(
            stat.title,
            textAlign: TextAlign.right,
            style: labelStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
