// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SubjectTableWidget extends StatelessWidget {
  const SubjectTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            // Header Text
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'المواد الدراسية',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نظرة عامة على أداء كل مادة وعدد الطلاب والواجبات',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Divider(),
            const SizedBox(height: 8),
            // Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowHeight: 30, // Increased row height for better spacing
                headingRowHeight: 30, // Increased heading row height
                horizontalMargin: 10, // More margin for cleaner cells
                columnSpacing: 10, // Wider space between columns
                headingTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                columns: const [
                  DataColumn(
                    label: Center(
                      child: Text(
                        'اسم المادة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'عدد الطلاب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'الاختبارات',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'عدد الحصص',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text(
                        'الملغي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('الكيمياء'))),
                      DataCell(Center(child: Text('50'))),
                      DataCell(Center(child: Text('20'))),
                      DataCell(Center(child: Text('320'))),
                      DataCell(
                        Center(child: Text('1')),
                      ), // Example for "Not canceled"
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('علوم'))),
                      DataCell(Center(child: Text('35'))),
                      DataCell(Center(child: Text('16'))),
                      DataCell(Center(child: Text('450'))),
                      DataCell(
                        Center(child: Text('5')),
                      ), // Example for "Canceled"
                    ],
                  ),
                  // Additional row for demonstration
                  DataRow(
                    cells: [
                      DataCell(Center(child: Text('الرياضيات'))),
                      DataCell(Center(child: Text('60'))),
                      DataCell(Center(child: Text('30'))),
                      DataCell(Center(child: Text('500'))),
                      DataCell(
                        Center(child: Text('3')),
                      ), // Example for "Not canceled"
                    ],
                  ),
                ],
                border: TableBorder.all(
                  color: Colors.grey, // Color for the borders
                  width: 1, // Border width
                  style: BorderStyle.solid, // Solid border style
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
