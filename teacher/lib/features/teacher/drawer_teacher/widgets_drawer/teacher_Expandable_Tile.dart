// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_drawer/state/Student_drawer_state.dart';
import 'package:teacher/features/teacher/drawer_teacher/state/teacher_drawer_state.dart';

class teacherExpandableTile extends StatefulWidget {
  final teacherDrawerItemModel item;
  final String selectedRoute;
  final void Function(String route) onTapSub;

  const teacherExpandableTile({
    super.key,
    required this.item,
    required this.selectedRoute,
    required this.onTapSub,
    required bool isExpanded,
  });

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<teacherExpandableTile> {
  @override
  Widget build(BuildContext context) {
    final drawerState = Get.find<StudentDrawerState>();

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
                  drawerState.toggleExpansion(
                    sub.route,
                  ); // Toggle sub-item expansion
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
