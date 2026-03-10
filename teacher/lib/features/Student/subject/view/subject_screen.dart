import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_controller.dart';
import '../widgets/subject_header.dart';
import '../widgets/subject_tile_card.dart';
import '../widgets/subject_tokens.dart';

class SubjectScreen extends GetView<SubjectController> {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: SubjectTokens.pageBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                SubjectHeader(
                  title: state.title,
                  subtitle: state.subtitle,
                  onBack: controller.backHome,
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.subjects.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.05,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (_, index) {
                      final item = state.subjects[index];
                      return SubjectTileCard(
                        item: item,
                        onTap: () => controller.openSubject(item),
                      );
                    },
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
