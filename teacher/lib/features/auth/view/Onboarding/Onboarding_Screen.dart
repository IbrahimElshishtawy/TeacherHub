// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/features/auth/view/user_type/User_Type_Screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildOnboardingPage(
            lottieAsset: 'assets/lottie/Welcome.json',
            text: 'مرحباً! اكتشف طريقة جديدة لتعلم الدروس بسهولة وبشكل منظم.',
          ),
          _buildOnboardingPage(
            lottieAsset: 'assets/lottie/Student transparent.json',
            text: 'جميع الدروس والملاحظات الآن في مكان واحد لسهولة الوصول.',
          ),
          _buildOnboardingPage(
            lottieAsset: 'assets/lottie/sign in.json',
            text: 'ابدأ رحلتك التعليمية الآن واستمتع بتجربة تعليمية مميزة.',
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String lottieAsset,
    required String text,
  }) {
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
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_pageController.page == 2) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      UserTypeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                ),
              );
            } else {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: Text('التالي'),
        ),
      ],
    );
  }
}
