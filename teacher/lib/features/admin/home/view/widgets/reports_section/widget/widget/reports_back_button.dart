import 'package:flutter/material.dart';

class ReportsBackButton extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsBackButton({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onBack,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text(
          'الرجوع',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
