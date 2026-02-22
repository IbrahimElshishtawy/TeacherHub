import 'package:get/get.dart';
import '../state/reports_state.dart';

class ReportsController extends GetxController {
  final Rx<ReportsState> state = ReportsState.initial().obs;

  // Expand/Collapse
  void toggleAttendanceExpanded() {
    state.value = state.value.copyWith(
      attendanceExpanded: !state.value.attendanceExpanded,
    );
  }

  void toggleGradesExpanded() {
    state.value = state.value.copyWith(
      gradesExpanded: !state.value.gradesExpanded,
    );
  }

  // Months
  void setAttendanceMonth(ReportMonth m) {
    state.value = state.value.copyWith(attendanceMonth: m);
  }

  void setGradesMonth(ReportMonth m) {
    state.value = state.value.copyWith(gradesMonth: m);
  }
}
