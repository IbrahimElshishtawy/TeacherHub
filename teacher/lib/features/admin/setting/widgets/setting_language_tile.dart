import 'package:flutter/material.dart';
import 'package:teacher/features/admin/setting/widgets/setting_tile.dart';

class SettingLanguageTile extends StatelessWidget {
  final String valueText;
  final VoidCallback onTap;

  const SettingLanguageTile({
    super.key,
    required this.valueText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: "اللغة",
      icon: Icons.language_rounded,
      iconColor: const Color(0xFF2F6BFF),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            valueText,
            style: const TextStyle(
              color: Color(0xFF2F6BFF),
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
            color: Color(0xFF2F6BFF),
          ),
        ],
      ),
    );
  }
}
