import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error401Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('خطأ 401')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/404 blue.json',
              width: 140,
              height: 140,
            ),
            SizedBox(height: 20),
            Text(
              'عذرًا، اسم المستخدم أو كلمة المرور غير صحيحة.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // أعد المحاولة
                Navigator.pop(context);
              },
              child: Text('إعادة المحاولة'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('تواصل معنا إذا استمرت المشكلة'),
            ),
          ],
        ),
      ),
    );
  }
}
