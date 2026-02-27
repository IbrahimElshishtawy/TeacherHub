import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/student_register_controller.dart';
import '../widgets/app_text_field.dart';

class Step2EmailVerify extends GetView<StudentRegisterController> {
  const Step2EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "البريد الإلكتروني",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.email,
          hint: "example@gmail.com",
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Obx(
            () => TextButton(
              onPressed: controller.isSendingOtp.value
                  ? null
                  : controller.sendOtp,
              child: const Text("إرسال / إعادة إرسال الكود"),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "رمز التحقق",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.otp,
          hint: "أدخل كود التحقق المرسل لك",
          icon: Icons.lock_outline,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
