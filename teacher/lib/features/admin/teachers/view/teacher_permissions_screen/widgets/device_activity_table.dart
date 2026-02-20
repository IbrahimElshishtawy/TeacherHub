import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceActivityTable extends StatelessWidget {
  const DeviceActivityTable({super.key});

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
            isLogout: true, // No logout action for this row
          ),
          _buildDeviceRow(
            'تسجيل خروج',
            '1-12-2025 10:30 AM',
            'Realme 14',
            'Android',
            isLogout: true, // This row will have logout functionality
          ),
          _buildDeviceRow(
            'تسجيل دخول',
            '1-1-2026 10:30 AM',
            'Dell Vostro',
            'Laptop',
            isLogout: true, // No logout action for this row
          ),
        ],
      ),
    );
  }

  TableRow _buildDeviceRow(
    String action,
    String date,
    String device,
    String deviceType, {
    bool isLogout =
        false, // Optional parameter to determine if it's a logout action
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: isLogout
                ? _logout
                : null, // Trigger the logout action if isLogout is true
            child: Text(
              isLogout ? 'تسجيل خروج' : 'إجراء',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isLogout
                    ? Colors.blue
                    : Color(0xFF6B7C93), // Blue for logout
              ),
            ),
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

  // Function to perform the logout action
  void _logout() {
    // Handle the logout action, for example:
    if (kDebugMode) {
      print("Logging out...");
    }

    // Implement actual logout functionality here, like updating user state, etc.
    // For example, navigate to login screen or change the authentication state
  }
}

class DeviceActivityCard extends StatelessWidget {
  const DeviceActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'الأجهزة والنشاط',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2A3B),
            ),
          ),
          const SizedBox(height: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [DeviceActivityTable()],
          ),
          const SizedBox(height: 7),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              'محاولة تسجيل الدخول من جهاز غير معروف مدرسياً.\n',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: Text(
              'نوع المستخدم: طالب / غير معروف\n'
              'نوع الجهاز: iPhone\n'
              'وقت محاولة التسجيل: 3:10AM 2/1/2026\n'
              'ID: 123456',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
