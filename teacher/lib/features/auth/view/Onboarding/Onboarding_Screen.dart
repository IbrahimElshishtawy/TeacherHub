// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'widget/onboarding_page.dart';
import 'widget/dots_indicator.dart';
import 'widget/next_button.dart';

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
          Align(
            alignment: Alignment.topCenter, // جعل البداية من أعلى
            child: Container(
              padding: EdgeInsets.only(top: 50), // إضافة المسافة من الأعلى
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
          ),
          DotsIndicator(currentPage: _currentPage),
          SizedBox(height: 20),
          NextButton(
            currentPage: _currentPage,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
