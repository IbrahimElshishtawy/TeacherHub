import 'package:flutter/material.dart';

class OverviewHeader extends StatelessWidget {
  const OverviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'نظرة سريعة على أدائك',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 1),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'ملخص آخر نشاطاتك داخل التطبيق',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF8A94A6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
