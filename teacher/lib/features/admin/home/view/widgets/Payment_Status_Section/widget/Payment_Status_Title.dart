import 'package:flutter/material.dart';

class PaymentStatusTitle extends StatelessWidget {
  const PaymentStatusTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "المدفوعات",
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
