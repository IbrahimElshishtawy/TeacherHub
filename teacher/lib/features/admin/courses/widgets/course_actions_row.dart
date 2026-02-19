import 'package:flutter/material.dart';

class CourseActionsRow extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onChangeStatus;
  final VoidCallback onPreview;

  const CourseActionsRow({
    super.key,
    required this.onEdit,
    required this.onChangeStatus,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onEdit,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE6E8F0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              "تعديل بيانات الكورس",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12.5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: onChangeStatus,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE6E8F0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              "تغيير حالة الكورس",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12.5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: onPreview,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE6E8F0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              "معاينة الكورس",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12.5),
            ),
          ),
        ),
      ],
    );
  }
}
