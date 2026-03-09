import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/important_events_controller.dart';
import '../widgets/important_events_header.dart';
import '../widgets/important_events_list.dart';
import '../widgets/important_events_tokens.dart';

class ImportantEventsScreen extends GetView<ImportantEventsController> {
  const ImportantEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ImportantEventsTokens.pageBg,
        appBar: AppBar(
          backgroundColor: ImportantEventsTokens.pageBg,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: controller.goToStudentHome,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF8D221A),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              children: [
                ImportantEventsHeader(
                  title: controller.state.title,
                  subtitle: controller.state.subtitle,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ImportantEventsList(events: controller.state.events),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
