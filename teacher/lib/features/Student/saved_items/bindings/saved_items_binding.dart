import 'package:get/get.dart';

import '../controller/saved_items_controller.dart';
import '../state/saved_items_state.dart';

class SavedItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedItemsState>(() => SavedItemsState());
    Get.lazyPut<SavedItemsController>(() => SavedItemsController());
  }
}
