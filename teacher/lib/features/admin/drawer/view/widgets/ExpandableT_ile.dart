// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:teacher/features/admin/drawer/state/admin_drawer_state.dart';

class ExpandableTile extends StatefulWidget {
  final DrawerItemModel item;
  final String selectedRoute;
  final void Function(String route) onTapSub;

  const ExpandableTile({
    super.key,
    required this.item,
    required this.selectedRoute,
    required this.onTapSub,
  });

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  @override
  Widget build(BuildContext context) {
    // Check if the item is expanded using the AdminDrawerState
    final drawerState = Get.find<AdminDrawerState>();

    // Check if this route is expanded
    final bool isExpanded = drawerState.isExpanded(widget.item.route ?? "");

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(right: 30, top: 2, bottom: 2),
        initiallyExpanded: isExpanded,
        onExpansionChanged: (bool expanded) {
          setState(() {
            drawerState.toggleExpansion(
              widget.item.route ?? "",
            ); // Toggle expansion
          });
        },
        leading: Icon(widget.item.icon, color: Colors.blue, size: 20),
        title: Text(
          widget.item.title,
          style: TextStyle(
            color: const Color.fromARGB(255, 251, 250, 250),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconColor: Colors.blue,
        collapsedIconColor: Colors.blue,

        children: [
          for (final sub in widget.item.children)
            InkWell(
              onTap: () {
                widget.onTapSub(sub.route);
                setState(() {
                  drawerState.toggleExpansion(sub.route);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(
                        color: sub.route == widget.selectedRoute
                            ? Colors.blue
                            : const Color.fromARGB(255, 248, 245, 245),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        sub.title,
                        style: TextStyle(
                          color: sub.route == widget.selectedRoute
                              ? Colors.blue
                              : const Color.fromARGB(255, 241, 239, 239),
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
