import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:teacher/features/Student/Student_drawer/controller/Student_drawer_controller.dart';
import 'package:teacher/features/Student/Student_drawer/widgets_drawer/ExpandableT_ile.dart';
import 'package:teacher/features/Student/Student_drawer/widgets_drawer/Student_Logout_Tile.dart';
import 'package:teacher/features/Student/Student_drawer/widgets_drawer/Student_Main_Tile.dart';
import 'package:teacher/features/Student/Student_drawer/widgets_drawer/Student_drawer_header.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  static const Color bg = Color(0xFF0E1622);
  static const Color white = Colors.white;
  static const Color accent = Color.fromARGB(255, 51, 86, 176);
  static const Color logoutRed = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudentDrawerController>();

    return SizedBox.expand(
      child: Material(
        color: bg,
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Obx(() {
              final s = c.state.value;

              return CustomScrollView(
                slivers: [
                  // Fixed header that does not scroll
                  SliverAppBar(
                    backgroundColor: bg,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 130.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: StudentDrawerHeader(
                        onClose: () => c.closeDrawerFromHome(),
                      ),
                    ),
                  ),

                  // List of drawer items
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = s.items[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        child: item.hasChildren
                            ? StudentExpandableTile(
                                item: item,
                                selectedRoute: s.selectedRoute,
                                isExpanded:
                                    item.route != null &&
                                    s.isExpanded(item.route!),
                                onTapSub: (r) {
                                  c.goTo(r);
                                  if (item.route != null) {
                                    c.toggleExpansion(item.route!);
                                  }
                                },
                              )
                            : StudentMainTile(
                                title: item.title,
                                icon: item.icon,
                                selected: s.selectedRoute == item.route,
                                onTap: () {
                                  if (item.route != null) {
                                    c.goTo(item.route!);
                                    c.toggleExpansion(item.route!);
                                  }
                                },
                              ),
                      );
                    }, childCount: s.items.length),
                  ),

                  // Logout tile
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      child: StudentLogoutTile(onTap: () {}),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
