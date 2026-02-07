import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/payment_Status_Card.dart';

class PaymentStatusCards extends StatelessWidget {
  const PaymentStatusCards({super.key});

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
        ],
      ),
    );
  }
}
