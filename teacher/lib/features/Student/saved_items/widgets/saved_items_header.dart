import 'package:flutter/material.dart';

import 'saved_items_tokens.dart';

class SavedItemsHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const SavedItemsHeader({
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
          children: [
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: SavedItemsTokens.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            //const SizedBox(width: 40),
            const Spacer(),
            IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xFF8D221A),
              ),
            ),
          ],
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: SavedItemsTokens.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
