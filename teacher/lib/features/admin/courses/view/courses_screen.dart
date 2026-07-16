import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/courses_controller.dart';
import '../widgets/courses_header.dart';
import '../widgets/course_card.dart';

class CoursesScreen extends GetView<CoursesController> {
  const CoursesScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  Widget _buildFilterChip(String label, String currentSelected, ValueChanged<String> onSelected) {
    final isSelected = label == currentSelected;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
      selected: isSelected,
      selectedColor: const Color(0xFF2563EB),
      onSelected: (val) {
        if (val) onSelected(label);
      },
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(label, style: const TextStyle(fontSize: 12)),
          items: items.map((i) => DropdownMenuItem(value: i, child: Text(i, style: const TextStyle(fontSize: 12)))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "$count",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filterChips = [
      "الكل",
      "كورسات",
      "فيديو مستقل",
      "مراجعات",
      "ملخصات",
      "حل امتحانات",
      "حل واجبات",
      "اختبارات",
      "PDF",
      "الصفحة الرئيسية"
    ];

    return Scaffold(
      backgroundColor: bg,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.openContentForm(),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text("إضافة محتوى", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final courses = controller.filteredCourses;
            final stateVal = controller.state.value;

            return ListView(
              children: [
                const SizedBox(height: 10),
                const CoursesHeader(),
                const SizedBox(height: 16),

                // 1. Search Bar
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    onChanged: controller.setQuery,
                    decoration: InputDecoration(
                      hintText: "ابحث باسم المحتوى أو المادة أو الدفعة...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE6E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE6E8F0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 2. Horizontal Filter Chips
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: filterChips.map((chip) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: _buildFilterChip(chip, stateVal.selectedType, controller.setFilterType),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // 3. Dropdown Filters Menu Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterDropdown(
                          label: "المادة",
                          value: stateVal.selectedSubject,
                          items: const ["الكل", "الكيمياء", "الفيزياء", "الأحياء"],
                          onChanged: (val) => controller.setFilterSubject(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الدفعة",
                          value: stateVal.selectedBatch,
                          items: const ["الكل", "Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"],
                          onChanged: (val) => controller.setFilterBatch(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الصف الدراسي",
                          value: stateVal.selectedStage,
                          items: const ["الكل", "الصف الأول الثانوي", "الصف الثاني الثانوي", "الصف الثالث الثانوي"],
                          onChanged: (val) => controller.setFilterStage(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "حالة النشر",
                          value: stateVal.selectedStatus,
                          items: const ["الكل", "منشور", "مسودة"],
                          onChanged: (val) => controller.setFilterStatus(val ?? "الكل"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Statistics Cards Section
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatCard("📚 الكورسات", controller.coursesCount),
                        const SizedBox(width: 8),
                        _buildStatCard("🎥 الفيديوهات", controller.videosCount),
                        const SizedBox(width: 8),
                        _buildStatCard("📝 الاختبارات", controller.testsCount),
                        const SizedBox(width: 8),
                        _buildStatCard("📄 الملفات", controller.pdfsCount),
                        const SizedBox(width: 8),
                        _buildStatCard("🏠 محتوى الرئيسية", controller.homeCount),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 5. Content Cards list
                ...courses.map(
                  (c) => CourseCard(
                    course: c,
                    onTap: () => controller.openDetails(c),
                    onEdit: () => controller.openContentForm(existingItem: c),
                    onDelete: () => controller.deleteContent(c),
                    onCopy: () => controller.copyContent(c),
                    onChangeBatches: () => controller.changeBatches(c),
                    onToggleHide: () => controller.hideContent(c),
                  ),
                ),

                const SizedBox(height: 80), // spacer for FAB
              ],
            );
          }),
        ),
      ),
    );
  }
}
