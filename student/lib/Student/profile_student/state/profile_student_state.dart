import 'package:flutter/material.dart';

class ProfileStudentState {
  final String studentName;
  final String studentCode;
  final String email;
  final String phone;
  final String parentPhone;
  final String grade;
  final String joinDate;
  final String avatarUrl;

  final String totalCourses;
  final String completedExams;
  final String attendanceRate;

  const ProfileStudentState({
    required this.studentName,
    required this.studentCode,
    required this.email,
    required this.phone,
    required this.parentPhone,
    required this.grade,
    required this.joinDate,
    required this.avatarUrl,
    required this.totalCourses,
    required this.completedExams,
    required this.attendanceRate,
  });

  ProfileStudentState copyWith({
    String? studentName,
    String? studentCode,
    String? email,
    String? phone,
    String? parentPhone,
    String? grade,
    String? joinDate,
    String? avatarUrl,
    String? totalCourses,
    String? completedExams,
    String? attendanceRate,
  }) {
    return ProfileStudentState(
      studentName: studentName ?? this.studentName,
      studentCode: studentCode ?? this.studentCode,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      parentPhone: parentPhone ?? this.parentPhone,
      grade: grade ?? this.grade,
      joinDate: joinDate ?? this.joinDate,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      totalCourses: totalCourses ?? this.totalCourses,
      completedExams: completedExams ?? this.completedExams,
      attendanceRate: attendanceRate ?? this.attendanceRate,
    );
  }
}

class ProfileStudentTheme {
  static const Color primary = Color(0xFF20278F);
  static const Color scaffold = Color(0xFFF3F4F8);
  static const Color cardBorder = Color(0xFFD7DCE8);
  static const Color subtitle = Color(0xFF8A90A2);
  static const Color iconBlue = Color(0xFF3C79FF);
  static const Color textDark = Color(0xFF1E2230);
}
