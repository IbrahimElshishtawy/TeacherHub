import 'package:flutter/material.dart';

class DrawerSubItemModel {
  final String title;
  final String route;

  const DrawerSubItemModel({required this.title, required this.route});
}

class DrawerItemModel {
  final String title;
  final IconData icon;
  final String? route; // If it's a regular item that opens a page
  final List<DrawerSubItemModel> children;

  const DrawerItemModel({
    required this.title,
    required this.icon,
    this.route,
    this.children = const [],
  });

  bool get hasChildren => children.isNotEmpty;
}

class AdminDrawerState {
  String selectedRoute = "/home_admin"; // Currently selected route

  final List<DrawerItemModel> items = const [
    DrawerItemModel(title: "لوحة التحكم", icon: Icons.grid_view_rounded),
    DrawerItemModel(
      title: "المستخدمين",
      icon: Icons.group_outlined,
      children: [
        DrawerSubItemModel(
          title: "الطلاب & اولياء الأمور",
          route: "/home_admin/user_management",
        ),
        DrawerSubItemModel(title: "المدرسين", route: "/home_admin/teachers"),
      ],
    ),
    DrawerItemModel(
      title: "الكورسات",
      icon: Icons.folder_outlined,
      route: "/home_admin/courses",
    ),
    DrawerItemModel(
      title: "الاختبارات والمراجعات",
      icon: Icons.edit_note_outlined,
      children: [
        DrawerSubItemModel(
          title: "الاختبارات",
          route: "/home_admin/quizzes/tests",
        ),
        DrawerSubItemModel(
          title: "المراجعات",
          route: "/home_admin/quizzes/reviews",
        ),
        DrawerSubItemModel(
          title: "النتائج",
          route: "/home_admin/quizzes/results",
        ),
      ],
    ),
    DrawerItemModel(
      title: "الحضور والغياب",
      icon: Icons.calendar_month_outlined,
      route: "/home_admin/attendance",
    ),
    DrawerItemModel(
      title: "المدفوعات",
      icon: Icons.credit_card_outlined,
      route: "/home_admin/payments",
    ),
    DrawerItemModel(
      title: "التقارير والإحصائيات",
      icon: Icons.bar_chart_rounded,
      children: [
        DrawerSubItemModel(
          title: "الحضور",
          route: "/home_admin/reports/attendance",
        ),
        DrawerSubItemModel(
          title: "المدفوعات",
          route: "/home_admin/reports/payments",
        ),
        DrawerSubItemModel(
          title: "الكورسات",
          route: "/home_admin/reports/courses",
        ),
      ],
    ),
    DrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/home_admin/settings",
    ),
    DrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_none_rounded,
      route: "/home_admin/notifications",
    ),
    DrawerItemModel(
      title: "الدعم والمساعدة",
      icon: Icons.support_agent_outlined,
      route: "/home_admin/support",
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
