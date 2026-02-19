import 'package:get/get.dart';
import '../state/exams_rr_state.dart';

class ExamsRRController extends GetxController {
  final Rx<ExamsRRState> state = ExamsRRState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    loadCounts();
  }

  void loadCounts() {
    state.value = state.value.copyWith(
      examsCount: 12,
      reviewsCount: 8,
      resultsCount: 350,
    );
  }

  void goToExams() {
    Get.toNamed('/admin/exams');
  }

  void goToReviews() {
    Get.toNamed('/admin/reviews');
  }

  void goToResults() {
    Get.toNamed('/admin/results');
  }
}
