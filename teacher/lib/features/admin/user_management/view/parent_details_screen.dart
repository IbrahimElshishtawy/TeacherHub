import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';

class ParentDetailsScreen extends GetView<UserManagementController> {
  final ParentModel parent;

  const ParentDetailsScreen({super.key, required this.parent});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x04000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF64748B))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Find all children models linked to this parent
    final childrenModels = controller.state.value.students.where((s) => parent.childrenIds.contains(s.id)).toList();

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  const Text(
                    "ملف ولي الأمر",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(width: 48), // spacer
                ],
              ),
              const SizedBox(height: 16),

              // 1. Parent Profile Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white24,
                      child: Text("👨‍👩‍👦", style: TextStyle(fontSize: 36)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      parent.fullName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "كود ولي الأمر: ${parent.id}",
                        style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 2. Parent Information
              _buildSectionCard(
                title: "معلومات الاتصال ولي الأمر",
                icon: Icons.contact_phone_outlined,
                color: const Color(0xFF7C3AED),
                children: [
                  _buildInfoRow("الاسم الكامل", parent.fullName),
                  _buildInfoRow("رقم الهاتف الرئيسي", parent.phone),
                  _buildInfoRow("رقم واتساب المعتمد للتقارير", parent.whatsapp),
                ],
              ),

              // 3. Linked Children list
              _buildSectionCard(
                title: "الأبناء المرتبطون بالحساب",
                icon: Icons.people_outline,
                color: const Color(0xFF2563EB),
                children: [
                  if (childrenModels.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          "لا يوجد طلاب مرتبطون بهذا الحساب حالياً.",
                          style: TextStyle(fontSize: 13, color: Colors.black45),
                        ),
                      ),
                    )
                  else
                    ...childrenModels.map((child) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  child.fullName,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: child.subscriptionStatus == "نشط"
                                        ? Colors.green.withValues(alpha: 0.1)
                                        : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    "الاشتراك: ${child.subscriptionStatus}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: child.subscriptionStatus == "نشط" ? Colors.green : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Divider(height: 1, color: Color(0xFFE2E8F0)),
                            const SizedBox(height: 6),
                            Text("الصف: ${child.grade} (${child.batch})", style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
                            const SizedBox(height: 4),
                            Text("آخر حضور: ${child.latestAttendanceDate}", style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
                            const SizedBox(height: 4),
                            Text("آخر اختبار: ${child.latestExamScore} (${child.latestExamName})", style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
                          ],
                        ),
                      );
                    }),
                ],
              ),

              // 4. Action Buttons
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.sendParentWhatsapp(parent, "متابعة دراسية شاملة.");
                  },
                  icon: const Icon(Icons.whatsapp),
                  label: const Text("إرسال تقرير المتابعة عبر واتساب", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
