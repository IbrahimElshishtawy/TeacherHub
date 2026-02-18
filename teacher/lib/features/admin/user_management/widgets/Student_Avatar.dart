
import 'package:flutter/material.dart';

class StudentAvatar extends StatelessWidget {
  final String fullName;
  final String avatarUrl;

  const StudentAvatar({
    required this.fullName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final initial = fullName.trim().isNotEmpty ? fullName.trim()[0] : "?";

    return CircleAvatar(
      radius: 18,
      backgroundColor: const Color(0xFFE6E8F0),
      backgroundImage: (avatarUrl.trim().isNotEmpty)
          ? NetworkImage(avatarUrl.trim())
          : null,
      child: (avatarUrl.trim().isEmpty)
          ? Text(
              initial,
              style: const TextStyle(fontWeight: FontWeight.w900),
            )
          : null,
    );
  }
}
