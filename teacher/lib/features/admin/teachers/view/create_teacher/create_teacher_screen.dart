import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // This page will handle account creation logic
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء حساب جديد")),
      body: Center(child: const Text('هذه صفحة إنشاء الحساب الجديد')),
    );
  }
}
