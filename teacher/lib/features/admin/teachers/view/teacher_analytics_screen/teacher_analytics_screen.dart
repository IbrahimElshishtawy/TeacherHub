// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Use the new package

import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/Weekly_Activity_Widget.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/subjects_table_widgets.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('تحليل البيانات')),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: Text(
                          'نظرة عامة على أداء المدرس',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: Text(
                          'ملخص سريع لأهم البيانات: المواد الدراسية، الطلاب، الواجبات ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // First Column: two cards
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCard(
                              "عدد الطلاب",
                              "الطلاب في كل المستويات : 453",
                              FontAwesomeIcons.users, // FontAwesome icon
                              Color(0xFF4CAF50), // Green color
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _buildCard(
                              "المواد الدراسية",
                              "المدرس مسؤول عن : مادتيين”",
                              FontAwesomeIcons.book, // FontAwesome icon
                              Color(0xFF2196F3), // Blue color
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Second Column: two cards
                      Row(
                        children: [
                          Expanded(
                            child: _buildCard(
                              "عدد الحصص الملغية",
                              "تم إلغاء 4 حصص",
                              FontAwesomeIcons.calendarTimes, // Cancel icon
                              Color(0xFFFF5722), // Red color
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _buildCard(
                              "عدد الحصص الدراسية",
                              "عدد الحصص أسبوعياً: 3 حصص”",
                              FontAwesomeIcons.chalkboardTeacher, // Class icon
                              Color(0xFFFFC107), // Yellow color
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Third Column: one card
                      _buildCard(
                        "عدد الاختبارات المنشورة",
                        "تم نشر 6 اختبارات",
                        FontAwesomeIcons.clipboardCheck, // Test icon
                        Color(0xFF673AB7), // Purple color
                      ),
                    ],
                  ),
                ),
              ),
              SubjectTableWidget(),
              WeeklyActivityWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String data, IconData icon, Color iconColor) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor, // Set the icon color dynamically
              size: 30,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 26, 31, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
