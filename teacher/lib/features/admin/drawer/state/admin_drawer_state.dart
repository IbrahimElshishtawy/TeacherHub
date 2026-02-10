import 'package:flutter/material.dart';

class DrawerSubItemModel {
  final String title;
  final String route;

  const DrawerSubItemModel({required this.title, required this.route});
}

class DrawerItemModel {
  final String title;
  final IconData icon;
  final String? route; // لو عنصر عادي يفتح صفحة
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
  String selectedRoute = "/admin/home";

  final List<DrawerItemModel> items = const [
    DrawerItemModel(title: "لوحة التحكم", icon: Icons.grid_view_rounded),

    DrawerItemModel(
      title: "المستخدمين",
      icon: Icons.group_outlined,
      children: [
        DrawerSubItemModel(title: "الطلاب", route: "/admin/users/students"),
        DrawerSubItemModel(title: "المدرسين", route: "/admin/users/teachers"),
        DrawerSubItemModel(
          title: "أولياء الأمور",
          route: "/admin/users/parents",
        ),
      ],
    ),

    DrawerItemModel(
      title: "الكورسات",
      icon: Icons.folder_outlined,
      route: "/admin/courses",
    ),

    DrawerItemModel(
      title: "الاختبارات والمراجعات",
      icon: Icons.edit_note_outlined,
      children: [
        DrawerSubItemModel(title: "الاختبارات", route: "/admin/quizzes/tests"),
        DrawerSubItemModel(title: "المراجعات", route: "/admin/quizzes/reviews"),
        DrawerSubItemModel(title: "النتائج", route: "/admin/quizzes/results"),
      ],
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
      children: [
        DrawerSubItemModel(title: "الحضور", route: "/admin/reports/attendance"),
        DrawerSubItemModel(
          title: "المدفوعات",
          route: "/admin/reports/payments",
        ),
        DrawerSubItemModel(title: "الكورسات", route: "/admin/reports/courses"),
      ],
    ),

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
