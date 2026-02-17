// ملف Paid_Courses_Widget
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Course {
  final String courseName;
  final int videoCount;
  final String publishDate;
  final String status;
  final int studentCount;
  final double coursePrice;
  final String duration;

  Course({
    required this.courseName,
    required this.videoCount,
    required this.publishDate,
    required this.status,
    required this.studentCount,
    required this.coursePrice,
    required this.duration,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'] as String,
      videoCount: json['videoCount'] as int,
      publishDate: json['publishDate'] as String,
      status: json['status'] as String,
      studentCount: json['studentCount'] as int,
      coursePrice: (json['coursePrice'] as num).toDouble(),
      duration: json['duration'] as String,
    );
  }
}

Future<List<Course>> loadCourses() async {
  final String jsonString = await rootBundle.loadString('assets/courses.json');
  final List<dynamic> jsonResponse = json.decode(jsonString) as List<dynamic>;
  return jsonResponse
      .map((course) => Course.fromJson(course as Map<String, dynamic>))
      .toList();
}

class PaidCoursesWidget extends StatefulWidget {
  final List<Course> courses;

  const PaidCoursesWidget({super.key, required this.courses});

  @override
  State<PaidCoursesWidget> createState() => _PaidCoursesWidgetState();
}

class _PaidCoursesWidgetState extends State<PaidCoursesWidget> {
  int _currentIndex = 0;

  void _nextCourse() {
    if (_currentIndex < widget.courses.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _previousCourse() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.courses.isEmpty) {
      return const Card(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('لا توجد كورسات متاحة'),
          ),
        ),
      );
    }

    final course = widget.courses[_currentIndex];

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.grey.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header مع العداد
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_currentIndex + 1} / ${widget.courses.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'الكورسات المدفوعة المنشورة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 15),

            // محتوى الكورس مع Animation
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Column(
                key: ValueKey<int>(_currentIndex),
                children: [
                  _buildRow(
                    Icons.book,
                    Colors.blue,
                    'اسم الكورس: ${course.courseName}',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.schedule,
                    Colors.orange,
                    'عدد فيديوهات الكورس: ${course.videoCount} فيديوهات',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.date_range,
                    Colors.green,
                    'تاريخ النشر: ${course.publishDate}',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.check_circle,
                    Colors.blue,
                    'الحالة: ${course.status}',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.people,
                    Colors.purple,
                    'عدد المشتركين: ${course.studentCount} طالب',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.monetization_on,
                    Colors.green,
                    'سعر الكورس: ${course.coursePrice} جنيه',
                  ),
                  const SizedBox(height: 12),
                  _buildRow(
                    Icons.access_alarm,
                    Colors.red,
                    'المدة الزمنية: ${course.duration}',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // أزرار التنقل
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // زر السابق
                IconButton(
                  onPressed: _currentIndex > 0 ? _previousCourse : null,
                  icon: const Icon(Icons.arrow_back_ios),
                  color: const Color(0xFF1B6BAC),
                  disabledColor: Colors.grey.withValues(alpha: 0.3),
                  style: IconButton.styleFrom(
                    backgroundColor: _currentIndex > 0
                        ? const Color(0xFF1B6BAC).withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // Indicator النقاط
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.courses.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _currentIndex == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? const Color(0xFF1B6BAC)
                            : Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // زر التالي
                IconButton(
                  onPressed: _currentIndex < widget.courses.length - 1
                      ? _nextCourse
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: const Color(0xFF1B6BAC),
                  disabledColor: Colors.grey.withValues(alpha: 0.3),
                  style: IconButton.styleFrom(
                    backgroundColor: _currentIndex < widget.courses.length - 1
                        ? const Color(0xFF1B6BAC).withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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

  Widget _buildRow(IconData icon, Color color, String text) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        SizedBox(width: 10),
        Icon(icon, color: color, size: 20),
      ],
    );
  }
}

class CoursesListWidget extends StatelessWidget {
  const CoursesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: loadCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return PaidCoursesWidget(courses: snapshot.data!);
        }
      },
    );
  }
}
