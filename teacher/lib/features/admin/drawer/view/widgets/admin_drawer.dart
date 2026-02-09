import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/drawer/controller/admin_drawer_controller.dart';
import 'package:teacher/features/admin/drawer/state/admin_drawer_state.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  static const Color bg = Color(0xFF0E1622); // ✅ نفس الدارك
  static const Color white = Colors.white;
  static const Color accent = Color(0xFF2F6BFF); // ✅ أزرق التحديد
  static const Color logoutRed = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<AdminDrawerController>();

    return Drawer(
      child: Container(
        color: bg,
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Obx(() {
              final s = c.state.value;

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                children: [
                  const SizedBox(height: 10),

                  // ✅ القائمة
                  for (final item in s.items) ...[
                    if (!item.hasChildren)
                      _MainTile(
                        title: item.title,
                        icon: item.icon,
                        selected: s.selectedRoute == item.route,
                        onTap: () => c.goTo(item.route!),
                      )
                    else
                      _ExpandableTile(
                        item: item,
                        selectedRoute: s.selectedRoute,
                        onTapSub: (r) => c.goTo(r),
                      ),

                    const SizedBox(height: 10),
                  ],

                  const SizedBox(height: 10),

                  // ✅ Logout مثل الصورة
                  _LogoutTile(
                    onTap: () {
                      // اعمل اللي انت عايزه هنا
                      // Get.offAllNamed("/login");
                    },
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

/* =================== Main Tile =================== */

class _MainTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _MainTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  static const Color white = Colors.white;
  static const Color accent = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    final color = selected ? accent : white;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =================== Expandable =================== */

class _ExpandableTile extends StatelessWidget {
  final DrawerItemModel item;
  final String selectedRoute;
  final void Function(String route) onTapSub;

  const _ExpandableTile({
    required this.item,
    required this.selectedRoute,
    required this.onTapSub,
  });

  static const Color white = Colors.white;
  static const Color accent = Color(0xFF2F6BFF);

  bool get _anyChildSelected =>
      item.children.any((c) => c.route == selectedRoute);

  @override
  Widget build(BuildContext context) {
    final titleColor = _anyChildSelected ? accent : white;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(right: 30, top: 2, bottom: 2),
        initiallyExpanded: _anyChildSelected,

        leading: Icon(item.icon, color: titleColor, size: 20),
        title: Text(
          item.title,
          style: TextStyle(
            color: titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconColor: titleColor,
        collapsedIconColor: titleColor,

        children: [
          for (final sub in item.children)
            InkWell(
              onTap: () => onTapSub(sub.route),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(
                        color: sub.route == selectedRoute ? accent : white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        sub.title,
                        style: TextStyle(
                          color: sub.route == selectedRoute ? accent : white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/* =================== Logout =================== */

class _LogoutTile extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutTile({required this.onTap});

  static const Color logoutRed = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: const [
            Icon(Icons.logout_rounded, color: logoutRed, size: 20),
            SizedBox(width: 10),
            Text(
              "تسجيل الخروج",
              style: TextStyle(
                color: logoutRed,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
