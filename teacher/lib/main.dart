import 'package:flutter/material.dart';
import 'features/auth/view/Onboarding/Onboarding_Screen.dart';
import 'features/auth/view/user_type/User_Type_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/user_type': (context) => UserTypeScreen(),
      },
      home: OnboardingScreen(),
    );
  }
}
