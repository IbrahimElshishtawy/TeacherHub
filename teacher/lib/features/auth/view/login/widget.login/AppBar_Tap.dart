// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppbarTap extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTap({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(247, 255, 255, 255),
      shadowColor: Colors.white10,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color.fromARGB(255, 141, 34, 26),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
