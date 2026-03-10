import 'package:flutter/material.dart';

import 'saved_items_tokens.dart';

class SavedItemsSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SavedItemsSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: SavedItemsTokens.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              onChanged: onChanged,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                hintText: 'ابحث عن كل ما تريد مثل كورس او شئ معين',
                hintStyle: TextStyle(fontSize: 18, color: Color(0xFFAEAEAE)),
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: Color(0xFFAEAEAE),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 36,
          height: 38,
          decoration: BoxDecoration(
            color: SavedItemsTokens.blue,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.filter_alt_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
