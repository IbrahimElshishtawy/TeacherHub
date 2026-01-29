import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/user_type_login/User_Type_login_Screen.dart';

class NextButton extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final VoidCallback onSkip; // Adding onSkip callback

  const NextButton({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.onSkip, // Receive onSkip callback
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Button Next
          ElevatedButton(
            onPressed: () {
              if (currentPage == 2) {
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
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(currentPage == 2 ? 'ابدأ' : 'التالي'),
          ),
          SizedBox(height: 20),
          // Skip Button
          GestureDetector(
            onTap: onSkip,
            child: Text(
              "تخطي",
              style: TextStyle(
                color: const Color.fromARGB(255, 142, 156, 167),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
