// ignore_for_file: unnecessary_underscores, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/Student_home/data/course_card_model.dart';
import 'package:student/Student/Student_home/widgets_home/course/view/available_courses_section.dart';
import 'package:student/Student/Student_home/widgets_home/overview/view/home_overview_big_card.dart';
import 'package:student/Student/Student_home/widgets_home/quiz/view/available_tests_screen.dart';
import 'package:student/Student/Student_home/widgets_home/subject/subject_actions_section.dart';
import 'package:student/Student/Student_home/widgets_home/warning/view/warning_card.dart';
import 'package:student/Student/subject/state/subject_state.dart';
import '../controller/Student_home_controller.dart';

class StudentHomeBodyContent extends StatelessWidget {
  const StudentHomeBodyContent({super.key});

  SubjectItem _toSubjectItem(CourseCardModel course) {
    return SubjectItem(
      id: course.id,
      title: course.title,
      teacherName: 'اسم المدرس',
      icon: Icons.menu_book_rounded,
      iconColor: const Color(0xFF3B82F6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvailableCoursesSection(
            onViewAll: () => Get.toNamed('/courses'),
            onEnter: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
            onContinue: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
            onSubscribe: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
          ),
          const GeneralVideosSection(),
          const SizedBox(height: 5),
          const SubjectActionsSection(),
          const SizedBox(height: 6),
          const AvailableTestsScreen(),
          const SizedBox(height: 6),
          const HomeOverviewBigCard(),
          const SizedBox(height: 6),
          const WarningCard(),
        ],
      ),
    );
  }
}

class GeneralVideosSection extends StatelessWidget {
  const GeneralVideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final videos = GeneralVideosState.generalVideos;
      if (videos.isEmpty) return const SizedBox.shrink();

      return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.video_library_rounded, color: Color(0xFF2F6BFF), size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    "المحاضرات والفيديوهات العامة",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE6E8F0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add_to_drive_outlined,
                            color: Color(0xFF1976D2),
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                video.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${video.stage} • ${video.part}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.snackbar(
                              "مشاهدة الفيديو",
                              "جاري تشغيل الفيديو من جوجل درايف...",
                              backgroundColor: const Color(0xFF2F6BFF).withValues(alpha: 0.9),
                              colorText: Colors.white,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F6BFF),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "مشاهدة",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
