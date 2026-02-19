import 'package:get/get.dart';
import '../state/attendance_state.dart';

class AttendanceController extends GetxController {
  final Rx<AttendanceState> state = AttendanceState.initial().obs;

  void setTab(AttendanceGradeTab tab) {
    state.value = state.value.copyWith(tab: tab);
    // هنا تقدر تعمل fetch حسب المرحلة/الصف
  }

  void prevDay() {
    final d = state.value.date.subtract(const Duration(days: 1));
    state.value = state.value.copyWith(date: d);
  }

  void nextDay() {
    final d = state.value.date.add(const Duration(days: 1));
    state.value = state.value.copyWith(date: d);
  }

  void setQuery(String q) {
    state.value = state.value.copyWith(query: q);
  }

  void openPresentList() {
    Get.snackbar("الحضور", "عرض قائمة الحضور (هنربطها بصفحة/جدول بعدين)");
  }

  void openAbsentList() {
    Get.snackbar("الغياب", "عرض قائمة الغياب (هنربطها بصفحة/جدول بعدين)");
  }

  void openFilter() {
    Get.snackbar("فلتر", "فلترة البيانات (قريباً)");
  }
}
