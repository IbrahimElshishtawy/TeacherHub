import 'package:flutter/widgets.dart';
import 'package:teacher/app/app.dart';
import 'package:teacher/core/bootstrap/app_initializer.dart';

Future<void> bootstrap() async {
  await AppInitializer.initialize();
  runApp(const TeacherApp());
}
