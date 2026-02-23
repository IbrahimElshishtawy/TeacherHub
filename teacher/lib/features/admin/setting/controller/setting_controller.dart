import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/setting_state.dart';

class SettingController extends GetxController {
  final Rx<SettingState> state = SettingState.initial.obs;

  // switches
  void toggleNotifications(bool v) {
    state.value = state.value.copyWith(notificationsEnabled: v);
  }

  void toggleDarkMode(bool v) {
    state.value = state.value.copyWith(darkMode: v);
    // لو عندك ThemeService اربطها هنا
    // Get.changeThemeMode(v ? ThemeMode.dark : ThemeMode.light);
  }

  // language
  void openLanguagePicker() {
    // بسيط: BottomSheet اختيار لغة
    Get.bottomSheet(
      _LanguageSheet(
        current: state.value.languageLabel,
        onPick: (lang) {
          state.value = state.value.copyWith(languageLabel: lang);
          Get.back();
        },
      ),
      backgroundColor: const Color(0x00000000),
      isDismissible: true,
    );
  }

  // navigation actions (بدّل الروتات حسب مشروعك)
  void goAccountSettings() => Get.toNamed('/settings/account');
  void goPersonalInfo() => Get.toNamed('/settings/personal');
  void goPasswordSecurity() => Get.toNamed('/settings/security');

  void goHelpCenter() => Get.toNamed('/support/help_center');
  void goContactSupport() => Get.toNamed('/support/contact');
  void rateApp() => Get.snackbar("قيم التطبيق", "قريباً");
  void aboutApp() => Get.toNamed('/about');
}

class _LanguageSheet extends StatelessWidget {
  final String current;
  final void Function(String) onPick;

  const _LanguageSheet({required this.current, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFE6E8F0),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "اختيار اللغة",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          _LangOption(
            title: "عربي",
            selected: current == "عربي",
            onTap: () => onPick("عربي"),
          ),
          _LangOption(
            title: "English",
            selected: current == "English",
            onTap: () => onPick("English"),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

class _LangOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _LangOption({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(
        selected ? Icons.check_circle : Icons.circle_outlined,
        color: selected ? const Color(0xFF2F6BFF) : const Color(0xFFB0B5C3),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
    );
  }
}
