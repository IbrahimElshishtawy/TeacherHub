import 'package:get/get.dart';

class AuthState {
  RxBool isAuthenticated = false.obs;
  RxString userEmail = ''.obs;
  RxString userName = ''.obs;
  RxString userRole = ''.obs;
}
