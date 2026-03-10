import 'package:flutter/material.dart';

import '../state/saved_items_state.dart';
import 'saved_items_tokens.dart';

class SavedItemsTabs extends StatelessWidget {
  final SavedItemsTab selectedTab;
  final ValueChanged<SavedItemsTab> onTabChanged;

  const SavedItemsTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TabButton(
            label: 'كورس',
            selected: selectedTab == SavedItemsTab.courses,
            onTap: () => onTabChanged(SavedItemsTab.courses),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TabButton(
            label: 'ملف',
            selected: selectedTab == SavedItemsTab.files,
            onTap: () => onTabChanged(SavedItemsTab.files),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TabButton(
            label: 'اختبار سابق',
            selected: selectedTab == SavedItemsTab.previousTests,
            onTap: () => onTabChanged(SavedItemsTab.previousTests),
          ),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? SavedItemsTokens.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: SavedItemsTokens.blue),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : SavedItemsTokens.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
