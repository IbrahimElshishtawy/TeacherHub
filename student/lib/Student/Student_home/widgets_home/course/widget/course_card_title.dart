import 'package:flutter/material.dart';

class CourseCardTitle extends StatelessWidget {
  final String title;

  const CourseCardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 13.5,
        color: Colors.black87,
      ),
    );
  }
}
