// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppbarTap extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTap({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white10,
      leading: IconButton(
        icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
