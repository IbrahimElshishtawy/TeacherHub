import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyActivityWidget extends StatefulWidget {
  const WeeklyActivityWidget({super.key});

  @override
  _WeeklyActivityWidgetState createState() => _WeeklyActivityWidgetState();
}

class _WeeklyActivityWidgetState extends State<WeeklyActivityWidget> {
  int selectedIndex = 0; // Index to track which button is selected
  String currentView = 'login'; // Default view is 'login'

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(3),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            // Title
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نشاط المدرس الأسبوعي',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'متابعة تسجيل الدخول، رفع الملفات، وإدارة الواجبات خلال الأسبوع',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Divider(),
            const SizedBox(height: 20),

            // AnimatedSwitcher for changing content in the card
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentView == 'login'
                  ? SizedBox(
                      height: 250, // Set a fixed height for the chart
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) {
                                  if (value.isFinite) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return const Text(
                                          'السبت',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 1:
                                        return const Text(
                                          'الأحد',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 2:
                                        return const Text(
                                          'الإثنين',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 3:
                                        return const Text(
                                          'الثلاثاء',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 4:
                                        return const Text(
                                          'الأربعاء',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 5:
                                        return const Text(
                                          'الخميس',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
                                      case 6:
                                        return const Text(
                                          'الجمعة',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        );
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
                                color: Colors.blue.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : currentView == 'cancelledClasses'
                  ? Text('عرض الحصص الملغية')
                  : Text('عرض الكورسات المدفوعة'),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                        currentView =
                            'login'; // Show login activity when clicked
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      backgroundColor: selectedIndex == 0
                          ? Colors.blue
                          : Colors.grey, // Change color when selected
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                        currentView =
                            'cancelledClasses'; // Show cancelled classes when clicked
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      backgroundColor: selectedIndex == 1
                          ? Colors.blue
                          : Colors.grey, // Change color when selected
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      'الحصص الملغية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                        currentView =
                            'paidCourses'; // Show paid courses when clicked
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      backgroundColor: selectedIndex == 2
                          ? Colors.blue
                          : Colors.grey, // Change color when selected
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      'الكورسات المدفوعة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
