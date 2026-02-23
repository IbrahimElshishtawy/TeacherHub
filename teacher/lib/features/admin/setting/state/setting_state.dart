class SettingState {
  final bool notificationsEnabled;
  final bool darkMode;
  final String languageLabel; // مثال: "عربي"

  const SettingState({
    required this.notificationsEnabled,
    required this.darkMode,
    required this.languageLabel,
  });

  static const initial = SettingState(
    notificationsEnabled: false,
    darkMode: false,
    languageLabel: "عربي",
  );

  SettingState copyWith({
    bool? notificationsEnabled,
    bool? darkMode,
    String? languageLabel,
  }) {
    return SettingState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      darkMode: darkMode ?? this.darkMode,
      languageLabel: languageLabel ?? this.languageLabel,
    );
  }
}
