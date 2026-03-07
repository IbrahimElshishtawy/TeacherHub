import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/settings/widgets/settings_item.dart';
import 'package:teacher/features/Student/settings/widgets/settings_section.dart';
import 'package:teacher/features/Student/settings/widgets/settings_switch.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات العامة")),
      body: ListView(
        children: [
          SettingsSection(
            title: 'إعدادات الحساب',
            children: [
              SettingsItem(title: 'المعلومات الشخصية', onTap: () {}),
              SettingsItem(title: 'كلمة المرور والأمان', onTap: () {}),
              SettingsItem(title: 'الإشعارات', onTap: () {}),
            ],
          ),
          SettingsSection(
            title: 'المظهر والتفضيلات',
            children: [
              SettingsSwitch(
                title: 'الوضع الداكن',
                value: controller.state.isDarkMode.value,
                onChanged: controller.toggleDarkMode,
              ),
              SettingsItem(title: 'اللغة', onTap: () {}),
              SettingsItem(title: 'الخصوصية', onTap: () {}),
            ],
          ),
          SettingsSection(
            title: 'الدعم',
            children: [
              SettingsItem(title: 'مركز المساعدة', onTap: () {}),
              SettingsItem(title: 'تواصل مع الدعم', onTap: () {}),
              SettingsItem(title: 'تقييم التطبيق', onTap: () {}),
            ],
          ),
          SettingsSection(
            title: 'حول التطبيق',
            children: [
              SettingsItem(title: 'حول التطبيق', onTap: () {}),
              SettingsItem(title: 'شروط الخدمة', onTap: () {}),
            ],
          ),
          ListTile(
            title: Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Handle log out
            },
          ),
        ],
      ),
    );
  }
}
