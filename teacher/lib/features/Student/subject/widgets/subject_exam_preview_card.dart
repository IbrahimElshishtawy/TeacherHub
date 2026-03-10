import 'package:flutter/material.dart';

import 'subject_tokens.dart';

class SubjectExamPreviewCard extends StatelessWidget {
  const SubjectExamPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SubjectTokens.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SubjectTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(Icons.hourglass_top_rounded, color: Color(0xFFF59E0B)),
              SizedBox(width: 8),
              Text(
                'الامتحانات القادمة',
                style: TextStyle(
                  color: SubjectTokens.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'استعد جيدًا لمواعيد الاختبارات التي ستنزل الفترة الجاية.',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: SubjectTokens.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 140),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F8),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: SubjectTokens.border),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        color: Color(0xFFD0D0D5),
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'لا يوجد اختبارات قادمة أخرى حتى الآن.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: SubjectTokens.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 140),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F8),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: SubjectTokens.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'اختبار على الحموض والقواعد',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF3840A0),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'مدة الاختبار: 30 دقيقة',
                            style: TextStyle(
                              color: SubjectTokens.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: SubjectTokens.textSecondary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'الموعد بعد: 3 ساعات من الآن',
                            style: TextStyle(
                              color: SubjectTokens.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 14,
                            color: SubjectTokens.textSecondary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8FB3FF),
                            disabledBackgroundColor: Color(0xFF8FB3FF),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          child: Text(
                            'يفتح في الموعد المحدد',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
