import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:student/auth/controller/login_controller.dart';

class ActionForgetBassword extends StatelessWidget {
  final String forget;
  const ActionForgetBassword({super.key, required this.forget});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 0, top: 1),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ===== نسيت كلمة المرور =====
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forget_password_$forget');
              },
              child: const Text(
                "نسيت كلمة المرور؟",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  Text(
                    "تذكرني",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                  ),

                  Checkbox(
                    value: loginController.rememberMe.value,
                    onChanged: (bool? value) {
                      loginController.toggleRememberMe(value);
                      if (value == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "تم تفعيل تذكرني. سيتم تذكيرك بكلمة المرور لاحقًا.",
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "تم إلغاء تذكرني. سيتعين عليك تسجيل الدخول مجددًا.",
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
