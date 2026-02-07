import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isMoreVisible;

  const ShowMoreButton({
    required this.onPressed,
    required this.isMoreVisible,
    super.key,
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
