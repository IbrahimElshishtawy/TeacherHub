import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets/performance_reports/widget/pie_outline_icon.dart';

class PerformanceReportsCard extends StatelessWidget {
  final VoidCallback? onTap;

  const PerformanceReportsCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "  تقارير الأداء",
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(4),
            child: Material(
              color: Colors.white,
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 92,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const PieOutlineIcon(size: 60, strokeWidth: 2),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "ألقي نظرة سريعة على أهم مؤشرات\nالأداء داخل النظام",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFF2F6BFF),
                        size: 26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
