import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TextRegisterClick extends StatelessWidget {
  const TextRegisterClick({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("' هل لديك حساب..؟ ?"),
        TextButton(
          onPressed: () {
            Get.toNamed('/register');
          },
          child: const Text(
            "انشاء حساب",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
