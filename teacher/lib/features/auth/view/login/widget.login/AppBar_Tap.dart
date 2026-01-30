// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/widget.login/Left_Arrow_Painter.dart'; // تأكد من المسار الصحيح

class AppbarTap extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTap({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white10,
      leading: IconButton(
        icon: CustomPaint(size: Size(30, 30), painter: LeftArrowPainter()),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
