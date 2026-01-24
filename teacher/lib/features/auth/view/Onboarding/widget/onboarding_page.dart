// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String lottieAsset;
  final String text;

  const OnboardingPage({
    super.key,
    required this.lottieAsset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(lottieAsset, width: 250, height: 250, fit: BoxFit.fill),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
