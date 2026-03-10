import 'package:flutter/material.dart';

class MyCoursesImageTile extends StatelessWidget {
  final String style;
  final double width;
  final double height;
  final Widget? bottomLeftOverlay;
  final Widget? bottomBar;

  const MyCoursesImageTile({
    super.key,
    required this.style,
    required this.width,
    required this.height,
    this.bottomLeftOverlay,
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
            decoration: BoxDecoration(
              gradient: _gradientFor(style),
            ),
            child: Center(
              child: Icon(
                _iconFor(style),
                color: Colors.white.withOpacity(0.78),
                size: style == 'dna' ? 34 : 30,
              ),
            ),
          ),
          if (bottomBar != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomBar!,
            ),
          if (bottomLeftOverlay != null)
            Positioned(
              left: 8,
              bottom: 8,
              child: bottomLeftOverlay!,
            ),
        ],
      ),
    );
  }

  LinearGradient _gradientFor(String style) {
    switch (style) {
      case 'amber':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF080808), Color(0xFF8A5419), Color(0xFF24140B)],
        );
      case 'lab':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3B2E28), Color(0xFF5A7685), Color(0xFFA08167)],
        );
      case 'blue_lab':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF284966), Color(0xFF7EA8CB), Color(0xFFE5EEF7)],
        );
      case 'molecule':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFBFC8CF), Color(0xFFE8EEF2), Color(0xFFAAB7C1)],
        );
      case 'glass':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFD9D9D4), Color(0xFFB7D1CF), Color(0xFFF5EFE6)],
        );
      case 'dna':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF363E6B), Color(0xFFD55E82), Color(0xFF6F9FD2)],
        );
      case 'beaker':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
      case 'amber':
        return Icons.local_bar_rounded;
      case 'lab':
      case 'blue_lab':
      case 'beaker':
        return Icons.science_rounded;
      case 'molecule':
        return Icons.bubble_chart_rounded;
      case 'glass':
        return Icons.biotech_rounded;
      case 'dna':
        return Icons.device_hub_rounded;
      default:
        return Icons.image_rounded;
    }
  }
}
