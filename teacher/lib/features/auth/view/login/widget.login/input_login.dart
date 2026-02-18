// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/auth/controller/login_controller.dart';

class InputLogin extends StatelessWidget {
  final String emailTitle;
  final String emailLabel;
  final String passwordTitle;
  final String passwordLabel;

  const InputLogin({
    super.key,
    required this.emailTitle,
    required this.emailLabel,
    required this.passwordTitle,
    required this.passwordLabel,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          /// ===== Email title =====
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              emailTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: 5),

          /// ===== Email field =====
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: emailLabel,
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  loginController.userEmail.value = value;
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// ===== Password title =====
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 240),
              child: Text(
                passwordTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const SizedBox(height: 5),

          /// ===== Password field =====
          Obx(
            () => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  obscureText: !loginController.showPassword.value,
                  decoration: InputDecoration(
                    labelText: passwordLabel,
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
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    loginController.userPassword.value = value;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
