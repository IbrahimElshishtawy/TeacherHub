import 'package:flutter/material.dart';

enum EventType { dailyClass, fullExam, fullReview }

class EventTypeTabs extends StatelessWidget {
  final EventType value;
  final ValueChanged<EventType> onChanged;

  const EventTypeTabs({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const Color blue = Color(0xFF2F6BFF);
  static const Color border = Color(0xFFE6E8F0);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              text: "حصة يومية",
              selected: value == EventType.dailyClass,
              onTap: () => onChanged(EventType.dailyClass),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _TabButton(
              text: "امتحان شامل",
              selected: value == EventType.fullExam,
              onTap: () => onChanged(EventType.fullExam),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _TabButton(
              text: "مراجعة شاملة",
              selected: value == EventType.fullReview,
              onTap: () => onChanged(EventType.fullReview),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  static const Color blue = Color(0xFF2F6BFF);
  static const Color border = Color(0xFFE6E8F0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? blue : border),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x1A2F6BFF),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            color: selected ? Colors.white : const Color(0xFF1E2A3B),
          ),
        ),
      ),
    );
  }
}
