import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/app/routes/app_pages.dart';
import 'package:teacher/app/routes/app_routes.dart';
import 'package:teacher/app/theme/app_theme.dart';

class TeacherApp extends StatelessWidget {
  const TeacherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Onboarding Demo',
      theme: AppTheme.light,
      initialRoute: AppRoutes.onboarding,
      unknownRoute: AppPages.unknownRoute,
      getPages: AppPages.pages,
    );
  }
}
