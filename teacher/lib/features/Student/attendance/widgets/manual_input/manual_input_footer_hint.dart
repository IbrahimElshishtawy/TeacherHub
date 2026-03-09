import 'package:flutter/material.dart';

import 'manual_input_theme.dart';

class ManualInputFooterHint extends StatelessWidget {
  const ManualInputFooterHint({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'اضغط Enter للتأكيد السريع',
        style: TextStyle(
          color: ManualInputTheme.hint,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
