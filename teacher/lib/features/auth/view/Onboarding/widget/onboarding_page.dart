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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(lottieAsset, width: 250, height: 250, fit: BoxFit.fill),
        SizedBox(height: 20),
        // النص
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
