// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/TabChip.dart';

class CenterDialogShell extends StatelessWidget {
  final String title;
  final List<String> tabs;
  final int activeIndex;
  final VoidCallback onTapTab0;
  final VoidCallback onTapTab1;
  final Widget child;

  const CenterDialogShell({
    super.key,
    required this.title,
    required this.tabs,
    required this.activeIndex,
    required this.onTapTab0,
    required this.onTapTab1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF3A3A3A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row (X + Title)
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1F1F1F),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 22),
                  ],
                ),
                const SizedBox(height: 10),

                // Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabChip(
                      text: tabs[0],
                      isActive: activeIndex == 0,
                      onTap: onTapTab0,
                    ),
                    const SizedBox(width: 10),
                    TabChip(
                      text: tabs[1],
                      isActive: activeIndex == 1,
                      onTap: onTapTab1,
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
