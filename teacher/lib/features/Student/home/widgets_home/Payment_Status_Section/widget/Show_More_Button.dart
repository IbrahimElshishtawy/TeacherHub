// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  final bool isMoreVisible;
  final VoidCallback onPressed;

  const ShowMoreButton({
    super.key,
    required this.onPressed,
    required this.isMoreVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          isMoreVisible ? 'إخفاء' : 'عرض المزيد',
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
