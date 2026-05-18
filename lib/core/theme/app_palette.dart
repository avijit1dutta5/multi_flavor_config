import 'package:flutter/material.dart';

/// Selectable accent palettes (multi-color theming).
enum AppPalette {
  oceanBlue('Ocean Blue', Color(0xFF0066FF), Color(0xFF00C2FF)),
  sunsetOrange('Sunset Orange', Color(0xFFEA580C), Color(0xFFF59E0B)),
  emerald('Emerald', Color(0xFF10B981), Color(0xFF14B8A6)),
  royalPurple('Royal Purple', Color(0xFF7C3AED), Color(0xFFEC4899)),
  crimson('Crimson', Color(0xFFEF4444), Color(0xFFDC2626));

  const AppPalette(this.label, this.primary, this.secondary);

  final String label;
  final Color primary;
  final Color secondary;
}
