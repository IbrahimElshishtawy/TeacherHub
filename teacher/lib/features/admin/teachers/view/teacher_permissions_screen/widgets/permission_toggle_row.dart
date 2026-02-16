import 'package:flutter/material.dart';

class PermissionToggleRow extends StatelessWidget {
  final String title;

  const PermissionToggleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7C93),
          ),
        ),
        Switch(
          value: true,
          onChanged: (bool value) {},
          activeThumbColor: Colors.green,
          inactiveThumbColor: Colors.red,
        ),
      ],
    );
  }
}
