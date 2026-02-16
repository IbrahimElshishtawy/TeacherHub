import 'package:flutter/material.dart';

class SecurityActionsWidget extends StatelessWidget {
  const SecurityActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'إجراءات الأمان',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2A3B),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'تحذير: هذه الإجراءات حساسة وقد تؤثر بشكل دائم على حساب المدرس.',
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context, 'حذف الحساب تم!');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('حذف الحساب'),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context, 'إيقاف الحساب تم!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('إيقاف / تعليق الحساب'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('إجراء تم!'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
