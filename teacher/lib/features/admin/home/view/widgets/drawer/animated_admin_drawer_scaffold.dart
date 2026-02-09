// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/drawer/view/widgets/admin_drawer.dart';
import 'package:teacher/features/admin/home/controller/home_controller.dart';

class AnimatedAdminDrawerScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const AnimatedAdminDrawerScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),
        appBar: appBar,
        body: GetBuilder<HomeController>(
          id: 'drawer',
          builder: (_) {
            final t = c.t.clamp(0.0, 1.0);

            final w = MediaQuery.of(context).size.width;
            final h = MediaQuery.of(context).size.height;
            final drawerX = (-w * 0.55) + (w * 0.55 * t);
            final drawerScale = 0.94 + (0.06 * t);
            final homeX = -w * 0.52 * t;
            final homeY = 24.0 * t;
            final homeScale = 1.0 - (0.18 * t);
            final radius = 22.0 * t;
            final shadowOpacity = 0.18 * t;

            return Stack(
              children: [
                // ===== Drawer Layer (تحت) =====
                Transform.translate(
                  offset: Offset(drawerX, 0),
                  child: Transform.scale(
                    scale: drawerScale,
                    alignment: Alignment.centerRight,
                    child: const AdminDrawer(),
                  ),
                ),

                // ===== Dim/Blur Overlay فوق الدرو لما يتفتح =====
                if (t > 0)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: c.closeDrawer,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.5 * t,
                          sigmaY: 2.5 * t,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0.10 * t),
                        ),
                      ),
                    ),
                  ),

                // ===== Home Layer (فوق) =====
                Transform.translate(
                  offset: Offset(homeX, homeY),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(0.10 * t),
                    child: Transform.scale(
                      scale: homeScale,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Container(
                          width: w,
                          height: h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F7F9),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                spreadRadius: 2,
                                offset: const Offset(0, 12),
                                color: Colors.black.withOpacity(shadowOpacity),
                              ),
                            ],
                          ),
                          child: AbsorbPointer(
                            absorbing: t > 0.02,
                            child: body,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
