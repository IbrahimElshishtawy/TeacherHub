import 'package:flutter/material.dart';

enum StatDisplayType { bar, chip }

class StatItem {
  final String title;
  final int value;
  final Color color;
  final StatDisplayType type;

  const StatItem({
    required this.title,
    required this.value,
    required this.color,
    required this.type,
  });
}
