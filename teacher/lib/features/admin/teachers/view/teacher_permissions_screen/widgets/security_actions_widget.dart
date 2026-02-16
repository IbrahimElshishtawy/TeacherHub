import 'package:flutter/material.dart';

class SecurityActionsWidget extends StatelessWidget {
  const SecurityActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ), // More rounded corners for a softer look
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 1,
              offset: Offset(4, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.center,
              child: const Text(
                'إجراءات الأمان',
                style: TextStyle(
                  fontSize: 18, // Increased size for better visibility
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2A3B),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'تحذير: هذه الإجراءات حساسة وقد تؤثر بشكل دائم على حساب المدرس.',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7C93)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context, 'حذف الحساب تم!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red, // Make button color red for better contrast
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ), // Padding for a larger clickable area
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded button
                    ),
                  ),
                  child: const Text(
                    'حذف الحساب',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context, 'إيقاف الحساب تم!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .orange, // Make button color orange for better contrast
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: const Text(
                    'إيقاف / تعليق الحساب',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              Colors.blueGrey[800], // Set a background color for the dialog
          title: const Text(
            'إجراء تم!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'موافق',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // Add rounded corners to the dialog
          ),
        );
      },
    );
  }
}
