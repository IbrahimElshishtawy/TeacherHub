import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Widget child; // Changed from AnimatedSwitcher? to Widget

  const ActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    required this.child, // Ensuring child is passed as a widget
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? Colors.white;
    final br = borderColor ?? const Color.fromARGB(147, 232, 238, 245);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: br),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child, // This will be the AnimatedSwitcher or any widget passed to ActionTile
              const SizedBox(height: 6),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E2A3B),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  subtitle,
                  maxLines: 2,
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 2.4,
                    color: const Color(0xFF6B7C93),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
