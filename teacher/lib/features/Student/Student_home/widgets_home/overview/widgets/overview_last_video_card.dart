// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/overview/widgets/Thumb_video.dart';
import 'overview_primary_button.dart';

class OverviewLastVideoCard extends StatelessWidget {
  const OverviewLastVideoCard({
    super.key,
    required this.videoTitle,
    required this.videoSubtitle,
    required this.courseName,
    required this.durationText,
    required this.watchedSinceText,
    required this.watchProgress,
    required this.videoPathOrUrl,
    this.thumbnailAssetPath,
    this.thumbnailNetworkUrl,
    this.onTapContinue,
    this.onTapCourse,
  });

  final String videoTitle;
  final String videoSubtitle;
  final String courseName;

  final String durationText;
  final String watchedSinceText;
  final double watchProgress;
  final String videoPathOrUrl;

  final String? thumbnailAssetPath;
  final String? thumbnailNetworkUrl;

  final VoidCallback? onTapContinue;
  final VoidCallback? onTapCourse;

  @override
  Widget build(BuildContext context) {
    final p = watchProgress.clamp(0.0, 1.0);

    return _InnerCardShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 4),
          // Header
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFFD9E6FF)),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xFF2F6FED),
                  size: 25,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'آخر فيديو',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF111827),
                ),
              ),
              const Spacer(),
              Text(
                watchedSinceText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8A94A6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(),
          const SizedBox(height: 15),

          // Main row (thumbnail + details)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThumbVideo(
                durationText: '45:00',
                progress: p,
                networkUrl: 'https://picsum.photos/600/400',
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          videoTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          videoSubtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11.5,
                            height: 1.25,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: OverviewPrimaryButton(text: 'متابعة', onTap: () {}),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: onTapCourse,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE9EDF5)),
                    ),
                    child: Text(
                      'كورس: $courseName',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF2F6FED),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InnerCardShell extends StatelessWidget {
  const _InnerCardShell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
