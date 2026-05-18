import 'package:flutter/material.dart';

import 'app_palette.dart';

/// Holds the active palette + theme mode and notifies listeners on change.
class ThemeController extends ChangeNotifier {
  AppPalette _palette = AppPalette.oceanBlue;
  ThemeMode _mode = ThemeMode.system;

  AppPalette get palette => _palette;
  ThemeMode get mode => _mode;

  /// Seeds the initial palette from the active flavor.
  void seed(Color flavorColor) {
    _palette = AppPalette.values.firstWhere(
      (p) => p.primary.toARGB32() == flavorColor.toARGB32(),
      orElse: () => AppPalette.oceanBlue,
    );
  }

  void setPalette(AppPalette palette) {
    if (palette == _palette) return;
    _palette = palette;
    notifyListeners();
  }

  void toggleMode() {
    _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
