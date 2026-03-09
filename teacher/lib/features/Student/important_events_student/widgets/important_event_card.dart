import 'package:flutter/material.dart';

import '../state/important_events_state.dart';
import 'important_events_tokens.dart';

class ImportantEventCard extends StatelessWidget {
  final ImportantEventItem item;

  const ImportantEventCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final iconBg = item.textColor == Colors.white
        ? ImportantEventsTokens.white.withOpacity(0.95)
        : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        color: item.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: item.textColor,
                    fontSize: 43,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.dateText,
                      style: TextStyle(
                        color: item.textColor.withOpacity(0.95),
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.calendar_month_rounded,
                      color: item.textColor.withOpacity(0.95),
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      item.timeText,
                      style: TextStyle(
                        color: item.textColor.withOpacity(0.95),
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.access_time_rounded,
                      color: item.textColor.withOpacity(0.95),
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              size: 36,
              color: Color(0xFF3F7FE3),
            ),
          ),
        ],
      ),
    );
  }
}
