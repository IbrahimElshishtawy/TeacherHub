// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/PaymentStatus_Cards.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/Payment_Status_Title.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/payment_status_table.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/widget/show_more_button.dart';

class PaymentStatusSection extends StatefulWidget {
  const PaymentStatusSection({super.key});

  @override
  _PaymentStatusSectionState createState() => _PaymentStatusSectionState();
}

class _PaymentStatusSectionState extends State<PaymentStatusSection> {
  bool _isMoreVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          PaymentStatusTitle(),

          // Row for status cards
          PaymentStatusCards(),

          // Button for showing more content
          ShowMoreButton(
            onPressed: () {
              setState(() {
                _isMoreVisible = !_isMoreVisible;
              });
            },
            isMoreVisible: _isMoreVisible,
          ),

          // Display additional table only when the button is clicked
          PaymentStatusTable(isVisible: _isMoreVisible),
        ],
      ),
    );
  }
}
