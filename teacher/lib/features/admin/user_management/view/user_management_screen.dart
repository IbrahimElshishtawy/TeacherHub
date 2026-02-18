import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/widgets/select_card.dart';

enum UserManagementType { students, parents }

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  static const Color primaryBlue = Color(0xFF2F6BFF);
  static const Color bg = Color(0xFFF6F7FB);

  UserManagementType? selected;

  void _onSelect(UserManagementType type) {
    setState(() => selected = type);
  }

  void _onEnter() {
    if (selected == null) return;

    if (selected == UserManagementType.students) {
      Get.toNamed('/user_management/students');
    } else {
      Get.toNamed('/user_management/parents');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 6),

              Row(
                children: [
                  InkWell(
                    onTap: () => Get.offNamed('/home_admin'),
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                "إدارة المستخدمين",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                "التحكم في حسابات الطلاب وأولياء الأمور وصلاحياتهم في التطبيق",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 18),

              // الطلاب
              SelectCard(
                titleEn: "طلاب",
                subtitleAr: "إدارة شاملة لحسابات الطلاب داخل التطبيق",
                assetPath: "assets/lottie/Schoolstudent.json",
                isSelected: selected == UserManagementType.students,
                onTap: () => _onSelect(UserManagementType.students),
              ),

              const SizedBox(height: 14),

              // أولياء الأمور
              SelectCard(
                titleEn: "أولياء الأمور",
                subtitleAr: "إدارة حسابات أولياء الأمور وربطهم بالطلاب",
                assetPath: "assets/lottie/Parenting.json",
                isSelected: selected == UserManagementType.parents,
                onTap: () => _onSelect(UserManagementType.parents),
              ),

              const SizedBox(height: 18),

              // زر الدخول يظهر فقط بعد الاختيار
              if (selected != null)
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _onEnter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "الدخول",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
