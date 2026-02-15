import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TeacherHeader extends StatelessWidget {
  final bool isActive;
  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;

  const TeacherHeader({
    super.key,
    required this.isActive,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    required this.avatarUrl,
  });

  bool _isHttpUrl(String value) {
    final raw = value.trim();
    if (raw.isEmpty) return false;
    if (raw.startsWith('assets/') ||
        raw.endsWith('.json') ||
        raw.startsWith('file:///assets/')) {
      return false;
    }
    final uri = Uri.tryParse(raw);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canUseNetwork = _isHttpUrl(avatarUrl);

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 142,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFE8EEF5)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF2ECC71)
                        : const Color(0xFFB0B7C3),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  isActive ? 'نشط' : 'غير نشط',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7A8699),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 75),
                  Column(
                    children: [
                      Text(
                        fullName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 7, 9, 11),
                        ),
                      ),
                      Text(
                        email,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF5B6B80),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '  الصف : $stageLabel',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF6B7C93),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        ' تم انشاء الحساب $createdAtLabel',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF6B7C93),
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),

                  canUseNetwork
                      ? CircleAvatar(
                          radius: 45,
                          backgroundColor: const Color(0xFFEAF2FF),
                          backgroundImage: NetworkImage(avatarUrl.trim()),
                        )
                      : Lottie.asset(
                          'assets/lottie/Teacher.json',
                          width: 90,
                          height: 90,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTeacherTopText extends StatelessWidget {
  const CreateTeacherTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "إنشاء حساب جديد للمدرس",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 6),
        Text(
          "إدخال بيانات المدرس وتحديد الصلاحيات قبل إنشاء الحساب",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
