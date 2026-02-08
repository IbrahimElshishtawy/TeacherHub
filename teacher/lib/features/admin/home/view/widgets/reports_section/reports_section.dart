import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/reports_State_Card.dart';

class ReportsStatisticsSection extends StatelessWidget {
  const ReportsStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title outside of the card
          Text(
            "التقارير والإحصائيات",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          // Card containing statistics and button
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cards for different statistics
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Center align the cards
                    children: [
                      StatCard(
                        title: 'مستويات',
                        value: 'عدد الطلاب \nحسب السنة',
                        subtitle: 'عرض الكل',
                        color: Colors.orange,
                        icon: Icons.timeline,
                      ),
                      // Reduced space between cards
                      StatCard(
                        title: 'التسجيل',
                        value: '600 طالب',
                        subtitle: 'عرض كل المواد',
                        color: Colors.green,
                        icon: Icons.school,
                      ),
                      // Reduced space between cards
                      StatCard(
                        title: 'الدرجات',
                        value: '82%',
                        subtitle: 'عرض كل المواد',
                        color: Colors.purple,
                        icon: Icons.grade,
                      ),
                      // Reduced space between cards
                      StatCard(
                        title: 'الحضور',
                        value: '930/1000',
                        subtitle: '70 طالب غائب',
                        color: Colors.blue,
                        icon: Icons.calendar_today,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  // Button at the bottom of the card
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your "عرض كرس مجاني" functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'عرض كرسم بياني',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
