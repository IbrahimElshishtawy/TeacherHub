import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const SettingsItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => onTap(),
      title: Text(title),
    );
  }
}
