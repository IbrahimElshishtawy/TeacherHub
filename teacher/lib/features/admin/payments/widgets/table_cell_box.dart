import 'package:flutter/material.dart';

class TableCellBox extends StatelessWidget {
  final double width;
  final Widget child;
  final bool showVerticalBorder;

  const TableCellBox({
    super.key,
    required this.width,
    required this.child,
    this.showVerticalBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: showVerticalBorder
            ? const Border(left: BorderSide(color: Color(0xFFE6E8F0), width: 1))
            : null,
      ),
      child: child,
    );
  }
}
