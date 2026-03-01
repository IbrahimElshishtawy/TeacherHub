// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EntryInfoDialog extends StatelessWidget {
  final String userName;
  final String userId;
  final VoidCallback onStart;

  const EntryInfoDialog({
    super.key,
    required this.userName,
    required this.userId,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
            border: Border.all(color: const Color(0xFFE9EDF5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ Header صغير احترافي
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F80ED).withOpacity(.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.verified_user,
                      color: Color(0xFF2F80ED),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "بيانات الدخول",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: "إغلاق",
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ✅ صف الاسم + زر نسخ
              _CopyInfoRow(
                icon: Icons.person,
                label: "اسم المستخدم",
                value: userName,
              ),
              const SizedBox(height: 10),

              // ✅ صف الرقم + زر نسخ
              _CopyInfoRow(
                icon: Icons.badge_outlined,
                label: "الرقم التعريفي",
                value: userId,
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "الرقم التعريفي لا يُشارك أبداً",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(.55),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: 140,
                height: 42,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F80ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  onPressed: onStart,
                  child: const Text(
                    "ابدأ الآن",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CopyInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _CopyInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  Future<void> _copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      "تم النسخ",
      "تم نسخ $text",
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      backgroundColor: Colors.black.withOpacity(.75),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6EAF2)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2F80ED),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.black.withOpacity(.55),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            tooltip: "نسخ",
            onPressed: () => _copy(value),
            icon: const Icon(Icons.copy_rounded, size: 20),
            color: const Color(0xFF2F80ED),
          ),
        ],
      ),
    );
  }
}
