import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyActivityWidget extends StatelessWidget {
  const WeeklyActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نشاط المدرس الأسبوعي',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'متابعة تسجيل الدخول، رفع الملفات، وإدارة الواجبات خلال الأسبوع',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            // Line Chart inside SizedBox with fixed height
            SizedBox(
              height: 250, // Set a fixed height for the chart
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      axisNameWidget: const Text('العدد'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: const Text('اليوم'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 18,
                        getTitlesWidget: (value, meta) {
                          // Ensure value is a valid integer and not NaN
                          if (value.isFinite) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text('السبت');
                              case 1:
                                return const Text('الأحد');
                              case 2:
                                return const Text('الإثنين');
                              case 3:
                                return const Text('الثلاثاء');
                              case 4:
                                return const Text('الأربعاء');
                              case 5:
                                return const Text('الخميس');
                              case 6:
                                return const Text('الجمعة');
                              default:
                                return const Text('');
                            }
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 5),
                        FlSpot(3, 6),
                        FlSpot(4, 9),
                        FlSpot(5, 6),
                        FlSpot(6, 10),
                      ],
                      isCurved: true,
                      color: Colors.blue, // Set the color of the line here
                      barWidth: 4,
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Buttons section
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ElevatedButton(onPressed: () {}, child: Text('تسجيل الدخول')),
            //     ElevatedButton(onPressed: () {}, child: Text('الحصص الملغية')),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text('الكورسات المدفوعة'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
