import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:teacher/features/admin/setting/controller/setting_controller.dart';
import 'package:teacher/features/admin/setting/widgets/setting_header.dart';
import 'package:teacher/features/admin/setting/widgets/setting_language_tile.dart';
import 'package:teacher/features/admin/setting/widgets/setting_section_card.dart';
import 'package:teacher/features/admin/setting/widgets/setting_switch_tile.dart';
import 'package:teacher/features/admin/setting/widgets/setting_tile.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final st = controller.state.value;

            return ListView(
              children: [
                const SizedBox(height: 6),
                const SettingHeader(),
                const SizedBox(height: 14),

                // ====== إعدادات الحساب ======
                SettingSectionCard(
                  child: Column(
                    children: [
                      SettingTile(
                        title: "إعدادات الحساب",
                        icon: Icons.settings_rounded,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.goAccountSettings,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingTile(
                        title: "المعلومات الشخصية",
                        icon: Icons.person_outline_rounded,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.goPersonalInfo,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingTile(
                        title: "كلمة المرور والأمان",
                        icon: Icons.key_outlined,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.goPasswordSecurity,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingSwitchTile(
                        title: "الإشعارات",
                        icon: Icons.notifications_none_rounded,
                        iconColor: const Color(0xFF2F6BFF),
                        value: st.notificationsEnabled,
                        onChanged: controller.toggleNotifications,
                      ),
                    ],
                  ),
                ),

                // ====== المظهر والتفضيلات ======
                SettingSectionCard(
                  child: Column(
                    children: [
                      SettingSwitchTile(
                        title: "الوضع الداكن",
                        icon: Icons.dark_mode_outlined,
                        iconColor: const Color(0xFF2F6BFF),
                        value: st.darkMode,
                        onChanged: controller.toggleDarkMode,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingLanguageTile(
                        valueText: st.languageLabel,
                        onTap: controller.openLanguagePicker,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingTile(
                        title: "الخصوصية",
                        icon: Icons.privacy_tip_outlined,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: () => Get.toNamed('/privacy'),
                      ),
                    ],
                  ),
                ),

                // ====== الدعم ======
                SettingSectionCard(
                  child: Column(
                    children: [
                      SettingTile(
                        title: "مركز المساعدة",
                        icon: Icons.help_outline_rounded,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.goHelpCenter,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingTile(
                        title: "تواصل مع الدعم",
                        icon: Icons.mail_outline_rounded,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.goContactSupport,
                      ),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      SettingTile(
                        title: "قيم التطبيق",
                        icon: Icons.auto_awesome_outlined,
                        iconColor: const Color(0xFF2F6BFF),
                        onTap: controller.rateApp,
                      ),
                    ],
                  ),
                ),

                // ====== حول التطبيق ======
                SettingSectionCard(
                  child: SettingTile(
                    title: "حول التطبيق",
                    icon: Icons.info_outline_rounded,
                    iconColor: const Color(0xFF2F6BFF),
                    onTap: controller.aboutApp,
                  ),
                ),

                const SizedBox(height: 14),
              ],
            );
          }),
        ),
      ),
    );
  }
}
