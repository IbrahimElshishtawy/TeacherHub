// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class teacherDrawerSubItemModel {
  final String title;
  final String route;

  const teacherDrawerSubItemModel({required this.title, required this.route});
}

class teacherDrawerItemModel {
  final String title;
  final IconData icon;
  final String? route;
  final List<teacherDrawerSubItemModel> children;

  const teacherDrawerItemModel({
    required this.title,
    required this.icon,
    this.route,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class teacherDrawerState {
  String selectedRoute = "/home_student";

  final List<teacherDrawerItemModel> items = const [
    teacherDrawerItemModel(
      title: "الملف الشخصي",
      icon: Icons.person_outline,
      route: "/profile_student",
    ),
    teacherDrawerItemModel(
      title: "المواد الدراسية",
      icon: Icons.book_outlined,
      route: "/courses",
    ),
    teacherDrawerItemModel(
      title: "كورساتي",
      icon: Icons.play_circle_filled_outlined,
      route: "/my_courses",
    ),
    teacherDrawerItemModel(
      title: "قناة التواصل",
      icon: Icons.chat_bubble_outline_rounded,
      route: "/communication_channel",
    ),
    teacherDrawerItemModel(
      title: "العناصر المحفوظة",
      icon: Icons.bookmark_border_rounded,
      route: "/saved_items",
    ),
    teacherDrawerItemModel(
      title: "الأحداث المهمة",
      icon: Icons.event_outlined,
      route: "/important_events",
    ),
    teacherDrawerItemModel(
      title: "تسجيل الحضور",
      icon: Icons.check_circle_outline,
      route: "/attendance_student",
    ),
    teacherDrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/settings_student",
    ),
    teacherDrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_outlined,
      route: "/notifications",
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
