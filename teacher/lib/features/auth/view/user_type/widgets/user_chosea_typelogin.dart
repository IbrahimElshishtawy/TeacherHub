import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserChoseaTypelogin extends StatelessWidget {
  final String title;
  final String lottieAsset;
  final VoidCallback onTap;
  final String subtitle;

  const UserChoseaTypelogin({
    super.key,
    required this.title,
    required this.lottieAsset,
    required this.onTap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        margin: EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
          trailing: Lottie.asset(
            lottieAsset,
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
