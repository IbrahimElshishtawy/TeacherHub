import 'package:flutter/material.dart';

import 'success_dialog_theme.dart';

class SuccessDialogCheckmark extends StatelessWidget {
  const SuccessDialogCheckmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SuccessDialogTheme.success.withOpacity(0.06),
          ),
        ),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SuccessDialogTheme.success.withOpacity(0.12),
            border: Border.all(
              color: SuccessDialogTheme.success.withOpacity(0.3),
              width: 1.5,
            ),
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                SuccessDialogTheme.success.withOpacity(0.9),
                SuccessDialogTheme.successDim,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: SuccessDialogTheme.success.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: -2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 26),
        ),
      ],
    );
  }
}
