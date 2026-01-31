// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error403Page extends StatelessWidget {
  const Error403Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppbarTap(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'خطأ 403 –  غير مصرح له بالدخول',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),

            SizedBox(height: 20),
            Lottie.asset(
              'assets/lottie/Under Maintenance.json',
              width: 350,
              height: 350,
            ),
            SizedBox(height: 20),
            Text(
              '''هذا الحساب غير مصرح له بالتسجيل
                   كمسؤول''',
              style: TextStyle(
                fontSize: 22,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // تحديد الحواف الدائرية
                    ),
                  ),
                  child: Text(
                    'الرجوع',
                    style: TextStyle(
                      color: Colors.white, // تحديد لون النص باللون الأبيض
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
