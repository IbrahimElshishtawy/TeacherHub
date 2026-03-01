import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentRegisterController extends GetxController {
  // step index: 0..2
  final stepIndex = 0.obs;

  // Step 1
  final firstName = TextEditingController();
  final fatherName = TextEditingController();
  final grandName = TextEditingController();
  final familyName = TextEditingController();
  final studentPhone = TextEditingController();
  final parentPhone = TextEditingController();

  // Step 2
  final email = TextEditingController();
  final otp = TextEditingController();

  // Step 3
  final selectedStageId = RxnInt();
  final selectedTeacherId = RxnInt();

  // dropdown data (مثال)
  final stages = <Map<String, dynamic>>[].obs; // {id, name}
  final teachers = <Map<String, dynamic>>[].obs; // {id, name}

  // loading states
  final isSendingOtp = false.obs;
  final isVerifyingOtp = false.obs;
  final isCreatingAccount = false.obs;
  final isLoadingTeachers = false.obs;
  @override
  void onInit() {
    super.onInit();
    _loadStages();
  }

  // ---------- Navigation ----------
  void next() async {
    if (stepIndex.value == 0) {
      if (!_validateStep1()) return;
      stepIndex.value = 1;
      return;
    }

    if (stepIndex.value == 1) {
      if (!_validateStep2()) return;
      // تحقق من الكود (أو خلّيه optional حسب منطقك)
      final ok = await verifyOtp();
      if (!ok) return;
      stepIndex.value = 2;
      return;
    }

    if (stepIndex.value == 2) {
      if (!_validateStep3()) return;
      await createAccount();
    }
  }

  void back() {
    if (stepIndex.value > 0) stepIndex.value--;
  }

  // ---------- Step 1 Validation ----------
  bool _validateStep1() {
    if (firstName.text.trim().isEmpty ||
        fatherName.text.trim().isEmpty ||
        grandName.text.trim().isEmpty ||
        familyName.text.trim().isEmpty) {
      Get.snackbar("خطأ", "من فضلك أدخل الاسم بالكامل");
      return false;
    }
    if (studentPhone.text.trim().length < 9) {
      Get.snackbar("خطأ", "رقم هاتف الطالب غير صحيح");
      return false;
    }
    if (parentPhone.text.trim().length < 9) {
      Get.snackbar("خطأ", "رقم هاتف ولي الأمر غير صحيح");
      return false;
    }
    return true;
  }

  // ---------- Step 2 ----------
  bool _validateStep2() {
    final e = email.text.trim();
    if (!GetUtils.isEmail(e)) {
      Get.snackbar("خطأ", "البريد الإلكتروني غير صحيح");
      return false;
    }
    if (otp.text.trim().isEmpty) {
      Get.snackbar("خطأ", "من فضلك أدخل رمز التحقق");
      return false;
    }
    return true;
  }

  Future<void> sendOtp() async {
    final e = email.text.trim();
    if (!GetUtils.isEmail(e)) {
      Get.snackbar("خطأ", "أدخل بريد صحيح");
      return;
    }
    isSendingOtp.value = true;
    try {
      //
      await Future.delayed(const Duration(milliseconds: 800));
      Get.snackbar("تم", "تم إرسال كود التحقق إلى بريدك");
    } finally {
      isSendingOtp.value = false;
    }
  }

  Future<bool> verifyOtp() async {
    isVerifyingOtp.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 700));
      // مثال بسيط: أي كود طوله >= 4 يعتبر OK
      if (otp.text.trim().length < 4) {
        Get.snackbar("خطأ", "رمز التحقق غير صحيح");
        return false;
      }
      return true;
    } finally {
      isVerifyingOtp.value = false;
    }
  }

  // ---------- Step 3 ----------
  bool _validateStep3() {
    if (selectedStageId.value == null) {
      Get.snackbar("خطأ", "اختر المرحلة التعليمية");
      return false;
    }
    if (selectedTeacherId.value == null) {
      Get.snackbar("خطأ", "اختر المدرس المسؤول");
      return false;
    }
    return true;
  }

  Future<void> _loadStages() async {
    stages.assignAll([
      {"id": 1, "name": "الصف الأول"},
      {"id": 2, "name": "الصف الثاني"},
      {"id": 3, "name": "الصف الثالث"},
    ]);
  }

  Future<void> loadTeachersByStage(int stageId) async {
    teachers.clear();
    await Future.delayed(const Duration(milliseconds: 500));
    teachers.assignAll([
      {"id": 11, "name": "أ/ أحمد"},
      {"id": 12, "name": "أ/ محمد"},
      {"id": 13, "name": "أ/ سارة"},
    ]);
  }

  Future<void> createAccount() async {
    isCreatingAccount.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 900));

      Get.snackbar("نجاح", "تم إنشاء الحساب بنجاح");
      Get.toNamed('/subjects');
      // مثال: Navigate to login
      Get.back();
    } finally {
      isCreatingAccount.value = false;
    }
  }

  final resendSeconds = 0.obs;
  Timer? _resendTimer;

  void startResendTimer([int seconds = 60]) {
    _resendTimer?.cancel();
    resendSeconds.value = seconds;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      resendSeconds.value--;
      if (resendSeconds.value <= 0) {
        t.cancel();
        resendSeconds.value = 0;
      }
    });
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    firstName.dispose();
    fatherName.dispose();
    grandName.dispose();
    familyName.dispose();
    studentPhone.dispose();
    parentPhone.dispose();
    email.dispose();
    otp.dispose();
    super.onClose();
  }
}
