// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets/Payment_Status_Section/widget/payment_Status_Card.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/show_more_button.dart';

class PaymentStatusCards extends StatelessWidget {
  final bool isMoreVisible;
  final VoidCallback onToggleVisibility;

  const PaymentStatusCards({
    super.key,
    required this.isMoreVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StatusCard(
                title: 'الجديدة',
                count: '5',
                color: Colors.blue,
                icon: Icons.refresh_outlined,
              ),
              StatusCard(
                title: 'الفاشلة',
                count: '5',
                color: Colors.red,
                icon: Icons.cancel_outlined,
              ),
              StatusCard(
                title: 'المعلقة',
                count: '37',
                color: Colors.amber,
                icon: Icons.access_time_outlined,
              ),
              StatusCard(
                title: 'الناجحة',
                count: '1245',
                color: Colors.green,
                icon: Icons.check_circle_outline,
              ),
            ],
          ),
          SizedBox(height: 5),
          // Button for showing more content
          ShowMoreButton(
            onPressed: onToggleVisibility,
            isMoreVisible: isMoreVisible,
          ),
        ],
      ),
    );
  }
}
