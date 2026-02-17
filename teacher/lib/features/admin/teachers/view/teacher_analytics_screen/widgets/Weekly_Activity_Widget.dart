import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/LineChart.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/Paid_Courses_Widget.dart';
import 'line_chart_widget.dart';
import 'bottom_navigation_buttons.dart';

class WeeklyActivityWidget extends StatefulWidget {
  const WeeklyActivityWidget({super.key});

  @override
  _WeeklyActivityWidgetState createState() => _WeeklyActivityWidgetState();
}

class _WeeklyActivityWidgetState extends State<WeeklyActivityWidget> {
  int selectedIndex = 0; // Index to track which button is selected
  String currentView = 'login'; // Default view is 'login'
  String cardTitle = 'نشاط المدرس الأسبوعي'; // Default card title

  // Sample course data to be passed to PaidCoursesWidget
  final List<Map<String, dynamic>> courses = [
    {
      'courseName': 'شرح الباب الأول - كيمياء',
      'videoCount': 6,
      'publishDate': '13-12-2025',
      'status': 'منشور',
      'studentCount': 35,
      'coursePrice': 300.0,
      'duration': '3 ساعات',
    },
    {
      'courseName': 'تعلم البرمجة بلغة Dart',
      'videoCount': 8,
      'publishDate': '10-10-2025',
      'status': 'منشور',
      'studentCount': 120,
      'coursePrice': 500.0,
      'duration': '5 ساعات',
    },
    {
      'courseName': 'مقدمة في الذكاء الاصطناعي',
      'videoCount': 12,
      'publishDate': '01-01-2026',
      'status': 'منشور',
      'studentCount': 200,
      'coursePrice': 750.0,
      'duration': '6 ساعات',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
                cardTitle, // Use dynamic card title
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
            const SizedBox(height: 2),

            // AnimatedSwitcher for changing content in the card
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentView == 'login'
                  ? LineChartWidget() // Display the Line Chart for login
                  : currentView == 'cancelledClasses'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'أكثر الأيام التي تم فيها إلغاء الحصص هذا الشهر',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Display the LineChart for cancelled classes
                            LineChartref(),
                          ],
                        )
                      : currentView == 'paidCourses'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'الكورسات المدفوعة المنشورة',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Display Paid Courses Widget with dynamic data
                                
                                  return Course(
                                    courseName: course['courseName'],
                                    videoCount: course['videoCount'],
                                    publishDate: course['publishDate'],
                                    status: course['status'],
                                    studentCount: course['studentCount'],
                                    coursePrice: course['coursePrice'],
                                    duration: course['duration'],
                                  );
                                
                              ],
                            )
                          : Container(), // Default empty container if no match
            ),
            SizedBox(height: 10),

            // Bottom Navigation Buttons
            BottomNavigationButtons(
              selectedIndex: selectedIndex,
              onSelect: (index, view, title) {
                setState(() {
                  selectedIndex = index;
                  currentView = view;
                  cardTitle = title;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
