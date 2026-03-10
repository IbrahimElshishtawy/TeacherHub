import 'package:flutter/material.dart';

import '../state/saved_items_state.dart';
import 'saved_items_tokens.dart';

class SavedTestCard extends StatelessWidget {
  final SavedTestItem item;

  const SavedTestCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final failed = item.score < 20;
    final scoreColor = failed ? Colors.white : SavedItemsTokens.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: failed ? SavedItemsTokens.red : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SavedItemsTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Text(
              '${item.title} - ${item.code}',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: failed ? Colors.white : const Color(0xFF1F2F88),
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            '${item.score}/${item.total}',
            style: TextStyle(
              color: scoreColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
