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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'تقدمك في الكورسات المدفوعة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          const Text(
            'نسبة التقدم في الدورات التي\nقمت بفتحها والاشتراك بها',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF7B8598),
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              const Icon(
                Icons.local_fire_department,
                size: 18,
                color: Color(0xFFFF7A00),
              ),
              const SizedBox(width: 6),
              Text(
                '${(progress * 100).toInt()}% مكتمل',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2F6FED),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          const OverviewProgressBar(value: progress),
          const SizedBox(height: 12),

          const Divider(height: 1, color: Color(0xFFE9EDF5)),
          const SizedBox(height: 10),

          const Text(
            'لقد قمت بإنهاء 3 كورسات حتى الآن',
            style: TextStyle(
              fontSize: 12.5,
              color: Color(0xFF2F6FED),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),

          // bottom row like screenshot
          Row(
            children: [
              Expanded(
                child: OverviewPrimaryButton(
                  text: 'استكمال آخر كورس',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _LightBox(
                  child: const Text(
                    'آخر كورس\n"الباب الأول - كيمياء"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.5,
                      height: 1.25,
                      color: Color(0xFF2D3A55),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),

          const Text(
            'تمت المشاهدة من 3 ساعات',
            style: TextStyle(
              fontSize: 11,
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9EDF5)),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9EDF5)),
      ),
      child: child,
    );
  }
}
