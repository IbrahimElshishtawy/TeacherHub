import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum ReportsView { main, levels, registration, grades }

class ReportsStatisticsController extends GetxController {
  final view = ReportsView.main.obs;

  void showLevels() => view.value = ReportsView.levels;
  void showRegistration() => view.value = ReportsView.registration;
  void showGrades() => view.value = ReportsView.grades;

  void backToMain() => view.value = ReportsView.main;
}
