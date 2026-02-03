// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/drawer/view/widgets/admin_drawer.dart';
import 'package:teacher/features/admin/home/view/widgets/AppBar_widget/home_app_bar.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: GetBuilder<HomeController>(
            id: 'drawer',
            builder: (c) {
              final t = c.drawerAnim.value.clamp(0.0, 1.0);

              return HomeAppBarWidget(onMenuTap: c.openDrawer, hideT: t);
            },
          ),
        ),

        body: GetBuilder<HomeController>(
          id: 'drawer',
          builder: (c) {
            final t = c.drawerAnim.value; // 0..1

            final width = MediaQuery.of(context).size.width;
            final shiftX = -width * 0.58 * t; // تتحرك لليسار
            final shiftY = 14.0 * t;
            final scale = 1.0 - (0.18 * t);
            final radius = 24.0 * t;

            return Stack(
              children: [
                // الخلفية (الدرو)
                AdminDrawer(onClose: c.closeDrawer),

                // Overlay (اضغط برا يقفل)
                if (t > 0)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: c.closeDrawer,
                      child: Container(
                        color: Colors.black.withOpacity(0.12 * t),
                      ),
                    ),
                  ),

                Transform.translate(
                  offset: Offset(shiftX, shiftY),
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Container(
                        color: const Color(0xFFF6F7F9),
                        child: _HomeBodyContent(),
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

class _HomeBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 12),
          _DemoCard(title: "إحصائيات الإدارة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "الإجراءات السريعة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "المدفوعات (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "إحصائيات الإدارة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "الإجراءات السريعة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "المدفوعات (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "إحصائيات الإدارة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "الإجراءات السريعة (قريباً)"),
          SizedBox(height: 12),
          _DemoCard(title: "المدفوعات (قريباً)"),
        ],
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final String title;
  const _DemoCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
