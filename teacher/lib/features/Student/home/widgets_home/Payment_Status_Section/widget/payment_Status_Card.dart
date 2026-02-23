// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData icon;

  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              Icon(icon, color: color, size: 35),
              const SizedBox(height: 5),
              Text(count, style: TextStyle(color: Colors.black, fontSize: 20)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
