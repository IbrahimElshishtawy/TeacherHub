import 'package:get/get.dart';

import '../controller/communication_channel_controller.dart';

class CommunicationChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunicationChannelController>(
      () => CommunicationChannelController(),
    );
  }
}
