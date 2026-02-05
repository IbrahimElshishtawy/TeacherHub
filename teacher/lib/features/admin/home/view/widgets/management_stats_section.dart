import 'package:flutter/material.dart';

class ManagementStatsSection extends StatelessWidget {
  final List<StatItem> stats = [
    StatItem(title: "عدد الطلاب", value: 1506, color: Colors.blue),
    StatItem(title: "عدد أولياء الأمور", value: 950, color: Colors.brown),
    StatItem(title: "عدد الكورسات", value: 50, color: Colors.green),
    StatItem(title: "متوسط الدفع", value: 300, color: Colors.blueAccent),
    StatItem(title: "الأجهزة المسجلة", value: 1953, color: Colors.green),
    StatItem(title: "الطلبات الجديدة", value: 22, color: Colors.orange),
    StatItem(title: "الأجهزة المجمدة", value: 0, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الإحصائيات
          Text(
            "إحصائيات الإدارة",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          // عرض الإحصائيات
          ...stats.map((stat) => StatProgressItem(stat: stat)),
          SizedBox(height: 20),
          // عرض الشهور مع التمرير
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var month in [
                  'يناير',
                  'فبراير',
                  'مارس',
                  'أبريل',
                  'مايو',
                  'يونيو',
                  'يوليو',
                ])
                  MonthSelector(month: month),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatItem {
  final String title;
  final int value;
  final Color color;

  StatItem({required this.title, required this.value, required this.color});
}

class StatProgressItem extends StatelessWidget {
  final StatItem stat;

  const StatProgressItem({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // عرض الإحصائيات مع الشريط
          Expanded(
            child: Container(
              height: 15,
              decoration: BoxDecoration(
                color: const Color.fromARGB(151, 238, 238, 238),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  // الشريط الذي يعكس القيمة مع جعل الشريط شفافًا
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor:
                        stat.value / 5000, // تعديل لتحديد الحجم المناسب
                    child: Container(
                      decoration: BoxDecoration(
                        color: stat.color.withOpacity(0.7), // جعل اللون شفافًا
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  // الرقم داخل الشريط الملون
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        stat.value.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(
                            255,
                            102,
                            100,
                            100,
                          ), // الرقم داخل الشريط الملون
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          // النص الذي يصف الإحصائية
          Expanded(
            child: Text(
              stat.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MonthSelector extends StatelessWidget {
  final String month;

  const MonthSelector({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          month,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
