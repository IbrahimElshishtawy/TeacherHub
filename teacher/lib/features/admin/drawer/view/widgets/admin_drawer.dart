import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_drawer_controller.dart';
import 'admin_drawer_header.dart';
import 'admin_drawer_item.dart';

class AdminDrawer extends GetView<AdminDrawerController> {
  final VoidCallback onClose;

  const AdminDrawer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1726), Color(0xFF0A1C30)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          // Allow scrolling if content overflows
          child: Column(
            children: [
              SizedBox(height: 50),
              AdminDrawerHeader(onClose: onClose),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() {
                  final s = controller.state.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      ...List.generate(s.mainItems.length, (i) {
                        final item = s.mainItems[i];
                        return AdminDrawerItem(
                          icon: item.icon,
                          title: item.title,
                          selected: s.selectedIndex == i,
                          onTap: () {
                            onClose();
                            controller.openMain(i);
                          },
                        );
                      }),

                      const SizedBox(height: 14),

                      ...List.generate(s.secondaryItems.length, (i) {
                        final item = s.secondaryItems[i];
                        return AdminDrawerItem(
                          icon: item.icon,
                          title: item.title,
                          onTap: () {
                            onClose();
                            controller.openSecondary(i);
                          },
                        );
                      }),

                      const SizedBox(
                        height: 14,
                      ), // Add some spacing before the logout button
                      InkWell(
                        onTap: () {
                          onClose();
                          controller.logout();
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.logout_rounded,
                                color: Color(0xFFFF3B30),
                                size: 22,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "تسجيل الخروج",
                                style: TextStyle(
                                  color: Color(0xFFFF3B30),
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
