// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets_home/Payment_Status_Section/widget/PaymentStatus_Cards.dart';
import 'package:teacher/features/admin/home/widgets_home/Payment_Status_Section/widget/Payment_Status_Table.dart';
import 'package:teacher/features/admin/home/widgets_home/Payment_Status_Section/widget/Payment_Status_Title.dart';

class PaymentStatusSection extends StatefulWidget {
  const PaymentStatusSection({super.key});

  @override
  _PaymentStatusSectionState createState() => _PaymentStatusSectionState();
}

class _PaymentStatusSectionState extends State<PaymentStatusSection> {
  bool _isMoreVisible = false; // حالة العرض للبيانات الإضافية

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان القسم
          PaymentStatusTitle(),

          // Row for status cards
          PaymentStatusCards(
            isMoreVisible: _isMoreVisible,
            onToggleVisibility: _toggleVisibility,
          ),

          // Display additional table only when the button is clicked
          PaymentStatusTable(isVisible: _isMoreVisible),
        ],
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _isMoreVisible = !_isMoreVisible;
    });
  }
}
