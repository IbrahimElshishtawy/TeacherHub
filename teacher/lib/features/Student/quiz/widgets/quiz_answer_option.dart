import 'package:flutter/material.dart';

class QuizAnswerOption extends StatelessWidget {
  final String text;
  final String optionLabel;
  final bool isSelected;
  final VoidCallback onTap;

  const QuizAnswerOption({
    super.key,
    required this.text,
    required this.optionLabel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF2ECF74), Color(0xFF24B864)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF24B864)
                  : const Color(0xFFE1E5EF),
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? const Color(0x1A24B864)
                    : const Color(0x0F000000),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.18)
                      : const Color(0xFFF2F5FB),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  optionLabel,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: isSelected ? Colors.white : const Color(0xFF3150B5),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : const Color(0xFF1F2430),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
