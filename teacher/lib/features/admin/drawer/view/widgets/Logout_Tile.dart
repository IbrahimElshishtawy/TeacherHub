import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutTile({super.key, required this.onTap});

  static const Color logoutRed = Color(0xFFE53935);
  static const Color cancelBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showLogoutDialog(context);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: const [
            Icon(Icons.logout_rounded, color: logoutRed, size: 20),
            SizedBox(width: 10),
            Text(
              "تسجيل الخروج",
              style: TextStyle(
                color: logoutRed,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لعرض نافذة التأكيد
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Lottie.asset(
                'lottie/Connection error.json', // المسار إلى ملف Lottie
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              const Text(
                "هناك مشكلة في الاتصال، حاول مرة أخرى.",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            // زر إلغاء
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق النافذة المنبثقة
              },
              style: TextButton.styleFrom(
                backgroundColor: cancelBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "إلغاء",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            // زر تأكيد
            TextButton(
              onPressed: () {
                onTap(); // تنفيذ دالة الخروج أو أي إجراء آخر
                Navigator.of(
                  context,
                ).pop(); // إغلاق النافذة المنبثقة بعد تنفيذ الإجراء
              },
              style: TextButton.styleFrom(
                backgroundColor: logoutRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "حاول مرة أخرى",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
