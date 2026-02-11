// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets/AppBar_widget/widget/profile_avatar_button.dart';

class AdminDrawerHeader extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onAvatarTap; // هنا يبقى يمكن أن يكون null
  final String? avatarUrl;

  const AdminDrawerHeader({
    super.key,
    required this.onClose,
    this.onAvatarTap,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 16,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  width: 44,
                  height: 44,
                  child: Center(child: Icon(Icons.close_rounded, size: 22)),
                ),
              ),
            ),
          ),

          Positioned(
            right: 16,
            bottom: 16,
            child: InkWell(
              onTap: onAvatarTap ?? () {},
              borderRadius: BorderRadius.circular(999),
              child: ProfileAvatarButton(
                onTap: onAvatarTap ?? () {},
                avatarUrl: avatarUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
