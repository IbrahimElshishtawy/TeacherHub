import 'package:get/get.dart';
import '../state/settings_state.dart';

class SettingsController extends GetxController {
  final SettingsState state = SettingsState();

  void toggleDarkMode(bool value) {
    state.isDarkMode.value = value;
  }

  void changeLanguage(String lang) {
    state.selectedLanguage.value = lang;
  }
}
