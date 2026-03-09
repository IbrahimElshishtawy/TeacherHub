import 'package:get/get.dart';

import '../controller/important_events_controller.dart';
import '../state/important_events_state.dart';

class ImportantEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportantEventsState>(() => ImportantEventsState.initial());
    Get.lazyPut<ImportantEventsController>(() => ImportantEventsController());
  }
}
