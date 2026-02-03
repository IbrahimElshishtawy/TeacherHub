import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final IconData icon;
  final String route;

  const DrawerItemModel({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class AdminDrawerState {
  int selectedIndex = 0;

  final List<DrawerItemModel> mainItems = const [
    DrawerItemModel(
      title: "لوحة التحكم",
      icon: Icons.grid_view_rounded,
      route: "/admin/home",
    ),
    DrawerItemModel(
      title: "المستخدمين",
      icon: Icons.group_outlined,
      route: "/admin/users",
    ),
    DrawerItemModel(
      title: "الكورسات",
      icon: Icons.folder_outlined,
      route: "/admin/courses",
    ),
    DrawerItemModel(
      title: "الاختبارات والمراجعات",
      icon: Icons.edit_note_outlined,
      route: "/admin/quizzes",
    ),
    DrawerItemModel(
      title: "الحضور والغياب",
      icon: Icons.calendar_month_outlined,
      route: "/admin/attendance",
    ),
    DrawerItemModel(
      title: "المدفوعات",
      icon: Icons.credit_card_outlined,
      route: "/admin/payments",
    ),
    DrawerItemModel(
      title: "التقارير والإحصائيات",
      icon: Icons.bar_chart_rounded,
      route: "/admin/reports",
    ),
  ];

  final List<DrawerItemModel> secondaryItems = const [
    DrawerItemModel(
      title: "الإعدادات",
      icon: Icons.settings_outlined,
      route: "/admin/settings",
    ),
    DrawerItemModel(
      title: "الإشعارات",
      icon: Icons.notifications_none_rounded,
      route: "/admin/notifications",
    ),
    DrawerItemModel(
      title: "الدعم والمساعدة",
      icon: Icons.support_agent_outlined,
      route: "/admin/support",
    ),
  ];
}
