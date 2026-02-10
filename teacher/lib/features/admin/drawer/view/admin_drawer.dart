import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/drawer/controller/admin_drawer_controller.dart';
import 'package:teacher/features/admin/drawer/view/widgets/ExpandableT_ile.dart';
import 'package:teacher/features/admin/drawer/view/widgets/Logout_Tile.dart';
import 'package:teacher/features/admin/drawer/view/widgets/Main_Tile.dart';
import 'package:teacher/features/admin/drawer/view/widgets/admin_drawer_header.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  static const Color bg = Color(0xFF0E1622);
  static const Color white = Colors.white;
  static const Color accent = Color(0xFF2F6BFF);
  static const Color logoutRed = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<AdminDrawerController>();

    return SizedBox.expand(
      child: Material(
        color: bg,
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Obx(() {
              final s = c.state.value;

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 18,
                ),
                children: [
                  const SizedBox(height: 30),

                  AdminDrawerHeader(onClose: () => c.closeDrawerFromHome()),
                  const SizedBox(height: 10),

                  for (final item in s.items) ...[
                    if (!item.hasChildren)
                      MainTile(
                        title: item.title,
                        icon: item.icon,
                        selected: s.selectedRoute == item.route,
                        onTap: () => c.goTo(item.route!),
                      )
                    else
                      ExpandableTile(
                        item: item,
                        selectedRoute: s.selectedRoute,
                        onTapSub: (r) => c.goTo(r),
                      ),
                    const SizedBox(height: 10),
                  ],

                  const SizedBox(height: 10),
                  LogoutTile(onTap: () {}),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
