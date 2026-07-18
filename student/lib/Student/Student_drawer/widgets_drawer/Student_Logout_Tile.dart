// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StudentLogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const StudentLogoutTile({super.key, required this.onTap});

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
                'assets/lottie/Warning Status.json',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 6),
              const Text(
                "هل أنت متأكد من رغبتك في تسجيل الخروج؟",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              const Text(
                "ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى حسابك.",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            // زر إلغاء
            Row(
              children: [
                SizedBox(
                  width: 114,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      onTap();
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: logoutRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "تسجيل الخروج",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                SizedBox(
                  width: 114,
                  height: 40,
                  child: TextButton(
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
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "تذكرني",
            //       textAlign: TextAlign.right,
            //       style: TextStyle(fontSize: 14),
            //     ),
            //     Checkbox(value: false, onChanged: (bool? value) {}),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}
