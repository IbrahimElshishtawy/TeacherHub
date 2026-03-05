// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OverviewTestsCard extends StatelessWidget {
  const OverviewTestsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _InnerCardShell(
      child: Column(
        children: [
          Row(
            children: const [
              Spacer(),
              Icon(Icons.emoji_events, color: Color(0xFFFFB300), size: 48),

              Text(
                'الاختبارات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              Spacer(),
            ],
          ),
          Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SmallPanel(
                  title: 'جميع الاختبارات السابقة',
                  items: const [
                    _TestLine(
                      'الباب الثاني - كيمياء',
                      '25/30',
                      Color(0xFF19A974),
                    ),
                    _TestLine(
                      'الباب الثالث - كيمياء',
                      '15/30',
                      Color(0xFFEF4444),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _EmptyPanel(
                  title: 'اختبارات حالياً',
                  subtitle: 'لا يوجد اختبارات حالياً',
                ),
              ),
            ],
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
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SmallPanel extends StatelessWidget {
  const _SmallPanel({required this.title, required this.items});
  final String title;
  final List<_TestLine> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          const SizedBox(height: 10),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      e.title,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D3A55),
                      ),
                    ),
                  ),
                  Text(
                    e.score,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w900,
                      color: e.color,
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

class _EmptyPanel extends StatelessWidget {
  const _EmptyPanel({required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8A94A6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestLine {
  final String title;
  final String score;
  final Color color;
  const _TestLine(this.title, this.score, this.color);
}
