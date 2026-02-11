import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';

class PieItem {
  final String label;
  final double value;
  final Color color;

  const PieItem({
    required this.label,
    required this.value,
    required this.color,
  });
}

class ReportsChartData {
  static String title(ChartType type) {
    switch (type) {
      case ChartType.attendance:
        return "الرسم البياني لحضور الطلاب";
      case ChartType.grades:
        return "الرسم البياني لمستوى الدرجات";
      case ChartType.registration:
        return "الرسم البياني لإقبال الطلاب على المواد";
      case ChartType.levels:
        return "الرسم البياني لتوزيع الطلاب حسب المستوى";
    }
  }

  static List<PieItem> data(ChartType type) {
    switch (type) {
      case ChartType.attendance:
        return const [
          PieItem(label: "الحضور", value: 93, color: Colors.green),
          PieItem(label: "الغياب", value: 7, color: Colors.red),
        ];

      case ChartType.grades:
        return const [
          PieItem(label: "فيزياء", value: 27, color: Colors.purple),
          PieItem(label: "عربي", value: 24, color: Colors.blue),
          PieItem(label: "كيمياء", value: 20, color: Colors.red),
          PieItem(label: "رياضيات", value: 29, color: Colors.green),
        ];

      case ChartType.registration:
        return const [
          PieItem(label: "فيزياء", value: 33.5, color: Colors.purple),
          PieItem(label: "عربي", value: 18.2, color: Colors.blue),
          PieItem(label: "رياضيات", value: 21.6, color: Colors.green),
          PieItem(label: "كيمياء", value: 26.7, color: Colors.orange),
        ];

      case ChartType.levels:
        return const [
          PieItem(label: "ثالثة ثانوي", value: 33.9, color: Colors.purple),
          PieItem(label: "ثانية ثانوي", value: 33.9, color: Colors.orange),
          PieItem(label: "أولى ثانوي", value: 14.1, color: Colors.green),
          PieItem(label: "ثالثة إعدادي", value: 18.1, color: Colors.blue),
        ];
    }
  }
}
