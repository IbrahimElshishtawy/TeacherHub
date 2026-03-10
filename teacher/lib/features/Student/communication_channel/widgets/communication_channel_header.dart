import 'package:flutter/material.dart';

import 'communication_channel_tokens.dart';

class CommunicationChannelHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const CommunicationChannelHeader({
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
            IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF8D221A),
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: CommunicationChannelTokens.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 40),
          ],
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: CommunicationChannelTokens.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
