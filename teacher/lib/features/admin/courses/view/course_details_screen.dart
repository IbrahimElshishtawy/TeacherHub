import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/courses_controller.dart';
import '../state/courses_state.dart';
import '../widgets/course_actions_row.dart';
import '../widgets/course_details_header.dart';
import '../widgets/course_info_row.dart';
import '../widgets/course_videos_grid.dart';

class CourseDetailsScreen extends GetView<CoursesController> {
  const CourseDetailsScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  String _formatDate(DateTime d) => "${d.year} / ${d.month} / ${d.day}";

  @override
  Widget build(BuildContext context) {
    final ContentModel course = Get.arguments as ContentModel;

    final videos = <CourseVideoModel>[
      const CourseVideoModel(
        title: "الذرة وبنيتها",
        subtitle: "مكونات الذرة والإلكترونات والطاقة",
        thumbnailUrl: "",
        duration: Duration(minutes: 45),
      ),
      const CourseVideoModel(
        title: "مقدمة في الكيمياء",
        subtitle: "التعريف بالمفاهيم الأساسية",
        thumbnailUrl: "",
        duration: Duration(minutes: 40),
      ),
      const CourseVideoModel(
        title: "الرابطة الكيميائية",
        subtitle: "الرابطة الأيونية والتساهمية",
        thumbnailUrl: "",
        duration: Duration(minutes: 44),
      ),
      const CourseVideoModel(
        title: "الجدول الدوري للعناصر",
        subtitle: "المجموعات والدورات",
        thumbnailUrl: "",
        duration: Duration(minutes: 42),
      ),
    ];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: ListView(
          children: [
            CourseDetailsHeader(course: course),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: _CardShell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "التحكم في المحتوى",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),

                    CourseActionsRow(
                      onEdit: () => controller.openContentForm(existingItem: course),
                      onChangeStatus: () => controller.changeStatus(course),
                      onPreview: () => controller.previewCourse(course),
                    ),

                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Color(0xFFE6E8F0)),
                    const SizedBox(height: 14),

                    const Text(
                      "تفاصيل المحتوى",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),

                    CourseInfoRow(
                      icon: Icons.video_library_outlined,
                      title: "نوع المحتوى",
                      value: course.contentType,
                    ),
                    CourseInfoRow(
                      icon: Icons.timelapse_outlined,
                      title: "المدة / التفاصيل",
                      value: course.contentType == "كورسات" ? "${course.videosCount} فيديوهات" : course.duration,
                    ),
                    CourseInfoRow(
                      icon: Icons.payments_outlined,
                      title: "الحالة",
                      value: course.isFree ? "مجاني" : "يتطلب اشتراك",
                    ),
                    CourseInfoRow(
                      icon: Icons.calendar_month_outlined,
                      title: "تاريخ النشر",
                      value: _formatDate(course.publishDate),
                    ),
                    CourseInfoRow(
                      icon: Icons.school_outlined,
                      title: "المرحلة التعليمية",
                      value: course.stage,
                    ),
                    CourseInfoRow(
                      icon: Icons.visibility_outlined,
                      title: "عدد المشاهدات",
                      value: "${course.views} مشاهدة",
                    ),
                    CourseInfoRow(
                      icon: Icons.groups_outlined,
                      title: "الطلاب المسجلون",
                      value: "${course.enrolled} طالب",
                    ),
                    CourseInfoRow(
                      icon: Icons.qr_code_2_outlined,
                      title: "الكود التعريفي",
                      value: course.id,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "فيديوهات الكورس",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => controller.uploadVideoFromGoogleDrive(course),
                    icon: const Icon(Icons.add_to_drive_outlined, size: 18),
                    label: const Text(
                      "رفع فيديو (جوجل درايف)",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CourseVideosGrid(
                videos: videos,
                onTap: (v) => Get.snackbar("فيديو", "فتح: ${v.title}"),
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  final Widget child;
  const _CardShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE6E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
