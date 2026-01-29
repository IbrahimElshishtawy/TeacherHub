import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderLoginScrean extends StatelessWidget {
  const HeaderLoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
      child: Column(
        children: [
          // Lottie فوق شوية
          Lottie.asset('assets/lottie/admin.json', width: 190, height: 190),
          const Text(
            "Admin",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // الوصف
          const Text(
            "إدارة النظام والمستخدمين",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          const Divider(thickness: 2, height: 2),
        ],
      ),
    );
  }
}
