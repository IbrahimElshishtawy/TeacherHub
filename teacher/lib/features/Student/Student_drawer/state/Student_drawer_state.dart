import 'package:flutter/material.dart';

class StudentDrawerSubItemModel {
  final String title;
  final String route;

  const StudentDrawerSubItemModel({required this.title, required this.route});
}

class StudentDrawerItemModel {
  final String title;
  final IconData icon;
  final String? route; // If it's a regular item that opens a page
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
    StudentDrawerItemModel(title: "لوحة التحكم", icon: Icons.grid_view_rounded),
    StudentDrawerItemModel(
      title: "المستخدمين",
      icon: Icons.group_outlined,
      children: [
        StudentDrawerSubItemModel(
          title: "الطلاب & اولياء الأمور",
          route: "/home_student/user_management",
        ),
        StudentDrawerSubItemModel(
          title: "المدرسين",
          route: "/home_student/teachers",
        ),
      ],
    ),
    StudentDrawerItemModel(
      title: "الكورسات",
      icon: Icons.folder_outlined,
      route: "/home_student/courses",
    ),
    StudentDrawerItemModel(
      title: "الاختبارات والمراجعات",
      icon: Icons.edit_note_outlined,
      route: "/home_student/exams_rr",
    ),
    StudentDrawerItemModel(
      title: "الحضور والغياب",
      icon: Icons.calendar_month_outlined,
      route: "/home_student/attendance",
    ),
    StudentDrawerItemModel(
      title: "المدفوعات",
      icon: Icons.credit_card_outlined,
      route: "/home_student/payments",
    ),
    StudentDrawerItemModel(
      title: "التقارير والإحصائيات",
      icon: Icons.bar_chart_rounded,
      route: "/home_student/reports",
    ),
    StudentDrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/settings",
    ),
    StudentDrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_none_rounded,
      route: "/home_student/notifications",
    ),
    StudentDrawerItemModel(
      title: "الدعم والمساعدة",
      icon: Icons.support_agent_outlined,
      route: "/home_student/support",
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

  // Check if the item is expanded
  bool isExpanded(String route) {
    return expandedItems[route] ?? false;
  }
}
