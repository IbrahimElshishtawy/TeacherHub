import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // To load local JSON files

// Create a Course class to handle course data
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
      courseName: json['courseName'],
      videoCount: json['videoCount'],
      publishDate: json['publishDate'],
      status: json['status'],
      studentCount: json['studentCount'],
      coursePrice: json['coursePrice'],
      duration: json['duration'],
    );
  }
}

// Load courses data from a local JSON file
Future<List<Course>> loadCourses() async {
  String jsonString = await rootBundle.loadString('assets/courses.json');
  List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map((course) => Course.fromJson(course)).toList();
}

// Create a PaidCoursesWidget that accepts dynamic data
class PaidCoursesWidget extends StatelessWidget {
  final Course course; // Accept a Course object instead of individual fields

  const PaidCoursesWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // Added higher elevation for better shadow effect
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.grey.withOpacity(0.5), // Shadow effect
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title of the section
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الكورسات المدفوعة المنشورة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),

            // Course name and icon
            Row(
              children: [
                Icon(Icons.book, color: Colors.blue, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'اسم الكورس: ${course.courseName}',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Course sessions and icon
            Row(
              children: [
                Icon(Icons.schedule, color: Colors.orange, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'عدد فيديوهات الكورس: ${course.videoCount} فيديوهات',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Course publish date and icon
            Row(
              children: [
                Icon(Icons.date_range, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'تاريخ النشر: ${course.publishDate}',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Course status and icon
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.blue, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'الحالة: ${course.status}',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Course students count and icon
            Row(
              children: [
                Icon(Icons.people, color: Colors.purple, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'عدد المشتركين: ${course.studentCount} طالب',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Course price and icon
            Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'سعر الكورس: ${course.coursePrice} جنيه',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Add more data if needed
            Row(
              children: [
                Icon(Icons.access_alarm, color: Colors.red, size: 20),
                SizedBox(width: 10),
                Expanded(
                  // Use Expanded to ensure it fits correctly
                  child: Text(
                    'المدة الزمنية: ${course.duration}',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Create a dynamic list for displaying multiple PaidCoursesWidget
class CoursesListWidget extends StatelessWidget {
  const CoursesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: loadCourses(), // Load data from JSON file
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Show loading indicator while waiting for data
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          List<Course> courses = snapshot.data!;
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return PaidCoursesWidget(course: courses[index]);
            },
          );
        }
      },
    );
  }
}
