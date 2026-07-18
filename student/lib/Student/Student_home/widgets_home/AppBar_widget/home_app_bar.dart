// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/AppBar_widget/widget/Menu_Square_Button_appbar.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/AppBar_widget/widget/appbar_greeting_center.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/AppBar_widget/widget/profile_avatar_button.dart';

import '../../controller/Student_home_controller.dart';

class studentHomeAppBarWidget extends GetView<StudentHomeController>
    implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final double hideT;

  const studentHomeAppBarWidget({super.key, this.onMenuTap, this.hideT = 0.0});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final t = hideT.clamp(0.0, 1.0);
    final h = lerpDouble(preferredSize.height, 0, t)!;

    if (h < 8) return const SizedBox.shrink();

    const gap12 = SizedBox(width: 125);

    return SafeArea(
      bottom: false,
      child: IgnorePointer(
        ignoring: t > 0.01,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeInOut,
          opacity: 1 - t,
          child: ClipRect(
            child: SizedBox(
              height: h,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(color: Colors.white),
                child: Obx(() {
                  final s = controller.state.value;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileAvatarButton(
                        radius: 37,
                        imageUrl: controller.userImageUrl.value,
                        localImagePath: controller.userLocalPath.value,
                        onTap: () => Get.toNamed('/profile'),
                      ),
                      //gap12,
                      AppbarGreetingstudnet(studentName: s.studentName),
                      gap12,

                      MenuSquareButton(onTap: onMenuTap),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
