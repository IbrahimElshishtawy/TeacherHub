import 'package:flutter/material.dart';

enum ImportantEventType { session, revision, exam }

class ImportantEventItem {
  final String title;
  final String timeText;
  final String dateText;
  final ImportantEventType type;

  const ImportantEventItem({
    required this.title,
    required this.timeText,
    required this.dateText,
    required this.type,
  });

  Color get cardColor {
    switch (type) {
      case ImportantEventType.session:
        return const Color(0xFF3F7FE3);
      case ImportantEventType.revision:
        return const Color(0xFFF2C600);
      case ImportantEventType.exam:
        return const Color(0xFF6C6C6C);
    }
  }

  Color get textColor {
    switch (type) {
      case ImportantEventType.revision:
        return const Color(0xFF1A1A1A);
      case ImportantEventType.session:
      case ImportantEventType.exam:
        return Colors.white;
    }
  }
}

class ImportantEventsState {
  final String title;
  final String subtitle;
  final List<ImportantEventItem> events;

  const ImportantEventsState({
    required this.title,
    required this.subtitle,
    required this.events,
  });

  factory ImportantEventsState.initial() {
    return const ImportantEventsState(
      title: 'جدول المواعيد والأحداث',
      subtitle: 'تابع مواعيد الحصص، الامتحانات الشاملة، والمراجعات المضافة إلى جدولك.',
      events: [
        ImportantEventItem(
          title: 'حصة يومية',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.session,
        ),
        ImportantEventItem(
          title: 'مراجعة شاملة (اختباري الحضور)',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.revision,
        ),
        ImportantEventItem(
          title: 'امتحان شامل',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.exam,
        ),
        ImportantEventItem(
          title: 'حصة يومية',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.session,
        ),
        ImportantEventItem(
          title: 'حصة يومية',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.session,
        ),
        ImportantEventItem(
          title: 'امتحان شامل',
          timeText: '5:30 PM',
          dateText: '15 / 2 / 2026',
          type: ImportantEventType.exam,
        ),
      ],
    );
  }
}
