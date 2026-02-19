import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';

class ExamsRRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamsRRController>(() => ExamsRRController());
  }
}
