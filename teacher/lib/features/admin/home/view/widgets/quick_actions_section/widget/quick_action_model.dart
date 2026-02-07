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
  static const String paymentsFollowUp = '/admin/payments-followup';
  static const String reportsPreview = '/admin/reports-preview';
  static const String teachersAccounts = '/admin/teachers-accounts';
  static const String usersManagement = '/admin/users-management';
}
