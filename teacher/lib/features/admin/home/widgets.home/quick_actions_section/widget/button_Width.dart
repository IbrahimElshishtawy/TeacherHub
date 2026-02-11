// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

double buttonWidth(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final cols = w < 420 ? 2 : 3;
  const spacing = 10.0;
  final totalSpacing = spacing * (cols - 1);

  final raw = (w - totalSpacing) / cols;
  return raw.clamp(140.0, 260.0);
}
