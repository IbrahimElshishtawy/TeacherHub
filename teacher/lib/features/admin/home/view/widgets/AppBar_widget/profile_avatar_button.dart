// ignore_for_file: unnecessary_underscores

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileAvatarButton extends StatelessWidget {
  final String? imageUrl;
  final String? localImagePath;
  final String fallbackLottieAsset;
  final VoidCallback onTap;

  final double radius;

  const ProfileAvatarButton({
    super.key,
    required this.onTap,
    this.imageUrl,
    this.localImagePath,
    this.fallbackLottieAsset = 'assets/lottie/admin.json',
    this.radius = 22,
    String? avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    Widget avatarChild;
    if (localImagePath != null && localImagePath!.trim().isNotEmpty) {
      avatarChild = Image.file(
        File(localImagePath!),
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    } else if (imageUrl != null && imageUrl!.trim().isNotEmpty) {
      avatarChild = Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(size),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return _fallback(size);
        },
      );
    } else {
      avatarChild = _fallback(size);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius + 12),
      child: ClipOval(
        child: Container(
          width: size,
          height: size,
          color: Colors.white,
          child: avatarChild,
        ),
      ),
    );
  }

  Widget _fallback(double size) {
    return Center(
      child: Lottie.asset(
        fallbackLottieAsset,
        width: size * 0.9,
        height: size * 0.9,
        fit: BoxFit.contain,
      ),
    );
  }
}
