import 'package:flutter/material.dart';

class SubjectActionModel {
  final String title;
  final IconData icon;
  final Color color;
  final String routeName;

  SubjectActionModel({
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
