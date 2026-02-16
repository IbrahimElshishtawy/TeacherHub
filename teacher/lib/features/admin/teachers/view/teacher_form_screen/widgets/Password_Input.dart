import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool show;
  final VoidCallback onToggle;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.show,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: !show,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.black45, fontSize: 12),
              ),
            ),
          ),
          InkWell(
            onTap: onToggle,
            child: Icon(
              show ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF2F6FED),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
