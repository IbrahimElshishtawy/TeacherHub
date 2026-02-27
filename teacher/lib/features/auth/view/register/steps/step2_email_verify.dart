// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/payments/widgets/card_shell.dart';
import 'package:teacher/features/auth/view/register/widgets/Card_Header.dart';
import 'package:teacher/features/auth/view/register/widgets/Otp_Boxes.dart';
import '../../../controller/student_register_controller.dart';
import '../widgets/app_text_field.dart';

class Step2EmailVerify extends GetView<StudentRegisterController> {
  const Step2EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: Text(
            "التحقق من البريد الإلكتروني",
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: Text(
            "هنبعتلك كود على الإيميل للتأكد من الحساب.",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ),
        const SizedBox(height: 14),

        // Email Card
        CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: CardHeader(
                  icon: Icons.email_outlined,
                  title: "بيانات البريد",
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "البريد الإلكتروني",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
              ),
              const SizedBox(height: 10),

              AppTextField(
                controller: controller.email,
                hint: "example@gmail.com",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      final loading = controller.isSendingOtp.value;
                      final seconds = controller.resendSeconds.value;

                      final disabled = loading || seconds > 0;

                      return SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: disabled
                              ? null
                              : () async {
                                  await controller.sendOtp();
                                  controller.startResendTimer(); // عداد
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            disabledBackgroundColor: primary.withOpacity(0.45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (loading)
                                const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                ),
                              const SizedBox(width: 8),
                              Text(
                                loading
                                    ? "جاري الإرسال..."
                                    : (seconds > 0
                                          ? "إعادة الإرسال خلال ${seconds}s"
                                          : "إرسال الكود"),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "لو الكود موصلش، تأكد من spam أو جرّب بعد دقيقة.",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    controller.otp.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: const Text("تغيير البريد / تعديل"),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // OTP Card
        CardShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: CardHeader(
                  icon: Icons.lock_outline,
                  title: "رمز التحقق",
                ),
              ),
              const SizedBox(height: 10),

              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text(
                  "أدخل الكود المرسل إلى بريدك",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),
              const SizedBox(height: 12),

              OtpBoxes(
                controller: controller.otp,
                length: 4,
                primaryColor: primary,
              ),

              const SizedBox(height: 12),

              Obx(() {
                final verifying = controller.isVerifyingOtp.value;
                return Row(
                  children: [
                    Icon(
                      verifying ? Icons.hourglass_top : Icons.verified_outlined,
                      size: 18,
                      color: verifying ? Colors.orange : Colors.green,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      verifying
                          ? "جاري التحقق..."
                          : "أدخل الكود ثم اضغط التالي",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 12,
                        color: verifying ? Colors.orange : Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
