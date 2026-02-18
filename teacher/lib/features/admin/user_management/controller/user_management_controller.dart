import 'package:get/get.dart';
import 'package:teacher/features/admin/user_management/state/user_management_state.dart';

class StudentsManagementController extends GetxController {
  final Rx<StudentsManagementState> state = StudentsManagementState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOverview();
  }

  Future<void> fetchOverview() async {
    state.value = const StudentsManagementState(
      active: 299,
      total: 320,
      suspended: 6,
      warned: 15,
    );
  }
}
