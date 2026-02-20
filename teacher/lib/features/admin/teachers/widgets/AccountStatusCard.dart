// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class AccountStatusCard extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const AccountStatusCard({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isActive ? const Color(0xFFDFF7E6) : const Color(0xFFF9D6D6);
    final dot = isActive ? const Color(0xFF22C55E) : const Color(0xFFEF4444);
    final switchActive = isActive
        ? const Color(0xFF22C55E)
        : const Color(0xFFEF4444);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Switch (top)
              Transform.scale(
                scale: 0.95,
                child: Switch(
                  value: isActive,
                  onChanged: onChanged,
                  activeThumbColor: Colors.white,
                  activeTrackColor: switchActive,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: switchActive.withOpacity(0.35),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'حالة الحساب',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF111827),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'إمكانية التفعيل/الإيقاف',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.45),
                ),
              ),

              const SizedBox(height: 8),

              // Status row (bottom right)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: dot,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isActive ? 'نشط' : 'موقوف',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: dot,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
