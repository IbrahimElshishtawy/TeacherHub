import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';
import 'card_shell.dart';
import 'parents_table.dart';

class ParentsTableSection extends GetView<UserManagementController> {
  final List<ParentRowModel> rows;
  const ParentsTableSection({super.key, required this.rows});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "إدارة أولياء الأمور",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          const Text(
            "عرض جميع أولياء الأمور المسجلين والتحكم في حساباتهم",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: controller.setParentsQuery,
                  decoration: InputDecoration(
                    hintText: "ابحث بالاسم / الهاتف / الرقم التعريفي",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF6F7FB),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ParentsTable(rows: rows),

          const SizedBox(height: 12),

          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: controller.exportParents,
                    icon: const Icon(Icons.file_upload_outlined),
                    label: const Text("Export"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: controller.sendReportsToAllParents,
                    icon: const Icon(Icons.send_rounded),
                    label: const Text(
                      "إرسال للكل",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE65100), // Deep orange
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Get.snackbar(
                  "عرض الكل",
                  "لو هنعمل صفحة منفصلة هنربطها هنا",
                ),
                child: const Text(
                  "عرض كل أولياء الأمور",
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
