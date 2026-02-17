import 'package:flutter/material.dart';

class BottomNavigationButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int, String, String) onSelect;

  const BottomNavigationButtons({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSelect(0, 'login', 'نشاط المدرس الأسبوعي');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              backgroundColor: selectedIndex == 0 ? Colors.blue : Colors.grey,
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            child: Text(
              'تسجيل الدخول',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSelect(1, 'cancelledClasses', 'الحصص الملغية');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              backgroundColor: selectedIndex == 1 ? Colors.blue : Colors.grey,
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            child: Text(
              'الحصص الملغية',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSelect(2, 'paidCourses', 'الكورسات المدفوعة');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              backgroundColor: selectedIndex == 2 ? Colors.blue : Colors.grey,
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            child: Text(
              'الكورسات المدفوعة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
