import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/admin_home/domain/entities/stat_item.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/management_stats_section/widget/management_bar_value.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/management_stats_section/widget/management_chip_value.dart';

class ManagementStatRow extends StatelessWidget {
  const ManagementStatRow({
    super.key,
    required this.stat,
    required this.maxValue,
  });

  final StatItem stat;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final safeMax = math.max(1, maxValue);
    final ratio = (stat.value / safeMax).clamp(0.0, 1.0);

    const labelStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w900,
      color: Color(0xFF6B6B6B),
    );

    void showValue() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('قيمة ${stat.title}: ${stat.value}'),
          duration: const Duration(seconds: 1),
        ),
      );
    }

    final valueWidget = stat.type == StatDisplayType.bar
        ? ManagementBarValue(
            value: stat.value,
            color: stat.color,
            ratio: ratio,
            minWidth: 30,
            height: 17,
          )
        : ManagementChipValue(
            value: stat.value,
            color: stat.color,
            ratio: ratio,
            minWidth: 30,
            height: 17,
          );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: showValue,
                  child: valueWidget,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),

          SizedBox(
            width: 115,
            child: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                stat.title,
                textAlign: TextAlign.right,
                style: labelStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
