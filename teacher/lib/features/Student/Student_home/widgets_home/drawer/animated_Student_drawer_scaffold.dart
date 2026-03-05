// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_drawer/view/Student_drawer.dart';
import 'package:teacher/features/Student/Student_home/controller/Student_home_controller.dart';

class AnimatedStudentDrawerScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const AnimatedStudentDrawerScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudentHomeController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),
        appBar: appBar,
        body: GetBuilder<StudentHomeController>(
          id: 'drawer_student',
          builder: (_) {
            final t = c.t.clamp(0.0, 1.0);
            final w = MediaQuery.of(context).size.width;
            final h = MediaQuery.of(context).size.height;
            final homeX = -w * 0.48 * t;
            final homeY = 30.0 * t;
            final homeScale = 1.0 - (0.23 * t);
            final radius = 22.0 * t;
            final shadowOpacity = 0.2 * t;

            return Stack(
              children: [
                // ===== Drawer Full Screen تحت =====
                const Positioned.fill(child: StudentDrawer()),

                // ===== Home فوق =====
                Transform.translate(
                  offset: Offset(homeX, homeY),
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
                              offset: const Offset(0, 10),
                              color: Colors.black.withOpacity(shadowOpacity),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            body,

                            // ===== Overlay فوق الهوم فقط لما الدرو مفتوح =====
                            if (t > 0)
                              Positioned.fill(
                                child: GestureDetector(
                                  onTap: c.closeDrawer,
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.10 * t),
                                  ),
                                ),
                              ),
                          ],
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
