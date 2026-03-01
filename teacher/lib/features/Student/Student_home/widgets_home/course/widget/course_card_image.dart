import 'package:flutter/material.dart';

class CourseCardImage extends StatelessWidget {
  final String imageUrl;

  const CourseCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const _ImagePlaceholder(icon: Icons.image_outlined);
          },

          errorBuilder: (_, _, _) {
            return const _ImagePlaceholder(icon: Icons.broken_image_outlined);
          },
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final IconData icon;
  const _ImagePlaceholder({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEFF3FA),
      alignment: Alignment.center,
      child: Icon(icon, size: 34, color: Colors.black38),
    );
  }
}
