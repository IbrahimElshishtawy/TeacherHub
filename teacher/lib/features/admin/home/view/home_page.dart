import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/home_controller.dart';
import 'package:teacher/features/admin/home/widgets.home/AppBar_widget/home_app_bar.dart';
import 'package:teacher/features/admin/home/widgets.home/Home_Body_Content.dart';
import 'package:teacher/features/admin/home/widgets.home/drawer/animated_admin_drawer_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return AnimatedAdminDrawerScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: GetBuilder<HomeController>(
          id: 'drawer',
          builder: (_) {
            final t = c.t.clamp(0.0, 1.0);
            return HomeAppBarWidget(onMenuTap: c.toggleDrawer, hideT: t);
          },
        ),
      ),
      body: HomeBodyContent(),
    );
  }
}
