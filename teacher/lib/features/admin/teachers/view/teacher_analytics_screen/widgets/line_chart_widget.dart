import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.withValues(alpha: 0.2),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.grey.withValues(alpha: 0.2),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text(
                          'السبت',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 1:
                        return const Text(
                          'الأحد',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 2:
                        return const Text(
                          'الإثنين',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 3:
                        return const Text(
                          'الثلاثاء',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 4:
                        return const Text(
                          'الأربعاء',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 5:
                        return const Text(
                          'الخميس',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      case 6:
                        return const Text(
                          'الجمعة',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        );
                      default:
                        return const Text('');
                    }
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
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 5),
                  FlSpot(1, 3),
                  FlSpot(2, 4),
                  FlSpot(3, 6),
                  FlSpot(4, 7),
                  FlSpot(5, 4),
                  FlSpot(6, 1),
                ],
                isCurved: true,
                color: const Color.fromARGB(255, 27, 107, 172),
                barWidth: 5,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withValues(alpha: 0.3),
                ),
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      color: Colors.blue,
                      radius: 4,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    );
                  },
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => Colors.blueAccent,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      '${spot.x}: ${spot.y}',
                      const TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
              ),
              touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                // Handle touch callback if needed
              },
              handleBuiltInTouches: true,
            ),
          ),
        ),
      ),
    );
  }
}
