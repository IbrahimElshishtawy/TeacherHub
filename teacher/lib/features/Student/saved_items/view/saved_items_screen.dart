import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/saved_items_controller.dart';
import '../state/saved_items_state.dart';
import '../widgets/saved_course_card.dart';
import '../widgets/saved_file_card.dart';
import '../widgets/saved_items_header.dart';
import '../widgets/saved_items_search_bar.dart';
import '../widgets/saved_items_tabs.dart';
import '../widgets/saved_items_tokens.dart';
import '../widgets/saved_test_card.dart';

class SavedItemsScreen extends GetView<SavedItemsController> {
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: SavedItemsTokens.bg,
        body: SafeArea(
          child: GetBuilder<SavedItemsController>(
            builder: (c) {
              final state = c.state;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  children: [
                    SavedItemsHeader(
                      title: state.title,
                      subtitle: state.subtitle,
                      onBack: c.goBackToHome,
                    ),
                    const SizedBox(height: 12),
                    SavedItemsSearchBar(onChanged: c.setQuery),
                    const SizedBox(height: 12),
                    SavedItemsTabs(
                      selectedTab: state.selectedTab,
                      onTabChanged: c.setTab,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: _SavedItemsContent(
                        selectedTab: state.selectedTab,
                        tests: state.filteredTests,
                        files: state.filteredFiles,
                        courses: state.filteredCourses,
                        onOpenMyCourses: c.goToMyCourses,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SavedItemsContent extends StatelessWidget {
  final SavedItemsTab selectedTab;
  final List<SavedTestItem> tests;
  final List<SavedFileItem> files;
  final List<SavedCourseItem> courses;
  final VoidCallback onOpenMyCourses;

  const _SavedItemsContent({
    required this.selectedTab,
    required this.tests,
    required this.files,
    required this.courses,
    required this.onOpenMyCourses,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case SavedItemsTab.previousTests:
        return ListView.builder(
          itemCount: tests.length,
          itemBuilder: (_, i) => SavedTestCard(item: tests[i]),
        );
      case SavedItemsTab.files:
        return ListView.builder(
          itemCount: files.length,
          itemBuilder: (_, i) => SavedFileCard(item: files[i]),
        );
      case SavedItemsTab.courses:
        return ListView.builder(
          itemCount: courses.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: onOpenMyCourses,
              child: SavedCourseCard(item: courses[i]),
            );
          },
        );
    }
  }
}
