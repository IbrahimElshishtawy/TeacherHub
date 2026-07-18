import 'package:flutter/material.dart';

class SettingsSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const SettingsSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
