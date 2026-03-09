import 'package:flutter/material.dart';

import 'important_events_tokens.dart';

class ImportantEventsHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const ImportantEventsHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ImportantEventsTokens.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ImportantEventsTokens.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
