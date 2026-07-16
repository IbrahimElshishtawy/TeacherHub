import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required String emoji,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 34),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Top Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.offAllNamed('/home_admin'),
                      icon: const Icon(Icons.arrow_forward_ios, size: 22, color: Color(0xFF1E293B)),
                    ),
                    const Icon(
                      Icons.manage_accounts_outlined,
                      size: 28,
                      color: Color(0xFF2563EB),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Title & Subtitle
                const Text(
                  "إدارة المستخدمين",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "إدارة الطلاب وأولياء الأمور والتواصل معهم بشكل كامل وفوري.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 32),

                // Large Categories Cards
                _buildCategoryCard(
                  title: "إدارة الطلاب",
                  subtitle: "عرض الطلاب، تتبع الحضور والغياب، الواجبات، الاشتراكات والدرجات.",
                  emoji: "👨‍🎓",
                  accentColor: const Color(0xFF2563EB),
                  onTap: () => Get.toNamed('/user_management/students'),
                ),
                const SizedBox(height: 16),
                _buildCategoryCard(
                  title: "إدارة أولياء الأمور",
                  subtitle: "التواصل مع أولياء الأمور، ربط الأبناء، والرسائل التلقائية والتقارير.",
                  emoji: "👨‍👩‍👦",
                  accentColor: const Color(0xFF7C3AED),
                  onTap: () => Get.toNamed('/user_management/parents'),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
