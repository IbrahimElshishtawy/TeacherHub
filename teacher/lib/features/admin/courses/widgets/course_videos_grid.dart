// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CourseVideoModel {
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final Duration duration;

  const CourseVideoModel({
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.duration,
  });
}

class CourseVideosGrid extends StatelessWidget {
  final List<CourseVideoModel> videos;
  final ValueChanged<CourseVideoModel>? onTap;

  const CourseVideosGrid({super.key, required this.videos, this.onTap});

  String _fmt(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: videos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.06,
      ),
      itemBuilder: (_, i) {
        final v = videos[i];
        return InkWell(
          onTap: onTap == null ? null : () => onTap!(v),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE6E8F0)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        v.thumbnailUrl.isEmpty
                            ? Container(
                                color: const Color(0xFFF6F7FB),
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    size: 40,
                                    color: Colors.black38,
                                  ),
                                ),
                              )
                            : Image.network(v.thumbnailUrl, fit: BoxFit.cover),

                        // Duration
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.55),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              _fmt(v.duration),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        v.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        v.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
