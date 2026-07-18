import 'package:flutter/material.dart';

import 'subject_tokens.dart';

class SubjectHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const SubjectHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          children: [
            IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xFF8D221A),
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: SubjectTokens.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 48),
          ],
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: SubjectTokens.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
