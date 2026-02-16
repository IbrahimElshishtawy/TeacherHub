import 'package:flutter/material.dart';

class DeviceActivityTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
          width: 1,
        ),
        columnWidths: const {
          0: FixedColumnWidth(100.0),
          1: FixedColumnWidth(150.0),
          2: FixedColumnWidth(100.0),
          3: FixedColumnWidth(80.0),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'الإجراء',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2A3B),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'آخر دخول',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2A3B),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'اسم الجهاز',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2A3B),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'نوع الجهاز',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2A3B),
                  ),
                ),
              ),
            ],
          ),
          _buildDeviceRow(
            'تسجيل دخول',
            '18-1-2026 10:30 AM',
            'Iphone Xs',
            'iPhone',
          ),
          _buildDeviceRow(
            'تسجيل خروج',
            '1-12-2025 10:30 AM',
            'Realme 14',
            'Android',
          ),
          _buildDeviceRow(
            'تسجيل دخول',
            '1-1-2026 10:30 AM',
            'Dell Vostro',
            'Laptop',
          ),
        ],
      ),
    );
  }

  TableRow _buildDeviceRow(
    String action,
    String date,
    String device,
    String deviceType,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            action,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            device,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            deviceType,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
          ),
        ),
      ],
    );
  }
}
