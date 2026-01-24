import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;

  const DotsIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
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
}
