// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/subject/state/subject_state.dart';
import '../widgets/overview_header.dart';
import '../widgets/overview_last_video_card.dart';
import '../widgets/overview_progress_card.dart';
import '../widgets/overview_tests_card.dart';

class HomeOverviewBigCard extends StatelessWidget {
  const HomeOverviewBigCard({super.key});

  static const double _innerCardW = double.infinity;
  static const double _innerCardH = 270;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: const Color(0xFFE9EDF5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OverviewHeader(),
            const SizedBox(height: 2),

            Center(
              child: SizedBox(
                width: _innerCardW,
                height: _innerCardH,
                child: const OverviewProgressCard(),
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: SizedBox(
                width: _innerCardW,
                height: _innerCardH,
                child: OverviewLastVideoCard(
                  videoTitle: 'الذرة وبنيتها',
                  videoSubtitle: 'مكونات الذرة والإلكترونات والطاقة',
                  courseName: 'الباب الأول - كيمياء',
                  durationText: '45:00',
                  watchedSinceText: 'تمت المشاهدة من 3 ساعات',
                  watchProgress: 0.4,
                  videoPathOrUrl:
                      'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
                  thumbnailNetworkUrl:
                      "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800",
                  onTapContinue: () => Get.toNamed(
                    '/courses/lesson',
                    arguments: const SubjectLessonItem(
                      id: 'lesson_2',
                      title: 'الذرة وبنيتها',
                      subtitle: 'مكونات الذرة والإلكترونات والطاقة',
                      dateText: 'الثلاثاء 2 فبراير',
                      duration: '40:00',
                      imageStyle: 'blue_lab',
                    ),
                  ),
                  onTapCourse: () => Get.toNamed('/courses/details'),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: SizedBox(
                width: _innerCardW,
                height: 230,
                child: const OverviewTestsCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

