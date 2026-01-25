// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/Onboarding/widget/dots_indicator.dart';
import 'package:teacher/features/auth/view/Onboarding/widget/next_button.dart';
import 'package:teacher/features/auth/view/Onboarding/widget/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView for onboarding pages
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                OnboardingPage(
                  lottieAsset: 'assets/lottie/Welcome.json',
                  text:
                      'مرحباً! اكتشف طريقة جديدة لتعلم الدروس بسهولة وبشكل منظم.',
                ),
                OnboardingPage(
                  lottieAsset: 'assets/lottie/Student transparent.json',
                  text:
                      'جميع الدروس والملاحظات الآن في مكان واحد لسهولة الوصول.',
                ),
                OnboardingPage(
                  lottieAsset: 'assets/lottie/sign in.json',
                  text:
                      'ابدأ رحلتك التعليمية الآن واستمتع بتجربة تعليمية مميزة.',
                ),
              ],
            ),
          ),
          // Dots indicator for the pages
          DotsIndicator(currentPage: _currentPage),
          SizedBox(height: 20),
          // Next button
          NextButton(
            currentPage: _currentPage,
            pageController: _pageController,
            onSkip: () {
              Navigator.pushReplacementNamed(context, '/user_type');
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
