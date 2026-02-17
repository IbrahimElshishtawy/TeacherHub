// ملف WeeklyActivityWidget
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/LineChart.dart';
import 'package:teacher/features/admin/teachers/view/teacher_analytics_screen/widgets/Paid_Courses_Widget.dart';
import 'line_chart_widget.dart';
import 'bottom_navigation_buttons.dart';

class WeeklyActivityWidget extends StatefulWidget {
  const WeeklyActivityWidget({super.key});

  @override
  State<WeeklyActivityWidget> createState() => _WeeklyActivityWidgetState();
}

class _WeeklyActivityWidgetState extends State<WeeklyActivityWidget> {
  int selectedIndex = 0;
  String currentView = 'login';
  String cardTitle = 'نشاط المدرس الأسبوعي';

  // ✅ تحويل من getter عادي لـ method بترجع List<Course>
  List<Course> get courses => [
    Course(
      courseName: 'شرح الباب الأول - كيمياء',
      videoCount: 6,
      publishDate: '13-12-2025',
      status: 'منشور',
      studentCount: 35,
      coursePrice: 300.0,
      duration: '3 ساعات',
    ),
    Course(
      courseName: 'تعلم البرمجة بلغة Dart',
      videoCount: 8,
      publishDate: '10-10-2025',
      status: 'منشور',
      studentCount: 120,
      coursePrice: 500.0,
      duration: '5 ساعات',
    ),
    Course(
      courseName: 'مقدمة في الذكاء الاصطناعي',
      videoCount: 12,
      publishDate: '01-01-2026',
      status: 'منشور',
      studentCount: 200,
      coursePrice: 750.0,
      duration: '6 ساعات',
    ),
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
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                cardTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'متابعة تسجيل الدخول، رفع الملفات، وإدارة الواجبات خلال الأسبوع',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const Divider(),
            const SizedBox(height: 2),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: currentView == 'login'
                  ? const LineChartWidget()
                  : currentView == 'cancelledClasses'
                  ? const Column(
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
                        LineChartref(),
                      ],
                    )
                  : currentView == 'paidCourses'
                  ? PaidCoursesWidget(courses: courses)
                  : Container(),
            ),
            const SizedBox(height: 10),

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
