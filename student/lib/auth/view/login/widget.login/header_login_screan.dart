import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderLoginScrean extends StatelessWidget {
  final String lottiePath;
  final String title;
  final String subtitle;

  const HeaderLoginScrean({
    super.key,
    required this.lottiePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        children: [
          // Lottie
          Lottie.asset(lottiePath, width: 140, height: 140),

          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 5),
          const Divider(thickness: 2, height: 2),
        ],
      ),
    );
  }
}
