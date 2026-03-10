import 'package:get/get.dart';

import '../state/communication_channel_state.dart';

class CommunicationChannelController extends GetxController {
  final state = CommunicationChannelState.initial().obs;

  TeacherChannelItem? get selectedTeacher {
    final selectedId = state.value.selectedTeacherId;
    if (selectedId == null) return null;
    for (final teacher in state.value.teachers) {
      if (teacher.id == selectedId) return teacher;
    }
    return null;
  }

  List<TeacherChannelItem> get visibleTeachers {
    final selectedId = state.value.selectedTeacherId;
    if (selectedId == null) return state.value.teachers;
    return state.value.teachers.where((t) => t.id == selectedId).toList();
  }

  void selectTeacher(String teacherId) {
    final current = state.value.selectedTeacherId;
    state.value = state.value.copyWith(
      selectedTeacherId: current == teacherId ? null : teacherId,
    );
    update();
  }

  void closeSelectedTeacher() {
    if (state.value.selectedTeacherId == null) return;
    state.value = state.value.copyWith(selectedTeacherId: null);
    update();
  }

  void goBackHome() {
    Get.offNamed('/home_student');
  }
}
