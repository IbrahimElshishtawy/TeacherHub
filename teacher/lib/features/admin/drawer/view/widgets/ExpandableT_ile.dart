import 'package:flutter/material.dart';
import 'package:teacher/features/admin/drawer/state/admin_drawer_state.dart';

class ExpandableTile extends StatelessWidget {
  final DrawerItemModel item;
  final String selectedRoute;
  final void Function(String route) onTapSub;

  const ExpandableTile({
    super.key,
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
