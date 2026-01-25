import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthState {
  RxBool isAuthenticated = false.obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
}
