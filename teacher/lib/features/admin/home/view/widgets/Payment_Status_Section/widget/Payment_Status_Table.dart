// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PaymentStatusTable extends StatelessWidget {
  final bool isVisible;

  const PaymentStatusTable({required this.isVisible, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: Container(
          width: 333,
          margin: const EdgeInsets.only(top: 1),
          padding: const EdgeInsets.all(8),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('حالة الدفع')),
                DataColumn(label: Text('ID الطالب')),
                DataColumn(label: Text('اسم الطالب')),
              ],
              rows: _getTableData().map((data) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        data['حالة الدفع']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: _getPaymentStatusColor(data['حالة الدفع']!),
                        ),
                      ),
                    ),
                    DataCell(Text(data['ID الطالب']!)),
                    DataCell(Text(data['اسم الطالب']!)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Color _getPaymentStatusColor(String status) {
    switch (status) {
      case 'تم الدفع':
        return Colors.green;
      case 'معلقة':
        return Colors.amber;
      case 'فشل الدفع':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  List<Map<String, String>> _getTableData() {
    return [
      {
        'حالة الدفع': 'تم الدفع',
        'ID الطالب': '#10111',
        'اسم الطالب': 'أحمد حسن',
      },
      {'حالة الدفع': 'معلقة', 'ID الطالب': '#10011', 'اسم الطالب': 'سارة محمد'},
      {'حالة الدفع': 'معلقة', 'ID الطالب': '#10110', 'اسم الطالب': 'علي مصطفى'},
      {
        'حالة الدفع': 'فشل الدفع',
        'ID الطالب': '#10115',
        'اسم الطالب': 'ليلى أحمد',
      },
      {
        'حالة الدفع': 'تم الدفع',
        'ID الطالب': '#10116',
        'اسم الطالب': 'كريم سعيد',
      },
      {
        'حالة الدفع': 'تم الدفع',
        'ID الطالب': '#10350',
        'اسم الطالب': 'مريم خالد',
      },
    ];
  }
}
