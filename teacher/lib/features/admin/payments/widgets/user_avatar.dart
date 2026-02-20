import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String fullName;
  final String avatarUrl;
  const UserAvatar({
    super.key,
    required this.fullName,
    required this.avatarUrl,
  });

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r"\s+"));
    if (parts.isEmpty) return "?";
    final first = parts.first.isNotEmpty ? parts.first[0] : "?";
    final second = parts.length > 1 && parts[1].isNotEmpty ? parts[1][0] : "";
    return (first + second).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: const Color(0xFFEAF0FF),
      backgroundImage: avatarUrl.isEmpty ? null : NetworkImage(avatarUrl),
      child: avatarUrl.isEmpty
          ? Text(
              _initials(fullName),
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFF2F6BFF),
              ),
            )
          : null,
    );
  }
}
