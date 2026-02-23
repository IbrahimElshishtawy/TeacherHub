// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Events Calendar Card (Single File Widget)
/// - نفس شكل الديزاين في الصورة
/// - RTL
/// - شهر + تقويم + أيام مميزة + سهمين + Legend + زر إضافة
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

  /// اسم الشهر المعروض (زي March)
  final String? initialMonth;

  /// أزرار تنقل (اختياري)
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  /// زر إضافة موعد
  final VoidCallback? onAddNew;

  /// الأيام اللي عليها اختيار/Highlight أزرق
  final Set<int> selectedDays;

  /// أيام أصفر (مراجعة شاملة)
  final Set<int> yellowDays;

  /// أيام رمادي (مراجعة)
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
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _bg,
          borderRadius: BorderRadius.circular(14),
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
            // Title
            const Text(
              "جدول الأحداث",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),

            // Month chip
            _MonthChip(text: month),
            const SizedBox(height: 10),

            // Weekday header + grid
            _CalendarGrid(
              selectedDays: widget.selectedDays,
              yellowDays: widget.yellowDays,
              disabledDays: widget.disabledDays,
            ),

            const SizedBox(height: 12),

            // Prev/Next arrows row
            Row(
              children: [
                _NavButton(
                  icon: Icons.keyboard_double_arrow_left_rounded,
                  onTap: widget.onPrev ?? () {},
                ),
                const Spacer(),
                _NavButton(
                  icon: Icons.keyboard_double_arrow_right_rounded,
                  onTap: widget.onNext ?? () {},
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Legend
            Wrap(
              spacing: 14,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                _LegendItem(color: _blue, text: "الحصص اليومية"),
                _LegendItem(color: _gray, text: "امتحان شامل"),
                _LegendItem(
                  color: _yellow,
                  text: "مراجعة شاملة للأحياء للحضور",
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Add new button
            SizedBox(
              height: 44,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: widget.onAddNew ?? () {},
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

// ============================
// Month Chip
// ============================
class _MonthChip extends StatelessWidget {
  final String text;
  const _MonthChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 12.5,
        ),
      ),
    );
  }
}

// ============================
// Calendar Grid
// ============================
class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({
    required this.selectedDays,
    required this.yellowDays,
    required this.disabledDays,
  });

  final Set<int> selectedDays;
  final Set<int> yellowDays;
  final Set<int> disabledDays;

  static const Color _blue = Color(0xFF2F6BFF);
  static const Color _yellow = Color(0xFFF4B400);
  static const Color _gray = Color(0xFF5B667A);
  static const Color _muted = Color(0xFF8A93A3);

  @override
  Widget build(BuildContext context) {
    // زي الصورة: Mo Tu We Th Fr Sa Su
    final week = const ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

    // عملت توزيع قريب من شكل الصورة (مش تقويم حقيقي)
    // Rows:
    // 23 24 25 26 27 28 1
    // 2  3  4  5  6  7  8
    // 9 10 11 12 13 14 15
    // 16 17 18 19 20 21 22
    // 23 24 25 26 27 28 29
    // 30 31  1  2  3  4  5  (هنعرض أول 2 بس ونخلي الباقي فاضي/خفيف)
    final cells = <_DayCell>[
      const _DayCell(value: 23, faint: true),
      const _DayCell(value: 24, faint: true),
      const _DayCell(value: 25, faint: true),
      const _DayCell(value: 26, faint: true),
      const _DayCell(value: 27, faint: true),
      const _DayCell(value: 28, faint: true),
      const _DayCell(value: 1, isBlue: true),

      const _DayCell(value: 2),
      const _DayCell(value: 3),
      const _DayCell(value: 4, isBlue: true),
      const _DayCell(value: 5),
      const _DayCell(value: 6),
      const _DayCell(value: 7),
      const _DayCell(value: 8, isBlue: true),

      const _DayCell(value: 9),
      const _DayCell(value: 10),
      const _DayCell(value: 11, isBlue: true),
      const _DayCell(value: 12),
      const _DayCell(value: 13),
      const _DayCell(value: 14),
      const _DayCell(value: 15, isBlue: true),

      const _DayCell(value: 16),
      const _DayCell(value: 17),
      const _DayCell(value: 18),
      const _DayCell(value: 19),
      const _DayCell(value: 20),
      const _DayCell(value: 21),
      const _DayCell(value: 22, isBlue: true),

      const _DayCell(value: 23),
      const _DayCell(value: 24, faint: true),
      const _DayCell(value: 25, isBlue: true),
      const _DayCell(value: 26, faint: true),
      const _DayCell(value: 27, faint: true),
      const _DayCell(value: 28, faint: true),
      const _DayCell(value: 29, faint: true),

      const _DayCell(value: 30, isYellow: true),
      const _DayCell(value: 31),
      const _DayCell(value: 1, faint: true),
      const _DayCell(value: 2, faint: true),
      const _DayCell(value: 3, faint: true),
      const _DayCell(value: 4, faint: true),
      const _DayCell(value: 5, faint: true),
    ];

    // Override حسب اللي جاي من widget (لو عايز تتحكم ديناميكيًا)
    final mapped = cells.map((c) {
      final v = c.value;
      final isBlue = selectedDays.contains(v);
      final isYellow = yellowDays.contains(v);
      final isGray = disabledDays.contains(v);

      // لو اليوم أصلاً faint نخليه كما هو في النص
      return c.copyWith(isBlue: isBlue, isYellow: isYellow, isGray: isGray);
    }).toList();

    return Column(
      children: [
        // Week header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: week.map((w) {
            return SizedBox(
              width: 34,
              child: Text(
                w,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: _muted,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),

        // 6 rows x 7 cols
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mapped.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final d = mapped[index];

            Color? bg;
            Color fg = const Color(0xFF1E2A3B);

            if (d.isBlue) {
              bg = _blue;
              fg = Colors.white;
            } else if (d.isYellow) {
              bg = _yellow;
              fg = const Color(0xFF1E2A3B);
            } else if (d.isGray) {
              bg = _gray.withOpacity(0.14);
              fg = _gray;
            } else if (d.faint) {
              fg = _muted;
            }

            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "${d.value}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: fg,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DayCell {
  final int value;
  final bool faint;
  final bool isBlue;
  final bool isYellow;
  final bool isGray;

  const _DayCell({
    required this.value,
    this.faint = false,
    this.isBlue = false,
    this.isYellow = false,
    this.isGray = false,
  });

  _DayCell copyWith({bool? faint, bool? isBlue, bool? isYellow, bool? isGray}) {
    return _DayCell(
      value: value,
      faint: faint ?? this.faint,
      isBlue: isBlue ?? this.isBlue,
      isYellow: isYellow ?? this.isYellow,
      isGray: isGray ?? this.isGray,
    );
  }
}

// ============================
// Nav Button
// ============================
class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _NavButton({required this.icon, required this.onTap});

  static const Color _blue = Color(0xFF2F6BFF);
  static const Color _border = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 38,
        height: 32,
        decoration: BoxDecoration(
          color: _blue.withOpacity(0.10),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _border),
        ),
        child: Icon(icon, color: _blue, size: 18),
      ),
    );
  }
}

// ============================
// Legend
// ============================
class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E2A3B),
          ),
        ),
      ],
    );
  }
}
