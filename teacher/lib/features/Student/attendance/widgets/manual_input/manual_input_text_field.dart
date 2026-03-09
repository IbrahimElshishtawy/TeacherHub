import 'package:flutter/material.dart';

import 'manual_input_theme.dart';

class ManualInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFocused;
  final VoidCallback onSubmitted;

  const ManualInputTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFocused ? ManualInputTheme.primary : ManualInputTheme.fieldBorder,
          width: isFocused ? 1.5 : 1,
        ),
        boxShadow: isFocused
            ? [
                BoxShadow(
                  color: ManualInputTheme.primary.withOpacity(0.15),
                  blurRadius: 16,
                  spreadRadius: -2,
                ),
              ]
            : [],
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: ManualInputTheme.titleColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
        cursorColor: ManualInputTheme.primary,
        decoration: InputDecoration(
          hintText: 'XXXX-XXXX-XXXX',
          hintStyle: const TextStyle(
            color: ManualInputTheme.hint,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              Icons.tag_rounded,
              color: isFocused ? ManualInputTheme.primary : ManualInputTheme.hint,
              size: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        ),
        onSubmitted: (_) => onSubmitted(),
      ),
    );
  }
}
