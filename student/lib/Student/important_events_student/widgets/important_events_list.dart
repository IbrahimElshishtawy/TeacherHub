import 'package:flutter/material.dart';

import '../state/important_events_state.dart';
import 'important_event_card.dart';

class ImportantEventsList extends StatelessWidget {
  final List<ImportantEventItem> events;

  const ImportantEventsList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (_, index) {
        return ImportantEventCard(item: events[index]);
      },
    );
  }
}
