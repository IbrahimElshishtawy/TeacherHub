import 'package:flutter/material.dart';

class QuickActionModel {
  final String title;
  final IconData icon;
  final Color color;
  final String routeName;

  QuickActionModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.routeName,
  });
}

// app_routes.dart
class AppRoutes {
  static const String securityControl = '/admin/security-control';
  static const String paymentsFollowUp = '/home_admin/payments';
  static const String reportsPreview = '/home_admin/reports';
  static const String teachersAccounts = '/home_admin/teachers';
  static const String usersManagement = '/home_admin/user_management';
}
