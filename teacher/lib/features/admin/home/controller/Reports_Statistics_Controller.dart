import 'package:get/get.dart';

enum ReportsView { main, levels, registration, grades, charts }

enum ChartType { attendance, grades, registration, levels }

class ReportsStatisticsController extends GetxController {
  final view = ReportsView.main.obs;

  //  chart state
  final chartType = ChartType.attendance.obs;
  final showValues = true.obs;

  // navigation
  void showLevels() => view.value = ReportsView.levels;
  void showRegistration() => view.value = ReportsView.registration;
  void showGrades() => view.value = ReportsView.grades;

  void showCharts() => view.value = ReportsView.charts;
  void backToMain() => view.value = ReportsView.main;

  // charts actions
  void setChart(ChartType type) => chartType.value = type;
  void toggleValues() => showValues.value = !showValues.value;
  void showAttendanceChart() {
    chartType.value = ChartType.attendance;
    view.value = ReportsView.charts;
  }
}
