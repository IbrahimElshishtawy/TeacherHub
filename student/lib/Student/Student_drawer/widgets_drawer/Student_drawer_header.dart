// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/AppBar_widget/widget/profile_avatar_button.dart';

class StudentDrawerHeader extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onAvatarTap; // هنا يبقى يمكن أن يكون null
  final String? avatarUrl;

  const StudentDrawerHeader({
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
