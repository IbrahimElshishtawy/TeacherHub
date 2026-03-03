import 'package:flutter/material.dart';
import 'overview_primary_button.dart';

class OverviewLastVideoCard extends StatelessWidget {
  const OverviewLastVideoCard({
    super.key,
    required this.videoTitle,
    required this.videoSubtitle,
    required this.courseName,
    required this.durationText, // مثال: 45:00
    required this.watchedSinceText, // مثال: تمت المشاهدة من 3 ساعات
    required this.watchProgress, // 0.0 -> 1.0
    required this.videoPathOrUrl, // هنا تحط المسار/الرابط
    this.thumbnailAssetPath, // مثال: assets/images/thumb.png
    this.thumbnailNetworkUrl, // مثال: https://...
    this.onTapContinue,
    this.onTapCourse,
  });

  final String videoTitle;
  final String videoSubtitle;
  final String courseName;

  final String durationText;
  final String watchedSinceText;
  final double watchProgress;

  /// ✅ هنا تقدر تحط:
  /// - مسار محلي: /storage/.../video.mp4
  /// - رابط: https://domain.com/video.mp4
  final String videoPathOrUrl;

  /// thumbnail optional
  final String? thumbnailAssetPath;
  final String? thumbnailNetworkUrl;

  final VoidCallback? onTapContinue;
  final VoidCallback? onTapCourse;

  @override
  Widget build(BuildContext context) {
    final p = watchProgress.clamp(0.0, 1.0);

    return _InnerCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              Text(
                'آخر فيديو',
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF111827),
                ),
              ),
              const Spacer(),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFFD9E6FF)),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xFF2F6FED),
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // watched since
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              watchedSinceText,
              style: const TextStyle(
                fontSize: 11.5,
                color: Color(0xFF8A94A6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Main row (thumb + details)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              _Thumb(
                durationText: durationText,
                progress: p,
                assetPath: thumbnailAssetPath,
                networkUrl: thumbnailNetworkUrl,
              ),
              const SizedBox(width: 12),

              // Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
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

                      const SizedBox(height: 10),

                      // ✅ (اختياري) عرض المسار/الرابط (علشان تعرف تحطه)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFE9EDF5)),
                        ),
                        child: Text(
                          'Video: $videoPathOrUrl',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10.5,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Bottom row (course + button)
          Row(
            children: [
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
              const SizedBox(width: 10),
              Expanded(
                child: OverviewPrimaryButton(
                  text: 'متابعة',
                  onTap: onTapContinue ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({
    required this.durationText,
    required this.progress,
    this.assetPath,
    this.networkUrl,
  });

  final String durationText;
  final double progress;
  final String? assetPath;
  final String? networkUrl;

  @override
  Widget build(BuildContext context) {
    final image = _buildImage();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 150,
        height: 85,
        decoration: BoxDecoration(
          color: const Color(0xFFE9EDF5),
          border: Border.all(color: const Color(0xFFE9EDF5)),
        ),
        child: Stack(
          children: [
            Positioned.fill(child: image),

            // duration badge
            Positioned(
              left: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  durationText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            // progress bar bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 4,
                child: Stack(
                  children: [
                    Container(color: Colors.black.withOpacity(0.12)),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        color: const Color(0xFFEF4444),
                      ), // الأحمر زي الصورة
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (networkUrl != null && networkUrl!.isNotEmpty) {
      return Image.network(networkUrl!, fit: BoxFit.cover);
    }
    if (assetPath != null && assetPath!.isNotEmpty) {
      return Image.asset(assetPath!, fit: BoxFit.cover);
    }
    return const Center(
      child: Icon(Icons.image, size: 34, color: Color(0xFF8A94A6)),
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
