import 'package:flutter/material.dart';

class AdminDrawerSubItemModel {
  final String title;
  final String route;

  const AdminDrawerSubItemModel({required this.title, required this.route});
}

class AdminDrawerItemModel {
  final String title;
  final IconData icon;
  final String? route; // If it's a regular item that opens a page
  final List<AdminDrawerSubItemModel> children;

  const AdminDrawerItemModel({
    required this.title,
    required this.icon,
    this.route,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class AdminDrawerState {
  String selectedRoute = "/home_admin";

  final List<AdminDrawerItemModel> items = const [
    AdminDrawerItemModel(title: "لوحة التحكم", icon: Icons.grid_view_rounded),
    AdminDrawerItemModel(
      title: "المستخدمين",
      icon: Icons.group_outlined,
      route: "/home_admin/user_management",
    ),
    AdminDrawerItemModel(
      title: "الكورسات",
      icon: Icons.folder_outlined,
      route: "/home_admin/courses",
    ),
    AdminDrawerItemModel(
      title: "الاختبارات والمراجعات",
      icon: Icons.edit_note_outlined,
      route: "/home_admin/exams_rr",
    ),
    AdminDrawerItemModel(
      title: "الحضور والغياب",
      icon: Icons.calendar_month_outlined,
      route: "/home_admin/attendance",
    ),
    AdminDrawerItemModel(
      title: "المدفوعات",
      icon: Icons.credit_card_outlined,
      route: "/home_admin/payments",
    ),
    AdminDrawerItemModel(
      title: "التقارير والإحصائيات",
      icon: Icons.bar_chart_rounded,
      route: "/home_admin/reports",
    ),
    AdminDrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/settings",
    ),
    AdminDrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_none_rounded,
      route: "/home_admin/notifications",
    ),
    AdminDrawerItemModel(
      title: "الدعم والمساعدة",
      icon: Icons.support_agent_outlined,
      route: "/home_admin/support",
    ),
  ];

  final Map<String, bool> expandedItems = {};
  void toggleExpansion(String route) {
    if (expandedItems.containsKey(route)) {
      expandedItems[route] = !expandedItems[route]!;
    } else {
      expandedItems[route] = true;
    }

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
