// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThumbVideo extends StatelessWidget {
  const ThumbVideo({
    super.key,
    required this.durationText,
    required this.progress,
    this.assetPath,
    this.networkUrl,
    this.width = 180,
    this.height = 100,
    this.borderRadius = 12,
    this.showProgress = true,
    this.showDuration = true,
  });

  final String durationText;
  final double progress;

  final String? assetPath;
  final String? networkUrl;

  final double width;
  final double height;
  final double borderRadius;

  final bool showProgress;
  final bool showDuration;

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFE9EDF5),
          border: Border.all(color: const Color(0xFFE9EDF5)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: _ThumbImage(assetPath: assetPath, networkUrl: networkUrl),
            ),

            if (showDuration)
              Positioned(
                left: 8,
                bottom: showProgress ? 10 : 8,
                child: _DurationBadge(text: durationText),
              ),

            if (showProgress)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _ProgressBar(value: p),
              ),
          ],
        ),
      ),
    );
  }
}

class _ThumbImage extends StatelessWidget {
  const _ThumbImage({this.assetPath, this.networkUrl});

  final String? assetPath;
  final String? networkUrl;

  @override
  Widget build(BuildContext context) {
    final hasNetwork = networkUrl != null && networkUrl!.trim().isNotEmpty;
    final hasAsset = assetPath != null && assetPath!.trim().isNotEmpty;

    if (hasNetwork) {
      return Image.network(
        networkUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const _ImageFallback(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
      );
    }

    if (hasAsset) {
      return Image.asset(
        assetPath!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const _ImageFallback(),
      );
    }

    return const _ImageFallback();
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.image, size: 34, color: Color(0xFF8A94A6)),
    );
  }
}

class _DurationBadge extends StatelessWidget {
  const _DurationBadge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: Stack(
        children: [
          Container(color: Colors.black.withOpacity(0.12)),
          FractionallySizedBox(
            widthFactor: value.clamp(0.0, 1.0),
            child: Container(color: const Color(0xFFEF4444)),
          ),
        ],
      ),
    );
  }
}
