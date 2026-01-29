import 'package:flutter/material.dart';
import 'package:get/get.dart'; // تأكد من أنك تستخدم GetX للتحكم في البيانات
import 'package:teacher/features/auth/controller/login_controller.dart'; // تأكد من المسار الصحيح

class InputLogin extends StatelessWidget {
  const InputLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(
      LoginController(),
    ); // التأكد من استخدام GetX

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // النص الخاص بالبريد الإلكتروني
          const Text(
            "البريد الإلكتروني",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 5),
          // حقل البريد الإلكتروني
          TextField(
            decoration: InputDecoration(
              labelText: 'البريد الإلكتروني',
              labelStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.email, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              loginController.userEmail.value = value;
            },
          ),
          const SizedBox(height: 20), // المسافة بين الحقول
          // النص الخاص بكلمة المرور
          const Text(
            "كلمة المرور",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 5),
          // حقل كلمة المرور
          Obx(
            () => TextField(
              obscureText: !loginController.showPassword.value,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    loginController.showPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: loginController.togglePasswordVisibility,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                loginController.userPassword.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
