import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final VoidCallback onSkip; // Callback function for Skip button

  const DotsIndicator({
    super.key,
    required this.currentPage,
    required this.onSkip, // Adding callback for Skip button
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDotWithNumber(0),
            Container(
              width: 40,
              height: 2,
              color: currentPage >= 1 ? Colors.blue : Colors.grey,
            ),
            _buildDotWithNumber(1),
            Container(
              width: 40,
              height: 2,
              color: currentPage >= 2 ? Colors.blue : Colors.grey,
            ),
            _buildDotWithNumber(2),
          ],
        ),
        SizedBox(height: 20), // Added space between dots and Skip button
        _buildNextButton(), // This is where the Next Button goes
        SizedBox(height: 20), // Added space between "Next" and "Skip"
        GestureDetector(
          onTap: onSkip, // When Skip is tapped, call the onSkip callback
          child: Text(
            "تخطي",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDotWithNumber(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: currentPage >= index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '${index + 1}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigate to next screen or logic
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(currentPage == 2 ? 'ابدأ' : 'التالي'),
    );
  }
}
