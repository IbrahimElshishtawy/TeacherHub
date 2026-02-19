import 'package:flutter/material.dart';
import '../state/courses_state.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onTap;

  const CourseCard({super.key, required this.course, required this.onTap});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  String _formatDate(DateTime d) => "${d.year} / ${d.month} / ${d.day}";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(10),
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
          child: Row(
            children: [
              // ============ الصورة (يمين) ============
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 160,
                  height: 140,
                  color: const Color(0xFFF6F7FB),
                  child: course.coverUrl.isEmpty
                      ? const Icon(
                          Icons.image_outlined,
                          color: Colors.black26,
                          size: 34,
                        )
                      : Image.network(course.coverUrl, fit: BoxFit.cover),
                ),
              ),

              const SizedBox(width: 20),

              // ============ النصوص + زر التفاصيل (شمال) ============
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "المرحلة التعليمية: ${course.stage}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      "عدد الفيديوهات: ${course.videosCount} فيديوهات",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      "تاريخ النشر: ${_formatDate(course.publishDate)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "التفاصيل",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
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
