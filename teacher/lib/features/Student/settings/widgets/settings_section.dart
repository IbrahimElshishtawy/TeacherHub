// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF2D3A55), // Dark color for the title
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8), // Space between title and icon
              Icon(icon, color: Color(0xFF2D3A55)), // Icon with dark color
            ],
          ),
          Divider(), // Divider between title and options
          // Children widgets (settings options)
          ...children,
        ],
      ),
    );
  }
}
