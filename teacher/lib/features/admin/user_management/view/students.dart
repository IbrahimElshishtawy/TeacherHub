import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_management_controller.dart';
import 'student_details_screen.dart';

class StudentsScreen extends GetView<UserManagementController> {
  const StudentsScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
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

  // ----------------------------------------------------
  // Registration Form Dialog
  // ----------------------------------------------------
  void _openRegistrationDialog(BuildContext context) {
    final nameController = TextEditingController();
    final studentPhoneController = TextEditingController();
    final parentPhoneController = TextEditingController();
    final parentWhatsappController = TextEditingController();

    String selectedGrade = "الصف الثالث الثانوي";
    String selectedBatch = "Third Secondary 2026";
    String selectedYear = "2025/2026";

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.person_add_alt_1_outlined, color: Color(0xFF2563EB), size: 28),
                          SizedBox(width: 10),
                          Text(
                            "تسجيل طالب جديد",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 16),

                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "اسم الطالب ثلاثي / رباعي",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: studentPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "رقم هاتف الطالب",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: parentPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "رقم هاتف ولي الأمر",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: parentWhatsappController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "رقم واتساب ولي الأمر",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text("الصف الدراسي", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedGrade,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "الصف الأول الثانوي", child: Text("الصف الأول الثانوي")),
                              DropdownMenuItem(value: "الصف الثاني الثانوي", child: Text("الصف الثاني الثانوي")),
                              DropdownMenuItem(value: "الصف الثالث الثانوي", child: Text("الصف الثالث الثانوي")),
                            ],
                            onChanged: (val) {
                              if (val != null) setState(() => selectedGrade = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      const Text("الدفعة الدراسية", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedBatch,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "Third Secondary 2026", child: Text("Third Secondary 2026")),
                              DropdownMenuItem(value: "Third Secondary 2027", child: Text("Third Secondary 2027")),
                              DropdownMenuItem(value: "Second Secondary", child: Text("Second Secondary")),
                              DropdownMenuItem(value: "First Secondary", child: Text("First Secondary")),
                            ],
                            onChanged: (val) {
                              if (val != null) setState(() => selectedBatch = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      const Text("السنة الدراسية", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedYear,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "2025/2026", child: Text("2025/2026")),
                              DropdownMenuItem(value: "2026/2027", child: Text("2026/2027")),
                            ],
                            onChanged: (val) {
                              if (val != null) setState(() => selectedYear = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              final name = nameController.text.trim();
                              final sPhone = studentPhoneController.text.trim();
                              final pPhone = parentPhoneController.text.trim();
                              final pWhatsapp = parentWhatsappController.text.trim();

                              if (name.isEmpty || sPhone.isEmpty || pPhone.isEmpty || pWhatsapp.isEmpty) {
                                Get.snackbar("خطأ", "يرجى ملء جميع الحقول المطلوبة", backgroundColor: Colors.red, colorText: Colors.white);
                                return;
                              }

                              controller.registerStudent(
                                name: name,
                                studentPhone: sPhone,
                                parentPhone: pPhone,
                                parentWhatsapp: pWhatsapp,
                                grade: selectedGrade,
                                batch: selectedBatch,
                                schoolYear: selectedYear,
                              );
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2563EB),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("تأكيد التسجيل", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // Chatbot Settings Dialog
  // ----------------------------------------------------
  void _openChatbotSettings(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Obx(() {
              final reports = controller.state.value.enabledReports;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.smart_toy_outlined, color: Color(0xFF7C3AED), size: 28),
                      SizedBox(width: 10),
                      Text(
                        "إعدادات التقارير التلقائية (WhatsApp)",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "تفعيل إرسال الرسائل الفورية للأولياء تلقائياً من خلال البوت الذكي.",
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 8),

                  ...reports.keys.map((key) {
                    final isEnabled = reports[key] ?? false;
                    return CheckboxListTile(
                      title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                      value: isEnabled,
                      dense: true,
                      activeColor: const Color(0xFF7C3AED),
                      onChanged: (val) => controller.toggleReport(key),
                    );
                  }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("حفظ وإغلاق", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // Bulk Messaging Bottom Sheet
  // ----------------------------------------------------
  void _openBulkWhatsappSheet(BuildContext context) {
    final messageController = TextEditingController();
    String selectedType = "رسالة نصية";
    
    final selectedRecipients = <String>[].obs;

    final recipientOptions = [
      "جميع أولياء الأمور",
      "مجموعة مخصصة",
      "أولياء أمور الطلاب الغائبين",
      "أولياء أمور الطلاب منخفضي الدرجات",
      "أولياء أمور الاشتراك المنتهي"
    ];

    Get.bottomSheet(
      Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(Icons.mark_chat_unread_outlined, color: Color(0xFF7C3AED), size: 28),
                    SizedBox(width: 10),
                    Text(
                      "إرسال رسالة جماعية (WhatsApp)",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "أرسل تقارير أو رسائل جماعية إلى مجموعات محددة من أولياء الأمور.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 16),

                const Text("اختر المستلمين", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Obx(() => Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: recipientOptions.map((opt) {
                    final isSelected = selectedRecipients.contains(opt);
                    return FilterChip(
                      label: Text(opt, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : Colors.black87)),
                      selected: isSelected,
                      selectedColor: const Color(0xFF7C3AED),
                      checkmarkColor: Colors.white,
                      onSelected: (val) {
                        if (val) {
                          selectedRecipients.add(opt);
                        } else {
                          selectedRecipients.remove(opt);
                        }
                      },
                    );
                  }).toList(),
                )),
                const SizedBox(height: 16),

                const Text("نوع الرسالة", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                StatefulBuilder(
                  builder: (context, setInnerState) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedType,
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(value: "رسالة نصية", child: Text("رسالة نصية")),
                            DropdownMenuItem(value: "تقرير تلقائي", child: Text("تقرير تلقائي")),
                            DropdownMenuItem(value: "تذكير بالحصة", child: Text("تذكير بالحصة")),
                            DropdownMenuItem(value: "نتيجة اختبار", child: Text("نتيجة اختبار")),
                            DropdownMenuItem(value: "متابعة الواجب", child: Text("متابعة الواجب")),
                            DropdownMenuItem(value: "تنبيه غياب", child: Text("تنبيه غياب")),
                          ],
                          onChanged: (val) {
                            if (val != null) {
                              setInnerState(() => selectedType = val);
                              if (val == "تذكير بالحصة") {
                                messageController.text = "تذكير: نود إعلامكم بموعد الحصة القادمة غداً إن شاء الله في تمام الساعة الثالثة عصراً. يرجى التزام الطالب بالحضور.";
                              } else if (val == "تنبيه غياب") {
                                messageController.text = "تنبيه: نود إحاطتكم علماً بغياب الطالب اليوم عن حضور المحاضرة المقررة. يرجى المتابعة لضمان عدم تأخر مستوى الطالب.";
                              } else {
                                messageController.text = "";
                              }
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: messageController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "محتوى الرسالة المعاينة",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "اكتب نص الرسالة هنا...",
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedRecipients.isEmpty) {
                          Get.snackbar("خطأ", "يرجى تحديد المستلمين أولاً", backgroundColor: Colors.red, colorText: Colors.white);
                          return;
                        }
                        if (messageController.text.trim().isEmpty) {
                          Get.snackbar("خطأ", "يرجى كتابة محتوى الرسالة", backgroundColor: Colors.red, colorText: Colors.white);
                          return;
                        }

                        controller.sendBulkWhatsapp(
                          targetGroups: selectedRecipients,
                          messageType: selectedType,
                          messageText: messageController.text.trim(),
                        );
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("تأكيد وإرسال", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openBulkWhatsappSheet(context),
        backgroundColor: const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.chat_bubble_outline_rounded),
        label: const Text("إرسال رسالة جماعية", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final students = controller.filteredStudents;
            final stateVal = controller.state.value;

            return ListView(
              children: [
                const SizedBox(height: 16),

                // Top app bar / Header
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "إدارة الطلاب",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "إدارة حسابات الطلاب، وتتبع نشاطهم واشتراكاتهم والدرجات الحاصلين عليها.",
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
                const SizedBox(height: 14),

                // Top Quick Actions Buttons
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _openRegistrationDialog(context),
                        icon: const Icon(Icons.person_add, size: 18),
                        label: const Text("تسجيل طالب جديد", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: () => _openChatbotSettings(context),
                        icon: const Icon(Icons.smart_toy_outlined, size: 18),
                        label: const Text("التقارير التلقائية", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF7C3AED),
                          side: const BorderSide(color: Color(0xFF7C3AED)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Search Field
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    onChanged: controller.setStudentQuery,
                    decoration: InputDecoration(
                      hintText: "ابحث باسم الطالب أو رقم الهاتف أو الكود...",
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

                // Filters Menu Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterDropdown(
                          label: "الدفعة",
                          value: stateVal.selectedStudentBatch,
                          items: const ["الكل", "Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"],
                          onChanged: (val) => controller.setStudentBatch(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الصف الدراسي",
                          value: stateVal.selectedStudentGrade,
                          items: const ["الكل", "الصف الأول الثانوي", "الصف الثاني الثانوي", "الصف الثالث الثانوي"],
                          onChanged: (val) => controller.setStudentGrade(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "السنة الدراسية",
                          value: stateVal.selectedStudentYear,
                          items: const ["الكل", "2025/2026", "2026/2027"],
                          onChanged: (val) => controller.setStudentYear(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الحالة",
                          value: stateVal.selectedStudentStatus,
                          items: const ["الكل", "نشط", "موقوف"],
                          onChanged: (val) => controller.setStudentStatus(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الاشتراك",
                          value: stateVal.selectedStudentSub,
                          items: const ["الكل", "نشط", "منتهي", "غير مشترك"],
                          onChanged: (val) => controller.setStudentSub(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "حضور الطالب",
                          value: stateVal.selectedStudentAttendance,
                          items: const ["الكل", "ممتاز", "مقبول", "ضعيف"],
                          onChanged: (val) => controller.setStudentAttendance(val ?? "الكل"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Statistics Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatCard("إجمالي الطلاب", "${controller.totalStudents}", Icons.groups_outlined, const Color(0xFF2563EB)),
                        const SizedBox(width: 8),
                        _buildStatCard("الطلاب النشطين", "${controller.activeStudents}", Icons.person_outline_rounded, Colors.green),
                        const SizedBox(width: 8),
                        _buildStatCard("الاشتراكات المنتهية", "${controller.expiredSubStudents}", Icons.credit_card_off_outlined, Colors.red),
                        const SizedBox(width: 8),
                        _buildStatCard("عدد الدفعات", "${controller.totalBatches}", Icons.class_outlined, const Color(0xFF7C3AED)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Students List of Cards
                ...students.map((student) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: student.isActive ? Colors.white : Colors.grey.shade100,
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
                                // Photo
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: const Color(0xFF2563EB).withValues(alpha: 0.1),
                                  child: const Text("👨‍🎓", style: TextStyle(fontSize: 24)),
                                ),
                                const SizedBox(width: 14),

                                // Name and Grade
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        student.fullName,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "كود: ${student.id} • ${student.grade} (${student.batch})",
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                ),

                                // Status Pill
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: student.isActive
                                        ? Colors.green.withValues(alpha: 0.1)
                                        : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    student.isActive ? "نشط" : "موقوف",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: student.isActive ? Colors.green : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 1, color: Color(0xFFE2E8F0)),
                            const SizedBox(height: 12),

                            // Contacts & Scores Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("هاتف الطالب: ${student.phone}", style: const TextStyle(fontSize: 12, color: Color(0xFF334155))),
                                    const SizedBox(height: 4),
                                    Text("هاتف ولي الأمر: ${student.parentPhone}", style: const TextStyle(fontSize: 12, color: Color(0xFF334155))),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("الاشتراك: ${student.subscriptionStatus}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: student.subscriptionStatus == "نشط" ? Colors.green : Colors.red)),
                                    const SizedBox(height: 4),
                                    Text(
                                      "نسبة الحضور: ${student.attendanceRate}% • آخر اختبار: ${student.latestExamScore}",
                                      style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),

                            // Action buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
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
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                    side: const BorderSide(color: Color(0xFF64748B)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("تعديل", style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                PopupMenuButton<String>(
                                  onSelected: (val) {
                                    if (val == "toggle") controller.toggleStudentStatus(student);
                                    if (val == "delete") controller.deleteStudent(student);
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: "toggle",
                                      child: Row(
                                        children: [
                                          Icon(student.isActive ? Icons.block : Icons.check_circle, size: 18),
                                          const SizedBox(width: 8),
                                          Text(student.isActive ? "إيقاف الحساب" : "تفعيل الحساب"),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "delete",
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete_outline, color: Colors.red, size: 18),
                                          SizedBox(width: 8),
                                          Text("حذف الطالب", style: TextStyle(color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                  ],
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xFFE2E8F0)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text("المزيد", style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => Get.to(() => StudentDetailsScreen(student: student)),
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

                const SizedBox(height: 80), // FAB spacing
              ],
            );
          }),
        ),
      ),
    );
  }
}
