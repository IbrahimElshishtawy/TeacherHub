import 'package:flutter/material.dart';

class TableCellBox extends StatelessWidget {
  final Widget child;
  final double width;
  final EdgeInsets padding;
  final bool showVerticalBorder;

  const TableCellBox({
    super.key,
    required this.child,
    required this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    this.showVerticalBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          left: showVerticalBorder
              ? const BorderSide(color: Color(0xFFE6E8F0), width: 1)
              : BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
