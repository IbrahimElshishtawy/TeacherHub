// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class teacherMenuSquareButton extends StatelessWidget {
  final VoidCallback? onTap;
  const teacherMenuSquareButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 20,
                offset: Offset(0, 14),
              ),
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 8,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.sort_rounded,
              size: 22,
              color: Colors.blue.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
