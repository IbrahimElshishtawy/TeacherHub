// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'overview_primary_button.dart';
import 'overview_progress_bar.dart';

class OverviewProgressCard extends StatelessWidget {
  const OverviewProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    const progress = 0.50;

    return _InnerCardShell(
      child: Column(
        children: [
          // Title and description
          const Text(
            'تقدمك في الكورسات المدفوعة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3A55),
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'نسبة التقدم في الدورات التي\nقمت بفتحها والاشتراك بها',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF7B8598),
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),

          // Progress indicator and percentage
          Row(
            children: [
              Spacer(),
              const Icon(
                Icons.local_fire_department,
                size: 20,
                color: Color(0xFFFF7A00),
              ),
              const SizedBox(width: 8),
              Text(
                '${(progress * 100).toInt()}% مكتمل',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2F6FED),
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 1),

          // Progress bar
          const OverviewProgressBar(value: progress),
          const SizedBox(height: 1),

          // Divider between sections
          const Divider(height: 1, color: Color(0xFFE9EDF5)),
          const SizedBox(height: 1),

          // Text for completed courses
          const Text(
            'لقد قمت بإنهاء 3 كورسات حتى الآن',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2F6FED),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),

          // Bottom section with button and info box
          Row(
            children: [
              Expanded(
                child: OverviewPrimaryButton(
                  text: 'استكمال آخر كورس',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _LightBox(
                  child: const Text(
                    'آخر كورس\n"الباب الأول - كيمياء"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.25,
                      color: Color(0xFF2D3A55),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Text indicating time spent
          const Text(
            'تمت المشاهدة من 3 ساعات',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF8A94A6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InnerCardShell extends StatelessWidget {
  const _InnerCardShell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _LightBox extends StatelessWidget {
  const _LightBox({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
