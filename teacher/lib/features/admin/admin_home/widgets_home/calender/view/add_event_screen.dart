// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/calender/view/widgets/event_type_tabs.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);
  static const Color blue = Color(0xFF2F6BFF);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  EventType selectedType = EventType.dailyClass;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String get _dateText {
    if (selectedDate == null) return "اليوم / الشهر / السنة";
    final d = selectedDate!;
    return "${d.year} / ${d.month.toString().padLeft(2, '0')} / ${d.day.toString().padLeft(2, '0')}";
  }

  String get _timeText {
    if (selectedTime == null) return "الدقائق / الساعات";
    final t = selectedTime!;
    final hh = t.hour.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    return "$hh:$mm";
  }

  Color get _typeColor {
    switch (selectedType) {
      case EventType.dailyClass:
        return const Color(0xFF2F6BFF); // أزرق
      case EventType.fullExam:
        return const Color(0xFF5B667A); // رمادي
      case EventType.fullReview:
        return const Color(0xFFF4B400); // أصفر
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 3),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AddEventScreen.blue,
              primary: AddEventScreen.blue,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AddEventScreen.blue,
              primary: AddEventScreen.blue,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _save() {
    if (selectedDate == null || selectedTime == null) {
      Get.snackbar(
        "تنبيه",
        "اختار التاريخ والوقت الأول",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.75),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    // هنا تقدر تبعت البيانات للكنترولر أو ترجعها للصفحة السابقة
    // مثال: Get.back(result: {...});
    Get.back(
      result: {
        "type": selectedType.name,
        "date": selectedDate!.toIso8601String(),
        "time": "${selectedTime!.hour}:${selectedTime!.minute}",
      },
    );

    Get.snackbar(
      "تم",
      "تم حفظ الموعد",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF19B66A).withOpacity(0.95),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AddEventScreen.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 6),

              // Back
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 28),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                "إضافة حدث جديد",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 6),
              const Text(
                "قم بتحديد نوع الموعد وتفاصيله لإضافته إلى جدول الأحداث العام.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 14),

              // Types Tabs
              EventTypeTabs(
                value: selectedType,
                onChanged: (t) => setState(() => selectedType = t),
              ),

              const SizedBox(height: 14),

              // Date label + field
              const _FieldLabel(
                title: "تاريخ الموعد",
                subtitle: "حدد اليوم المخصص لهذا الحدث على الجدول",
              ),
              const SizedBox(height: 8),
              _PickerField(
                icon: Icons.calendar_month_outlined,
                valueText: _dateText,
                accent: _typeColor,
                onTap: _pickDate,
              ),

              const SizedBox(height: 16),

              // Time label + field
              const _FieldLabel(
                title: "وقت الموعد",
                subtitle: "حدد ساعة البداية الخاصة بهذا الحدث",
              ),
              const SizedBox(height: 8),
              _PickerField(
                icon: Icons.access_time_rounded,
                valueText: _timeText,
                accent: _typeColor,
                onTap: _pickTime,
              ),

              const SizedBox(height: 18),

              // Save
              SizedBox(
                height: 45,
                width: 180,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AddEventScreen.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "حفظ ونشر الموعد",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================
// UI pieces
// ==========================

class _FieldLabel extends StatelessWidget {
  final String title;
  final String subtitle;
  const _FieldLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

class _PickerField extends StatelessWidget {
  final IconData icon;
  final String valueText;
  final VoidCallback onTap;
  final Color accent;

  const _PickerField({
    required this.icon,
    required this.valueText,
    required this.onTap,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
            Icon(icon, color: accent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                valueText,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF1E2A3B).withOpacity(0.85),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
