import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_1/step_basic_info_upload_row.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_1/step_form_widgets.dart';

class StepBasicInfoFields extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool obscurePass;
  final bool obscureConfirm;

  final VoidCallback onTogglePass;
  final VoidCallback onToggleConfirm;

  final VoidCallback onPickImage;
  final VoidCallback onNext;

  const StepBasicInfoFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePass,
    required this.obscureConfirm,
    required this.onTogglePass,
    required this.onToggleConfirm,
    required this.onPickImage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFE6ECF5);
    const hintColor = Color(0xFF9AA8BC);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FormLabel('صورة الحساب'),
        const SizedBox(height: 8),
        StepBasicInfoUploadRow(borderColor: borderColor, hintColor: hintColor),
        const SizedBox(height: 14),

        const FormLabel('الاسم بالكامل'),
        const SizedBox(height: 8),
        AppTextField(
          controller: fullNameController,
          hint: 'أدخل الاسم الكامل للمدرس',
          borderColor: borderColor,
          keyboardType: TextInputType.name,
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'الرجاء إدخال الاسم بالكامل'
              : null,
        ),
        const SizedBox(height: 14),

        const FormLabel('البريد الإلكتروني'),
        const SizedBox(height: 8),
        AppTextField(
          controller: emailController,
          hint: 'example@email.com',
          borderColor: borderColor,
          keyboardType: TextInputType.emailAddress,
          validator: (v) {
            final value = (v ?? '').trim();
            if (value.isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
            if (!value.contains('@') || !value.contains('.')) {
              return 'البريد الإلكتروني غير صحيح';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),

        const FormLabel('رقم الهاتف (اختياري)'),
        const SizedBox(height: 8),
        AppTextField(
          controller: phoneController,
          hint: 'أدخل رقم الهاتف (اختياري)',
          borderColor: borderColor,
          keyboardType: TextInputType.phone,
          validator: (_) => null,
        ),
        const SizedBox(height: 14),

        const FormLabel('كلمة المرور'),
        const SizedBox(height: 8),
        AppPasswordField(
          controller: passwordController,
          hint: 'أدخل كلمة المرور',
          borderColor: borderColor,
          obscure: obscurePass,
          onToggle: onTogglePass,
          validator: (v) {
            final value = (v ?? '');
            if (value.isEmpty) return 'الرجاء إدخال كلمة المرور';
            if (value.length < 8) return 'كلمة المرور يجب ألا تقل عن 8 أحرف';
            return null;
          },
        ),
        const SizedBox(height: 8),
        const Text(
          '• يجب أن تحتوي على 8 أحرف على الأقل، رقم، حرف كبير وحرف صغير',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF7C8CA5),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 14),

        const FormLabel('تأكيد كلمة المرور'),
        const SizedBox(height: 8),
        AppPasswordField(
          controller: confirmPasswordController,
          hint: 'أعد إدخال كلمة المرور للتحقق',
          borderColor: borderColor,
          obscure: obscureConfirm,
          onToggle: onToggleConfirm,
          validator: (v) {
            final value = (v ?? '');
            if (value.isEmpty) return 'الرجاء إدخال تأكيد كلمة المرور';
            if (value != passwordController.text) {
              return 'كلمات المرور غير متطابقة';
            }
            return null;
          },
        ),

        const SizedBox(height: 18),

        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2F6FED),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'التالي',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
