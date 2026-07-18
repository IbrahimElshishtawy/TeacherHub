import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/settings/widgets/settings_item.dart';
import 'package:student/Student/settings/widgets/settings_section.dart';
import 'package:student/Student/settings/widgets/settings_switch.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Color.fromARGB(255, 141, 34, 26),
          ),
          onPressed: () => Get.offNamed('/home_student'),
        ),
      ),
      body: ListView(
        children: [
          Text(
            '  الإعدادات العامه',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 5, 6, 9),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            ' التحكم في إعدادات حسابك وتفضيلاتك بما في يناسب احتياجاتك',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              color: Color(0xFF2D3A55),
            ),
            textAlign: TextAlign.center,
          ),
          SettingsSection(
            title: 'إعدادات الحساب',
            icon: Icons.account_circle,
            children: [
              SettingsItem(title: 'المعلومات الشخصية', onTap: () {}),
              SettingsItem(title: 'كلمة المرور والأمان', onTap: () {}),
              SettingsItem(title: 'الإشعارات', onTap: () {}),
            ],
          ),
          SettingsSection(
            title: 'المظهر والتفضيلات',
            icon: Icons.palette,
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
            icon: Icons.support,
            children: [
              SettingsItem(title: 'مركز المساعدة', onTap: () {}),
              SettingsItem(title: 'تواصل مع الدعم', onTap: () {}),
              SettingsItem(title: 'تقييم التطبيق', onTap: () {}),
            ],
          ),
          SettingsSection(
            title: 'حول التطبيق',
            icon: Icons.info,
            children: [
              SettingsItem(title: 'حول التطبيق', onTap: () {}),
              SettingsItem(title: 'شروط الخدمة', onTap: () {}),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.logout, color: Colors.red),
              onTap: () {
                // Handle log out
              },
            ),
          ),
        ],
      ),
    );
  }
}
