// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartref extends StatefulWidget {
  const LineChartref({super.key});

  @override
  State<LineChartref> createState() => _LineChartrefState();
}

class _LineChartrefState extends State<LineChartref> {
  int _selectedMonth = 0;

  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  final List<List<FlSpot>> monthlyData = [
    [
      FlSpot(0, 2),
      FlSpot(1, 3),
      FlSpot(2, 4),
      FlSpot(3, 1),
      FlSpot(4, 2),
      FlSpot(5, 3),
      FlSpot(6, 4),
    ], // يناير
    [
      FlSpot(0, 5),
      FlSpot(1, 2),
      FlSpot(2, 6),
      FlSpot(3, 3),
      FlSpot(4, 4),
      FlSpot(5, 1),
      FlSpot(6, 5),
    ], // فبراير
    [
      FlSpot(0, 1),
      FlSpot(1, 4),
      FlSpot(2, 3),
      FlSpot(3, 5),
      FlSpot(4, 2),
      FlSpot(5, 6),
      FlSpot(6, 3),
    ], // مارس
    [
      FlSpot(0, 3),
      FlSpot(1, 5),
      FlSpot(2, 2),
      FlSpot(3, 4),
      FlSpot(4, 6),
      FlSpot(5, 2),
      FlSpot(6, 1),
    ], // أبريل
    [
      FlSpot(0, 6),
      FlSpot(1, 1),
      FlSpot(2, 5),
      FlSpot(3, 2),
      FlSpot(4, 3),
      FlSpot(5, 4),
      FlSpot(6, 2),
    ], // مايو
    [
      FlSpot(0, 2),
      FlSpot(1, 6),
      FlSpot(2, 1),
      FlSpot(3, 4),
      FlSpot(4, 5),
      FlSpot(5, 3),
      FlSpot(6, 6),
    ], // يونيو
    [
      FlSpot(0, 4),
      FlSpot(1, 3),
      FlSpot(2, 5),
      FlSpot(3, 6),
      FlSpot(4, 1),
      FlSpot(5, 2),
      FlSpot(6, 4),
    ], // يوليو
    [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 3),
      FlSpot(3, 4),
      FlSpot(4, 5),
      FlSpot(5, 6),
      FlSpot(6, 3),
    ], // أغسطس
    [
      FlSpot(0, 5),
      FlSpot(1, 4),
      FlSpot(2, 2),
      FlSpot(3, 1),
      FlSpot(4, 3),
      FlSpot(5, 5),
      FlSpot(6, 2),
    ], // سبتمبر
    [
      FlSpot(0, 3),
      FlSpot(1, 1),
      FlSpot(2, 4),
      FlSpot(3, 6),
      FlSpot(4, 2),
      FlSpot(5, 4),
      FlSpot(6, 5),
    ], // أكتوبر
    [
      FlSpot(0, 6),
      FlSpot(1, 5),
      FlSpot(2, 1),
      FlSpot(3, 3),
      FlSpot(4, 4),
      FlSpot(5, 2),
      FlSpot(6, 6),
    ], // نوفمبر
    [
      FlSpot(0, 2),
      FlSpot(1, 4),
      FlSpot(2, 6),
      FlSpot(3, 5),
      FlSpot(4, 1),
      FlSpot(5, 3),
      FlSpot(6, 4),
    ], // ديسمبر
  ];

  @override
  Widget build(BuildContext context) {
    final spots = monthlyData[_selectedMonth];

    return Column(
      children: [
        // ✅ Tabs الشهور
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true, // ✅ عشان يبدأ من اليمين
            itemCount: months.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedMonth;
              return GestureDetector(
                onTap: () => setState(() => _selectedMonth = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF1B6BAC)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF1B6BAC)
                          : Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    months[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // ✅ الشارت
        Container(
          height: 280,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: LineChart(
            LineChartData(
              minY: 0,
              gridData: FlGridData(
                show: true,
                horizontalInterval: 1,
                verticalInterval: 1,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withValues(alpha: 0.15),
                  strokeWidth: 1,
                  dashArray: [6, 4],
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: Colors.grey.withValues(alpha: 0.15),
                  strokeWidth: 1,
                  dashArray: [6, 4],
                ),
              ),
              extraLinesData: ExtraLinesData(
                verticalLines: spots.map((spot) {
                  return VerticalLine(
                    x: spot.x,
                    color: Colors.black.withValues(alpha: 0.7),
                    strokeWidth: 1.5,
                    dashArray: [4, 3],
                  );
                }).toList(),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value == meta.min || value == meta.max) {
                        return const SizedBox();
                      }
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      const days = [
                        'السبت',
                        'الأحد',
                        'الإثنين',
                        'الثلاثاء',
                        'الأربعاء',
                        'الخميس',
                        'الجمعة',
                      ];
                      final index = value.toInt();
                      if (index < 0 || index >= days.length) {
                        return const Text('');
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          days[index],
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black.withValues(alpha: 0.3),
                    width: 1.1,
                  ),
                  left: BorderSide(
                    color: Colors.grey.withValues(alpha: 0.3),
                    width: 1.1,
                  ),
                  right: const BorderSide(color: Colors.transparent),
                  top: const BorderSide(color: Colors.transparent),
                ),
              ),
              lineBarsData: spots.map((spot) {
                return LineChartBarData(
                  spots: [FlSpot(spot.x, spot.y), FlSpot(spot.x + 1, spot.y)],
                  isCurved: false,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B6BAC), Color(0xFF4DA6FF)],
                  ),
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF1B6BAC).withValues(alpha: 0.35),
                        const Color(0xFF4DA6FF).withValues(alpha: 0.05),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (s, percent, barData, index) {
                      if (index == 0) {
                        return FlDotCirclePainter(
                          color: const Color(0xFF1B6BAC),
                          radius: 5,
                          strokeWidth: 2.5,
                          strokeColor: Colors.white,
                        );
                      }
                      return FlDotCirclePainter(
                        color: Colors.transparent,
                        radius: 0,
                        strokeWidth: 0,
                        strokeColor: Colors.transparent,
                      );
                    },
                  ),
                );
              }).toList(),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => const Color(0xFF1B6BAC),
                  tooltipBorderRadius: BorderRadius.circular(8),
                  tooltipPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        '${spot.y.toInt()}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    }).toList();
                  },
                ),
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? response) {},
                handleBuiltInTouches: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
