import 'package:flutter/widgets.dart';
import 'package:student/app/app.dart';
import 'package:student/core/bootstrap/app_initializer.dart';

Future<void> bootstrap() async {
  await AppInitializer.initialize();
  runApp(const TeacherApp());
}
