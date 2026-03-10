// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StudentDrawerSubItemModel {
  final String title;
  final String route;

  const StudentDrawerSubItemModel({required this.title, required this.route});
}

class StudentDrawerItemModel {
  final String title;
  final IconData icon;
  final String? route;
  final List<StudentDrawerSubItemModel> children;

  const StudentDrawerItemModel({
    required this.title,
    required this.icon,
    this.route,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class StudentDrawerState {
  String selectedRoute = "/home_student";

  final List<StudentDrawerItemModel> items = const [
    StudentDrawerItemModel(
      title: "الملف الشخصي",
      icon: Icons.person_outline,
      route: "/profile_student",
    ),
    StudentDrawerItemModel(
      title: "المواد الدراسية",
      icon: Icons.book_outlined,
      route: "/courses",
    ),
    StudentDrawerItemModel(
      title: "كورساتي",
      icon: Icons.play_circle_filled_outlined,
      route: "/my_courses",
    ),
    StudentDrawerItemModel(
      title: "قناة التواصل",
      icon: Icons.chat_bubble_outline_rounded,
      route: "/communication_channel",
    ),
    StudentDrawerItemModel(
      title: "العناصر المحفوظة",
      icon: Icons.bookmark_border_rounded,
      route: "/saved_items",
    ),
    StudentDrawerItemModel(
      title: "الأحداث المهمة",
      icon: Icons.event_outlined,
      route: "/important_events",
    ),
    StudentDrawerItemModel(
      title: "تسجيل الحضور",
      icon: Icons.check_circle_outline,
      route: "/attendance_student",
    ),
    StudentDrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/settings_student",
    ),
    StudentDrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_outlined,
      route: "/notifications_student",
    ),
  ];

  // A list to keep track of expanded items
  final Map<String, bool> expandedItems = {};

  // Function to toggle item expansion
  void toggleExpansion(String route) {
    if (expandedItems.containsKey(route)) {
      expandedItems[route] = !expandedItems[route]!;
    } else {
      expandedItems[route] = true;
    }

    // Close all other items that are not the selected one
    for (var key in expandedItems.keys) {
      if (key != route) {
        expandedItems[key] = false;
      }
    }
  }

  bool isExpanded(String route) {
    return expandedItems[route] ?? false;
  }
}
