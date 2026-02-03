// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AdminDrawerHeader extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onAvatarTap;
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
            top: 12,
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
            top: 10,
            child: InkWell(
              onTap: onAvatarTap,
              borderRadius: BorderRadius.circular(999),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white.withOpacity(0.10),
                backgroundImage:
                    (avatarUrl != null && avatarUrl!.trim().isNotEmpty)
                    ? NetworkImage(avatarUrl!)
                    : null,
                child: (avatarUrl == null || avatarUrl!.trim().isEmpty)
                    ? Icon(Icons.person, color: Colors.white.withOpacity(0.9))
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
