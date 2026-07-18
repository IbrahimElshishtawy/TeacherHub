import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserChoseaTypelogin extends StatelessWidget {
  final String title;
  final String lottieAsset;
  final VoidCallback onTap;
  final String subtitle;
  final bool isSelected;

  const UserChoseaTypelogin({
    super.key,
    required this.title,
    required this.lottieAsset,
    required this.onTap,
    required this.subtitle,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 6 : 3,
        color: isSelected ? Colors.blue.shade50 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 1.5,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          subtitle: subtitle.isNotEmpty
              ? Text(
                  subtitle,
                  style: TextStyle(
                    color: isSelected ? Colors.blueGrey : Colors.grey,
                  ),
                )
              : null,
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
