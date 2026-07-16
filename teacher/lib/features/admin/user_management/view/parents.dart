import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';
import 'parent_details_screen.dart';

class ParentsScreen extends GetView<UserManagementController> {
  const ParentsScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

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
        border: Border.all(color: const Color(0xFFE2E8F0)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final parents = controller.filteredParents;
            final stateVal = controller.state.value;

            return ListView(
              children: [
                const SizedBox(height: 16),

                // Header
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "إدارة أولياء الأمور",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "متابعة أولياء الأمور، وإرسال تقارير الحضور والنتائج والتقييمات الشهرية بنقرة واحدة.",
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Search Bar
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    onChanged: controller.setParentQuery,
                    decoration: InputDecoration(
                      hintText: "ابحث باسم ولي الأمر أو رقم الهاتف...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Dropdown Filters Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterDropdown(
                          label: "الدفعة",
                          value: stateVal.selectedParentBatch,
                          items: const ["الكل", "Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"],
                          onChanged: (val) => controller.setParentBatch(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الصف",
                          value: stateVal.selectedParentGrade,
                          items: const ["الكل", "الصف الأول الثانوي", "الصف الثاني الثانوي", "الصف الثالث الثانوي"],
                          onChanged: (val) => controller.setParentGrade(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "السنة",
                          value: stateVal.selectedParentYear,
                          items: const ["الكل", "2025/2026", "2026/2027"],
                          onChanged: (val) => controller.setParentYear(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "عدد الأبناء",
                          value: stateVal.selectedParentChildrenCount,
                          items: const ["الكل", "1", "2", "3+"],
                          onChanged: (val) => controller.setParentChildrenCount(val ?? "الكل"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Parents List Cards
                ...parents.map((parent) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: const Color(0xFF7C3AED).withValues(alpha: 0.1),
                                  child: const Text("👨‍👩‍👦", style: TextStyle(fontSize: 24)),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        parent.fullName,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "رقم الهاتف: ${parent.phone} • واتساب: ${parent.whatsapp}",
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7C3AED).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "عدد الأبناء: ${parent.childrenIds.length}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF7C3AED),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 1, color: Color(0xFFE2E8F0)),
                            const SizedBox(height: 12),

                            // Actions
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {
                                    controller.sendParentWhatsapp(parent, "متابعة مستوى الأبناء الدوري.");
                                  },
                                  icon: const Icon(Icons.whatsapp, size: 16, color: Colors.green),
                                  label: const Text("إرسال واتساب", style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold)),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.green),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => Get.to(() => ParentDetailsScreen(parent: parent)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2563EB),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("عرض التفاصيل", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 30),
              ],
            );
          }),
        ),
      ),
    );
  }
}
