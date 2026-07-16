import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';

class StudentDetailsScreen extends GetView<UserManagementController> {
  final StudentModel student;

  const StudentDetailsScreen({super.key, required this.student});

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

  Widget _buildMetricTile(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController(text: student.internalNotes);

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
                    "تفاصيل الطالب",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(width: 48), // spacer
                ],
              ),
              const SizedBox(height: 16),

              // 1. Student Identity Header Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white24,
                      child: Text("👨‍🎓", style: TextStyle(fontSize: 36)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      student.fullName,
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
                        "كود الطالب: ${student.id}",
                        style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 2. Student Info Card
              _buildSectionCard(
                title: "معلومات الطالب الأساسية",
                icon: Icons.person_outline,
                color: const Color(0xFF2563EB),
                children: [
                  _buildInfoRow("الاسم الكامل", student.fullName),
                  _buildInfoRow("رقم الهاتف", student.phone),
                  _buildInfoRow("رقم هاتف ولي الأمر", student.parentPhone),
                  _buildInfoRow("واتساب ولي الأمر", student.parentWhatsapp),
                  _buildInfoRow("المرحلة التعليمية", student.grade),
                  _buildInfoRow("الدفعة المستهدفة", student.batch),
                  _buildInfoRow("السنة الدراسية", student.schoolYear),
                  _buildInfoRow("حالة الاشتراك", student.subscriptionStatus),
                  _buildInfoRow("تاريخ التسجيل", "2025/10/01"),
                ],
              ),

              // 3. Attendance Card
              _buildSectionCard(
                title: "كارت الحضور والغياب",
                icon: Icons.co_present_outlined,
                color: Colors.green,
                children: [
                  Row(
                    children: [
                      _buildMetricTile("عدد مرات الحضور", "${student.attendanceCount}", Colors.green),
                      const SizedBox(width: 10),
                      _buildMetricTile("عدد مرات الغياب", "${student.absenceCount}", Colors.red),
                      const SizedBox(width: 10),
                      _buildMetricTile("نسبة الحضور", "${student.attendanceRate}%", const Color(0xFF2563EB)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow("آخر حضور مسجل", student.latestAttendanceDate),
                ],
              ),

              // 4. Exam Statistics
              _buildSectionCard(
                title: "إحصائيات الاختبارات",
                icon: Icons.quiz_outlined,
                color: const Color(0xFF7C3AED),
                children: [
                  Row(
                    children: [
                      _buildMetricTile("عدد الاختبارات", "${student.examCount}", const Color(0xFF7C3AED)),
                      const SizedBox(width: 10),
                      _buildMetricTile("متوسط الدرجات", "${student.avgExamScore}%", Colors.blue),
                      const SizedBox(width: 10),
                      _buildMetricTile("أعلى درجة", "${student.highestExamScore}", Colors.amber.shade700),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow("آخر اختبار مسجل", student.latestExamName),
                  _buildInfoRow("درجة آخر اختبار", student.latestExamScore),
                ],
              ),

              // 5. Homework Card
              _buildSectionCard(
                title: "إحصائيات الواجبات المنزلية",
                icon: Icons.assignment_outlined,
                color: Colors.orange,
                children: [
                  Row(
                    children: [
                      _buildMetricTile("إجمالي الواجبات", "${student.homeworkCount}", Colors.orange),
                      const SizedBox(width: 10),
                      _buildMetricTile("الواجبات المكتملة", "${student.completedHomework}", Colors.green),
                      const SizedBox(width: 10),
                      _buildMetricTile("الواجبات المتأخرة", "${student.delayedHomework}", Colors.red),
                    ],
                  ),
                ],
              ),

              // 6. Purchased Courses & Progress
              _buildSectionCard(
                title: "الكورسات والتقدم الدراسي",
                icon: Icons.auto_stories_outlined,
                color: Colors.teal,
                children: [
                  _buildInfoRow("الكورسات المشتراة", "${student.purchasedCoursesCount} كورسات"),
                  const SizedBox(height: 10),
                  const Text("نسبة تقدم الكورس الحالي", style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: student.courseProgress / 100.0,
                            minHeight: 10,
                            backgroundColor: Colors.teal.withValues(alpha: 0.1),
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text("${student.courseProgress}%", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.teal)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMetricTile("المحاضرات المكتملة", "${student.completedLessons}", Colors.green),
                      const SizedBox(width: 10),
                      _buildMetricTile("المحاضرات المتبقية", "${student.remainingLessons}", Colors.orange),
                    ],
                  ),
                ],
              ),

              // 7. Timeline logs
              _buildSectionCard(
                title: "سجل النشاطات (Timeline)",
                icon: Icons.timeline_outlined,
                color: Colors.blueGrey,
                children: [
                  _buildInfoRow("آخر تسجيل دخول للمنصة", student.lastLogin),
                  _buildInfoRow("آخر مشاهدة محاضرة", student.lastWatch),
                  _buildInfoRow("آخر اختبار أداه", student.lastExam),
                  _buildInfoRow("آخر واجب رفعه", student.lastHomework),
                ],
              ),

              // 8. Teacher Notes
              _buildSectionCard(
                title: "ملاحظات المعلم الداخلية",
                icon: Icons.rate_review_outlined,
                color: Colors.brown,
                children: [
                  TextField(
                    controller: noteController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "اكتب ملاحظاتك الداخلية عن مستوى الطالب وسلوكه...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.saveNotes(student, noteController.text.trim());
                      },
                      icon: const Icon(Icons.save_outlined, size: 16),
                      label: const Text("حفظ الملاحظات", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),

              // 9. Quick Actions row
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text("تعديل بيانات الطالب"),
                            content: Text("شاشة تعديل الطالب: ${student.fullName}"),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text("موافق"),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text("تعديل البيانات", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => controller.toggleStudentStatus(student),
                      icon: Icon(student.isActive ? Icons.block_outlined : Icons.check_circle_outline),
                      label: Text(student.isActive ? "إيقاف الحساب" : "تفعيل الحساب", style: const TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: student.isActive ? Colors.red : Colors.green,
                        side: BorderSide(color: student.isActive ? Colors.red : Colors.green),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.snackbar("إرسال رسالة", "فتح محادثة شات بوت إرسال رسالة للطالب ${student.fullName}");
                  },
                  icon: const Icon(Icons.send_outlined),
                  label: const Text("إرسال رسالة خاصة", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C3AED),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
