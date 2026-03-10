import 'package:flutter/material.dart';

import '../state/subject_state.dart';
import 'subject_tokens.dart';

class SubjectTestRecordCard extends StatelessWidget {
  final SubjectTestRecordItem item;

  const SubjectTestRecordCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final failed = item.score < 20;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: failed ? const Color(0xFFE3342A) : SubjectTokens.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SubjectTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
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
                color: failed ? Colors.white : const Color(0xFF1F3CA6),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            '${item.score}/${item.total}',
            style: TextStyle(
              color: failed ? Colors.white : SubjectTokens.green,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
