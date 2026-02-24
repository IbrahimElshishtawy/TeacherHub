// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:teacher/features/admin/home/widgets_home/calender/view/add_event_screen.dart';

import 'calendar_grid.dart';
import 'legend_item.dart';
import 'month_chip.dart';
import 'nav_button.dart';

class EventsCalendarCard extends StatefulWidget {
  const EventsCalendarCard({
    super.key,
    this.initialMonth,
    this.onPrev,
    this.onNext,
    this.onAddNew,
    this.selectedDays = const {4, 11, 25},
    this.yellowDays = const {30},
    this.disabledDays = const {24, 26, 27, 28, 29},
  });

  final String? initialMonth;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final VoidCallback? onAddNew;

  final Set<int> selectedDays;
  final Set<int> yellowDays;
  final Set<int> disabledDays;

  @override
  State<EventsCalendarCard> createState() => _EventsCalendarCardState();
}

class _EventsCalendarCardState extends State<EventsCalendarCard> {
  static const Color _border = Color(0xFFE6E8F0);
  static const Color _bg = Colors.white;

  static const Color _blue = Color(0xFF2F6BFF);
  static const Color _yellow = Color(0xFFF4B400);
  static const Color _gray = Color(0xFF5B667A);

  late String month;

  @override
  void initState() {
    super.initState();
    month = widget.initialMonth ?? "March";
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _bg,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: _border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "جدول الأحداث",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),

            MonthChip(text: month),
            const SizedBox(height: 10),

            CalendarGrid(
              selectedDays: widget.selectedDays,
              yellowDays: widget.yellowDays,
              disabledDays: widget.disabledDays,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                NavButton(
                  icon: Icons.keyboard_double_arrow_left_rounded,
                  onTap: widget.onPrev ?? () {},
                ),
                const Spacer(),
                NavButton(
                  icon: Icons.keyboard_double_arrow_right_rounded,
                  onTap: widget.onNext ?? () {},
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Wrap(
              spacing: 14,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                LegendItem(color: _blue, text: "الحصص اليومية"),
                LegendItem(color: _gray, text: "امتحان شامل"),
                LegendItem(color: _yellow, text: "مراجعة شاملة للأحياء للحضور"),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 44,
              width: 180,
              child: ElevatedButton.icon(
                onPressed:
                    widget.onAddNew ??
                    () async {
                      await Get.to(() => const AddEventScreen());
                    },
                icon: const Icon(Icons.add, size: 20),
                label: const Text(
                  "أضف موعد جديد",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _blue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
