// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/models/perm_item.dart';
import 'permissions_colors.dart';
import 'permission_row.dart';

class PermissionsSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<PermItem> items;

  final Map<String, bool> values;
  final void Function(String key, bool value) onChanged;

  const PermissionsSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PermColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, size: 18, color: PermColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: PermColors.titleColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: PermColors.cardBorder),
          const SizedBox(height: 6),
          ...items.map((e) {
            final val = values[e.keyName] ?? false;
            return PermissionRow(
              title: e.title,
              value: val,
              onChanged: (v) => onChanged(e.keyName, v),
            );
          }).toList(),
        ],
      ),
    );
  }
}
