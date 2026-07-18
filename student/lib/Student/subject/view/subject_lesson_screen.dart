// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_controller.dart';
import '../state/subject_state.dart';
import '../widgets/subject_image_tile.dart';
import '../widgets/subject_lesson_card.dart';
import '../widgets/subject_tokens.dart';

class SubjectLessonScreen extends GetView<SubjectController> {
  const SubjectLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;
    final lesson = Get.arguments as SubjectLessonItem?;
    final currentLesson = lesson ?? state.lessons.first;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: SubjectTokens.pageBg,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SubjectImageTile(
                    style: currentLesson.imageStyle,
                    width: double.infinity,
                    height: 220,
                    bottomBar: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(height: 4, color: SubjectTokens.red),
                        Container(
                          color: Colors.black.withOpacity(0.35),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.pause_rounded, color: Colors.white),
                              SizedBox(width: 10),
                              Icon(Icons.skip_previous_rounded, color: Colors.white),
                              SizedBox(width: 4),
                              Icon(Icons.play_arrow_rounded, color: Colors.white),
                              SizedBox(width: 4),
                              Icon(Icons.skip_next_rounded, color: Colors.white),
                              SizedBox(width: 12),
                              Text(
                                '20:35 / 50:03',
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Icon(Icons.closed_caption_outlined, color: Colors.white),
                              SizedBox(width: 10),
                              Icon(Icons.fullscreen_rounded, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    Text(
                      '${currentLesson.title} (التعرف على المفاهيم الأساسية ومقدمة الباب الأول)',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: SubjectTokens.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF7AA7B7),
                          child: Text(
                            'م',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'أ / مصطفى هيكل',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'الثلاثاء 2 فبراير',
                                    style: TextStyle(
                                      color: SubjectTokens.textSecondary,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: 14,
                                    color: SubjectTokens.textSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        _LessonActionButton(icon: Icons.bookmark_border_rounded),
                        SizedBox(width: 8),
                        _LessonActionButton(icon: Icons.download_outlined),
                        SizedBox(width: 8),
                        _LessonActionButton(icon: Icons.open_in_new_rounded),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...state.lessons.map(
                      (item) => SubjectLessonCard(
                        item: item,
                        onTap: () => controller.openLesson(item),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonActionButton extends StatelessWidget {
  final IconData icon;

  const _LessonActionButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF8FA9D8)),
    );
  }
}
