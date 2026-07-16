import 'package:flutter/material.dart';
import '../state/courses_state.dart';

class CourseCard extends StatelessWidget {
  final ContentModel course;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onCopy;
  final VoidCallback onChangeBatches;
  final VoidCallback onToggleHide;

  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.onCopy,
    required this.onChangeBatches,
    required this.onToggleHide,
  });

  Color _getBadgeColor(String type) {
    switch (type) {
      case "كورسات":
        return const Color(0xFF2563EB); // Blue
      case "فيديو مستقل":
        return const Color(0xFF7C3AED); // Purple
      case "مراجعات":
        return const Color(0xFFD97706); // Amber
      case "اختبارات":
        return const Color(0xFFDC2626); // Red
      case "PDF":
        return const Color(0xFF059669); // Emerald
      default:
        return const Color(0xFF4B5563); // Gray
    }
  }

  String _getBadgeIcon(String type) {
    switch (type) {
      case "كورسات":
      case "فيديو مستقل":
      case "مراجعات":
      case "حل امتحانات":
      case "حل واجبات":
        return "🎥";
      case "اختبارات":
        return "📝";
      case "PDF":
      case "ملخصات":
        return "📄";
      default:
        return "🏠";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        color: course.isActive ? Colors.white : Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE6E8F0)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 110,
                        height: 110,
                        color: const Color(0xFFF3F4F6),
                        child: const Icon(Icons.image_outlined, color: Colors.black26, size: 30),
                      ),
                    ),
                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getBadgeColor(course.contentType).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${_getBadgeIcon(course.contentType)} ${course.contentType}",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: _getBadgeColor(course.contentType),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Text(
                                  course.sourceType,
                                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Text(
                            course.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 8),

                          Text(
                            "المادة: ${course.subject} • المرحلة: ${course.stage}",
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "الدفعات: ${course.batches.join(', ')}",
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PopupMenuButton<String>(
                          onSelected: (val) {
                            if (val == "edit") onEdit();
                            if (val == "copy") onCopy();
                            if (val == "batches") onChangeBatches();
                            if (val == "hide") onToggleHide();
                            if (val == "delete") onDelete();
                          },
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            const PopupMenuItem(value: "edit", child: Row(children: [Icon(Icons.edit_outlined), SizedBox(width: 8), Text("تعديل")])),
                            const PopupMenuItem(value: "copy", child: Row(children: [Icon(Icons.copy_outlined), SizedBox(width: 8), Text("نسخ")])),
                            const PopupMenuItem(value: "batches", child: Row(children: [Icon(Icons.people_outline), SizedBox(width: 8), Text("تغيير الدفعات")])),
                            PopupMenuItem(value: "hide", child: Row(children: [Icon(course.isActive ? Icons.visibility_off_outlined : Icons.visibility_outlined), const SizedBox(width: 8), Text(course.isActive ? "إخفاء" : "إظهار")])),
                            const PopupMenuItem(value: "delete", child: Row(children: [Icon(Icons.delete_outline, color: Colors.red), SizedBox(width: 8), Text("حذف", style: TextStyle(color: Colors.red))])),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, color: Color(0xFFE6E8F0)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (course.contentType == "كورسات")
                      Text(
                        "عدد الفيديوهات: ${course.videosCount}",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF7C3AED)),
                      )
                    else if (course.contentType == "PDF" || course.contentType == "ملخصات")
                      const Text(
                        "ملف PDF",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF059669)),
                      )
                    else
                      Text(
                        "مدة الفيديو: ${course.duration}",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                      ),

                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: onEdit,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            minimumSize: const Size(60, 30),
                            side: const BorderSide(color: Color(0xFF2563EB)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("تعديل", style: TextStyle(fontSize: 12, color: Color(0xFF2563EB), fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            minimumSize: const Size(60, 30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("التفاصيل", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
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
