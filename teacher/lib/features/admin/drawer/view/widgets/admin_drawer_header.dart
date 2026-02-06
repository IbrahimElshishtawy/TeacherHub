// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/AppBar_widget/widget/profile_avatar_button.dart';

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
          // Close button on the left (تم تغييره ليكون في الأسفل)
          Positioned(
            left: 16,
            bottom: 16, // تم تعديل الـ top إلى bottom بحيث يكون في الأسفل
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

          // Avatar button on the right (تم تغييره ليكون في الأسفل)
          Positioned(
            right: 16,
            bottom: 16, // تم تعديل الـ top إلى bottom بحيث يكون في الأسفل
            child: InkWell(
              onTap:
                  onAvatarTap ??
                  () {}, // إذا كان onAvatarTap null، يستدعي وظيفة فارغة
              borderRadius: BorderRadius.circular(999),
              child: ProfileAvatarButton(
                onTap: onAvatarTap ?? () {}, // نفس الشيء هنا إذا كان null
                avatarUrl: avatarUrl, // تأكد من تمرير الصورة هنا لو موجودة
              ),
            ),
          ),
        ],
      ),
    );
  }
}
