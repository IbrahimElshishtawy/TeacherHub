import 'package:flutter/material.dart';

class PaymentStatusSection extends StatelessWidget {
  const PaymentStatusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "المدفوعات",
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Row for status cards
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusCard(
                      title: 'الجديدة',
                      count: '5',
                      color: Colors.blue,
                      icon: Icons.refresh_outlined,
                    ),
                    StatusCard(
                      title: 'الفاشلة',
                      count: '5',
                      color: Colors.red,
                      icon: Icons.cancel_outlined,
                    ),
                    StatusCard(
                      title: 'المعلقة',
                      count: '37',
                      color: Colors.amber,
                      icon: Icons.access_time_outlined,
                    ),
                    StatusCard(
                      title: 'الناجحة',
                      count: '1245',
                      color: Colors.green,
                      icon: Icons.check_circle_outline,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Implement your "عرض المزيد" functionality here
                  },
                  child: const Text(
                    'عرض المزيد',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Display more button
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData icon;

  const StatusCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              Icon(icon, color: color, size: 35),
              const SizedBox(height: 5),
              Text(count, style: TextStyle(color: Colors.black, fontSize: 20)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
