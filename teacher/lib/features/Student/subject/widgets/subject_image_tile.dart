import 'package:flutter/material.dart';

class SubjectImageTile extends StatelessWidget {
  final String style;
  final double width;
  final double height;
  final Widget? bottomLeft;
  final Widget? bottomBar;

  const SubjectImageTile({
    super.key,
    required this.style,
    required this.width,
    required this.height,
    this.bottomLeft,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(gradient: _gradientFor(style)),
            child: Center(
              child: Icon(
                _iconFor(style),
                color: Colors.white.withValues(alpha: 0.75),
                size: 30,
              ),
            ),
          ),
          if (bottomBar != null)
            Positioned(left: 0, right: 0, bottom: 0, child: bottomBar!),
          if (bottomLeft != null)
            Positioned(left: 8, bottom: 8, child: bottomLeft!),
        ],
      ),
    );
  }

  LinearGradient _gradientFor(String style) {
    switch (style) {
      case 'dna':
        return const LinearGradient(
          colors: [Color(0xFF3C436C), Color(0xFFDB5B84), Color(0xFF7DA4D5)],
        );
      case 'molecule':
        return const LinearGradient(
          colors: [Color(0xFFBFC8CF), Color(0xFFE8EEF2), Color(0xFFAAB7C1)],
        );
      case 'lab':
        return const LinearGradient(
          colors: [Color(0xFF3B2E28), Color(0xFF5A7685), Color(0xFFA08167)],
        );
      case 'blue_lab':
        return const LinearGradient(
          colors: [Color(0xFF284966), Color(0xFF7EA8CB), Color(0xFFE5EEF7)],
        );
      case 'glass':
        return const LinearGradient(
          colors: [Color(0xFFD9D9D4), Color(0xFFB7D1CF), Color(0xFFF5EFE6)],
        );
      case 'beaker':
        return const LinearGradient(
          colors: [Color(0xFF7CA7D4), Color(0xFF315D86), Color(0xFFC6D6E7)],
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFF888888), Color(0xFF444444)],
        );
    }
  }

  IconData _iconFor(String style) {
    switch (style) {
      case 'dna':
        return Icons.device_hub_rounded;
      case 'molecule':
        return Icons.bubble_chart_rounded;
      case 'lab':
      case 'blue_lab':
      case 'beaker':
        return Icons.science_rounded;
      case 'glass':
        return Icons.biotech_rounded;
      default:
        return Icons.image_rounded;
    }
  }
}
