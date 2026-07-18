import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/saved_items_controller.dart';
import '../widgets/saved_items_tokens.dart';
import '../widgets/subscribed_lesson_card.dart';

class MySubscribedCoursesScreen extends GetView<SavedItemsController> {
  const MySubscribedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = controller.state.subscribedLessons;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: SavedItemsTokens.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF8D221A),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'كورساتي المشتركة',
                      style: TextStyle(
                        color: SavedItemsTokens.textPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
                const Text(
                  'قائمة الدروس والفيديوهات التعليمية المتاحة في هذا الكورس',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: SavedItemsTokens.textSecondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (_, i) =>
                        SubscribedLessonCard(item: lessons[i]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
