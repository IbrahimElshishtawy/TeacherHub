import 'package:get/get.dart';
import '../view/login/admin_login_screen.dart';
import '../view/login/teacher_login_screen.dart';
import '../view/login/student_login_screen.dart';
import '../view/login/parent_login_screen.dart';

class LoginController extends GetxController {
  // Define navigation functions for each user type
  void navigateToAdminLogin() {
    Get.to(() => AdminLoginScreen());
  }

  void navigateToTeacherLogin() {
    Get.to(() => TeacherLoginScreen());
  }

  void navigateToStudentLogin() {
    Get.to(() => StudentLoginScreen());
  }

  void navigateToParentLogin() {
    Get.to(() => ParentLoginScreen());
  }
}
