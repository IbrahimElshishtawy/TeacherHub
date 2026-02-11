import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // إضافة مكتبة Lottie
import 'package:get/get.dart';

enum UserManagementType { students, parents }

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  UserManagementType? selected;

  static const Color primaryBlue = Color(0xFF2F6BFF);
  static const Color bg = Color(0xFFF6F7FB);

  void _onSelect(UserManagementType type) {
    setState(() => selected = type);
  }

  void _onEnter() {
    if (selected == null) return;

    if (selected == UserManagementType.students) {
      Get.toNamed('/admin/users/students');
    } else {
      Get.toNamed('/admin/users/parents');
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

              // AppBar بسيط (سهم + عنوان)
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                "إدارة المستخدمين",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                "التحكم في حسابات الطلاب وأولياء الأمور وصلاحياتهم في التطبيق",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5, color: Colors.black54),
              ),
              const SizedBox(height: 18),

              _SelectCard(
                titleEn: "students",
                subtitleAr: "إدارة شاملة لحسابات الطلاب داخل التطبيق",
                assetPath:
                    "assets/lottie/Schoolstudent.json", // تغيير إلى ملف Lottie
                isSelected: selected == UserManagementType.students,
                onTap: () => _onSelect(UserManagementType.students),
              ),
              const SizedBox(height: 14),
              _SelectCard(
                titleEn: "Parents",
                subtitleAr: "إدارة حسابات أولياء الأمور وربطهم بالطلاب",
                assetPath:
                    "assets/lottie/Parenting.json", // تغيير إلى ملف Lottie
                isSelected: selected == UserManagementType.parents,
                onTap: () => _onSelect(UserManagementType.parents),
              ),

              const SizedBox(height: 18),

              if (selected != null) ...[
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
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectCard extends StatelessWidget {
  final String titleEn;
  final String subtitleAr;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectCard({
    required this.titleEn,
    required this.subtitleAr,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? primaryBlue : Colors.white;
    final titleColor = isSelected ? Colors.white : Colors.black87;
    final subColor = isSelected ? Colors.white70 : Colors.black45;
    final borderColor = isSelected
        ? Colors.transparent
        : const Color(0xFFE6E8EF);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            // عرض الرسوم المتحركة بدلاً من الصورة الثابتة
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.15)
                    : const Color(0xFFEFF3FF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Lottie.asset(
                  assetPath,
                  width: 42,
                  height: 42,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleEn,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitleAr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: subColor,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
